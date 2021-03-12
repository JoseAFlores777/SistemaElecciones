<!-- Modal -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Usuarios | Administradores</title>
    </head>

    <body>


    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Editar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
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
                                        <input type="text" class="form-control" id="wewe" placeholder="" name="PrimerNombre" required value="${persona.primer_Nombre}">
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
                                <img alt="Charles Hall" src="${pageContext.request.contextPath}/ControladorIMG?TipoFoto=1&id=${persona.getId_Persona()}" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                <div class="mt-2">
                                    <label class="btn btn-primary">
                                        <input type="file" name="Foto" />
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
                                <label class="form-label" for="inputState">Tipo Usuario</label>
                                <select id="inputState" class="form-control" name="idTipo" required value="${persona.getId_Tipo_Des()}">
                                    <option selected="">Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Estado Voto</label>
                                <select id="inputState" class="form-control" name="Estado_Voto" required value="${persona.getEstadoVoto_Des()}">
                                    <option selected="">Choose...</option>
                                 
                                </select>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Mesa De votación</label>
                                <select id="inputState" class="form-control" name="idMesa" required value="${persona.getId_Mesa()}">
                                    <option selected="">Choose...</option>
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
                                    <option selected="">Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Partido</label>
                                <select id="inputState" class="form-control" name="idPartido" required value="${persona.getId_Partido_Nom()}">
                                    <option selected="">Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                        </div>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                    </div>

                </form>



            

        </div>
    </div>
</div>



        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  
    </body>
</html>



