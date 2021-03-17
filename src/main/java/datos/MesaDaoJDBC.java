package datos;

import dominio.Mesa;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class MesaDaoJDBC {

    private static final String SQL_SELECT = "SELECT idMesa,idMunicipio,Nombre,Latitud,Longitud,Apertura,Cierre,Estado FROM Mesas";
    private static final String SQL_SELECT_CON_EXCEPCION = "SELECT idMesa,idMunicipio,Nombre,Latitud,Longitud,Apertura,Cierre,Estado FROM Mesas WHERE idMesa !=";

    private static final String SQL_SELECT_BY_ID = "SELECT idMesa,idMunicipio,Nombre,Latitud,Longitud,Apertura,Cierre,Estado FROM Mesas WHERE idMesa=? ";

    private static final String SQL_INSERT = "INSERT INTO Mesas (idMunicipio,Nombre,Latitud,Longitud,Apertura,Cierre) VALUES(?,?,?,?,?,?)";

    private static final String SQL_UPDATE = "UPDATE Mesas SET idMunicipio=?,Nombre=?,Latitud=?,Longitud=?,Apertura=?,Cierre=?,Estado=?  WHERE idMesa=?";

    private static final String SQL_DELETE = "DELETE FROM Mesas WHERE idMesa = ?";

    public List<Mesa> listar(int idExcepcion) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Mesa mesa = null;
        List<Mesa> mesas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            if (idExcepcion != 0) {
                stmt = conn.prepareStatement(SQL_SELECT_CON_EXCEPCION + idExcepcion);
            } else {
                stmt = conn.prepareStatement(SQL_SELECT);
            }

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_Mesa = rs.getInt("idMesa");
                int id_Municipio = rs.getInt("idMunicipio");
                String Nombre = rs.getString("Nombre");
                String Latitud = rs.getString("Latitud");
                String Longitud = rs.getString("Longitud");
                java.sql.Date Apertura = rs.getDate("Apertura");
                java.sql.Date Cierre = rs.getDate("Cierre");
                int Estado = rs.getInt("Estado");

                mesa = new Mesa(id_Mesa, id_Municipio, Nombre, Latitud, Longitud, Apertura, Cierre, Estado);
                mesas.add(mesa);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return mesas;
    }

    public Mesa encontrar(Mesa mesa) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, mesa.getId_Mesa());
            rs = stmt.executeQuery();
            //rs.absolute(1);//nos posicionamos en el primer registro devuelto
            while (rs.next()) {
                int id_Mesa = rs.getInt("idMesa");
                int id_Municipio = rs.getInt("idMunicipio");
                String Nombre = rs.getString("Nombre");
                String Latitud = rs.getString("Latitud");
                String Longitud = rs.getString("Longitud");
                java.sql.Date Apertura = rs.getDate("Apertura");
                java.sql.Date Cierre = rs.getDate("Cierre");
                int Estado = rs.getInt("Estado");

                mesa.setId_Mesa(id_Mesa);
                mesa.setId_Municipio(id_Municipio);
                mesa.setNombre(Nombre);
                mesa.setLatitud(Latitud);
                mesa.setLongitud(Longitud);
                mesa.setApertura(Apertura);
                mesa.setCierre(Cierre);
                mesa.setEstado(Estado);

            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return mesa;
    }

    public int insertar(Mesa mesa) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);

            stmt.setInt(1, mesa.getId_Municipio());
            stmt.setString(2, mesa.getNombre());
            stmt.setString(3, mesa.getLatitud());
            stmt.setString(4, mesa.getLongitud());
            stmt.setDate(5, mesa.getApertura());
            stmt.setDate(6, mesa.getCierre());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int actualizar(Mesa mesa) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);

            stmt.setInt(1, mesa.getId_Municipio());
            stmt.setString(2, mesa.getNombre());
            stmt.setString(3, mesa.getLatitud());
            stmt.setString(4, mesa.getLongitud());
            stmt.setDate(5, mesa.getApertura());
            stmt.setDate(6, mesa.getCierre());
            stmt.setInt(7, mesa.getEstado());
            stmt.setInt(8, mesa.getId_Mesa());


            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int eliminar(Mesa mesa) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, mesa.getId_Mesa());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
    
    
    
    //1:Tipo->DepartamentoNombre 2:Tipo->Municipio 3->Estado de mesa 4->Id de Departamento

    public String Referencia(int id, int Tipo) {
        String Referencia = null;
        String sql = null;

        if (Tipo == 1) {
            sql = "SELECT   T3.Nombre FROM Mesas as T1 INNER JOIN Municipios as T2 ON(T1.idMunicipio = T2.idMunicipio) INNER JOIN Departamentos as T3  ON(T2.idDepartamento = T3.idDepartamento) WHERE T1.idMesa =" + id;
        } else if (Tipo == 2) {
            sql = "SELECT T2.Nombre FROM Mesas as T1 INNER JOIN Municipios as T2 ON(T1.idMunicipio = T2.idMunicipio) WHERE T1.idMesa =" + id;
        }
         else if (Tipo == 3) {
            sql = "SELECT T2.Des FROM Mesas as T1 INNER JOIN idTipos_EstadoMesa as T2 on(T1.Estado =T2.idTipos_EstadoMesa) WHERE T1.idMesa=" + id;
        }
         else if (Tipo == 4) {
            sql = "SELECT   T3.idDepartamento FROM Mesas as T1 INNER JOIN Municipios as T2 ON(T1.idMunicipio = T2.idMunicipio) INNER JOIN Departamentos as T3  ON(T2.idDepartamento = T3.idDepartamento) WHERE T1.idMesa =" + id;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Mesa mesa = null;

        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {

                Referencia = rs.getString(1);

            }

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return Referencia;
    }
    
    

}
