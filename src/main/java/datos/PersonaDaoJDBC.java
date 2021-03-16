package datos;

import dominio.Persona;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class PersonaDaoJDBC {

    private static final String SQL_SELECT = "SELECT idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado "
            + "FROM Personas";

    private static final String SQL_SELECT_BY_ID = "SELECT idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado "
            + "FROM Personas WHERE idPersona=?";

    private static final String SQL_INSERT = "INSERT INTO Personas(idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado )"
            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

    private static final String SQL_UPDATE_CANDIDATOS = "UPDATE Personas SET  idTipo=?, idMesa=?, idPartido=?, Contra=?, PrimerNombre=?, SegundoNombre=?, TercerNombre=?, PrimerApellido=?, SegundoApellido=?, Foto=?, Estado_Voto=?, Estado=?  "
            + "WHERE idPersona=?";
    private static final String SQL_UPDATE_USUARIOS = "UPDATE Personas SET  idTipo=?, idMesa=?, Contra=?, PrimerNombre=?, SegundoNombre=?, TercerNombre=?, PrimerApellido=?, SegundoApellido=?, Foto=?, Estado_Voto=?, Estado=?  "
            + "WHERE idPersona=?";
    private static final String SQL_UPDATE_CANDIDATOS_FOTO = "UPDATE Personas SET  idTipo=?, idMesa=?, idPartido=?, Contra=?, PrimerNombre=?, SegundoNombre=?, TercerNombre=?, PrimerApellido=?, SegundoApellido=?, Estado_Voto=?, Estado=?  "
            + "WHERE idPersona=?";
    private static final String SQL_UPDATE_USUARIOS_FOTO = "UPDATE Personas SET  idTipo=?, idMesa=?, Contra=?, PrimerNombre=?, SegundoNombre=?, TercerNombre=?, PrimerApellido=?, SegundoApellido=?, Estado_Voto=?, Estado=?  "
            + "WHERE idPersona=?";

    private static final String SQL_DELETE = "DELETE FROM Personas WHERE idPersona = ?";

    private static final String SQL_VALIDAR = "SELECT * FROM Personas WHERE idPersona=? AND Contra=?";

    public List<Persona> listar(String user) {

        if (user.equals("7")) {
            user = "";
        } else {
            user = " WHERE idTipo=" + user;
        }
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Persona persona = null;
        List<Persona> personas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT + user);
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
                String Foto = rs.getString("Foto");
                
                int EstadoVoto = rs.getInt("Estado_Voto");
                boolean Estado = rs.getBoolean("Estado");

                persona = new Persona(id_Persona, id_Tipo, id_Mesa, id_Partido, Password_, primer_Nombre, segundo_Nombre, tercer_Nombre, primer_Apellido, segundo_Apellido, Foto, EstadoVoto, Estado);
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

    //Tipo foto 1:foto de Perfil  2: Foto de Partido
    public void listarIMG(String id, int tipoFoto, HttpServletResponse response) throws IOException {
        String sql;
        if (tipoFoto == 1) {
            sql = "SELECT Foto FROM Personas WHERE idPersona=" + id;
        } else {
            sql = "SELECT T2.Bandera\n"
                    + "FROM Personas T1\n"
                    + "INNER JOIN Partidos T2\n"
                    + "ON(T1.idPartido=T2.idPartido)\n"
                    + "WHERE T1.idPersona =" + id;
        }

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
            while (( i=bufferedInputStream.read()) != -1) {
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

    public Persona encontrar(Persona persona) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setString(1, persona.getId_Persona());
            rs = stmt.executeQuery();
//            rs.absolute(1);//nos posicionamos en el primer registro devuelto
            while (rs.next()) {
                int id_Tipo = rs.getInt("idTipo");
                int id_Mesa = rs.getInt("idMesa");
                int id_Partido = rs.getInt("idPartido");
                String Password_ = rs.getString("Contra");
                String primer_Nombre = rs.getString("PrimerNombre");
                String segundo_Nombre = rs.getString("SegundoNombre");
                String tercer_Nombre = rs.getString("TercerNombre");
                String primer_Apellido = rs.getString("PrimerApellido");
                String segundo_Apellido = rs.getString("SegundoApellido");
                String Foto = rs.getString("Foto");
                
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
            }
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
            stmt.setInt(2, persona.getId_Tipo());
            stmt.setInt(3, persona.getId_Mesa());
            stmt.setInt(4, persona.getId_Partido());
            stmt.setString(5, persona.getPassword_());
            stmt.setString(6, persona.getPrimer_Nombre());
            stmt.setString(7, persona.getSegundo_Nombre());
            stmt.setString(8, persona.getTercer_Nombre());
            stmt.setString(9, persona.getPrimer_Apellido());
            stmt.setString(10, persona.getSegundo_Apellido());
            stmt.setString(11, persona.getFoto());
            stmt.setInt(12, persona.getEstadoVoto());
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
            
            if (persona.getFoto()==null) {
                            if (persona.getId_Tipo() <= 3) {
                stmt = conn.prepareStatement(SQL_UPDATE_CANDIDATOS);

                stmt.setInt(1, persona.getId_Tipo());
                stmt.setInt(2, persona.getId_Mesa());
                stmt.setInt(3, persona.getId_Partido());
                stmt.setString(4, persona.getPassword_());
                stmt.setString(5, persona.getPrimer_Nombre());
                stmt.setString(6, persona.getSegundo_Nombre());
                stmt.setString(7, persona.getTercer_Nombre());
                stmt.setString(8, persona.getPrimer_Apellido());
                stmt.setString(9, persona.getSegundo_Apellido());
                stmt.setString(10, persona.getFoto());
                stmt.setInt(11, persona.getEstadoVoto());
                stmt.setBoolean(12, persona.isEstado());
                stmt.setString(13, persona.getId_Persona());
            } else {
                stmt = conn.prepareStatement(SQL_UPDATE_USUARIOS);
                stmt.setInt(1, persona.getId_Tipo());
                stmt.setInt(2, persona.getId_Mesa());
                stmt.setString(3, persona.getPassword_());
                stmt.setString(4, persona.getPrimer_Nombre());
                stmt.setString(5, persona.getSegundo_Nombre());
                stmt.setString(6, persona.getTercer_Nombre());
                stmt.setString(7, persona.getPrimer_Apellido());
                stmt.setString(8, persona.getSegundo_Apellido());
                stmt.setString(9, persona.getFoto());
                stmt.setInt(10, persona.getEstadoVoto());
                stmt.setBoolean(11, persona.isEstado());
                stmt.setString(12, persona.getId_Persona());
            }
            }else{

            if (persona.getId_Tipo() <= 3) {
            
                stmt = conn.prepareStatement(SQL_UPDATE_CANDIDATOS_FOTO);

                stmt.setInt(1, persona.getId_Tipo());
                stmt.setInt(2, persona.getId_Mesa());
                stmt.setInt(3, persona.getId_Partido());
                stmt.setString(4, persona.getPassword_());
                stmt.setString(5, persona.getPrimer_Nombre());
                stmt.setString(6, persona.getSegundo_Nombre());
                stmt.setString(7, persona.getTercer_Nombre());
                stmt.setString(8, persona.getPrimer_Apellido());
                stmt.setString(9, persona.getSegundo_Apellido());
                
                stmt.setInt(10, persona.getEstadoVoto());
                stmt.setBoolean(11, persona.isEstado());
                stmt.setString(12, persona.getId_Persona());
            } else {
                stmt = conn.prepareStatement(SQL_UPDATE_USUARIOS_FOTO);
                stmt.setInt(1, persona.getId_Tipo());
                stmt.setInt(2, persona.getId_Mesa());
                stmt.setString(3, persona.getPassword_());
                stmt.setString(4, persona.getPrimer_Nombre());
                stmt.setString(5, persona.getSegundo_Nombre());
                stmt.setString(6, persona.getTercer_Nombre());
                stmt.setString(7, persona.getPrimer_Apellido());
                stmt.setString(8, persona.getSegundo_Apellido());
                
                stmt.setInt(9, persona.getEstadoVoto());
                stmt.setBoolean(10, persona.isEstado());
                stmt.setString(11, persona.getId_Persona());
            }
            }
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

    public int validar(Persona per) {
        int r = 0;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            conn = Conexion.getConnection();
            System.out.println("123");
            stmt = conn.prepareStatement(SQL_VALIDAR);
            stmt.setString(1, per.getId_Persona());
            stmt.setString(2, per.getPassword_());
            rs = stmt.executeQuery();
            System.out.println("NO VALIDADA");
            while (rs.next()) {
                r = r + 1;
                System.out.println("Validacion correcta");
                per.setId_Persona(rs.getString("idPersona"));
                per.setPassword_(rs.getString("Contra"));

            }

            if (r == 1) {
                return 1;
            } else {
                return 0;
            }

        } catch (SQLException ex) {

            ex.printStackTrace(System.out);
            return 0;
        } finally {
//           Conexion.close(stmt);
//           Conexion.close(conn);
        }

    }
//1:Tipo->tipos 2:Tipo->Partidos 3:Tipo->EstadoVoto

    public String Referencia(int id, int Tipo) {
        String Referencia = null;
        String sql = null;

        if (Tipo == 1) {
            sql = "SELECT Nombre FROM Tipos WHERE idTipo=" + id;
        } else if (Tipo == 2) {
            sql = "SELECT Nombre FROM Partidos WHERE idPartido=" + id;
        } else if (Tipo == 3) {
            sql = "SELECT Des FROM Tipos_EstadoVoto WHERE idTipos_EstadoVoto=" + id;
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
