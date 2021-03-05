
package web;


import datos.PersonaDaoJDBC;
import dominio.Persona;
import java.io.IOException;
import java.io.InputStream;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        List<Persona> personas = new PersonaDaoJDBC().listar();
        System.out.println("personas = " + personas);
        HttpSession sesion = request.getSession();
        sesion.setAttribute("personas", personas);
//
        response.sendRedirect("clientes.jsp");

     
    }



    private void editarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos el idCliente
        String id_Persona = request.getParameter("idPersona");
        Persona persona = new PersonaDaoJDBC().encontrar(new Persona(id_Persona));
        request.setAttribute("persona", persona);
        String jspEditar = "/WEB-INF/paginas/cliente/editarCliente.jsp";
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
                    this.modificarPersona(request, response);
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
            Part part = request.getPart("Foto");
            InputStream Foto = part.getInputStream();
            int EstadoVoto = Integer.parseInt(request.getParameter("Estado_Voto"));
            boolean Estado =  Boolean.parseBoolean(request.getParameter("Estado"));  
        


        //Creamos el objeto de Persona (modelo)
        Persona persona = new Persona(id_Persona,id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);

        //Insertamos el nuevo objeto en la base de datos
        int registrosModificados = new PersonaDaoJDBC().insertar(persona);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
    }

    private void modificarPersona(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //recuperamos los valores del formulario editarPersona
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
            Part part = request.getPart("Foto");
            InputStream Foto = part.getInputStream();
            int EstadoVoto = Integer.parseInt(request.getParameter("Estado_Voto"));
            boolean Estado =  Boolean.parseBoolean(request.getParameter("Estado"));  

        //Creamos el objeto de Persona (modelo)
        Persona persona = new Persona(id_Persona,id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);

        //Modificar el  objeto en la base de datos
        int registrosModificados = new PersonaDaoJDBC().actualizar(persona);
        System.out.println("registrosModificados = " + registrosModificados);

        //Redirigimos hacia accion por default
        this.accionDefault(request, response);
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
        Persona persona = new Persona(id_Persona,Password_);
        
        int Ingreso = new PersonaDaoJDBC().validar(persona);
        System.out.println(Ingreso);
        if (Ingreso==1) {
            
        HttpSession sesion = request.getSession();
        sesion.setAttribute("credencial", persona);
            
request.getRequestDispatcher("Principal.jsp").forward(request, response);
            
        }else{
         request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}
