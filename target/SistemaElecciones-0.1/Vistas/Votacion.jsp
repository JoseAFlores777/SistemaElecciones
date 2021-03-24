<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();

    usuario = (Persona) session.getAttribute("credencial");
    System.out.println(usuario.getNombreCompleto());
    System.out.println(usuario.getId_Mesa_Estado());
    System.out.println(usuario.getId_Mesa());
    System.out.println(usuario.getId_Persona());
    System.out.println(usuario.getEstadoVoto());
    if (Integer.parseInt(usuario.getId_Mesa_Estado()) != 2) {
        response.sendRedirect("ControladorMenus?accion=MesaCerrada");
    } else {

        if (usuario.getEstadoVoto() == 1) {
            response.sendRedirect("ControladorMenus?accion=Inhabilitado");
        } else if (usuario.getEstadoVoto() == 3) {
            response.sendRedirect("ControladorMenus?accion=YaVoto");
        }
    }


%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <title>Votación</title>

        <style>
            .FotoCandidato{
                max-width: 100% !important;
                height: 200px !important;
            }

        </style>

    </head>

    <body>

        <div class="wrapper">



            <div class="main">

                <jsp:include page="/Estructura-Menu/NavBar.jsp"/>

                <main class="content">


                    <%--Inicio de Contenido--%>
                    <div class="card">
                        <div class="card-body" style="background-color: #cccccc">
                            <h1 style="text-align: center;">Papeleta Electoral</h1>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/ServletControladorVotos?accion=insertar&idMesa=<%=usuario.getId_Mesa()%>&idVotante=<%=usuario.getId_Persona()%>" method="POST">
                        <div class="accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingOne">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                        <h1 style="text-align: center">Presidencial</h1>
                                    </button>
                                </h2>
                                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">

                                        <div class="container-fluid overflow-auto">
                                            <div class="row flex-nowrap">

                                                <c:forEach var="presidente" items="${Presidentes}" varStatus="status" >
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${presidente.getFoto_Partido()}" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${presidente.getFoto()}" class=" card-img-top img-fluid rounded FotoCandidato" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 100%; text-align: center"><b>${presidente.getNombreCompleto()}</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Presidente form-check-input"  type="checkbox" name="idPersona" value="${presidente.getId_Persona()}" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>





                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <h1 style="text-align: center">Diputados</h1>
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">     

                                        <c:forEach var="partido" items="${Partidos}" varStatus="status" >
                                            <div class="row">
                                                <div class="col-2" style="height: 550px;">
                                                    <div class="card" style="height: 100%" >

                                                        <div class="card-body row " style="height: 100%; align-content: center; background-color: #ededed">
                                                            <h5 style="font-size: 26px; text-align: center;"><b>${partido.getNombre()}</b></h5>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="col-10 container-fluid overflow-auto">
                                                    <div class="row flex-nowrap">
                                                        <c:forEach var="diputado" items="${Diputados}" varStatus="status" >

                                                            <c:if test="${diputado.getId_Partido()== partido.getId_Partido()}">
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${diputado.getFoto_Partido()}" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${diputado.getFoto()}" class=" card-img-top img-fluid rounded FotoCandidato" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 100%; text-align: center"><b>${diputado.getNombreCompleto()}</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" name="idPersona" value="${diputado.getId_Persona()}" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                            </c:if>



                                                        </c:forEach>


                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>














                                        
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <h1 style="text-align: center">Alcaldes</h1>
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="container-fluid overflow-auto">

                                            <div class="row flex-nowrap">
                                                <c:forEach var="alcalde" items="${Alcaldes}" varStatus="status" >
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${alcalde.getFoto_Partido()}" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="${pageContext.request.contextPath}/Imagenes/${alcalde.getFoto()}" class=" card-img-top img-fluid rounded FotoCandidato" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 100%; text-align: center"><b>${alcalde.getNombreCompleto()}</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Alcalde form-check-input"  type="checkbox" name="idPersona" value="${alcalde.getId_Persona()}" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>


                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button class="btn btn-outline-success mt-5" type="submit" style="height: 70px; font-size: 25px;">Realizar Voto</button>

                        </div>
                    </form>

                    <%--<jsp:include page="/Modales/EditarPersona.jsp"/>  --%>
                    <%--Final de Contenido--%>


                </main>
                <footer class="footer">
                    <jsp:include page="/Estructura-Menu/footer.jsp"/>  
                </footer>

            </div>

        </div>



        <jsp:include page="/Estructura-Menu/html-scripts.jsp"/>  ç


        <script language="javascript">
            $(document).ready(function () {

            <%                int p = 1;
                int d = 3;
                int a = 1;

            %>

                // Evento que se ejecuta al soltar una tecla en el input
                //$("#cantidad").keydown(function () {
                //  $("input.Presidente[type=checkbox]").prop('checked', false);
                //$("#seleccionados").html("0");
                //});
//input.myClass[type=checkbox]
                // Evento que se ejecuta al pulsar en un checkbox
                $("input.Presidente[type=checkbox]").change(function () {

                    // Cogemos el elemento actual
                    var elemento = this;
                    var contador = 0;

                    // Recorremos todos los checkbox para contar los que estan seleccionados
                    $("input.Presidente[type=checkbox]").each(function () {
                        if ($(this).is(":checked"))
                            contador++;
                    });



                    // Comprovamos si supera la cantidad máxima indicada
                    if (contador > <%=p%>)
                    {
                        alert("Has seleccionado mas checkbox que los indicados");

                        // Desmarcamos el ultimo elemento
                        $(elemento).prop('checked', false);
                        contador--;
                    }

                    $("#seleccionados").html(contador);
                });
                $("input.Diputado[type=checkbox]").change(function () {

                    // Cogemos el elemento actual
                    var elemento = this;
                    var contador = 0;

                    // Recorremos todos los checkbox para contar los que estan seleccionados
                    $("input.Diputado[type=checkbox]").each(function () {
                        if ($(this).is(":checked"))
                            contador++;
                    });



                    // Comprovamos si supera la cantidad máxima indicada
                    if (contador > <%=d%>)
                    {
                        alert("Has seleccionado mas checkbox que los indicados");

                        // Desmarcamos el ultimo elemento
                        $(elemento).prop('checked', false);
                        contador--;
                    }

                    $("#seleccionados").html(contador);
                });
                $("input.Alcalde[type=checkbox]").change(function () {

                    // Cogemos el elemento actual
                    var elemento = this;
                    var contador = 0;

                    // Recorremos todos los checkbox para contar los que estan seleccionados
                    $("input.Alcalde[type=checkbox]").each(function () {
                        if ($(this).is(":checked"))
                            contador++;
                    });



                    // Comprovamos si supera la cantidad máxima indicada
                    if (contador > <%=a%>)
                    {
                        alert("Has seleccionado mas checkbox que los indicados");

                        // Desmarcamos el ultimo elemento
                        $(elemento).prop('checked', false);
                        contador--;
                    }

                    $("#seleccionados").html(contador);
                });
            });
        </script>
    </body>
</html>