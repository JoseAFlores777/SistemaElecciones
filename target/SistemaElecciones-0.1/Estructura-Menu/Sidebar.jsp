<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
String Nombre = usuario.getNombreCompleto();
String Foto = usuario.getFoto();
    

%>

                                    <%
                                    if (usuario.getId_Tipo()==5) {%>
                                           <nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="">
                        <span class="align-middle">Sistema de Elecciones</span>
                    </a>
                    

                    <ul class="sidebar-nav">
                        <li class="sidebar-header">
                            
                            <a href="ServletControladorVotos?accion=verPortada" type="button" class="btn btn-outline-secondary" style="margin-left: 31px;" target="_blank">Realizar Mi Voto</a>                                
                            
                        </li>
                        <li class="sidebar-header">
                            Vistas
                        </li>

                        <li class="sidebar-item">
                            <a  class="sidebar-link" href="ControladorMenus?accion=Dashboard" target="myFrame">
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
                            <a class="sidebar-link" href="ServletControlador?user=5&accion=" >
                                <i class="align-middle" data-feather="clipboard"></i> <span class="align-middle">Administradores</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ServletControlador?user=4&accion=" >
                                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Magistrados</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ServletControlador?user=6&accion=" >
                                <i class="align-middle" data-feather="user-check"></i> <span class="align-middle">Encargados de Mesas </span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ServletControlador?user=7&accion=" >
                                <i class="align-middle" data-feather="users"></i> <span class="align-middle">Electores</span>
                            </a>
                        </li>


                        <li class="sidebar-header">
                            Elecciones
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="ServletControladorPartidos?accion=" >
                                <i class="far fa-flag"></i> <span class="align-middle">Partidos Políticos</span>
                            </a>
                        </li>


                        <li class="sidebar-item">
                            <a data-target="#Candidatos" data-toggle="collapse" class="sidebar-link collapsed">
                                <i class="far fa-user-circle"></i> <span class="align-middle">Candidatos</span>
                            </a>
                            <ul id="Candidatos" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                                <li class="sidebar-item"><a class="sidebar-link" href="ServletControlador?user=1&accion="  >Presidentes</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="ServletControlador?user=2&accion=" >Alcaldes</a></li>
                                <li class="sidebar-item"><a class="sidebar-link" href="ServletControlador?user=3&accion=" >Diputados</a></li>

                            </ul>
                        </li>

                        <li class="sidebar-item" style="margin-bottom: 40px;">
                            <a class="sidebar-link" href="ServletControladorMesas?accion="">
                                <i class="fas fa-poll-h"></i> <span class="align-middle">Mesas Electorales</span>
                            </a>
                        </li>

                    </ul>


                </div>
            </nav>
                                        <%}%>
