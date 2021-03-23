package web;

import com.google.gson.Gson;
import datos.MesaDaoJDBC;
import datos.ReferenciasDaoJDBC;
import datos.VotoDaoJDBC;
import dominio.Departamentos;
import dominio.Mesa;
import dominio.Municipios;
import dominio.Persona;
import dominio.Tipo_EstadoMesa;
import dominio.Voto;
import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControladorVotos")
public class ServletControladorVotos extends HttpServlet {

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
                case "verPortada":
                    response.sendRedirect("ControladorMenus?accion=Votaciones");
                    break;
                case "BuscarReferencias":
                    this.BuscarReferencias(request, response);
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
        List<Departamentos> Deptos = new ReferenciasDaoJDBC().listarDepartamentos(mesa.getID_Depto_Nom(),true);
        List<Municipios> municipios = new ReferenciasDaoJDBC().listarMunicipios();
        List<Tipo_EstadoMesa> EstadoMesa = new ReferenciasDaoJDBC().listarTipoEstadoMesa(mesa.getEstado());
        Gson gson = new Gson();

        String JSON = gson.toJson(municipios);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("municipiosJSON", JSON);

        request.setAttribute("Departamentos", Deptos);
        request.setAttribute("Estados", EstadoMesa);
        String jspEditar = "/Modales/EditarMesas.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }
    
    private void VerMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos el idCliente
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));

        Mesa mesa = new MesaDaoJDBC().encontrar(new Mesa(id_Mesa));
        request.setAttribute("mesa", mesa);
        List<Persona> Electores = new ReferenciasDaoJDBC().listarPesrsonaMesa(mesa.getId_Mesa(),1);
        List<Persona> MiembrosMesa = new ReferenciasDaoJDBC().listarPesrsonaMesa(mesa.getId_Mesa(),2);
        
        List<Tipo_EstadoMesa> EstadoMesa = new ReferenciasDaoJDBC().listarTipoEstadoMesa(mesa.getEstado());

        request.setAttribute("Electores", Electores);
        request.setAttribute("MiembrosMesa", MiembrosMesa);
        request.setAttribute("Estados", EstadoMesa);
        String jspEditar = "/Modales/VistaMesa.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                {
                    try {
                        this.insertarVoto(request, response);
                    } catch (ParseException ex) {
                       ex.printStackTrace(System.out);
                    } catch (SQLException ex) {
                   ex.printStackTrace();
                }
                }
                    break;

                case "modificar":
                {
                    try {
                        this.modificarMesa(request, response);
                    } catch (ParseException ex) {
                        ex.printStackTrace(System.out);
                    }
                }

                    break;


                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarVoto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException {
        //recuperamos los valores del formulario agregarPersona

        int id_Municipio = Integer.parseInt(request.getParameter("idMunicipio"));
        String Nombre = request.getParameter("Nombre");
        String Latitud = request.getParameter("Latitud");
        String Longitud = request.getParameter("Longitud");
        
        String id_Persona = request.getParameter("idPersona");
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));


        //Creamos el objeto de Persona (modelo)
        Voto voto = new Voto(id_Mesa, id_Persona);
        

        //Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new VotoDaoJDBC().insertar(voto);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        response.sendRedirect("ServletControladorMesas?accion=");
    }
    
    
        private void BuscarReferencias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Departamentos> Deptos = new ReferenciasDaoJDBC().listarDepartamentos(0,false);
  
          List<Municipios> municipios = new ReferenciasDaoJDBC().listarMunicipios();
        
        Gson gson = new Gson();

        String JSON = gson.toJson(municipios);
        HttpSession sesion = request.getSession();
        
        sesion.setAttribute("municipiosJSON", JSON);
        request.setAttribute("Departamentos", Deptos);
        String jspEditar = "/Modales/AgregarMesa.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }
    
    
    

    private void modificarMesa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        //recuperamos los valores del formulario editarPersona
        java.util.Date Apertura = null;
        java.util.Date Cierre = null;
        Mesa mesa;

        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        System.out.println(request.getParameter("idMunicipio"));
        int id_Municipio = Integer.parseInt(request.getParameter("idMunicipio"));
        String Nombre = request.getParameter("Nombre");
        String Latitud = request.getParameter("Latitud");
        String Longitud = request.getParameter("Longitud");
        int Estado = Integer.parseInt(request.getParameter("Estado"));

        if (Estado > 1) {
            if (Estado == 2) {
                Apertura = new java.util.Date();
            }
            if (Estado == 3) {
                Cierre = new java.util.Date();
            }
            mesa = new Mesa(id_Mesa, id_Municipio, Nombre, Latitud, Longitud, Apertura, Cierre, Estado);

        } else {
            mesa = new Mesa(id_Mesa, id_Municipio, Nombre, Latitud, Longitud, Estado);

        }

//        java.sql.Date Apertura = Date.valueOf(request.getParameter("Apertura"));
//        java.sql.Date Cierre = Date.valueOf(request.getParameter("Cierre"));
        //Creamos el objeto de Persona (modelo)
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
