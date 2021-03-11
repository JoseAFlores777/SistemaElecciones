package datos;

import dominio.Partido;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class PartidoDaoJDBC {

    private static final String SQL_SELECT = "SELECT idPartido,Nombre,Bandera,Estado FROM Partidos";

    private static final String SQL_SELECT_BY_ID = "SELECT idPartido,Nombre,Bandera,Estado FROM Partidos WHERE idPartido = ? ";

    private static final String SQL_INSERT = "INSERT INTO Partidos(Nombre,Bandera) Values (?,?)";

    private static final String SQL_UPDATE = "UPDATE Partidos SET Nombre=?,Bandera=?,Estado=? WHERE idPartido=?";

    private static final String SQL_DELETE = "DELETE FROM Partidos WHERE idPartido = ?";

    public List<Partido> listar() {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Partido partido = null;
        List<Partido> partidos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {

                String id_Partido = rs.getString("idPartido");

                String Nombre = rs.getString("Nombre");

                InputStream Bandera = rs.getBinaryStream("Bandera");

                boolean Estado = rs.getBoolean("Estado");

                partido = new Partido(id_Partido, Nombre, Bandera, Estado);
                partidos.add(partido);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return partidos;
    }

    //Tipo foto 1:foto de Perfil  2: Foto de Partido
    public void listarIMG(String id, HttpServletResponse response) throws IOException {
        String sql = "SELECT Bandera FROM Partidos WHERE idPartido=" + id;


        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;

        try {
            outputStream = response.getOutputStream();
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {

                inputStream = rs.getBinaryStream(1);

            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) !=-1) {
                bufferedOutputStream.write(i);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }

    }

    public Partido encontrar(Partido partido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setString(1, partido.getId_Partido());
            rs = stmt.executeQuery();
            rs.absolute(1);//nos posicionamos en el primer registro devuelto

            String id_Partido = rs.getString("idPartido");
            String Nombre = rs.getString("Nombre");
            InputStream Bandera = rs.getBinaryStream("Bandera");
            boolean Estado = rs.getBoolean("Estado");

            partido.setId_Partido(id_Partido);
            partido.setNombre(Nombre);
            partido.setBandera_(Bandera);
            partido.setEstado(Estado);

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return partido;
    }

    public int insertar(Partido partido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);

            stmt.setString(1, partido.getNombre());
            stmt.setBlob(2, partido.getBandera_());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int actualizar(Partido partido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);

            stmt.setString(1, partido.getNombre());
            stmt.setBlob(2, partido.getBandera_());
            stmt.setBoolean(3, partido.isEstado());
            stmt.setString(4, partido.getId_Partido());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int eliminar(Partido partido) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setString(1, partido.getId_Partido());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }



}
