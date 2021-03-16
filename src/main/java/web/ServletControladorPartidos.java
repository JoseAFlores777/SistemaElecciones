package web;

import datos.PartidoDaoJDBC;
import dominio.Partido;
import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@MultipartConfig
@WebServlet("/ServletControladorPartidos")
public class ServletControladorPartidos extends HttpServlet {
    
        private String pathFiles = "/Users/joseadolfoizaguirreflores/Desktop/ProyectoFinal_PrograIV/Proyecto-SistemaElecciones/SistemaElecciones/src/main/webapp/Imagenes";
    private File uploads = new File(pathFiles);
    private String[] extens = {".ico", ".png", ".jpg", ".jpeg"};

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarPartido(request, response);
                    break;
                case "eliminar":
                    this.eliminarPartido(request, response);
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

        List<Partido> partidos = new PartidoDaoJDBC().listar();
        System.out.println("partidos = " + partidos);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("partidos", partidos);

        response.sendRedirect("ControladorMenus?accion=Partidos");

    }

    private void editarPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos el idCliente
        String id_Partido = request.getParameter("idPartido");
        Partido partido = new PartidoDaoJDBC().encontrar(new Partido(id_Partido));
        request.setAttribute("partido", partido);
        String jspEditar = "/Modales/EditarPartido.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarPartido(request, response);
                    break;
                case "modificar":
                    this.modificarPartido(request, response);

                    break;

                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario agregarPersona

        String Nombre = request.getParameter("Nombre");
        String Bandera = request.getParameter("Bandera");

        //Creamos el objeto de Persona (modelo)
        Partido partido = new Partido(Nombre, Bandera);

        //Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new PartidoDaoJDBC().insertar(partido);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

    private void modificarPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona
        String id_Partido = request.getParameter("idPartido");
        String Nombre = request.getParameter("Nombre");
        Part part = request.getPart("Bandera");

        boolean Estado = Boolean.parseBoolean(request.getParameter("Estado"));

        if (isExtension(part.getSubmittedFileName(), extens)) {
            String Bandera = saveFile(part, uploads);

            //Creamos el objeto de Persona (modelo)
            Partido partido = new Partido(id_Partido, Nombre, Bandera, Estado);

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PartidoDaoJDBC().actualizar(partido);
            System.out.println("registrosModificados = " + registrosModificados);

        } else {

            Partido par = new PartidoDaoJDBC().encontrar(new Partido(id_Partido));
            String Bandera = par.getBandera_();
            //Creamos el objeto de Persona (modelo)
            Partido partido = new Partido(id_Partido, Nombre, Bandera, Estado);

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PartidoDaoJDBC().actualizar(partido);
            System.out.println("registrosModificados = " + registrosModificados);

        }

        //Redirigimos hacia accion por default
        response.sendRedirect("ServletControladorPartidos?accion=");
    }

    private void eliminarPartido(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona
        String id_Partido = request.getParameter("idPartido");

        //Creamos el objeto de Persona (modelo)
        Partido partido = new Partido(id_Partido);

        //Eliminamos el  objeto en la base de datos
        int registrosModificados = new PartidoDaoJDBC().eliminar(partido);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }
    
        private String saveFile(Part part, File pathUploads) {
        String pathAbsolute = "";
        String fileName=" ";

        try {

            Path path = Paths.get(part.getSubmittedFileName());
             fileName = path.getFileName().toString();
             
            InputStream input = part.getInputStream();

            if (input != null) {
                File file = new File(pathUploads, fileName);
                pathAbsolute = file.getAbsolutePath();
                Files.copy(input, file.toPath());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return fileName;
    }

    private boolean isExtension(String fileName, String[] extensions) {
        for (String et : extensions) {
            if (fileName.toLowerCase().endsWith(et)) {
                return true;
            }
        }

        return false;
    }

}
