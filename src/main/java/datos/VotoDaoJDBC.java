package datos;

import dominio.Persona;
import dominio.Voto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class VotoDaoJDBC {

    private static final String SQL_SELECT_BY_PARTIDO = "SELECT idVoto,idMesa,idPartido,idTipo,idPersona FROM Votos WHERE idPartido =";
    private static final String SQL_SELECT_BY_MESA = "SELECT idVoto,idMesa,idPartido,idTipo,idPersona FROM Votos WHERE idMesa =";
    private static final String SQL_SELECT_BY_CANDIDATO = "SELECT idVoto,idMesa,idPartido,idTipo,idPersona FROM Votos WHERE idPersona =";

    private static final String SQL_SEARCH_BY_ID = "SELECT idVoto FROM Votos WHERE idMesa = ? AND idPartido=? AND idTipo=? AND idPersona=?";

    private static final String SQL_INSERT_VOTOS = "INSERT INTO Votos (idMesa,idPartido,idTipo,idPersona,Votos) VALUES(?,?,?,?,?)";

    private static final String SQL_UPDATE_VOTO = "UPDATE Votos SET Votos = Votos +1 WHERE idVoto=?";

    private static final String SQL_DELETE = "DELETE FROM Personas WHERE idPersona = ?";
    
    private static final String SQL_UPDATE_ESTADO_VOTO_ELECTOR = "UPDATE Personas SET Estado_Voto = 3 WHERE idPersona=?";

//Referencia Tipo: 1-> Listar por Partido 2->Listar Por Mesa 3->Listar Por candidato
    public List<Voto> listar(String id, int Tipo) {

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Voto voto = null;
        List<Voto> votos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

            if (Tipo == 1) {
                stmt = conn.prepareStatement(SQL_SELECT_BY_PARTIDO + id);
            } else if (Tipo == 2) {
                stmt = conn.prepareStatement(SQL_SELECT_BY_MESA + id);
            } else if (Tipo == 3) {
                stmt = conn.prepareStatement(SQL_SELECT_BY_CANDIDATO + id);
            }

            rs = stmt.executeQuery();
            while (rs.next()) {

//                String id_Persona = rs.getString("idPersona");
//                int id_Tipo = rs.getInt("idTipo");
//                int id_Mesa = rs.getInt("idMesa");
//                int id_Partido = rs.getInt("idPartido");
//                String Password_ = rs.getString("Contra");
//                String primer_Nombre = rs.getString("PrimerNombre");
//                String segundo_Nombre = rs.getString("SegundoNombre");
//                String tercer_Nombre = rs.getString("TercerNombre");
//                String primer_Apellido = rs.getString("PrimerApellido");
//                String segundo_Apellido = rs.getString("SegundoApellido");
//                String Foto = rs.getString("Foto");
//
//                int EstadoVoto = rs.getInt("Estado_Voto");
//                boolean Estado = rs.getBoolean("Estado");
                voto = new Voto();
                votos.add(voto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return votos;
    }

    public int encontrar(Voto voto) throws SQLException {
        int id_Voto = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SEARCH_BY_ID);
            stmt.setInt(1, voto.getId_Mesa());
            stmt.setInt(2, voto.getId_Partido());
            stmt.setInt(3, voto.getId_Tipo());
            stmt.setString(4, voto.getId_Persona());
            rs = stmt.executeQuery();
//            rs.absolute(1);//nos posicionamos en el primer registro devuelto
            while (rs.next()) {
                id_Voto = rs.getInt("idVoto");

            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        

        if (id_Voto > 0) {
            return id_Voto;
        } else {
            return 0;
        }

    }

    public int insertar(Voto voto) throws SQLException {
        int id_Voto = encontrar(voto);
        if (id_Voto > 0) {
            return actualizar(id_Voto);
        } else {
            Connection conn = null;
            PreparedStatement stmt = null;
            int rows = 0;
            try {
                conn = Conexion.getConnection();

                stmt = conn.prepareStatement(SQL_INSERT_VOTOS);

                stmt.setInt(1, voto.getId_Mesa());
                stmt.setInt(2, voto.getId_Partido());
                stmt.setInt(3, voto.getId_Tipo());
                stmt.setString(4, voto.getId_Persona());
                stmt.setInt(5, 1);
                System.out.println(voto.getId_Mesa()+"/"+voto.getId_Partido()+"/"+voto.getId_Tipo()+"/"+voto.getId_Persona()+"/"+1);
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

    public int actualizar(int idVoto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(SQL_UPDATE_VOTO);

            stmt.setInt(1, idVoto);


            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
    public int actualizarEstadoVoto(String idPersona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(SQL_UPDATE_ESTADO_VOTO_ELECTOR);

            stmt.setString(1, idPersona);


            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    public int eliminar(Voto voto) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, voto.getId_Voto());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }

    //1->Tipo Usuario 2->Nombre Partido 3-> Nombre Candidato
    public String Referencia(String id, int Tipo) {
        String Referencia = null;
        String sql = null;

        if (Tipo == 1) {
            sql = "SELECT Nombre FROM Tipos WHERE idTipo=" + id;
        } else if (Tipo == 2) {
            sql = "SELECT Nombre FROM Partidos WHERE idPartido=" + id;
        } else if (Tipo == 3) {
            sql = "SELECT CONCAT(PrimerNombre,' ',SegundoNombre,' ',PrimerApellido,' ',SegundoApellido) From Personas WHERE idPersona=" + id;
        } else if (Tipo == 4) {
            sql = "SELECT idPartido FROM Personas WHERE idPersona =" + id;
        } else if (Tipo == 5) {
            sql = "SELECT idTipo FROM Personas WHERE idPersona=" + id;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Persona persona = null;

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
