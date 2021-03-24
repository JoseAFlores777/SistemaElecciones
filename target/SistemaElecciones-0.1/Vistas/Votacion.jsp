<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();
    
    usuario = (Persona)session.getAttribute("credencial");
            System.out.println(usuario.getNombreCompleto());
            System.out.println(usuario.getId_Mesa_Estado());
            System.out.println(usuario.getEstadoVoto());
if (Integer.parseInt(usuario.getId_Mesa_Estado()) != 2) {
        response.sendRedirect("ControladorMenus?accion=MesaCerrada");
    }else{

    if (usuario.getEstadoVoto()==1) {
            response.sendRedirect("ControladorMenus?accion=Inhabilitado");
        }else if(usuario.getEstadoVoto()==3){
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

                    <form action="" method="POST">
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
                                                
                                                
                                                
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Presidente form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



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
                                        <div class="row">
                                            <div class="col-2" style="height: 550px;">
                                                <div class="card" style="height: 100%" >

                                                    <div class="card-body row " style="height: 100%; align-content: center; background-color: #ededed">
                                                        <h5 style="font-size: 26px; text-align: center;"><b>Partido Liberal de Honduras</b></h5>

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-10 container-fluid overflow-auto">
                                                <div class="row flex-nowrap">
                                                    
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                    


                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-2" style="height: 550px;">
                                                <div class="card" style="height: 100%" >

                                                    <div class="card-body row " style="height: 100%; align-content: center; background-color: #ededed">
                                                        <h5 style="font-size: 26px; text-align: center;"><b>Partido Liberal de Honduras</b></h5>

                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-10 container-fluid overflow-auto">
                                                <div class="row flex-nowrap">
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div  class="col-3" style="width: 233px;">
                                                        <div class="card" style="width: 13rem;">
                                                            <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                            <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                            <div class="card-body">
                                                                <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                                <div class="form-check" >
                                                                    <input class="Diputado form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                    <label class="form-check-label" for="defaultCheck1">

                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>

                                            </div>
                                        </div>
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
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div  class="col-3" style="width: 233px;">
                                                    <div class="card" style="width: 13rem;">
                                                        <img src="Imagenes/liberal@4x.png" style="height: 117px" class="card-img-top" alt="...">
                                                        <img src="Imagenes/Foto_Perfil.png" class="card-img-top img-fluid rounded" alt="...">
                                                        <div class="card-body">
                                                            <h5 class="card-title" style="font-size: 16px; text-align: center"><b>JOSÉ ADOLFO IZAGUIRRE FLORES</b></h5>

                                                            <div class="form-check" >
                                                                <input class="Alcalde form-check-input"  type="checkbox" value="" id="defaultCheck1" style="width: 110;height: 110;margin-left: auto;">
                                                                <label class="form-check-label" for="defaultCheck1">

                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


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

            <%
                int p = 1;
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