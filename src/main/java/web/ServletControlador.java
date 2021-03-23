package web;

import datos.MesaDaoJDBC;
import datos.PartidoDaoJDBC;
import datos.PersonaDaoJDBC;
import datos.ReferenciasDaoJDBC;
import dominio.Mesa;
import dominio.Partido;
import dominio.Persona;
import dominio.TipoUsuarios;
import dominio.Tipo_EstadoVoto;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.Clock;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    //private String pathFiles = "img/uploads";
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
                    this.editarPersona(request, response);
                    break;
                case "eliminar":
                    this.eliminarPersona(request, response);
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
        String user = request.getParameter("user");
        List<Persona> personas = new PersonaDaoJDBC().listar(user);
        System.out.println("personas = " + personas);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("personas", personas);

        if (user.equals("1")) {
            response.sendRedirect("ControladorMenus?accion=Presidentes");
        } else if (user.equals("2")) {
            response.sendRedirect("ControladorMenus?accion=Alcaldes");
        } else if (user.equals("3")) {
            response.sendRedirect("ControladorMenus?accion=Diputados");
        } else if (user.equals("4")) {
            response.sendRedirect("ControladorMenus?accion=Magistrados");
        } else if (user.equals("5")) {
            response.sendRedirect("ControladorMenus?accion=Administradores");
        } else if (user.equals("6")) {
            response.sendRedirect("ControladorMenus?accion=EncargadoMesa");
        } else if (user.equals("7")) {
            response.sendRedirect("ControladorMenus?accion=Electores");
        }
    }

    private void editarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int Tipo_Tipos =1;
        //recuperamos el idCliente
        String id_Persona = request.getParameter("idPersona");
        Persona persona = new PersonaDaoJDBC().encontrar(new Persona(id_Persona));
        
        if (persona.getId_Tipo()>3) Tipo_Tipos=2; 
        
        List<Partido> partidos = new PartidoDaoJDBC().listar(persona.getId_Partido());
        List<TipoUsuarios> tipos = new ReferenciasDaoJDBC().listarTipoUsuarios(persona.getId_Tipo(),Tipo_Tipos);
        List<Tipo_EstadoVoto> Estado_Voto = new ReferenciasDaoJDBC().listarTipoEstadoVoto(persona.getEstadoVoto());
        request.setAttribute("Estado_Voto", Estado_Voto);
        request.setAttribute("Tipos", tipos);
        request.setAttribute("Partidos", partidos);
        request.setAttribute("persona", persona);
        String jspEditar = "/Modales/EditarPersona.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }
    
    private void BuscarReferencias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
int user =  Integer.parseInt(request.getParameter("user"));
        System.out.println(user);
List<Partido> partidos;
        if (user == 1) {
            System.out.println("entre en 1");
            partidos = new ReferenciasDaoJDBC().listarPatidosSinPresidente();
            
        }else{
            System.out.println("entre en todos");
        partidos = new PartidoDaoJDBC().listar(0);
        }
        
        
        List<TipoUsuarios> tipos = new ReferenciasDaoJDBC().listarTipoUsuarios(0,3);
        List<Mesa> mesas = new MesaDaoJDBC().listar(0);
        
        
        request.setAttribute("Mesas", mesas);
        request.setAttribute("Tipos", tipos);
        
        request.setAttribute("Partidos", partidos);
        
        String jspEditar = "/Modales/AgregarPersona.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarPersona(request, response);
                    break;
                case "modificar": {
                    try {
                        this.modificarPersona(request, response);
                    } catch (Exception ex) {
                        ex.printStackTrace(System.out);
                    }
                }
                break;

                case "Ingresar":
                    System.out.println("AQUI ESTOY");
                    out.print("<script>alert('el usuario no existe')</script>");
                    this.validarPersona(request, response);
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Persona persona;

        //recuperamos los valores del formulario editarPersona
        System.out.println("Aqui el valor de Foto");
        System.out.println(request.getParameter("Foto"));

        String id_Persona = request.getParameter("idPersona");
        int id_Tipo = Integer.parseInt(request.getParameter("idTipo"));
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        Part part = request.getPart("Foto");
        String Password_ = request.getParameter("Contra");
        String primer_Nombre = request.getParameter("PrimerNombre");
        String segundo_Nombre = request.getParameter("SegundoNombre");
        String tercer_Nombre = request.getParameter("TercerNombre");
        String primer_Apellido = request.getParameter("PrimerApellido");
        String segundo_Apellido = request.getParameter("SegundoApellido");



//        if (part == null) {
//            System.out.println("No ha seleccionado un archivo");
//            return;
//        }

        if (isExtension(part.getSubmittedFileName(), extens)) {
            String Foto = saveFile(part, uploads);

            if (id_Tipo <= 3) {
                int id_Partido = Integer.parseInt(request.getParameter("idPartido"));
                //Creamos el objeto de Persona (modelo)
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto);
            } else {
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto);
            }

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PersonaDaoJDBC().insertar(persona);
            System.out.println("registrosModificados = " + registrosModificados);

        }
        
        else{
        
        
        String Foto = "SinFoto.png";
                    if (id_Tipo <= 3) {
                int id_Partido = Integer.parseInt(request.getParameter("idPartido"));
                //Creamos el objeto de Persona (modelo)
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto);
            } else {
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto);
            }

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PersonaDaoJDBC().insertar(persona);
            System.out.println("registrosModificados = " + registrosModificados);
        
        
        
        }

        //Redirigimos hacia accion por default
//        this.accionDefault(request, response);
        if (id_Tipo == 1) {
            response.sendRedirect("ServletControlador?user=1&accion=");
        } else if (id_Tipo == 2) {
            response.sendRedirect("ServletControlador?user=2&accion=");
        } else if (id_Tipo == 3) {
            response.sendRedirect("ServletControlador?user=3&accion=");
        } else if (id_Tipo == 4) {
            response.sendRedirect("ServletControlador?user=4&accion=");
        } else if (id_Tipo == 5) {
            response.sendRedirect("ServletControlador?user=5&accion=");
        } else if (id_Tipo == 6) {
            response.sendRedirect("ServletControlador?user=6&accion=");
        } else if (id_Tipo == 7) {
            response.sendRedirect("ServletControlador?user=7&accion=");
        }
    }

    private void modificarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        Persona persona;

        //recuperamos los valores del formulario editarPersona
        System.out.println("Aqui el valor de Foto");
        System.out.println(request.getParameter("Foto"));

        String id_Persona = request.getParameter("idPersona");
        int id_Tipo = Integer.parseInt(request.getParameter("idTipo"));
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        Part part = request.getPart("Foto");
        String Password_ = request.getParameter("Contra");
        String primer_Nombre = request.getParameter("PrimerNombre");
        String segundo_Nombre = request.getParameter("SegundoNombre");
        String tercer_Nombre = request.getParameter("TercerNombre");
        String primer_Apellido = request.getParameter("PrimerApellido");
        String segundo_Apellido = request.getParameter("SegundoApellido");

        int EstadoVoto = Integer.parseInt(request.getParameter("Estado_Voto"));
        boolean Estado = Boolean.parseBoolean(request.getParameter("Estado"));

//        if (part == null) {
//            System.out.println("No ha seleccionado un archivo");
//            return;
//        }

        if (isExtension(part.getSubmittedFileName(), extens)) {
            String Foto = saveFile(part, uploads);

            if (id_Tipo <= 3) {
                int id_Partido = Integer.parseInt(request.getParameter("idPartido"));
                //Creamos el objeto de Persona (modelo)
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
            } else {
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
            }

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PersonaDaoJDBC().actualizar(persona);
            System.out.println("registrosModificados = " + registrosModificados);

        }else{
        
        Persona per = new PersonaDaoJDBC().encontrar(new Persona(id_Persona));
        String Foto = per.getFoto();
                    if (id_Tipo <= 3) {
                int id_Partido = Integer.parseInt(request.getParameter("idPartido"));
                //Creamos el objeto de Persona (modelo)
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
            } else {
                persona = new Persona(id_Persona, id_Tipo, id_Mesa, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
            }

            //Modificar el  objeto en la base de datos
            int registrosModificados = new PersonaDaoJDBC().actualizar(persona);
            System.out.println("registrosModificados = " + registrosModificados);
        
        
        
        }

        //Redirigimos hacia accion por default
//        this.accionDefault(request, response);
        if (id_Tipo == 1) {
            response.sendRedirect("ServletControlador?user=1&accion=");
        } else if (id_Tipo == 2) {
            response.sendRedirect("ServletControlador?user=2&accion=");
        } else if (id_Tipo == 3) {
            response.sendRedirect("ServletControlador?user=3&accion=");
        } else if (id_Tipo == 4) {
            response.sendRedirect("ServletControlador?user=4&accion=");
        } else if (id_Tipo == 5) {
            response.sendRedirect("ServletControlador?user=5&accion=");
        } else if (id_Tipo == 6) {
            response.sendRedirect("ServletControlador?user=6&accion=");
        } else if (id_Tipo == 7) {
            response.sendRedirect("ServletControlador?user=7&accion=");
        }

    }

    private void eliminarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona
        String id_Persona = request.getParameter("idPersona");

        //Creamos el objeto de Persona (modelo)
        Persona persona = new Persona(id_Persona);

        //Eliminamos el  objeto en la base de datos
        int registrosModificados = new PersonaDaoJDBC().eliminar(persona);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

    private void validarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id_Persona = request.getParameter("idPersona");
        String Password_ = request.getParameter("Contra");

        System.out.println(id_Persona);
        System.out.println(Password_);
        Persona persona = new Persona(id_Persona, Password_);

        int Ingreso = new PersonaDaoJDBC().validar(persona);
        System.out.println(Ingreso);
        if (Ingreso == 1) {

            HttpSession sesion = request.getSession();
            sesion.setAttribute("credencial", persona);

            request.getRequestDispatcher("Principal.jsp").forward(request, response);

        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
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
