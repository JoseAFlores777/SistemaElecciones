<%@page import="datos.Conexion"%>
<%@page import="dominio.Mesa"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<% String s_area = request.getParameter("f_area");
    String s_opc = request.getParameter("f_opc");
    
    System.out.println("Entra hasta ComboD");
    if (s_opc.equals("1")) {

        String sql = "SELECT T2.idMunicipio,T2.Nombre FROM Departamentos AS T1 INNER JOIN Municipios AS T2 ON(T1.idDepartamento=T2.idDepartamento) WHERE T1.idDepartamento=" + s_area
                + " order by T2.Nombre asc";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {%>

    <option value="<%=rs.getString("idMunicipio")%>"><%=rs.getString("Nombre")%></option>
    
    <%}

        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
}%>


