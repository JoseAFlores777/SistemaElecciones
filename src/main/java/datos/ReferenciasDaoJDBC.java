/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;

import dominio.TipoUsuarios;
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

}
