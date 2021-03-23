
<%@page import="datos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Mesas Electorales</title>
    </head>

    <body onload="mostrar_mapa(0, 0)">

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">


                    <%--Inicio de Contenido--%>


                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de Página--%>
                        <body>
                            <div class="row mb-2 mb-xl-3">
                                <div class="col-auto d-none d-sm-block">
                                    <h3><strong>Mesas</strong> Electorales</h3>
                                </div>

                                <div class="col-auto ml-auto text-right mt-n1">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
<li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Mesas</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <%--Fin de Titulo de Página--%>



                            <%--iNICIO DE mAPA--%>
                            <p>
                                <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    Ver Mapa
                                </button>
                            </p>
                            <div class="collapse" id="collapseExample">

                                <div class="card">
                                    <div class="card-header">
                                        <h5 class="card-title">Geoubicacion de Mesas Electorales</h5>
                                        <h6 class="card-subtitle text-muted">Seleccione cualquiera de los globos para ver más detalles</h6>
                                    </div>
                                    <div class="card-body">
                                        <div class="content" id="hybrid_map" style="height: 300px;"></div>
                                    </div>
                                </div>

                            </div>
                            <%--fIN DE mAPA--%>



                            <div class="card" style="padding-top: 20px;">

                                <a href="${pageContext.request.contextPath}/ServletControladorMesas?accion=BuscarReferencias" type="button" class="btn  btn-outline-success" style="margin-left:25%; margin-right: 25%; margin-bottom: 10px;"><i class="fas fa-plus"></i> Agregar</a>


                                <table id="example" class="table display" style="margin-top:100%;">
                                    <thead>
                                        <tr>
                                            <th style="width:5%;">#</th>
                                            <th style="width:10%">Id de Mesa</th>
                                            <th style="width:16%">Departamento</th>
                                            <th style="width:17%;">Municipio</th>
                                            <th style="width:30%;">Lugar De votacion</th>
                                            <th class="d-none d-md-table-cell" style="width:10%">Estado</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>




                                        <c:forEach var="mesa" items="${mesas}" varStatus="status" >
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${mesa.getId_Mesa()}</td>
                                                <td>${mesa.getDepto_Nom()}</td>
                                                <td>${mesa.getId_Municipio_Nomb()}</td>
                                                <td>${mesa.getNombre()}</td>

                                                <c:if test="${mesa.getEstadoDes()=='En Espera'}">
                                                    <td><span class="badge bg-warning" >${mesa.getEstadoDes()}</span></td>
                                                    </c:if>
                                                    <c:if test="${mesa.getEstadoDes()=='Cerrada'}">
                                                    <td><span class="badge bg-secondary" >${mesa.getEstadoDes()}</span></td>
                                                    </c:if>
                                                    <c:if test="${mesa.getEstadoDes()=='Abierta'}">
                                                    <td><span class="badge bg-primary" >${mesa.getEstadoDes()}</span></td>
                                                    </c:if>


                                                <td class="table-action">
                                                    <a href="${pageContext.request.contextPath}/ServletControladorMesas?accion=ver&idMesa=${mesa.getId_Mesa()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-eye align-middle mr-2"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg></a>
                                                    <a href="${pageContext.request.contextPath}/ServletControladorMesas?accion=editar&idMesa=${mesa.getId_Mesa()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle mr-2"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                                    <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                                </td>
                                            </tr>


                                        </c:forEach>




                                    </tbody>
                                </table>
                            </div>
                    </div>



                    <%--Final de Contenido--%>


                </main>
                <footer class="footer">
                    <jsp:include page="/Estructura-Menu/footer.jsp"/>  
                </footer>

            </div>

        </div>



        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  
        <jsp:include page="/Estructura-Menu/Mapa_Scripts.jsp"/>  




           




    </body>
</html>

































