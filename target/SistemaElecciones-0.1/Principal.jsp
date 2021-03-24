<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
    if (usuario.getId_Tipo()==4) {
            request.getRequestDispatcher("ControladorMenus?accion=Dashboard").forward(request, response);
        }else if (usuario.getId_Tipo()==5){
    
    response.sendRedirect("ServletControlador?user=5&accion=");
    }else if (usuario.getId_Tipo()==6){
        response.sendRedirect("ServletControladorMesas?accion=ver&idMesa="+usuario.getId_Mesa());
    
    }else{
        response.sendRedirect("ServletControladorVotos?accion=verPortada");
    
    }
    

%>
  


