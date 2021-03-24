<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
    if (usuario.getId_Tipo()==4) {
            request.getRequestDispatcher("ControladorMenus?accion=Dashboard").forward(request, response);
        }else if (usuario.getId_Tipo()==6){
        response.sendRedirect("ServletControladorMesas?accion=ver&idMesa="+usuario.getId_Mesa());
    
    }else if (usuario.getId_Tipo()==7){
        response.sendRedirect("ServletControladorVotos?accion=verPortada");
    
    }
    

%>
  

<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Mi Perfil</title>
    </head>

    <body>

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">


                    <%--Inicio de Contenido--%>


                    <div class="container-fluid p-0">
    <%--Inicio de Titulo de Página--%>
    <body>
        <div class="row mb-2 mb-xl-3">
            <div class="col-auto d-none d-sm-block">
                <h3><strong>Vistas</strong> Perfil</h3>
            </div>

            <div class="col-auto ml-auto text-right mt-n1">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
<li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Perfil</li>
                    </ol>
                </nav>
            </div>
        </div>
            <%--Fin de Titulo de Página--%>

                        <div class="card">

                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        </div>
                    </div>



                    <%--Final de Contenido--%>


                </main>
                <footer class="footer">
                    <jsp:include page="/Estructura-Menu/footer.jsp"/>  
                </footer>

            </div>

        </div>



        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  
    </body>
</html>




































