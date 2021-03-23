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