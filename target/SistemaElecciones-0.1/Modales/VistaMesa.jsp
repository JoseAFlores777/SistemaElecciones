<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
String Nombre = usuario.getNombreCompleto();
String Foto = usuario.getFoto();
    

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>



        <style>


            #example_wrapper{
                margin-top:38px !important;
            }
            
            #chartdiv,#chartdiv1,#chartdiv2,#chartdiv3 {
  width: 100%;
  height: 500px;
}

        </style>

        <title>Información | Mesas</title>
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
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Mesas">Mesas Electorales</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Información Mesa</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <a href="${pageContext.request.contextPath}/ServletControladorMesas?accion=editar&idMesa=${mesa.getId_Mesa()}" type="button" class="btn  btn-outline-success" style=" margin-bottom: 15px;"><i class="far fa-edit"></i> Editar Mesa</a>
                                       
                                                                            <%
                                    if (usuario.getId_Tipo()==6) {%>
                                             <a href="ServletControladorVotos?accion=verPortada" type="button" class="btn btn-outline-secondary" style="margin-left: 5px; margin-bottom: 15px;" target="_blank">Realizar Mi Voto</a>                                
                                        <%}%>
                                        
                                       
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
                                                            <h1 class="card-title" style="font-size: 20px; text-align: center">Geoubicación de la Mesa Electoral #${mesa.getId_Mesa()}</h1>
                                                            
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

                                                                                    <b><h4>Fecha de Apertura: </h4></b>${mesa.getApertura2()}<br><br>
                                                                                    <b><h4>Fecha de Cierre: </h4></b> ${mesa.getCierre2()}


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





                                               <table id="example" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th style="width:5%;">#</th>
                                        <th style="width:35%;">Nombre</th>
                                        <th style="width:25%">Cargo</th>
                                        <th style="width:10%;">#Mesa</th>
                                        <th class="d-none d-md-table-cell" style="width:10%">Estado</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>




                                    <c:forEach var="MiembrosMesa" items="${MiembrosMesa}" varStatus="status" >
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/Imagenes/${MiembrosMesa.getFoto()}" width="48" height="48" class="rounded-circle mr-2" alt="Avatar"> ${MiembrosMesa.primer_Nombre} ${MiembrosMesa.segundo_Nombre} ${MiembrosMesa.tercer_Nombre} ${MiembrosMesa.primer_Apellido} ${MiembrosMesa.segundo_Apellido}
                                            </td>

                                            <td>${MiembrosMesa.getId_Tipo_Des()}</td>
                                            <td>Mesa ${MiembrosMesa.getId_Mesa()}</td>
                                                                                            <c:if test="${MiembrosMesa.getEstadoDes()=='Activo'}">
                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-success" >${MiembrosMesa.getEstadoDes()}</span></td>
                                                    </c:if>
                                                <c:if test="${MiembrosMesa.getEstadoDes()=='Inactivo'}">
                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-secondary" >${MiembrosMesa.getEstadoDes()}</span></td>
                                                    </c:if>
                                            <td class="table-action">
                                                <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idPersona=${MiembrosMesa.getId_Persona()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                                <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                            </td>
                                        </tr>


                                    </c:forEach>




                                </tbody>
                            </table>












                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>




                                            <%--########Electores###########--%>
                                            <div class="tab-pane fade" id="Electores" role="tabpanel" aria-labelledby="Electores-tab">








                                                <table id="example" class="display" style="width:100%">
                                                    <thead>
                                                        <tr>
                                                            <th style="width:5%;">#</th>
                                                            <th style="width:15%">DNI</th>
                                                            <th style="width:35%;">Nombre</th>
                                                            <th style="width:10%;">#Mesa</th>
                                                            <th style="width:15%;">Estado de Votación</th>

                                                            <th class="d-none d-md-table-cell" style="width:10%">Estado</th>
                                                            <th>Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>




                                                        <c:forEach var="Elector" items="${Electores}" varStatus="status" >
                                                            <tr>
                                                                <td>${status.count}</td>
                                                                <td>${Elector.getId_Persona()}</td>

                                                                <td>
                                                                    <img src="${pageContext.request.contextPath}/Imagenes/${Elector.getFoto()}" width="48" height="48" class="rounded-circle mr-2" alt="Avatar"> ${Elector.primer_Nombre} ${Elector.segundo_Nombre} ${Elector.tercer_Nombre} ${Elector.primer_Apellido} ${Elector.segundo_Apellido}
                                                                </td>


                                                                <td>Mesa ${Elector.getId_Mesa()}</td>

                                                                <c:if test="${Elector.getEstadoVoto_Des()=='Inhabilitado'}">
                                                                    <td><span class="badge bg-secondary" >${Elector.getEstadoVoto_Des()}</span></td>
                                                                    </c:if>
                                                                    <c:if test="${Elector.getEstadoVoto_Des()=='Habilitado'}">
                                                                    <td><span class="badge bg-primary" >${Elector.getEstadoVoto_Des()}</span></td>
                                                                    </c:if>
                                                                    <c:if test="${Elector.getEstadoVoto_Des()=='Ya Votó'}">
                                                                    <td><span class="badge bg-success" >${Elector.getEstadoVoto_Des()}</span></td>
                                                                    </c:if>
                                                                    <c:if test="${Elector.getEstadoVoto_Des()=='No Votó'}">
                                                                    <td><span class="badge bg-danger" >${Elector.getEstadoVoto_Des()}</span></td>
                                                                    </c:if>

                                                                <c:if test="${Elector.getEstadoDes()=='Activo'}">
                                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-success" >${Elector.getEstadoDes()}</span></td>
                                                                    </c:if>
                                                                    <c:if test="${Elector.getEstadoDes()=='Inactivo'}">
                                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-secondary" >${Elector.getEstadoDes()}</span></td>
                                                                    </c:if>


                                                                <td class="table-action">
                                                                    <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idPersona=${Elector.getId_Persona()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                                                    <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                                                </td>
                                                            </tr>


                                                        </c:forEach>




                                                    </tbody>
                                                </table>











                                            </div>
                                            <%--++++++++++++++++++++++++++++++--%>




                                            <%--########Estadísticas###########--%>
                                            <div class="tab-pane fade" id="Estadísticas" role="tabpanel" aria-labelledby="Estadísticas-tab">









                                                <ul class="nav nav-tabs" id="myTab" role="tablist" style="margin-top: 10px;">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="Partidos-tab" data-bs-toggle="tab" data-bs-target="#Partidos" type="button" role="tab" aria-controls="Partidos" aria-selected="true">Partidos</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="Presidentes-tab" data-bs-toggle="tab" data-bs-target="#Presidentes" type="button" role="tab" aria-controls="Presidentes" aria-selected="false">Presidentes</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="Diputados-tab" data-bs-toggle="tab" data-bs-target="#Diputados" type="button" role="tab" aria-controls="Diputados" aria-selected="false">Diputados</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="Alcaldes-tab" data-bs-toggle="tab" data-bs-target="#Alcaldes" type="button" role="tab" aria-controls="Alcaldes" aria-selected="false">Alcaldes</button>
                                                    </li>
                                                </ul>
                                                <div class="tab-content" id="myTabContent">
                                                    <div class="tab-pane fade show active" id="Partidos" role="tabpanel" aria-labelledby="Partidos-tab">...
                                                    
                                                    
                                                    <div id="chartdiv1"></div>
                                                    
                                                    
                                                    
                                                    </div>
                                                    <div class="tab-pane fade" id="Presidentes" role="tabpanel" aria-labelledby="Presidentes-tab">...
                                                    
                                                    <div id="chartdiv"></div>
                                                    
                                                    
                                                    </div>
                                                    <div class="tab-pane fade" id="Diputados" role="tabpanel" aria-labelledby="Diputados-tab">...
                                                    <div id="chartdiv2"></div>
                                                    </div>
                                                    <div class="tab-pane fade" id="Alcaldes" role="tabpanel" aria-labelledby="Alcaldes-tab">...
                                                    <div id="chartdiv3"></div>
                                                    </div>
                                                </div>










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

        <script>
            
            
            
            
         am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv1", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data = [
  {
    country: "Partido Nacional",
    visits: 23725
  },
  {
    country: "Partido Liberal de Honduras",
    visits: 23725
  },
  {
    country: "Partido Innovación y unidad",
    visits: 1809
  },
  {
    country: "Partido Democracia Cristiana",
    visits: 1322
  },
  {
    country: "Partido Unificación Democrática",
    visits: 1122
  },
  {
    country: "Partido Anticorrupción",
    visits: 1114
  },
  {
    country: "Partido Libertad y Refundación",
    visits: 984
  },
  
];

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;
categoryAxis.fontSize = 11;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.max = 24000;
valueAxis.strictMinMax = true;
valueAxis.renderer.minGridDistance = 30;
// axis break
var axisBreak = valueAxis.axisBreaks.create();
axisBreak.startValue = 2100;
axisBreak.endValue = 22900;
//axisBreak.breakSize = 0.005;

// fixed axis break
var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
axisBreak.breakSize = 0.05 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

// make break expand on hover
var hoverState = axisBreak.states.create("hover");
hoverState.properties.breakSize = 1;
hoverState.properties.opacity = 0.1;
hoverState.transitionDuration = 1500;

axisBreak.defaultState.transitionDuration = 1000;
/*
// this is exactly the same, but with events
axisBreak.events.on("over", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
    1500,
    am4core.ease.sinOut
  );
});
axisBreak.events.on("out", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
    1000,
    am4core.ease.quadOut
  );
});*/

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.columns.template.tooltipText = "{valueY.value}";
series.columns.template.tooltipY = 0;
series.columns.template.strokeOpacity = 0;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});   
            
            
            
            
            
        </script>
        <script>
            
            
            
            
         am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv2", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data = [
  {
    country: "Partido Nacional",
    visits: 23725
  },
  {
    country: "Partido Liberal de Honduras",
    visits: 23725
  },
  {
    country: "Partido Innovación y unidad",
    visits: 1809
  },
  {
    country: "Partido Democracia Cristiana",
    visits: 1322
  },
  {
    country: "Partido Unificación Democrática",
    visits: 1122
  },
  {
    country: "Partido Anticorrupción",
    visits: 1114
  },
  {
    country: "Partido Libertad y Refundación",
    visits: 984
  },
  
];

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;
categoryAxis.fontSize = 11;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.max = 24000;
valueAxis.strictMinMax = true;
valueAxis.renderer.minGridDistance = 30;
// axis break
var axisBreak = valueAxis.axisBreaks.create();
axisBreak.startValue = 2100;
axisBreak.endValue = 22900;
//axisBreak.breakSize = 0.005;

// fixed axis break
var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
axisBreak.breakSize = 0.05 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

// make break expand on hover
var hoverState = axisBreak.states.create("hover");
hoverState.properties.breakSize = 1;
hoverState.properties.opacity = 0.1;
hoverState.transitionDuration = 1500;

axisBreak.defaultState.transitionDuration = 1000;
/*
// this is exactly the same, but with events
axisBreak.events.on("over", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
    1500,
    am4core.ease.sinOut
  );
});
axisBreak.events.on("out", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
    1000,
    am4core.ease.quadOut
  );
});*/

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.columns.template.tooltipText = "{valueY.value}";
series.columns.template.tooltipY = 0;
series.columns.template.strokeOpacity = 0;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});   
            
            
            
            
            
        </script>
        <script>
            
            
            
            
         am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);
chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

chart.data = [
  {
    country: "Partido Nacional",
    visits: 23725
  },
  {
    country: "Partido Liberal de Honduras",
    visits: 23725
  },
  {
    country: "Partido Innovación y unidad",
    visits: 1809
  },
  {
    country: "Partido Democracia Cristiana",
    visits: 1322
  },
  {
    country: "Partido Unificación Democrática",
    visits: 1122
  },
  {
    country: "Partido Anticorrupción",
    visits: 1114
  },
  {
    country: "Partido Libertad y Refundación",
    visits: 984
  },
  
];

var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
categoryAxis.renderer.grid.template.location = 0;
categoryAxis.dataFields.category = "country";
categoryAxis.renderer.minGridDistance = 40;
categoryAxis.fontSize = 11;

var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.min = 0;
valueAxis.max = 24000;
valueAxis.strictMinMax = true;
valueAxis.renderer.minGridDistance = 30;
// axis break
var axisBreak = valueAxis.axisBreaks.create();
axisBreak.startValue = 2100;
axisBreak.endValue = 22900;
//axisBreak.breakSize = 0.005;

// fixed axis break
var d = (axisBreak.endValue - axisBreak.startValue) / (valueAxis.max - valueAxis.min);
axisBreak.breakSize = 0.05 * (1 - d) / d; // 0.05 means that the break will take 5% of the total value axis height

// make break expand on hover
var hoverState = axisBreak.states.create("hover");
hoverState.properties.breakSize = 1;
hoverState.properties.opacity = 0.1;
hoverState.transitionDuration = 1500;

axisBreak.defaultState.transitionDuration = 1000;
/*
// this is exactly the same, but with events
axisBreak.events.on("over", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 1 }, { property: "opacity", to: 0.1 }],
    1500,
    am4core.ease.sinOut
  );
});
axisBreak.events.on("out", function() {
  axisBreak.animate(
    [{ property: "breakSize", to: 0.005 }, { property: "opacity", to: 1 }],
    1000,
    am4core.ease.quadOut
  );
});*/

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.categoryX = "country";
series.dataFields.valueY = "visits";
series.columns.template.tooltipText = "{valueY.value}";
series.columns.template.tooltipY = 0;
series.columns.template.strokeOpacity = 0;

// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
series.columns.template.adapter.add("fill", function(fill, target) {
  return chart.colors.getIndex(target.dataItem.index);
});   
            
            
            
            
            
        </script>


    </body>
</html>



