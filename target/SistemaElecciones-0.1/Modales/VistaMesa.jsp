<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Editar | Mesas</title>
    </head>

    <body onload="mostrar_mapa(1, 2)">

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">

                    <input id="Latitud" type="hidden" value="${mesa.getLatitud()}">
                    <input id="Longitud" type="hidden" value="${mesa.getLongitud()}">
                    <input id="IdMesa" type="hidden" value="${mesa.getId_Mesa()}">
                    <input id="LugarVoto" type="hidden" value="${mesa.getNombre()}">
                    <input id="Deptos" type="hidden" value="${mesa.getDepto_Nom()}">
                    <input id="i_municipios" type="hidden" value="${mesa.getId_Municipio_Nomb()}">


                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de Página--%>

                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Información</strong> Mesa ${mesa.getId_Mesa()}</h3>
                            </div>

                            <div class="col-auto ml-auto text-right mt-n1">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                        <li class="breadcrumb-item"><a href="#">Sistema De Elecciones</a></li>
                                        <li class="breadcrumb-item"><a href="#">Mesas</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Modificar</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link active" id="Generales-tab" data-bs-toggle="tab" data-bs-target="#Generales" type="button" role="tab" aria-controls="Generales" aria-selected="true">Datos Generales</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="Miembros-tab" data-bs-toggle="tab" data-bs-target="#Miembros" type="button" role="tab" aria-controls="Miembros" aria-selected="false">Miembros de Mesa</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="Electores-tab" data-bs-toggle="tab" data-bs-target="#Electores" type="button" role="tab" aria-controls="Electores" aria-selected="false">Electores</button>
                                            </li>
                                            <li class="nav-item" role="presentation">
                                                <button class="nav-link" id="Estadísticas-tab" data-bs-toggle="tab" data-bs-target="#Estadísticas" type="button" role="tab" aria-controls="Estadísticas" aria-selected="false">Estadísticas</button>
                                            </li>
                                        </ul>
                                        <div class="tab-content" id="myTabContent">

                                            <%--########Generales###########--%>

                                            <div class="tab-pane fade show active" id="Generales" role="tabpanel" aria-labelledby="Generales-tab">


                                                <div class="col-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Geoubicacion de Mesa ${mesa.getId_Mesa()}</h5>
                                                            <h6 class="card-subtitle text-muted">Displays a mixture of normal and satellite views.</h6>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="content" id="hybrid_map" style="height: 300px;"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h1 class="card-title" style="font-size: 20px; text-align: center">Información General de la Mesa Electoral #${mesa.getId_Mesa()}</h1>

                                                        </div>
                                                        <div class="card-body">


                                                            <div class="row">
                                                                <div class="col-12 col-lg-2">
                                                                    <div class="card" style="height:300px">
                                                                        <div class="card-header" style="background-color: #e6e3e3">
                                                                            <b><h1 class="card-title" style="text-align: center">ID de Mesa:</h1></b>
                                                                        </div>
                                                                        <div class="card-body" style="height:245px">
                                                                            <h1 style="font-size: 60px">${mesa.getId_Mesa()}</h1>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-12 col-lg-3">
                                                                    <div class="card"style="height:300px">                                                                 <div class="card ">
                                                                            <div class="card-header" style="background-color: #e6e3e3">
                                                                                <b><h1 class="card-title" style="text-align: center">Ubicación Geográfica</h1></b>

                                                                            </div>
                                                                            <div class="card-body" style="height:245px">
                                                                                <b><h3>Departamento: </h3></b> ${mesa.getDepto_Nom()}<br><br>
                                                                                <b><h3>Municipio: </h3></b> ${mesa.getId_Municipio_Nomb()}
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12 col-lg-4">
                                                                    <div class="card"style="height:300px">                                                                 <div class="card ">
                                                                            <div class="card-header" style="background-color: #e6e3e3">
                                                                                <b><h1 class="card-title" style="text-align: center">Lugar de Votación</h1></b>

                                                                            </div>
                                                                            <div class="card-body" style="height:245px">
                                                                                <b><h3>Nombre del Lugar: </h3></b> ${mesa.getNombre()}<br><br>
                                                                                <b><h3>Coordenadas: </h3></b> ${mesa.getLatitud()} , ${mesa.getLongitud()}

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-12 col-lg-3">
                                                                    <div class="card"style="height:300px">                                                                 <div class="card ">
                                                                            <div class="card-header" style="background-color: #e6e3e3">
                                                                                <b><h1 class="card-title" style="text-align: center">Estado de La Mesa</h1></b>

                                                                            </div>
                                                                            <div class="card-body" style="height:245px">


                                                                                <c:if test="${mesa.getEstadoDes()=='En Espera'}">
                                                                                    <td><b><h3>Estado: </h3></b><span class="badge bg-warning" >${mesa.getEstadoDes()}</span><br><br>
                                                                                    </c:if>
                                                                                    <c:if test="${mesa.getEstadoDes()=='Cerrada'}">
                                                                                    <td><b><h3>Estado: </h3></b><span class="badge bg-secondary" >${mesa.getEstadoDes()}</span><br><br>
                                                                                    </c:if>
                                                                                    <c:if test="${mesa.getEstadoDes()=='Abierta'}">
                                                                                    <td><b><h3>Estado: </h3></b><span class="badge bg-primary" >${mesa.getEstadoDes()}</span><br><br>
                                                                                    </c:if>

                                                                                <b><h4>Fecha de Apertura: </h4></b>${mesa.getApertura().getTime}<br><br>
                                                                                <b><h4>Fecha de Cierre: </h4></b> ${mesa.getCierre().getTime}


                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>



                                            <%--########Miembros###########--%>
                                            <div class="tab-pane fade" id="Miembros" role="tabpanel" aria-labelledby="Miembros-tab">


                                                Miembros


                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>




                                            <%--########Electores###########--%>
                                            <div class="tab-pane fade" id="Electores" role="tabpanel" aria-labelledby="Electores-tab">


                                                Electores


                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>




                                            <%--########Estadísticas###########--%>
                                            <div class="tab-pane fade" id="Estadísticas" role="tabpanel" aria-labelledby="Estadísticas-tab">


                                                Estadísticas


                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>


                                        </div>
                                    </div>
                                    <div class="card-body">
                                    </div>
                                </div>
                            </div>
                        </div>









                </main>
                <footer class="footer">
                    <jsp:include page="/Estructura-Menu/footer.jsp"/>  
                </footer>

            </div>

        </div>


        <template id="my-template">
            <swal-title>
                Save changes to "Untitled 1" before closing?
            </swal-title>
            <swal-icon type="warning" color="red"></swal-icon>
            <swal-button type="confirm">
                Save As
            </swal-button>
            <swal-button type="cancel">
                Cancel
            </swal-button>
            <swal-button type="deny">
                Close without Saving
            </swal-button>
            <swal-param name="allowEscapeKey" value="false" />
            <swal-param
                name="customClass"
                value='{ "popup": "my-popup" }' />
        </template>






        <jsp:include page="/Estructura-Menu/MunicipioComboDep.jsp"/>  
        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  



        <jsp:include page="/Estructura-Menu/Mapa_Scripts.jsp"/>  




    </body>
</html>



