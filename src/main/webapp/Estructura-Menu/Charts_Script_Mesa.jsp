        <%@page import="dominio.Mesa"%>
<%@page import="dominio.Persona"%>
<%@page import="dominio.Persona"%>
<%@page import="java.sql.SQLException"%>
<%@page import="datos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    Persona usuario = new Persona();
    Mesa mesa = new Mesa();

    usuario = (Persona) session.getAttribute("credencial");
    mesa = (Mesa) session.getAttribute("mesa");
    System.out.println(usuario.getNombreCompleto());
    String Nombre = usuario.getNombreCompleto();
    String Foto = usuario.getFoto();




            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            String Partidos = "", Votos = "", VotosP = "", VotosD = "", VotosA = "", Presidente = "", Diputado = "", Alcalde = "";

            try {
                conn = Conexion.getConnection();
                stmt = conn.prepareStatement("SELECT T2.Nombre, SUM(T1.Votos) FROM Votos AS  T1 INNER JOIN Partidos AS T2 ON(T2.idPartido=T1.idPartido) WHERE T1.idMesa=" + mesa.getId_Mesa() + " GROUP BY T2.Nombre;");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Partidos += "'" + rs.getString(1) + "',";
                    Votos += "" + rs.getString(2) + ",";

                }

                //quitar la ultima coma de las cadenas
                Partidos = Partidos.substring(0, Partidos.length() - 1);
                Votos = Votos.substring(0, Votos.length() - 1);

            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            } finally {
                Conexion.close(rs);
                Conexion.close(stmt);
                Conexion.close(conn);
            }


            try {
                conn = Conexion.getConnection();
                stmt = conn.prepareStatement("SELECT CONCAT(T2.PrimerNombre,' ',T2.SegundoNombre,' ',T2.PrimerApellido,' ',T2.SegundoApellido), SUM(T1.Votos) FROM Votos AS  T1 INNER JOIN Personas AS T2 ON(T2.idPersona=T1.idPersona) WHERE T1.idMesa=" + mesa.getId_Mesa() + " AND T1.idTipo=1 GROUP BY T2.idPersona;");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Presidente += "'" + rs.getString(1) + "',";
                    VotosP += "" + rs.getString(2) + ",";

                }

                //quitar la ultima coma de las cadenas
                Presidente = Presidente.substring(0, Presidente.length() - 1);
                VotosP = VotosP.substring(0, VotosP.length() - 1);

            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            } finally {
                Conexion.close(rs);
                Conexion.close(stmt);
                Conexion.close(conn);
            }

          try {
                conn = Conexion.getConnection();
                stmt = conn.prepareStatement("SELECT CONCAT(T2.PrimerNombre,' ',T2.SegundoNombre,' ',T2.PrimerApellido,' ',T2.SegundoApellido), SUM(T1.Votos) FROM Votos AS  T1 INNER JOIN Personas AS T2 ON(T2.idPersona=T1.idPersona) WHERE T1.idMesa=" + mesa.getId_Mesa() + " AND T1.idTipo=3 GROUP BY T2.idPersona;");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Diputado += "'" + rs.getString(1) + "',";
                    VotosD += "" + rs.getString(2) + ",";

                }

                //quitar la ultima coma de las cadenas
                Diputado = Diputado.substring(0, Diputado.length() - 1);
                VotosD = VotosD.substring(0, VotosD.length() - 1);

            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            } finally {
                Conexion.close(rs);
                Conexion.close(stmt);
                Conexion.close(conn);
            }

            try {
                conn = Conexion.getConnection();
                stmt = conn.prepareStatement("SELECT CONCAT(T2.PrimerNombre,' ',T2.SegundoNombre,' ',T2.PrimerApellido,' ',T2.SegundoApellido), SUM(T1.Votos) FROM Votos AS  T1 INNER JOIN Personas AS T2 ON(T2.idPersona=T1.idPersona) WHERE T1.idMesa=" + mesa.getId_Mesa() + " AND T1.idTipo=2 GROUP BY T2.idPersona;");
                rs = stmt.executeQuery();

                while (rs.next()) {
                    Alcalde += "'" + rs.getString(1) + "',";
                    VotosA += "" + rs.getString(2) + ",";

                }

                //quitar la ultima coma de las cadenas
                Alcalde = Alcalde.substring(0, Alcalde.length() - 1);
                VotosA = VotosA.substring(0, VotosA.length() - 1);

            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            } finally {
                Conexion.close(rs);
                Conexion.close(stmt);
                Conexion.close(conn);
            }


        %>





        <script>


            var chart = Highcharts.chart({
                chart: {
                    renderTo: 'container'  // Pongo que tipo de gráfica es
                },
                title: {
                    text: 'Estadística de Partidos Políticos'
                },
                subtitle: {
                    text: 'Conteo de Votos Por Partido'
                },
                xAxis: {
                    categories: [<%=Partidos%>],
                    // Pongo el título para el eje de las 'X'
                    title: {
                        text: 'Partidos'
                    }
                }, yAxis: {
                    // Pongo el título para el eje de las 'Y'
                    title: {
                        text: 'Nº Votos'
                    }
                },
                series: [{
                        type: 'column',
                        colorByPoint: true,
                        data: [<%=Votos%>],
                        showInLegend: false
                    }]
            });


            document.getElementById('plain').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: false,
                        polar: false
                    },
                    subtitle: {
                        text: 'Plain'
                    }
                });
            });

            document.getElementById('inverted').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: true,
                        polar: false
                    },
                    subtitle: {
                        text: 'Inverted'
                    }
                });
            });

            document.getElementById('polar').addEventListener('click', () => {
                chart.update({
                    chart: {
                        inverted: false,
                        polar: true
                    },
                    subtitle: {
                        text: 'Polar'
                    }
                });
            });







            var chart2 = Highcharts.chart({
                chart: {
                    renderTo: 'PresidentesChart'  // Pongo que tipo de gráfica es
                },
                title: {
                    text: 'Estadística de Presidentes'
                },
                subtitle: {
                    text: 'Conteo de Votos Por Presidente'
                },
                xAxis: {
                    categories: [<%=Presidente%>],
                    // Pongo el título para el eje de las 'X'
                    title: {
                        text: 'Presidentes'
                    }
                }, yAxis: {
                    // Pongo el título para el eje de las 'Y'
                    title: {
                        text: 'Nº Votos'
                    }
                },
                series: [{
                        type: 'column',
                        colorByPoint: true,
                        data: [<%=VotosP%>],
                        showInLegend: false
                    }]
            });


            document.getElementById('plain2').addEventListener('click', () => {
                chart2.update({
                    chart: {
                        inverted: false,
                        polar: false
                    },
                    subtitle: {
                        text: 'Plain'
                    }
                });
            });

            document.getElementById('inverted2').addEventListener('click', () => {
                chart2.update({
                    chart: {
                        inverted: true,
                        polar: false
                    },
                    subtitle: {
                        text: 'Inverted'
                    }
                });
            });

            document.getElementById('polar2').addEventListener('click', () => {
                chart2.update({
                    chart: {
                        inverted: false,
                        polar: true
                    },
                    subtitle: {
                        text: 'Polar'
                    }
                });
            });








            var chart3 = Highcharts.chart({
                chart: {
                    renderTo: 'DiputadosChart'  // Pongo que tipo de gráfica es
                },
                title: {
                    text: 'Estadística de Diputados'
                },
                subtitle: {
                    text: 'Conteo de Votos Por Diputados'
                },
                xAxis: {
                    categories: [<%=Diputado%>],
                    // Pongo el título para el eje de las 'X'
                    title: {
                        text: 'Diputados'
                    }
                }, yAxis: {
                    // Pongo el título para el eje de las 'Y'
                    title: {
                        text: 'Nº Votos'
                    }
                },
                series: [{
                        type: 'column',
                        colorByPoint: true,
                        data: [<%=VotosD%>],
                        showInLegend: false
                    }]
            });


            document.getElementById('plain3').addEventListener('click', () => {
                chart3.update({
                    chart: {
                        inverted: false,
                        polar: false
                    },
                    subtitle: {
                        text: 'Plain'
                    }
                });
            });

            document.getElementById('inverted3').addEventListener('click', () => {
                chart3.update({
                    chart: {
                        inverted: true,
                        polar: false
                    },
                    subtitle: {
                        text: 'Inverted'
                    }
                });
            });

            document.getElementById('polar3').addEventListener('click', () => {
                chart3.update({
                    chart: {
                        inverted: false,
                        polar: true
                    },
                    subtitle: {
                        text: 'Polar'
                    }
                });
            });








            var chart4 = Highcharts.chart({
                chart: {
                    renderTo: 'AlcaldesChart'  // Pongo que tipo de gráfica es
                },
                title: {
                    text: 'Estadística de Alcaldes'
                },
                subtitle: {
                    text: 'Conteo de Votos Por Alcaldes'
                },
                xAxis: {
                    categories: [<%=Alcalde%>],
                    // Pongo el título para el eje de las 'X'
                    title: {
                        text: 'Alcaldes'
                    }
                }, yAxis: {
                    // Pongo el título para el eje de las 'Y'
                    title: {
                        text: 'Nº Votos'
                    }
                },
                series: [{
                        type: 'column',
                        colorByPoint: true,
                        data: [<%=VotosP%>],
                        showInLegend: false
                    }]
            });


            document.getElementById('plain4').addEventListener('click', () => {
                chart4.update({
                    chart: {
                        inverted: false,
                        polar: false
                    },
                    subtitle: {
                        text: 'Plain'
                    }
                });
            });

            document.getElementById('inverted4').addEventListener('click', () => {
                chart4.update({
                    chart: {
                        inverted: true,
                        polar: false
                    },
                    subtitle: {
                        text: 'Inverted'
                    }
                });
            });

            document.getElementById('polar4').addEventListener('click', () => {
                chart4.update({
                    chart: {
                        inverted: false,
                        polar: true
                    },
                    subtitle: {
                        text: 'Polar'
                    }
                });
            });






        </script>