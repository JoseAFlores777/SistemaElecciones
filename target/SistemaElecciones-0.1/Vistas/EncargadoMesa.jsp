

<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Usuarios | Mesas</title>
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
                <h3><strong>Usuarios</strong> Encargados de Mesa</h3>
            </div>

            <div class="col-auto ml-auto text-right mt-n1">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                        <li class="breadcrumb-item"><a href="#">Sistema De Elecciones</a></li>
                        <li class="breadcrumb-item"><a href="#">Usuarios</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Encargados de Mesa</li>
                    </ol>
                </nav>
            </div>
        </div>
            <%--Fin de Titulo de Página--%>

                        <div class="card">

                            <table id="example" class="table display" style="margin-top: 20px;">
                                <thead>
                                    <tr>
                                        <th style="width:40%;">Name</th>
                                        <th style="width:25%">Phone Number</th>
                                        <th class="d-none d-md-table-cell" style="width:25%">Date of Birth</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <img src="adminkit-main/static/img/avatars/avatar-2.jpg" width="48" height="48" class="rounded-circle mr-2" alt="Avatar"> Vanessa Tucker
                                        </td>

                                        <td>864-348-0485</td>
                                        <td class="d-none d-md-table-cell">June 21, 1961</td>
                                        <td class="table-action">
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="adminkit-main/static/img/avatars/avatar-3.jpg" width="48" height="48" class="rounded-circle mr-2" alt="Avatar">William Harris</td>
                                        <td>914-939-2458</td>
                                        <td class="d-none d-md-table-cell">May 15, 1948</td>
                                        <td class="table-action">
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="adminkit-main/static/img/avatars/avatar-2.jpg" width="48" height="48" class="rounded-circle mr-2" alt="Avatar">Sharon Lessman</td>
                                        <td>704-993-5435</td>
                                        <td class="d-none d-md-table-cell">September 14, 1965</td>
                                        <td class="table-action">
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="adminkit-main/static/img/avatars/avatar-4.jpg" width="48" height="48" class="rounded-circle mr-2" alt="Avatar">Christina Mason</td>
                                        <td>765-382-8195</td>
                                        <td class="d-none d-md-table-cell">April 2, 1971</td>
                                        <td class="table-action">
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="adminkit-main/static/img/avatars/avatar-5.jpg" width="48" height="48" class="rounded-circle mr-2" alt="Avatar">Robin Schneiders</td>
                                        <td>202-672-1407</td>
                                        <td class="d-none d-md-table-cell">October 12, 1966</td>
                                        <td class="table-action">
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 align-middle"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
                                            <a href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash align-middle"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></a>
                                        </td>
                                    </tr>
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
































