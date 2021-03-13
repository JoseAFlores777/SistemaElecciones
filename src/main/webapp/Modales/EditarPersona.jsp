










<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Usuarios | Administradores</title>
    </head>

    <body>

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">
                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de Página--%>

                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Modificar</strong> Usuario</h3>
                            </div>

                            <div class="col-auto ml-auto text-right mt-n1">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                        <li class="breadcrumb-item"><a href="#">Sistema De Elecciones</a></li>
                                        <li class="breadcrumb-item"><a href="#">Usuarios</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <!-- Modal -->
                        <%-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">

                                    <form  action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idPersona=${persona.getId_Persona()}" method="POST" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="mb-3 col-md-10">
                                                    <label class="form-label" for="inputFirstName">No. de Identidad</label>
                                                    <input type="text" class="form-control" id="inputDNI" placeholder="Sin Guiones" name="idPersona" required value="${persona.getId_Persona()}">
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Primer Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="PrimerNombre" required value="${persona.getPrimer_Nombre()}">
                                                        </div>
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Segundo Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="SegundoNombre" required value="${persona.getSegundo_Nombre()}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Tercer Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="TercerNombre" required value="${persona.getTercer_Nombre()}">
                                                        </div>
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Primer Apellido</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="PrimerApellido" required value="${persona.getPrimer_Apellido()}">
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>                                                               
                                            <div class="col-md-4 me-1 ">
                                                <div class="text-center">
                                                    <img alt="${persona.getNombreCompleto()}" src="${pageContext.request.contextPath}/ControladorIMG?TipoFoto=1&id=${persona.getId_Persona()}" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                                    <div class="mt-2">
                                                        <label class="btn btn-primary">
                                                            <input type="file" name="Foto"/>
                                                            <i class="fas fa-upload"></i> Subir Imagen
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputFirstName">Segundo Apellido</label>
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="SegundoApellido" required value="${persona.getSegundo_Apellido()}">
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputFirstName">Password</label>
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="Contra" required value="${persona.getPassword_()}">
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Tipo Usuario</label>
                                                    <select id="inputState" class="form-control" name="idTipo" >
                                                        <option value="${persona.getId_Tipo()}">${persona.getId_Tipo_Des()}</option>
                                                        <option>...</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Estado Voto</label>
                                                    <select id="inputState" class="form-control" name="Estado_Voto" >
                                                        <option value="${persona.getEstadoVoto()}">${persona.getEstadoVoto_Des()}</option>

                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Mesa De votación</label>
                                                    <select id="inputState" class="form-control" name="idMesa" >
                                                        <option value="${persona.getId_Mesa()}">${persona.getId_Mesa()}</option>
                                                        <option>...</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Estado Usuario</label>
                                                    <select id="inputState" class="form-control" name="Estado" required value="${persona.getEstadoDes()}">
                                                        <option value="${persona.isEstado()}">${persona.getEstadoDes()}</option>
                                                        <option>...</option>
                                                    </select>
                                                </div>
                                                <c:if test="${persona.getId_Tipo()<=3}">
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputState">Partido</label>
                                                        <select id="inputState" class="form-control" name="idPartido">
                                                            <option value="${persona.getId_Partido()}">${persona.getId_Partido_Nom()}</option>
                                                            <option>...</option>
                                                        </select>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>


                                        <div class="modal-footer">

                                            <c:if test="${persona.getId_Tipo()==1}">
                                                <a href="ControladorMenus?accion=Presidentes"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==2}">
                                                <a href="ControladorMenus?accion=Alcaldes"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==3}">
                                                <a href="ControladorMenus?accion=Diputados"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==4}">
                                                <a href="ControladorMenus?accion=Magistrados"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==5}">
                                                <a href="ControladorMenus?accion=Administradores"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==6}">
                                                <a href="ControladorMenus?accion=EncargadoMesa"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>
                                            <c:if test="${persona.getId_Tipo()==7}">
                                                <a href="ControladorMenus?accion=Electores"  type="button" class="btn btn-secondary" >Cancelar</a>    
                                            </c:if>

                                            <button type="submit" class="btn btn-primary">Actualizar</button>
                                        </div>

                                    </form>



                                </div>

                            </div>
                        </div>
                    </div>
                    <%--</div>--%>


                </main>
                <footer class="footer">
                    <jsp:include page="/Estructura-Menu/footer.jsp"/>  
                </footer>

            </div>

        </div>



        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  
    </body>
</html>



