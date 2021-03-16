package web;

import datos.PersonaDaoJDBC;
import dominio.Persona;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.InputStream;
import static java.lang.System.out;
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
        //recuperamos el idCliente
        String id_Persona = request.getParameter("idPersona");
        Persona persona = new PersonaDaoJDBC().encontrar(new Persona(id_Persona));
        request.setAttribute("persona", persona);
        String jspEditar = "/Modales/EditarPersona.jsp";
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
                case "modificar":
                {
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
        //recuperamos los valores del formulario agregarPersona

        String id_Persona = request.getParameter("idPersona");
        int id_Tipo = Integer.parseInt(request.getParameter("idTipo"));
        int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));
        int id_Partido = Integer.parseInt(request.getParameter("idPartido"));
        String Password_ = request.getParameter("Contra");
        String primer_Nombre = request.getParameter("PrimerNombre");
        String segundo_Nombre = request.getParameter("SegundoNombre");
        String tercer_Nombre = request.getParameter("TercerNombre");
        String primer_Apellido = request.getParameter("PrimerApellido");
        String segundo_Apellido = request.getParameter("SegundoApellido");
        String Foto = request.getParameter("Foto");

        int EstadoVoto = Integer.parseInt(request.getParameter("Estado_Voto"));
        boolean Estado = Boolean.parseBoolean(request.getParameter("Estado"));

        //Creamos el objeto de Persona (modelo)
        Persona persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);

        //Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new PersonaDaoJDBC().insertar(persona);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

    private void modificarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        Persona persona;
   
        String Foto = "Hola";
        //recuperamos los valores del formulario editarPersona

    System.out.println("Aqui");
        FileItemFactory file = new DiskFileItemFactory();
        ServletFileUpload fileUpload = new ServletFileUpload(file);
        
        List items = fileUpload.parseRequest(request);
        //System.out.println(fileUploa);
        System.out.println("No entré al for");
        System.out.println(items);
        
        
        for (int i = 0; i < items.size(); i++) {
            System.out.println(" entré al for");
            FileItem fileItem = (FileItem) items.get(i);
            System.out.println("No entré al if");
            if (!fileItem.isFormField()) {
                //File f = new File("C:\\xampp\\htdocs\\img\\" + fileItem.getName());
                File f = new File(System.getProperty("user.dir")+"\\src\\main\\webapp\\Imagenes\\"  + fileItem.getName());
                System.out.println(System.getProperty("user.dir")+"\\src\\main\\webapp\\Imagenes\\"  + fileItem.getName());
                //File f = new File("\\Users\\joseadolfoizaguirreflores\\Desktop\\ProyectoFinal_PrograIV\\Proyecto-SistemaElecciones\\SistemaElecciones\\src\\main\\webapp\\Imagenes\\"+ fileItem.getName());
                ///Users/joseadolfoizaguirreflores/Desktop/ProyectoFinal_PrograIV/Proyecto-SistemaElecciones/SistemaElecciones/src/main/webapp/Imagenes
                fileItem.write(f);
                
                 //Foto ="http://localhost/img/" + fileItem.getName();
                 Foto = f.getAbsolutePath();
                     //Foto = "http://localhost/img/"+ System.getProperty("user.dir")+"/src/main/webapp/Imagenes/"  + fileItem.getName();
            }
        }
              

            System.out.println("Aqui el valor de Foto");
            System.out.println(request.getParameter("Foto"));
            System.out.println(Foto);
            String id_Persona = request.getParameter("idPersona");
            int id_Tipo = Integer.parseInt(request.getParameter("idTipo"));
            int id_Mesa = Integer.parseInt(request.getParameter("idMesa"));

            String Password_ = request.getParameter("Contra");
            String primer_Nombre = request.getParameter("PrimerNombre");
            String segundo_Nombre = request.getParameter("SegundoNombre");
            String tercer_Nombre = request.getParameter("TercerNombre");
            String primer_Apellido = request.getParameter("PrimerApellido");
            String segundo_Apellido = request.getParameter("SegundoApellido");
            

            int EstadoVoto = Integer.parseInt(request.getParameter("Estado_Voto"));
            boolean Estado = Boolean.parseBoolean(request.getParameter("Estado"));

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
}
