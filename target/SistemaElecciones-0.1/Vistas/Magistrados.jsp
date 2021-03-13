<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Usuarios | Magistrados</title>
    </head>

    <body>

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
                <h3><strong>Usuarios</strong> Magistrados</h3>
            </div>

            <div class="col-auto ml-auto text-right mt-n1">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                        <li class="breadcrumb-item"><a href="#">Sistema De Elecciones</a></li>
                        <li class="breadcrumb-item"><a href="#">Usuarios</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Magistrados</li>
                    </ol>
                </nav>
            </div>
        </div>
            <%--Fin de Titulo de Página--%>

                        <div class="card" style="padding-top: 20px;">

                            <button type="button" class="btn  btn-outline-success" style="margin-left:25%; margin-right: 25%; margin-bottom: 10px;"><i class="fas fa-plus"></i> Agregar</button>


                            <table id="example" class="table display" style="margin-top:100%;">
                                <thead>
                                    <tr>
                                        <th style="width:5%;">#</th>
                                        <th style="width:40%;">Nombre</th>
                                        <th style="width:25%">Cargo</th>
                                        <th class="d-none d-md-table-cell" style="width:15%">Estado</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>




                                    <c:forEach var="persona" items="${personas}" varStatus="status" >
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>
                                                <img src="${pageContext.request.contextPath}/ControladorIMG?TipoFoto=1&id=${persona.getId_Persona()}" width="48" height="48" class="rounded-circle mr-2" alt="Avatar"> ${persona.primer_Nombre} ${persona.segundo_Nombre} ${persona.tercer_Nombre} ${persona.primer_Apellido} ${persona.segundo_Apellido}
                                            </td>

                                            <td>${persona.getId_Tipo_Des()}</td>
                                                                                            <c:if test="${persona.getEstadoDes()=='Activo'}">
                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-success" >${persona.getEstadoDes()}</span></td>
                                                    </c:if>
                                                <c:if test="${persona.getEstadoDes()=='Inactivo'}">
                                                    <td class="d-none d-md-table-cell" ><span class="badge bg-secondary" >${persona.getEstadoDes()}</span></td>
                                                    </c:if>
                                            <td class="table-action">
                                                <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idPersona=${persona.getId_Persona()}" ><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
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
    </body>
</html>

































