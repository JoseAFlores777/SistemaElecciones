










<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Usuarios | Administradores</title>
    </head>

    <body >

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">
                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de Página--%>

                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Agregar</strong> Usuario</h3>
                            </div>

                            <div class="col-auto ml-auto text-right mt-n1">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Agregar</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <!-- Modal -->
                        <%-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
                        <div class="modal-dialog" >
                            <div class="modal-content">
                                <div class="modal-body">

                                    <form  action="${pageContext.request.contextPath}/ServletControlador?accion=insertar" method="POST" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <div class="mb-3 col-md-10">
                                                    <label class="form-label" for="inputFirstName">No. de Identidad</label>
                                                    <input type="text" class="form-control" id="inputDNI" placeholder="Sin Guiones" name="idPersona" required>
                                                </div>

                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Primer Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="PrimerNombre" required>
                                                        </div>
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Segundo Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="SegundoNombre"  >
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Tercer Nombre</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="TercerNombre" >
                                                        </div>
                                                        <div class="mb-3 col-md-5">
                                                            <label class="form-label" for="inputFirstName">Primer Apellido</label>
                                                            <input type="text" class="form-control" id="inputFirstName" placeholder="" name="PrimerApellido" required >
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>                                                               
                                            <div class="col-md-4 me-1 ">
                                                <div class="text-center">
                                                    <img id="Imagen" alt="Sin Foto" src="${pageContext.request.contextPath}/Imagenes/SinFoto.png" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                                    <div class="mt-2">
                                                        <label class="btn btn-primary">
                                                            <input id="InputImagen" type="file" name="Foto">
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
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="SegundoApellido" >
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputFirstName">Password</label>
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="Contra" required >
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Tipo Usuario</label>
                                                    <select id="TipoUsuario" class="form-control" name="idTipo" required>
                                                        <option value="">-Seleccione-</option>
                                                        <c:forEach var="tipo" items="${Tipos}" varStatus="status" >
                                                            <option value="${tipo.getId_Tipo()}">${tipo.getNombre()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Mesa De votación</label>
                                                    <select id="inputState" class="form-control" name="idMesa" required>
                                                        <option value="">-Seleccione-</option>
                                                        <c:forEach var="mesa" items="${Mesas}" varStatus="status" >
                                                            <option value="${mesa.getId_Mesa()}">Mesa #${mesa.getId_Mesa()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label" for="inputState">Partido Politico</label>
                                                    <select id="idPartido" class="form-control" name="idPartido" disabled>
                                                        <option value="null">-Seleccione-</option>
                                                        <c:forEach var="Partido" items="${Partidos}" varStatus="status" >
                                                            <option value="${Partido.getId_Partido()}">${Partido.getNombre()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>




                                        <div class="modal-footer">


                                            <a href="ControladorMenus?accion=Dashboard"  type="button" class="btn btn-secondary" >Cancelar</a>    


                                            <button type="submit" class="btn btn-primary">Guardar</button>
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

        <script>
            $('#TipoUsuario').change(function () {

                if ($('#TipoUsuario').val() < 4) {
                    $('#idPartido').removeAttr('disabled');
                    $('#idPartido').removeAttr('required');
                }else{
                     
                      $('#idPartido').prop('disabled', true);
                      $('#idPartido').prop('required', true);
                    
                }

            });

        </script>
    </body>
</html>



