<%@page import="datos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<script type="text/javascript">





    function mostrar_mapa(centinela, mesa) {


        if (mesa > 0) {
            var Latitud = $("#Latitud").val();
            var Longitud = $("#Longitud").val();
            var IdMesa = $("#IdMesa").val();
            var Lugar = $("#LugarVoto").val();
            var src = $("#IdMesa").val();
            if (mesa == 1) {

                var Depto = $('select[id="Deptos"] option:selected').text();
                var Municipio = $('select[id="i_municipios"] option:selected').text();

            } else if (mesa == 2) {
                var Depto = $("#Deptos").val();
                var Municipio = $("#i_municipios").val();
            }


            var ubicacion = new google.maps.LatLng(Latitud, Longitud);
            var opciones = {zoom: 17, //acercamiento
                center: ubicacion,
                mapTypeId: google.maps.MapTypeId.HYBRID //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
            };
        } else {
            var ubicacion = new google.maps.LatLng(14.6203, -87.644);
            var opciones = {zoom: 7, //acercamiento
                center: ubicacion,
                mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
            };
        }
        //Ubicación inicial del mapa.
        //Latitud y Longitud
        //Parámetros Iniciales


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
                icon: 'images/icons/Globo3.png', //Imagen que aparecerá en la marca, debe estar en el server
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
                content: '<b>' + Lugar + '</b><br/>' + Depto + '<br/>' + Municipio + '<br/><b>Mesa #' + IdMesa + '</b>'
            });

            google.maps.event.addListener(mi_ubicacion, 'click', function () {
                //Calling the open method of the InfoWindow
                infowindow.open(map, mi_ubicacion);
            });

        } else if (centinela == 0) {
            console.log("Hasta Aqui todo Bien")
    <%
        String idMesa = "", idMunicipio = "",
                NombreDepto = "", NombreMuni = "",
                NombreLugar = "", Latitud = "",
                Longitud = "", Apertura = "",
                Cierre = "", Estado = "";
        int cont = 1;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement("SELECT T1.idMesa,T1.idMunicipio,T3.Nombre,T2.Nombre,T1.Nombre,T1.Latitud,T1.Longitud,T1.Apertura,T1.Cierre,T1.Estado FROM Mesas AS T1 INNER JOIN Municipios AS T2 ON(T1.idMunicipio=T2.idMunicipio) INNER JOIN Departamentos AS T3 ON(T2.idDepartamento=T3.idDepartamento)");
            rs = stmt.executeQuery();

            while (rs.next()) {
                idMesa = rs.getString(1);
                idMunicipio = rs.getString(2);
                NombreDepto = rs.getString(3);
                NombreMuni = rs.getString(4);
                NombreLugar = rs.getString(5);
                Latitud = rs.getString(6);
                Longitud = rs.getString(7);
                Apertura = rs.getString(8);
                Cierre = rs.getString(9);
                Estado = rs.getString(10);

    %>
            mi_ubicacion<%=cont%> = new google.maps.Marker({
                position: new google.maps.LatLng(<%=Latitud%>, <%=Longitud%>),
                icon: 'images/icons/Globo3.png',
                map: map,
                title: 'Mesa #<%=idMesa%>'
            });

            var infowindow<%=cont%> = new google.maps.InfoWindow({
                content: '<b><%=NombreLugar%></b><br/><%=NombreDepto%><br/><%=NombreMuni%><br/><b>Mesa #<%=idMesa%></b>'
            });

            google.maps.event.addListener(mi_ubicacion<%=cont%>, 'click', function () {
                infowindow<%=cont%>.open(map, mi_ubicacion<%=cont%>);
            });

    <%
                cont++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }


    %>
        }





    }
    ;



</script> 