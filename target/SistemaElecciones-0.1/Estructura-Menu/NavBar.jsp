<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
String Nombre = usuario.getNombreCompleto();
String Foto = usuario.getFoto();
    

%>
  

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
                                    <img src="${pageContext.request.contextPath}/Imagenes/<%=Foto%>" class="avatar img-fluid rounded mr-1" alt="<%=Nombre%>" /> <span class="text-dark"><%=Nombre%></span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right">
                                    

                                    <%
                                    if (usuario.getId_Tipo()==5) {%>
                                            <a class="dropdown-item" href="ControladorMenus?accion=Perfil" target="myFrame"><i class="align-middle mr-1" data-feather="user"></i> Perfil</a>
                                        <%}%>
                                                        
                                                           
                                                     

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="index.jsp">Salir</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>