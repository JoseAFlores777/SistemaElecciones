<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Editar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">






                <form action="${pageContext.request.contextPath}/ServletControlador?accion=Ingresar" method="GET" class="login100-form validate-form">
                    <div class="row">
                        <div class="col-md-7">
                            <div class="mb-3 col-md-10">
                                <label class="form-label" for="inputFirstName">No. de Identidad</label>
                                <input type="text" class="form-control" id="inputDNI" placeholder="Sin Guiones">
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="mb-3 col-md-5">
                                        <label class="form-label" for="inputFirstName">Primer Nombre</label>
                                        <input type="text" class="form-control" id="inputFirstName" placeholder="">
                                    </div>
                                    <div class="mb-3 col-md-5">
                                        <label class="form-label" for="inputFirstName">Segundo Nombre</label>
                                        <input type="text" class="form-control" id="inputFirstName" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="mb-3 col-md-5">
                                        <label class="form-label" for="inputFirstName">Tercer Nombre</label>
                                        <input type="text" class="form-control" id="inputFirstName" placeholder="">
                                    </div>
                                    <div class="mb-3 col-md-5">
                                        <label class="form-label" for="inputFirstName">Primer Apellido</label>
                                        <input type="text" class="form-control" id="inputFirstName" placeholder="">
                                    </div>
                                </div>
                            </div>

                        </div>                                                               
                        <div class="col-md-4 me-1 ">
                            <div class="text-center">
                                <img alt="Charles Hall" src="adminkit-main/static/img/avatars/avatar.jpg" class="rounded-circle img-responsive mt-2" width="128" height="128">
                                <div class="mt-2">
<label class="btn btn-primary">
    <input type="file"/>
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
                                <input type="text" class="form-control" id="inputFirstName" placeholder="">
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Tipo Usuario</label>
                                <select id="inputState" class="form-control">
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
                                <select id="inputState" class="form-control">
                                    <option selected="">Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Mesa De votación</label>
                                <select id="inputState" class="form-control">
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
                                <select id="inputState" class="form-control">
                                    <option selected="">Choose...</option>
                                    <option>...</option>
                                </select>
                            </div>
                            <div class="mb-3 col-md-6">
                                <label class="form-label" for="inputState">Partido</label>
                                <select id="inputState" class="form-control">
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
</div>