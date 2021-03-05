
package datos;

import dominio.Persona;
import java.io.InputStream;
import java.sql.*;
import java.util.*;

public class PersonaDaoJDBC {
    private static final String SQL_SELECT = "SELECT idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado " 
            + "FROM Personas";
            

    private static final String SQL_SELECT_BY_ID = "SELECT idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado "
            + "FROM Personas WHERE idPersona = ?";
            

    private static final String SQL_INSERT = "INSERT INTO Personas(idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado )" 
            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
            

    private static final String SQL_UPDATE = "UPDATE Personas SET  idTipo=?, idMesa=?, idPartido=?, Contra=?, PrimerNombre=?, SegundoNombre=?, TercerNombre=?, PrimerApellido=?, SegundoApellido=?, Foto=?, Estado_Voto=?, Estado=?  "
            + "WHERE idPersona=?";
            

    private static final String SQL_DELETE = "DELETE FROM Personas WHERE idPersona = ?";
    
    
    
        public List<Persona> listar() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Persona persona = null;
        List<Persona> personas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();
            while (rs.next()) {


                String id_Persona = rs.getString("idPersona");
                int id_Tipo = rs.getInt("idTipo");
                int id_Mesa = rs.getInt("idMesa");
                int id_Partido = rs.getInt("idPartido");
                String Password_ = rs.getString("Contra");
                String primer_Nombre = rs.getString("PrimerNombre");
                String segundo_Nombre = rs.getString("SegundoNombre");
                String tercer_Nombre = rs.getString("TercerNombre");
                String primer_Apellido = rs.getString("PrimerApellido");
                String segundo_Apellido = rs.getString("SegundoApellido");
                InputStream Foto = rs.getBinaryStream("Foto");
                int EstadoVoto = rs.getInt("Estado_Voto");
                boolean Estado = rs.getBoolean("Estado");
                
                
                persona = new Persona(id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
                personas.add(persona);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return personas;
    }
    
        
    public Persona encontrar(Persona persona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setString(1, persona.getId_Persona());
            rs = stmt.executeQuery();
            rs.absolute(1);//nos posicionamos en el primer registro devuelto

                int id_Tipo = rs.getInt("idTipo");
                int id_Mesa = rs.getInt("idMesa");
                int id_Partido = rs.getInt("idPartido");
                String Password_ = rs.getString("Contra");
                String primer_Nombre = rs.getString("PrimerNombre");
                String segundo_Nombre = rs.getString("SegundoNombre");
                String tercer_Nombre = rs.getString("TercerNombre");
                String primer_Apellido = rs.getString("PrimerApellido");
                String segundo_Apellido = rs.getString("SegundoApellido");
                InputStream Foto = rs.getBinaryStream("Foto");
                int EstadoVoto = rs.getInt("Estado_Voto");
                boolean Estado = rs.getBoolean("Estado");

                persona.setId_Tipo(id_Tipo);
                persona.setId_Mesa(id_Mesa);
                persona.setId_Partido(id_Partido);
                persona.setPassword_(Password_);
                persona.setPrimer_Nombre(primer_Nombre);
                persona.setSegundo_Nombre(segundo_Nombre);
                persona.setTercer_Nombre(tercer_Nombre);
                persona.setPrimer_Apellido(primer_Apellido);
                persona.setSegundo_Apellido(segundo_Apellido);
                persona.setFoto(Foto);
                persona.setEstadoVoto(EstadoVoto);
                persona.setEstado(Estado);

        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return persona;
    }
    
    
        public int insertar(Persona persona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);

            
            stmt.setString(1, persona.getId_Persona());
            stmt.setInt(2, persona.getId_Tipo() );
            stmt.setInt(3, persona.getId_Mesa() );
            stmt.setInt(4, persona.getId_Partido() );
            stmt.setString(5, persona.getPassword_() );
            stmt.setString(6, persona.getPrimer_Nombre() );
            stmt.setString(7, persona.getSegundo_Nombre() );
            stmt.setString(8, persona.getTercer_Nombre() );
            stmt.setString(9, persona.getPrimer_Apellido() );
            stmt.setString(10, persona.getSegundo_Apellido() );
            stmt.setBinaryStream(11, persona.getFoto() );
            stmt.setInt(12, persona.getEstadoVoto() );
            stmt.setBoolean(13, persona.isEstado());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }
        
    
    public int actualizar(Persona persona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            
            
            stmt.setInt(1, persona.getId_Tipo() );
            stmt.setInt(2, persona.getId_Mesa() );
            stmt.setInt(3, persona.getId_Partido() );
            stmt.setString(4, persona.getPassword_() );
            stmt.setString(5, persona.getPrimer_Nombre() );
            stmt.setString(6, persona.getSegundo_Nombre() );
            stmt.setString(7, persona.getTercer_Nombre() );
            stmt.setString(8, persona.getPrimer_Apellido() );
            stmt.setString(9, persona.getSegundo_Apellido() );
            stmt.setBinaryStream(10, persona.getFoto() );
            stmt.setInt(11, persona.getEstadoVoto() );
            stmt.setBoolean(12, persona.isEstado());
            stmt.setString(13, persona.getId_Persona());

            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return rows;
    }   
    
    
        public int eliminar(Persona persona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setString(1, persona.getId_Persona());

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
