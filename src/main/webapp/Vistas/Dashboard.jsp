<%@page import="java.sql.SQLException"%>
<%@page import="datos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dominio.Persona"%>
<%
    Persona usuario = new Persona();

    usuario = (Persona) session.getAttribute("credencial");
    System.out.println(usuario.getNombreCompleto());
    if (usuario.getId_Tipo() == 4) {

    } else if (usuario.getId_Tipo() == 6) {
        response.sendRedirect("ServletControladorMesas?accion=ver&idMesa=" + usuario.getId_Mesa());

    } else if (usuario.getId_Tipo() == 7) {
        response.sendRedirect("ServletControladorVotos?accion=verPortada");

    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String ElectoresNum = "", ElectoresYaVotaron = "", CandidatosNum = "", PresidentesNum = "", DiputadosNum = "", AlcaldesNum = "", MesasNum = "", MesasEspera = "", MesasAbiertas = "", MesasCerradas = "",
            PartidosNum = "", PartidosNombres = "";

    try {
        conn = Conexion.getConnection();
        stmt = conn.prepareStatement("SELECT count(*) FROM Personas;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            ElectoresNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Personas WHERE Estado_Voto=3;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            ElectoresYaVotaron = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Personas WHERE idTipo>=1 AND idTipo<=3;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            CandidatosNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Personas WHERE idTipo=1;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            PresidentesNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Personas WHERE idTipo=2");
        rs = stmt.executeQuery();

        while (rs.next()) {
            AlcaldesNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Personas WHERE idTipo=3;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            DiputadosNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Mesas;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            MesasNum = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Mesas WHERE Estado=1;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            MesasEspera = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Mesas WHERE Estado=2;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            MesasAbiertas = rs.getString(1);

        }

        stmt = conn.prepareStatement("SELECT count(*) FROM Mesas WHERE Estado=3;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            MesasCerradas = rs.getString(1);

        }
        stmt = conn.prepareStatement("SELECT count(*) FROM Partidos;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            PartidosNum = rs.getString(1);

        }
        stmt = conn.prepareStatement("SELECT T2.Nombre FROM Votos AS  T1 INNER JOIN Partidos AS T2 ON(T2.idPartido=T1.idPartido)  GROUP BY T2.Nombre;");
        rs = stmt.executeQuery();

        while (rs.next()) {
            PartidosNombres += "'" + rs.getString(1) + "',";

        }
        PartidosNombres = PartidosNombres.substring(0, PartidosNombres.length() - 1);
System.out.println(PartidosNombres);
    } catch (SQLException ex) {
        ex.printStackTrace(System.out);
    } finally {
        Conexion.close(rs);
        Conexion.close(stmt);
        Conexion.close(conn);
    }


%>



<html lang="es">

    <head>

        <jsp:include page="/Estructura-Menu/Head-metas.jsp"/>

        <style>
            .highcharts-figure, .highcharts-data-table table {
                min-width: 310px; 
                max-width: 800px;
                margin: 1em auto;
            }

            .highcharts-data-table table {
                font-family: Verdana, sans-serif;
                border-collapse: collapse;
                border: 1px solid #EBEBEB;
                margin: 10px auto;
                text-align: center;
                width: 100%;
                max-width: 500px;
            }
            .highcharts-data-table caption {
                padding: 1em 0;
                font-size: 1.2em;
                color: #555;
            }
            .highcharts-data-table th {
                font-weight: 600;
                padding: 0.5em;
            }
            .highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
                padding: 0.5em;
            }
            .highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
                background: #f8f8f8;
            }
            .highcharts-data-table tr:hover {
                background: #f1f7ff;
            }

            #button-bar {
                min-width: 310px;
                max-width: 800px;
                margin: 0 auto;
            }




        </style>

        <title>Dashboard</title>
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
                                    <h3><strong>Vistas</strong> Dashboard</h3><br><br>
                                    <%                                                                                                if (usuario.getId_Tipo() == 4) {%>
                                    <a href="ServletControladorVotos?accion=verPortada" type="button" class="btn btn-outline-secondary" style="margin-left: 5px; margin-bottom: 15px;" target="_blank">Realizar Mi Voto</a>                                
                                    <%}%>
                                </div>

                                <div class="col-auto ml-auto text-right mt-n1">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                            <li class="breadcrumb-item"><a href="ControladorMenus?accion=Dashboard">Inicio</a></li>

                                            <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <%--Fin de Titulo de Página--%>




                            <div class="row">
                                <div class="col-xl-6 col-xxl-5 d-flex">
                                    <div class="w-100">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="card" style="height: 125px;">
                                                    <div class="row card-body">
                                                        <div class="col-6">
                                                            <h5 class="card-title mb-4">Electores</h5>
                                                            <h1 class="mt-1 mb-3"><%=ElectoresNum%></h1>
                                                        </div>
                                                        <div class="col-6 mb-1">
                                                            <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i><%=ElectoresYaVotaron%></span>
                                                            <span class="text-muted">Ya Votaron</span><br>
                                                            <span class="text-danger"> <i class="mdi mdi-arrow-bottom-right"></i><%=Integer.parseInt(ElectoresNum) - Integer.parseInt(ElectoresYaVotaron)%></span>
                                                            <span class="text-muted">No Han Votado</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card" style="height: 125px;">
                                                    <div class="row card-body">
                                                        <div class="col-6">
                                                            <h5 class="card-title mb-4">Candidatos</h5>
                                                            <h1 class="mt-1 mb-3"><%=CandidatosNum%></h1>
                                                        </div>
                                                        <div class="col-6 mb-1">
                                                            <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i><%=PresidentesNum%></span>
                                                            <span class="text-muted">Presidentes</span><br>
                                                            <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i><%=DiputadosNum%></span>
                                                            <span class="text-muted">Diputados</span><br>
                                                            <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i><%=AlcaldesNum%></span>
                                                            <span class="text-muted">Alcaldes</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="card" style="height: 125px;">
                                                    <div class="row card-body">
                                                        <div class="col-6">
                                                            <h5 class="card-title mb-4">Mesas Electorales</h5>
                                                            <h1 class="mt-1 mb-3"><%=MesasNum%></h1>
                                                        </div>
                                                        <div class="col-6 mb-1">
                                                            <span class="text-dark"> <i class="mdi mdi-arrow-bottom-right"></i><%=MesasEspera%></span>
                                                            <span class="text-muted">En Espera</span><br>
                                                            <span class="text-success"> <i class="mdi mdi-arrow-bottom-right"></i><%=MesasAbiertas%></span>
                                                            <span class="text-muted">Abiertas</span><br>
                                                            <span class="text-primary"> <i class="mdi mdi-arrow-bottom-right"></i><%=MesasCerradas%></span>
                                                            <span class="text-muted">Cerradas</span><br>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card" style="height: 125px;">
                                                    <div class="card-body">
                                                        <h5 class="card-title mb-4">Partidos Políticos</h5>
                                                        <h1 class="mt-1 mb-3"><%=PartidosNum%></h1>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-6 col-xxl-7">
                                    <div class="card flex-fill w-100">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Estadistica de Votos Por Partido</h5>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="chart chart-sm">

                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="col-xl-12 col-xxl-12">
                                    <div class="card flex-fill w-100">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Estadistica de Votos Por Partido</h5>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="chart chart-sm" style="min-height: 196px;">
                                                <figure class="highcharts-figure">
                                                    <div id="container"></div>
                                                    <p class="highcharts-description">
                                                       A Continuación Podrás Observar una Gráfica en donde podemos ver la cantidad de Votos segun el candidato por cada Partido
                                                    </p>
                                                </figure>
                                                <div id="button-bar">
                                                    <button id="small">Small</button>
                                                    <button id="large">Large</button>
                                                    <button id="auto">Auto</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-6 col-xxl-3 d-flex order-2 order-xxl-3">
                                    <div class="card flex-fill w-100">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Browser Usage</h5>
                                        </div>
                                        <div class="card-body d-flex">
                                            <div class="align-self-center w-100">
                                                <div class="py-3">
                                                    <div class="chart chart-xs">
                                                        <canvas id="chartjs-dashboard-pie"></canvas>
                                                    </div>
                                                </div>

                                                <table class="table mb-0">
                                                    <tbody>
                                                        <tr>
                                                            <td>Chrome</td>
                                                            <td class="text-right">4306</td>
                                                        </tr>
                                                        <tr>
                                                            <td>Firefox</td>
                                                            <td class="text-right">3801</td>
                                                        </tr>
                                                        <tr>
                                                            <td>IE</td>
                                                            <td class="text-right">1689</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-12 col-xxl-6 d-flex order-3 order-xxl-2">
                                    <div class="card flex-fill w-100">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Real-Time</h5>
                                        </div>
                                        <div class="card-body px-4">
                                            <div id="world_map" style="height:350px;"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 col-xxl-3 d-flex order-1 order-xxl-1">
                                    <div class="card flex-fill">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Calendar</h5>
                                        </div>
                                        <div class="card-body d-flex">
                                            <div class="align-self-center w-100">
                                                <div class="chart">
                                                    <div id="datetimepicker-dashboard"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-lg-8 col-xxl-9 d-flex">
                                    <div class="card flex-fill">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Latest Projects</h5>
                                        </div>
                                        <table class="table table-hover my-0">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th class="d-none d-xl-table-cell">Start Date</th>
                                                    <th class="d-none d-xl-table-cell">End Date</th>
                                                    <th>Status</th>
                                                    <th class="d-none d-md-table-cell">Assignee</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>Project Apollo</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-success">Done</span></td>
                                                    <td class="d-none d-md-table-cell">Vanessa Tucker</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Fireball</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-danger">Cancelled</span></td>
                                                    <td class="d-none d-md-table-cell">William Harris</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Hades</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-success">Done</span></td>
                                                    <td class="d-none d-md-table-cell">Sharon Lessman</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Nitro</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-warning">In progress</span></td>
                                                    <td class="d-none d-md-table-cell">Vanessa Tucker</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Phoenix</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-success">Done</span></td>
                                                    <td class="d-none d-md-table-cell">William Harris</td>
                                                </tr>
                                                <tr>
                                                    <td>Project X</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-success">Done</span></td>
                                                    <td class="d-none d-md-table-cell">Sharon Lessman</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Romeo</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-success">Done</span></td>
                                                    <td class="d-none d-md-table-cell">Christina Mason</td>
                                                </tr>
                                                <tr>
                                                    <td>Project Wombat</td>
                                                    <td class="d-none d-xl-table-cell">01/01/2020</td>
                                                    <td class="d-none d-xl-table-cell">31/06/2020</td>
                                                    <td><span class="badge bg-warning">In progress</span></td>
                                                    <td class="d-none d-md-table-cell">William Harris</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-4 col-xxl-3 d-flex">
                                    <div class="card flex-fill w-100">
                                        <div class="card-header">

                                            <h5 class="card-title mb-0">Monthly Sales</h5>
                                        </div>
                                        <div class="card-body d-flex w-100">
                                            <div class="align-self-center chart chart-lg">
                                                <canvas id="chartjs-dashboard-bar"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
        <script>
            var chart = Highcharts.chart({

                chart: {
                    renderTo: 'container',
                    type: 'column'
                },

                title: {
                    text: 'Votos Por partido'
                },

                subtitle: {
                    text: 'Haz Clic en los Botones para cambiar el tamaño de la gráfica'
                },

                legend: {
                    align: 'right',
                    verticalAlign: 'middle',
                    layout: 'vertical'
                },

                xAxis: {
                    categories: [<%=PartidosNombres%>],
                    title: {
                        text: 'Partidos'
                    }
                },

                yAxis: {
                    allowDecimals: false,
                    title: {
                        text: 'Votos'
                    }
                },

                series: [{
                        name: 'Presidentes',
                        data: [1, 4, 3]
                    }, {
                        name: 'Diputados',
                        data: [6, 4, 2]
                    }, {
                        name: 'Alcaldes',
                        data: [8, 4, 3]
                    }],

                responsive: {
                    rules: [{
                            condition: {
                                maxWidth: 10000
                            },
                            chartOptions: {
                                legend: {
                                    align: 'center',
                                    verticalAlign: 'bottom',
                                    layout: 'horizontal'
                                },
                                yAxis: {
                                    labels: {
                                        align: 'left',
                                        x: 10,
                                        y: -5
                                    },
                                    title: {
                                        text: null
                                    }
                                },
                                subtitle: {
                                    text: null
                                },
                                credits: {
                                    enabled: false
                                }
                            }
                        }]
                }
            });

            document.getElementById('small').addEventListener('click', function () {
                chart.setSize(400);
            });

            document.getElementById('large').addEventListener('click', function () {
                chart.setSize(600);
            });

            document.getElementById('auto').addEventListener('click', function () {
                chart.setSize(null);
            });



        </script>

    </body>
</html>































