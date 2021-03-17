package web;

import datos.MesaDaoJDBC;
import datos.ReferenciasDaoJDBC;
import dominio.Departamentos;
import dominio.Mesa;
import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControladorMesas")
public class ServletControladorMesas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarMesa(request, response);
                    break;
                case "eliminar":
                    this.eliminarMesa(request, response);
                    break;

                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Mesa> mesas = new MesaDaoJDBC().listar(0);
        System.out.println("partidos = " + mesas);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("mesas", mesas);

        response.sendRedirect("ControladorMenus?accion=Mesas");

    }

    private void editarMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos el idCliente
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        
        Mesa mesa = new MesaDaoJDBC().encontrar(new Mesa(id_Mesa));
        request.setAttribute("mesa", mesa);
        List<Departamentos> Deptos = new ReferenciasDaoJDBC().listarDepartamentos(mesa.getID_Depto_Nom());
        request.setAttribute("Departamentos", Deptos);
        String jspEditar = "/Modales/EditarMesas.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarMesa(request, response);
                    break;
                case "modificar":
                    this.modificarMesa(request, response);

                    break;

                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario agregarPersona

        int id_Municipio = Integer.parseInt(request.getParameter("idMunicipio"));
        String Nombre = request.getParameter("Nombre");
        String Latitud = request.getParameter("Latitud");
        String Longitud = request.getParameter("Longitud");
        java.sql.Date Apertura = Date.valueOf(request.getParameter("Apertura"));
        java.sql.Date Cierre = Date.valueOf(request.getParameter("Cierre"));

        //Creamos el objeto de Persona (modelo)
        Mesa mesa = new Mesa(id_Municipio, Nombre, Latitud, Longitud, Apertura, Cierre);

        //Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new MesaDaoJDBC().insertar(mesa);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

    private void modificarMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona

        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        int id_Municipio = Integer.parseInt(request.getParameter("idMunicipio"));
        String Nombre = request.getParameter("Nombre");
        String Latitud = request.getParameter("Latitud");
        String Longitud = request.getParameter("Longitud");
        java.sql.Date Apertura = Date.valueOf(request.getParameter("Apertura"));
        java.sql.Date Cierre = Date.valueOf(request.getParameter("Cierre"));
        int Estado = Integer.parseInt(request.getParameter("Estado"));



            //Creamos el objeto de Persona (modelo)
            Mesa mesa = new Mesa(id_Mesa, id_Municipio, Nombre, Latitud, Longitud, Apertura, Cierre, Estado);

            //Modificar el  objeto en la base de datos
            int registrosModificados = new MesaDaoJDBC().actualizar(mesa);
            System.out.println("registrosModificados = " + registrosModificados);


        //Redirigimos hacia accion por default
        response.sendRedirect("ServletControladorMesas?accion=");
    }

    private void eliminarMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));

        //Creamos el objeto de Persona (modelo)
        Mesa mesa = new Mesa(id_Mesa);

        //Eliminamos el  objeto en la base de datos
        int registrosModificados = new MesaDaoJDBC().eliminar(mesa);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

}