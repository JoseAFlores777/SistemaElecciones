<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Editar | Mesas</title>
    </head>

    <body onload="mostrar_mapa(1, 1)">

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">
                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de P�gina--%>

                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Modificar</strong> Mesa</h3>
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

                        <!-- Modal -->
                        <%-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
                        <div class="modal-dialog" style="max-width:2000px;">
                            <div class="modal-content">
                                <div class="modal-body">

                                    <form  action="${pageContext.request.contextPath}/ServletControladorMesas?accion=modificar&idMesa=${mesa.getId_Mesa()}" method="POST" >
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">ID de la Mesa</label>
                                                    <input type="text" class="form-control" id="IdMesa" placeholder="Sin Guiones" name="idMesa" required value="${mesa.getId_Mesa()}" disabled>
                                                </div>
                                                <div class="row">
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputState">Departamento</label>
                                                        <select id="Deptos" class="form-control" onchange="combo_Municipios()" name="f_area">
                                                            <option value="${mesa.getID_Depto_Nom()}">${mesa.getDepto_Nom()}</option>
                                                            <c:forEach var="Deptos" items="${Departamentos}" varStatus="status" >
                                                                <option value="${Deptos.getId_Departamento()}">${Deptos.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputState">Municipio</label>
                                                        <select id="i_municipios" class="form-control" name="idMunicipio" >
                                                            <option value="${mesa.getId_Municipio()}">${mesa.getId_Municipio_Nomb()}</option>

                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">Centro de Votaci�n</label>
                                                    <input type="text" class="form-control" id="LugarVoto" placeholder="" name="Nombre" required value="${mesa.getNombre()}">
                                                </div>

                                                <div class="row">
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputFirstName">Latitud</label>
                                                        <input id="Latitud" type="text" class="form-control" id="inputFirstName" placeholder="" name="Latitud"  value="${mesa.getLatitud()}">
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputFirstName">Longitud</label>
                                                        <input id="Longitud" type="text" class="form-control" id="inputFirstName" placeholder="" name="Longitud"  value="${mesa.getLongitud()}">
                                                    </div>
                                                </div>



                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputState">Estado</label>
                                                    <select id="Estado" class="form-control" onchange="CambioEstado()" name="Estado">
                                                        <option value="${mesa.getEstado()}">${mesa.getEstadoDes()}</option>
                                                        <c:forEach var="Estado" items="${Estados}" varStatus="status" >
                                                            <option value="${Estado.getId_TipoEstadoMesa()}">${Estado.getDescripcion()}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>


                                            </div>


                                            <div class="col-md-7">


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




        <script>


            function combo_Municipios() {
                //alert("cambiar a select dependiente");
//		$("#i_opc").val("1");
//			$.post("comboD.jsp",$("#data").serialize(),function(data){$("#i_municipios").html(data);});
                $("#i_municipios").empty();
                $("#i_municipios").append('<option value="">-Elige un Municipio-</option>');

                let municipios = <%=session.getAttribute("municipiosJSON")%>;

                for (var i = 0; i < municipios.length; i++) {
                    if (municipios[i].id_Departamento == $("#Deptos").val()) {
                        //console.log(municipios[i].Nombre);
                        let Nombre = municipios[i].Nombre;
                        let id = municipios[i].id_Municipio;
                        console.log(Nombre);
                        $("#i_municipios").append('<option value=' + id + '>' + Nombre + '</option>');

                    }

                }

            }

        </script>

        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  


        
        <script type="text/javascript">

            var Latitud = $("#Latitud").val();
            var Longitud = $("#Longitud").val();
            var IdMesa = $("#IdMesa").val();
            var Depto = $('select[id="Deptos"] option:selected').text();
            var  Municipio= $('select[id="i_municipios"] option:selected').text();
            var  Lugar= $("#LugarVoto").val();
            var  src= $("#IdMesa").val();


            function mostrar_mapa(centinela, mesa) {


                if (mesa > 0) {
                    var ubicacion = new google.maps.LatLng(Latitud, Longitud);
                } else {
                    var ubicacion = new google.maps.LatLng(14.6203, -87.644);
                }
                //Ubicación inicial del mapa.
                //Latitud y Longitud
                //Parámetros Iniciales
                var opciones = {zoom: 17, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
                };

                //Creacion del mapa
                var map = new google.maps.Map(document.getElementById("hybrid_map"), opciones);


                //recuperar ubicacion donde hago click
                var iw = new google.maps.InfoWindow(
                        {content: '<b>Arrastre</b> el globo para definir<br/>la Nueva Ubicaci�n',
                            position: ubicacion});
                iw.open(map);
                // configurar evento click sobre el mapa
                map.addListener('click', function (mapsMouseEvent) {
                    iw.close();
                    iw = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
                    iw.setContent(mapsMouseEvent.latLng.toString());
                    iw.open(map);
                });


                if (centinela == 1) {
                    //Colocar una marca sobre el Mapa
                    mi_ubicacion = new google.maps.Marker({
                        position: new google.maps.LatLng(Latitud, Longitud), //Posición de la marca
                        icon: 'images/icons/Globo.png', //Imagen que aparecerá en la marca, debe estar en el server
                        map: map, //Mapa donde estará la marca

                        draggable: true,
                        title: 'Mesa #' + IdMesa //Título all hacer un mouseover
                    });

                    mi_ubicacion.addListener('dragend', function (event) {

                        $("#Latitud").val(this.getPosition().lat());
                        $("#Longitud").val(this.getPosition().lng());
                    });

                    //Mostrar Información al hacer click en la marca
                    var infowindow = new google.maps.InfoWindow({
                        content: '<b>'+Lugar+'</b><br/>'+Depto+'<br/>'+Municipio+'<br/><b>Mesa #'+IdMesa+'</b>'
                    });

                    google.maps.event.addListener(mi_ubicacion, 'click', function () {
                        //Calling the open method of the InfoWindow
                        infowindow.open(map, mi_ubicacion);
                    });
                }
                ;
            }

        </script>  




    </body>
</html>



