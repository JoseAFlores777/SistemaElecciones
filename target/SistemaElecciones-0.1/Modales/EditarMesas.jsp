<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Editar | Mesas</title>
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
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-body">

                                    <form  action="${pageContext.request.contextPath}/ServletControladorMesas?accion=modificar&idMesa=${mesa.getId_Mesa()}" method="POST" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">ID de la Mesa</label>
                                                    <input type="text" class="form-control" id="inputDNI" placeholder="Sin Guiones" name="idPartido" required value="${mesa.getId_Mesa()}" disabled>
                                                </div>

                                                <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputState">Departamento</label>
                                                    <select id="inputState" class="form-control" name="idTipo" >
                                                        <option value="${mesa.getID_Depto_Nom()}">${mesa.getDepto_Nom()}</option>
                                                            <c:forEach var="Deptos" items="${Departamentos}" varStatus="status" >
                                                            <option value="${Deptos.getId_Departamento()}">${Deptos.getNombre()}</option>
                                                            </c:forEach>
                                                    </select>
                                                </div>
                                                            
                                                            
                                                                                                            <div class="mb-3 col-md-12">
                                                    <label class="form-label" for="inputFirstName">Nombre del Partido</label>
                                                    <input type="text" class="form-control" id="inputFirstName" placeholder="" name="Nombre" required value="${partido.getNombre()}">
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



