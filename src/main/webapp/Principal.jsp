<%
    if (session.getAttribute("credencial") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>


<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
        <meta name="author" content="AdminKit">
        <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

        <link rel="shortcut icon" href="adminkit-main/static/img/icons/icon-48x48.png" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        <title>AdminKit Demo - Bootstrap 5 Admin Template</title>

        <link href="adminkit-main/static/css/app.css" rel="stylesheet">
    </head>

    <body>
        <div class="wrapper">
            <nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="">
                        <span class="align-middle">Sistema de Elecciones</span>
                    </a>

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            Vistas
                        </li>

                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="ControladorMenus?accion=Dashboard" target="myFrame">
                                <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=Perfil" target="myFrame">
                                <i class="align-middle" data-feather="user"></i> <span class="align-middle">Perfil</span>
                            </a>
                        </li>





                        <li class="sidebar-header">
                            Usuarios
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=Administradores" target="myFrame">
                                <i class="align-middle" data-feather="clipboard"></i> <span class="align-middle">Administradores</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=Magistrados" target="myFrame">
                                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Magistrados</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=EncargadoMesa" target="myFrame">
                                <i class="align-middle" data-feather="user-check"></i> <span class="align-middle">Encargados de Mesas </span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=Electores" target="myFrame">
                                <i class="align-middle" data-feather="users"></i> <span class="align-middle">Electores</span>
                            </a>
                        </li>


                        <li class="sidebar-header">
                            Elecciones
                        </li>
                        
                                  <li class="sidebar-item">
                            <a class="sidebar-link" href="ControladorMenus?accion=Partidos" target="myFrame">
                                <i class="far fa-flag"></i> <span class="align-middle">Partidos Políticos</span>
                            </a>
                        </li>
                        

                        <li class="sidebar-item">
                            <a data-target="#Candidatos" data-toggle="collapse" class="sidebar-link collapsed">
                                <i class="far fa-user-circle"></i> <span class="align-middle">Candidatos</span>
                            </a>
                            <ul id="Candidatos" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                                <li class="sidebar-item"><a class="sidebar-link" href="ControladorMenus?accion=Presidentes" target="myFrame" >Presidentes</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="ControladorMenus?accion=Alcaldes" target="myFrame">Alcaldes</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="ControladorMenus?accion=Diputados" target="myFrame">Diputados</a></li>
                                
                            </ul>
                        </li>

                        <li class="sidebar-item" style="margin-bottom: 40px;">
                            <a class="sidebar-link" href="ControladorMenus?accion=Mesas" target="myFrame">
                                <i class="fas fa-poll-h"></i> <span class="align-middle">Mesas Electorales</span>
                            </a>
                        </li>

                    </ul>


                </div>
            </nav>

            <div class="main">
                <nav class="navbar navbar-expand navbar-light navbar-bg">
                    <a class="sidebar-toggle d-flex">
                        <i class="hamburger align-self-center"></i>
                    </a>

                    <form class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                            <input type="text" class="form-control" placeholder="Search?" aria-label="Search">
                            <button class="btn" type="button">
                                <i class="align-middle" data-feather="search"></i>
                            </button>
                        </div>
                    </form>

                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav navbar-align">

                            <li class="nav-item dropdown">
                                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                                    <i class="align-middle" data-feather="settings"></i>
                                </a>

                                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                                    <img src="adminkit-main/static/img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="Charles Hall" /> <span class="text-dark">Charles Hall</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <a class="dropdown-item" href="pages-profile.html"><i class="align-middle mr-1" data-feather="user"></i> Perfil</a>
                            
                                 
                                    
                                    
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main class="content">
                    <div class="container-fluid p-0">

                        <%--Inicio de Contenido--%>




                        <div style="height: 100%;">
                            <iframe name="myFrame" style="height: 100%; width: 100%;"></iframe>
                        </div>
                        
                        
                        
                        
                        




                        <%--Final de Contenido--%>


                    </div>


                </main>

                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row text-muted">
                            <div class="col-6 text-left">
                                <p class="mb-0">
                                    <strong>Sistema de Elecciones | Segundo Avance </strong> &copy <strong>2021</strong>
                                </p>
                            </div>

                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script src="adminkit-main/static/js/app.js"></script>


    </body>

</html>