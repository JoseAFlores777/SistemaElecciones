<nav id="sidebar" class="sidebar">
                <div class="sidebar-content js-simplebar">
                    <a class="sidebar-brand" href="">
                        <span class="align-middle">Sistema de Elecciones</span>
                    </a>

                    <ul class="sidebar-nav">
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