<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Editar | Partidos</title>
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
                                <h3><strong>Modificar</strong> Partido</h3>
                            </div>

                            <div class="col-auto ml-auto text-right mt-n1">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Partidos">Partidos</a></li>
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

                                    <form  action="${pageContext.request.contextPath}/ServletControladorPartidos?accion=modificar&idPartido=${partido.getId_Partido()}" method="POST" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">ID del Partido</label>
                                                    <input type="text" class="form-control" id="inputDNI" placeholder="Sin Guiones" name="idPartido" required value="${partido.getId_Partido()}" disabled>
                                                </div>
                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">Nombre del Partido</label>
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="Nombre" required value="${partido.getNombre()}">
                                                </div>
                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputState">Estado Partido</label>
                                                    <select id="inputState" class="form-control" name="Estado" required value="${partido.getEstadoDes()}">
                                                        <option value="${partido.isEstado()}">${partido.getEstadoDes()}</option>
                                                        <c:if test="${partido.isEstado()=='True'}">
                                                        <option value="False">Inactivo</option>
                                                        </c:if>
                                                        <c:if test="${partido.isEstado()=='False'}">
                                                        <option value="True">Activo</option>
                                                        </c:if>
                                                        
                                                        

                                                    </select>
                                                </div>


                                            </div>

                                            <div class="col-md-3 ms-4 ">
                                                <div class="text-center">
                                                    <img id="Imagen" alt="${partido.getNombre()}" src="${pageContext.request.contextPath}/Imagenes/${partido.getBandera_()}" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                                    <div class="mt-2">
                                                        <label class="btn btn-primary">
                                                            <input id="InputImagen" type="file" name="Bandera">
                                                            <i class="fas fa-upload"></i> Subir Imagen
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="modal-footer">


                                                <a href="ControladorMenus?accion=Partidos"  type="button" class="btn btn-secondary" >Cancelar</a>    


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



