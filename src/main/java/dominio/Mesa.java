package dominio;

import datos.MesaDaoJDBC;
import java.util.Date;

public class Mesa {

    private int id_Mesa;
    private int id_Municipio;
    private String Nombre;
    private String Latitud;
    private String Longitud;
    private Date Apertura;
    private Date Cierre;
    private int Estado;

    public Mesa() {
    }

    public Mesa(int id_Mesa) {
        this.id_Mesa = id_Mesa;
    }
    

    public Mesa(int id_Mesa, int id_Municipio, String Nombre, String Latitud, String Longitud, Date Apertura, Date Cierre, int Estado) {
        this.id_Mesa = id_Mesa;
        this.id_Municipio = id_Municipio;
        this.Nombre = Nombre;
        this.Latitud = Latitud;
        this.Longitud = Longitud;
        this.Apertura = Apertura;
        this.Cierre = Cierre;
        this.Estado = Estado;
    }

    public Mesa(int id_Municipio, String Nombre, String Latitud, String Longitud, Date Apertura, Date Cierre, int Estado) {
        this.id_Municipio = id_Municipio;
        this.Nombre = Nombre;
        this.Latitud = Latitud;
        this.Longitud = Longitud;
        this.Apertura = Apertura;
        this.Cierre = Cierre;
        this.Estado = Estado;
    }

    public Mesa(int id_Municipio, String Nombre, String Latitud, String Longitud, Date Apertura, Date Cierre) {
        this.id_Municipio = id_Municipio;
        this.Nombre = Nombre;
        this.Latitud = Latitud;
        this.Longitud = Longitud;
        this.Apertura = Apertura;
        this.Cierre = Cierre;
    }

    public Mesa(int id_Mesa, int id_Municipio, String Nombre, String Latitud, String Longitud, int Estado) {
        this.id_Mesa = id_Mesa;
        this.id_Municipio = id_Municipio;
        this.Nombre = Nombre;
        this.Latitud = Latitud;
        this.Longitud = Longitud;
        this.Estado = Estado;
    }

    public int getId_Mesa() {
        return id_Mesa;
    }

    public void setId_Mesa(int id_Mesa) {
        this.id_Mesa = id_Mesa;
    }

    public int getId_Municipio() {
        return id_Municipio;
    }

    public void setId_Municipio(int id_Municipio) {
        this.id_Municipio = id_Municipio;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getLatitud() {
        return Latitud;
    }

    public void setLatitud(String Latitud) {
        this.Latitud = Latitud;
    }

    public String getLongitud() {
        return Longitud;
    }

    public void setLongitud(String Longitud) {
        this.Longitud = Longitud;
    }

    public Date getApertura() {
        return Apertura;
    }

    public void setApertura(Date Apertura) {
        this.Apertura = Apertura;
    }

    public Date getCierre() {
        return Cierre;
    }

    public void setCierre(Date Cierre) {
        this.Cierre = Cierre;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }


    public String getDepto_Nom() {
        return new MesaDaoJDBC().Referencia(getId_Mesa(),1);
    }
    public int getID_Depto_Nom() {
        return Integer.parseInt(new MesaDaoJDBC().Referencia(getId_Mesa(),4));
    }
    public String getId_Municipio_Nomb() {
        return new MesaDaoJDBC().Referencia(getId_Mesa(),2);
    }

    public String getEstadoDes() {
            
        return new MesaDaoJDBC().Referencia(getId_Mesa(),3);

    }

}
