
package dominio;

import datos.PersonaDaoJDBC;
import java.io.IOException;
import java.io.InputStream;


public class Persona {
private String id_Persona;
private int id_Tipo;
private String id_Tipo_Des;
private int id_Mesa;
private String id_Mesa_Des;
private int id_Partido;
private String id_Partido_Nom;
private String Password_;
private String primer_Nombre;
private String segundo_Nombre;
private String tercer_Nombre;
private String primer_Apellido;
private String segundo_Apellido;
private String Foto;
private String Foto_Partido;
private int EstadoVoto;
private String EstadoVoto_Des;
private boolean Estado;

    public Persona() {
    }

    public Persona(String id_Persona) {
        this.id_Persona = id_Persona;
    }

    public Persona(String id_Persona, String Password_) {
        this.id_Persona = id_Persona;
        this.Password_ = Password_;
    }

    public Persona(String id_Persona, int id_Tipo, int id_Mesa, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto, int EstadoVoto, boolean Estado) {
        this.id_Persona = id_Persona;
        this.id_Tipo = id_Tipo;
        this.id_Mesa = id_Mesa;
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        this.EstadoVoto = EstadoVoto;
        this.Estado = Estado;
    }



    public Persona(int id_Tipo, int id_Mesa, int id_Partido, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto, int EstadoVoto, boolean Estado) {
        this.id_Tipo = id_Tipo;
        this.id_Mesa = id_Mesa;
        this.id_Partido = id_Partido;
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        this.EstadoVoto = EstadoVoto;
        this.Estado = Estado;
    }

    public Persona(String id_Persona, int id_Tipo, int id_Mesa, int id_Partido, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto, int EstadoVoto, boolean Estado) {
        this.id_Persona = id_Persona;
        this.id_Tipo = id_Tipo;
        this.id_Mesa = id_Mesa;
        this.id_Partido = id_Partido;
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        this.EstadoVoto = EstadoVoto;
        this.Estado = Estado;
    }

    public Persona(String id_Persona, int id_Tipo, String id_Tipo_Des, int id_Mesa, String id_Mesa_Des, int id_Partido, String id_Partido_Nom, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto, int EstadoVoto, boolean Estado) {
        this.id_Persona = id_Persona;
        this.id_Tipo = id_Tipo;
        this.id_Tipo_Des = id_Tipo_Des;
        this.id_Mesa = id_Mesa;
        this.id_Mesa_Des = id_Mesa_Des;
        this.id_Partido = id_Partido;
        this.id_Partido_Nom = id_Partido_Nom;
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        this.EstadoVoto = EstadoVoto;
        this.Estado = Estado;
    }

    public Persona(String id_Persona, int id_Tipo, int id_Mesa, int id_Partido, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto) {
                this.id_Persona = id_Persona;
        this.id_Tipo = id_Tipo;
        
        this.id_Mesa = id_Mesa;
        
        this.id_Partido = id_Partido;
        
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        
        
    }

    public Persona(String id_Persona, int id_Tipo, int id_Mesa, String Password_, String primer_Nombre, String segundo_Nombre, String tercer_Nombre, String primer_Apellido, String segundo_Apellido, String Foto) {
                this.id_Persona = id_Persona;
        this.id_Tipo = id_Tipo;
        
        this.id_Mesa = id_Mesa;
        
        this.Password_ = Password_;
        this.primer_Nombre = primer_Nombre;
        this.segundo_Nombre = segundo_Nombre;
        this.tercer_Nombre = tercer_Nombre;
        this.primer_Apellido = primer_Apellido;
        this.segundo_Apellido = segundo_Apellido;
        this.Foto = Foto;
        
        
    }

    public String getId_Persona() {
        return id_Persona;
    }

    public void setId_Persona(String id_Persona) {
        this.id_Persona = id_Persona;
    }

    public int getId_Tipo() {
        return id_Tipo;
    }

    public void setId_Tipo(int id_Tipo) {
        this.id_Tipo = id_Tipo;
    }

    public int getId_Mesa() {
        return id_Mesa;
    }

    public void setId_Mesa(int id_Mesa) {
        this.id_Mesa = id_Mesa;
    }

    public int getId_Partido() {
        return id_Partido;
    }

    public void setId_Partido(int id_Partido) {
        this.id_Partido = id_Partido;
    }

    public String getPassword_() {
        return Password_;
    }

    public void setPassword_(String Password_) {
        this.Password_ = Password_;
    }

    public String getPrimer_Nombre() {
        return primer_Nombre;
    }

    public void setPrimer_Nombre(String primer_Nombre) {
        this.primer_Nombre = primer_Nombre;
    }

    public String getSegundo_Nombre() {
        return segundo_Nombre;
    }

    public void setSegundo_Nombre(String segundo_Nombre) {
        this.segundo_Nombre = segundo_Nombre;
    }

    public String getTercer_Nombre() {
        return tercer_Nombre;
    }

    public void setTercer_Nombre(String tercer_Nombre) {
        this.tercer_Nombre = tercer_Nombre;
    }

    public String getPrimer_Apellido() {
        return primer_Apellido;
    }

    public void setPrimer_Apellido(String primer_Apellido) {
        this.primer_Apellido = primer_Apellido;
    }

    public String getSegundo_Apellido() {
        return segundo_Apellido;
    }

    public void setSegundo_Apellido(String segundo_Apellido) {
        this.segundo_Apellido = segundo_Apellido;
    }

    public String getNombreCompleto() {
        return getPrimer_Nombre()+" "+getSegundo_Nombre()+" "+getTercer_Nombre()+" "+getPrimer_Apellido()+" "+getSegundo_Apellido();
    }
    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public int getEstadoVoto() {
        return EstadoVoto;
    }

    public void setEstadoVoto(int EstadoVoto) {
        this.EstadoVoto = EstadoVoto;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }

    public String getId_Tipo_Des() {
        
        return  new PersonaDaoJDBC().Referencia(getId_Tipo(),1);
        
    }

    public void setId_Tipo_Des(String id_Tipo_Des) {
        this.id_Tipo_Des = id_Tipo_Des;
    }

    public String getId_Mesa_Des() {
        return id_Mesa_Des;
    }

    public void setId_Mesa_Des(String id_Mesa_Des) {
        this.id_Mesa_Des = id_Mesa_Des;
    }

    public String getId_Partido_Nom() {
       return  new PersonaDaoJDBC().Referencia(getId_Partido(),2);
    }

    public void setId_Partido_Nom(String id_Partido_Nom) {
        this.id_Partido_Nom = id_Partido_Nom;
    }

    public String getFoto_Partido() throws IOException {
        return  new PersonaDaoJDBC().listarIMG(getId_Persona());
    }

    public void setFoto_Partido(String Foto_Partido) {
        this.Foto_Partido = Foto_Partido;
    }

    public String getEstadoVoto_Des() {
        return new PersonaDaoJDBC().Referencia(getEstadoVoto(),3);
    }

    public void setEstadoVoto_Des(String EstadoVoto_Des) {
        this.EstadoVoto_Des = EstadoVoto_Des;
    }
    
    
    public String getEstadoDes(){
        if (isEstado()) {
            return "Activo";
        }else{
        return "Inactivo";
        }
        
    }

    @Override
    public String toString() {
        return "Persona{" + "id_Persona=" + id_Persona + ", id_Tipo=" + id_Tipo + ", id_Mesa=" + id_Mesa + ", id_Partido=" + id_Partido + ", Password_=" + Password_ + ", primer_Nombre=" + primer_Nombre + ", segundo_Nombre=" + segundo_Nombre + ", tercer_Nombre=" + tercer_Nombre + ", primer_Apellido=" + primer_Apellido + ", segundo_Apellido=" + segundo_Apellido + ", Foto=" + Foto + ", EstadoVoto=" + EstadoVoto + ", Estado=" + Estado + '}';
    }



}
