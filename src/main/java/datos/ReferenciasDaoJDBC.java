/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import dominio.Departamentos;
import dominio.Municipios;
import dominio.Persona;
import dominio.TipoUsuarios;
import dominio.Tipo_EstadoMesa;
import dominio.Tipo_EstadoVoto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class ReferenciasDaoJDBC {

    private static final String SQL_SELECT_tUSUARIOS_CON_EXCEPCION = "SELECT idTipo,Nombre FROM Tipos WHERE idTipo !=";
    private static final String SQL_SELECT_tUSUARIOS_SIN_EXCEPCION = "SELECT idTipo,Nombre FROM Tipos";
    private static final String SQL_SELECT_tESTADO_VOTO_CON_EXCEPCION = "SELECT idTipos_EstadoVoto,Des FROM Tipos_EstadoVoto WHERE idTipos_EstadoVoto !=";
    private static final String SQL_SELECT_DEPTOS_CON_EXCEPCION = "SELECT idDepartamento,Nombre FROM Departamentos WHERE idDepartamento !=";
    private static final String SQL_SELECT_MUNICIPIOS_POR_DEPTO = "SELECT T2.Nombre FROM Departamentos AS T1 INNER JOIN Municipios AS T2 ON(T1.idDepartamento=T2.idDepartamento) WHERE T1.idDepartamento =";
private static final String SQL_SELECT_tESTADO_MESA_CON_EXCEPCION = "SELECT idTipos_EstadoMesa,Des FROM idTipos_EstadoMesa WHERE idTipos_EstadoMesa !=";
private static final String SQL_SELECT_PERSONAS_POR_MESA = "SELECT idPersona,idTipo,idMesa,idPartido,Contra,PrimerNombre,SegundoNombre,TercerNombre,PrimerApellido,SegundoApellido,Foto,Estado_Voto,Estado FROM Personas WHERE idMesa=";
    
    public List<TipoUsuarios> listarTipoUsuarios(int idExcepcion,int Tipo_Tipos) {
        
        String sql =null;
        //1:niveles 2:cargo 3:TODOS
        if (Tipo_Tipos == 1) {
            sql = SQL_SELECT_tUSUARIOS_CON_EXCEPCION + idExcepcion+" AND Tipo = 1";
            
        }else if (Tipo_Tipos == 2){
        sql = SQL_SELECT_tUSUARIOS_CON_EXCEPCION + idExcepcion+" AND Tipo = 2";
        }else if (Tipo_Tipos == 3){
        sql = SQL_SELECT_tUSUARIOS_SIN_EXCEPCION;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        TipoUsuarios Tipo = null;
        List<TipoUsuarios> Tipos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(sql);

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_Tipo = rs.getInt("idTipo");

                String Nombre = rs.getString("Nombre");

                
                Tipo = new TipoUsuarios(id_Tipo, Nombre);
                Tipos.add(Tipo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return Tipos;
    }
    
    
    public List<Tipo_EstadoVoto> listarTipoEstadoVoto(int idExcepcion) {
        

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Tipo_EstadoVoto Tipo = null;
        List<Tipo_EstadoVoto> Tipos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(SQL_SELECT_tESTADO_VOTO_CON_EXCEPCION + idExcepcion);

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_TipoEstadoVoto = rs.getInt("idTipos_EstadoVoto");

                String Descripcion = rs.getString("Des");

                
                Tipo = new Tipo_EstadoVoto(id_TipoEstadoVoto, Descripcion);
                Tipos.add(Tipo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return Tipos;
    }
    public List<Departamentos> listarDepartamentos(int idExcepcion) {
        

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Departamentos Depto = null;
        List<Departamentos> Deptos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(SQL_SELECT_DEPTOS_CON_EXCEPCION + idExcepcion+" ORDER BY Nombre ASC");

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_Departamento = rs.getInt("idDepartamento");

                String Nombre = rs.getString("Nombre");

                
                Depto = new Departamentos(id_Departamento, Nombre);
                Deptos.add(Depto);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return Deptos;
    }
    public List<Municipios> listarMunicipios(int idDepto) {
        

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Municipios municipio = null;
        List<Municipios> municipios = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

//            stmt = conn.prepareStatement(SQL_SELECT_MUNICIPIOS_POR_DEPTO + idDepto+" ORDER BY Nombre ASC");
            stmt = conn.prepareStatement("SELECT idMunicipio,idDepartamento,Nombre FROM Municipios ORDER BY Nombre ASC");

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_Municipio = rs.getInt("idMunicipio");
                int id_Departamento = rs.getInt("idDepartamento");

                String Nombre = rs.getString("Nombre");

                
                municipio = new Municipios(id_Municipio, id_Departamento,Nombre);
                municipios.add(municipio);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return municipios;
    }
    
        public List<Tipo_EstadoMesa> listarTipoEstadoMesa(int idExcepcion) {
        

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Tipo_EstadoMesa Tipo = null;
        List<Tipo_EstadoMesa> Tipos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();

            stmt = conn.prepareStatement(SQL_SELECT_tESTADO_MESA_CON_EXCEPCION + idExcepcion);

            rs = stmt.executeQuery();
            while (rs.next()) {

                int id_TipoEstadoMesa = rs.getInt("idTipos_EstadoMesa");

                String Descripcion = rs.getString("Des");

                
                Tipo = new Tipo_EstadoMesa(id_TipoEstadoMesa, Descripcion);
                Tipos.add(Tipo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(stmt);
            Conexion.close(conn);
        }
        return Tipos;
    }
        //1:Electores 2:Miembros de Mesa
        public List<Persona> listarPesrsonaMesa(int idMesa,int TipoUser) {
        

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Persona persona = null;
        List<Persona> personas = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            
            if (TipoUser==1) {
            stmt = conn.prepareStatement(SQL_SELECT_PERSONAS_POR_MESA + idMesa);    
            } else if (TipoUser==2) {
                stmt = conn.prepareStatement(SQL_SELECT_PERSONAS_POR_MESA+idMesa+" AND idTipo=6");
            }

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

}
