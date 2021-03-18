/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import dominio.Departamentos;
import dominio.Municipios;
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
    private static final String SQL_SELECT_tESTADO_VOTO_CON_EXCEPCION = "SELECT idTipos_EstadoVoto,Des FROM Tipos_EstadoVoto WHERE idTipos_EstadoVoto !=";
    private static final String SQL_SELECT_DEPTOS_CON_EXCEPCION = "SELECT idDepartamento,Nombre FROM Departamentos WHERE idDepartamento !=";
    private static final String SQL_SELECT_MUNICIPIOS_POR_DEPTO = "SELECT T2.Nombre FROM Departamentos AS T1 INNER JOIN Municipios AS T2 ON(T1.idDepartamento=T2.idDepartamento) WHERE T1.idDepartamento =";
private static final String SQL_SELECT_tESTADO_MESA_CON_EXCEPCION = "SELECT idTipos_EstadoMesa,Des FROM idTipos_EstadoMesa WHERE idTipos_EstadoMesa !=";
    
    public List<TipoUsuarios> listarTipoUsuarios(int idExcepcion,int Tipo_Tipos) {
        
        String sql =null;
        
        if (Tipo_Tipos == 1) {
            sql = SQL_SELECT_tUSUARIOS_CON_EXCEPCION + idExcepcion+" AND Tipo = 1";
            
        }else if (Tipo_Tipos == 2){
        sql = SQL_SELECT_tUSUARIOS_CON_EXCEPCION + idExcepcion+" AND Tipo = 2";
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

}
