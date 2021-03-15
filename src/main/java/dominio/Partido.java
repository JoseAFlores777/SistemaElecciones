package dominio;

import java.io.InputStream;

public class Partido {

    private String id_Partido;
    private String Nombre;
    private String Bandera_;
    private boolean Estado;

    public Partido() {
    }

    public Partido(String id_Partido) {
        this.id_Partido = id_Partido;
    }

    public Partido(String Nombre, String Bandera_) {
        this.Nombre = Nombre;
        this.Bandera_ = Bandera_;
    }

    public Partido(String Nombre, String Bandera_, boolean Estado) {
        this.Nombre = Nombre;
        this.Bandera_ = Bandera_;
        this.Estado = Estado;
    }

    public Partido(String id_Partido, String Nombre, String Bandera_, boolean Estado) {
        this.id_Partido = id_Partido;
        this.Nombre = Nombre;
        this.Bandera_ = Bandera_;
        this.Estado = Estado;
    }

    public String getId_Partido() {
        return id_Partido;
    }

    public void setId_Partido(String id_Partido) {
        this.id_Partido = id_Partido;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getBandera_() {
        return Bandera_;
    }

    public void setBandera_(String Bandera_) {
        this.Bandera_ = Bandera_;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }

    public String getEstadoDes() {
        if (isEstado()) {
            return "Activo";
        } else {
            return "Inactivo";
        }

    }

    @Override
    public String toString() {
        return "Partido{" + "id_Partido=" + id_Partido + ", Nombre=" + Nombre + ", Bandera_=" + Bandera_ + ", Estado=" + Estado + '}';
    }

}
