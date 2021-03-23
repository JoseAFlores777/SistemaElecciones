










<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Mesas</title>
    </head>

    <body onload="mostrar_mapa(1, 1)">

        <div class="wrapper">
            <jsp:include page="/Estructura-Menu/Sidebar.jsp"/>


            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">
                    <div class="container-fluid p-0">
                        <%--Inicio de Titulo de Página--%>

                        <div class="row mb-2 mb-xl-3">
                            <div class="col-auto d-none d-sm-block">
                                <h3><strong>Agregar</strong> Mesa</h3>
                            </div>

                            <div class="col-auto ml-auto text-right mt-n1">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>
                                        <li class="breadcrumb-item"><a href="ControladorMenus?accion=Mesas">Mesas</a></li>
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

                                    <form  action="${pageContext.request.contextPath}/ServletControladorMesas?accion=insertar" method="POST" >
                                        <div class="row">
                                            <div class="col-md-12">


                                                <div class="col-12 col-lg-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h5 class="card-title">Geoubicacion de Mesa</h5>
                                                            <h6 class="card-subtitle text-muted">Displays a mixture of normal and satellite views.</h6>
                                                        </div>
                                                        <div class="card-body">
                                                            <div class="content" id="hybrid_map" style="height: 300px;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">

                                                <div class="row">
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputState">Departamento</label>
                                                        <select id="Deptos" class="form-control" onchange="combo_Municipios()" name="f_area">
                                                            <option value="">-- Escoja un Departamento --</option>
                                                            <c:forEach var="Deptos" items="${Departamentos}" varStatus="status" >
                                                                <option value="${Deptos.getId_Departamento()}">${Deptos.getNombre()}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputState">Municipio</label>
                                                        <select id="i_municipios" class="form-control" name="idMunicipio" >


                                                        </select>
                                                    </div>
                                                </div>


                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">Centro de Votación</label>
                                                    <input type="text" class="form-control" id="LugarVoto" placeholder="" name="Nombre" required >
                                                </div>

                                                <div class="row">
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputFirstName">Latitud</label>
                                                        <input id="Latitud" type="text" class="form-control" id="inputFirstName" placeholder="" name="Latitud"  value="14.6203">
                                                    </div>
                                                    <div class="mb-3 col-md-6">
                                                        <label class="form-label" for="inputFirstName">Longitud</label>
                                                        <input id="Longitud" type="text" class="form-control" id="inputFirstName" placeholder="" name="Longitud"  value="-87.644">
                                                    </div>
                                                </div>



                                            </div>






                                            <div class="modal-footer">


                                                <a href="ControladorMenus?accion=Mesas"  type="button" class="btn btn-secondary" >Cancelar</a>    


                                                <button type="submit" class="btn btn-primary">Guardar</button>
                                            </div>
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


        <jsp:include page="/Estructura-Menu/MunicipioComboDep.jsp"/>  
        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  
        <jsp:include page="/Estructura-Menu/Mapa_Scripts.jsp"/>  



    </body>
</html>



