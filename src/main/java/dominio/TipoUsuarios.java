
package dominio;


public class TipoUsuarios {
    
    private int id_Tipo;
    private String Nombre;
    private int Tipo_;

    public TipoUsuarios() {
    }

    public TipoUsuarios(int id_Tipo, String Nombre) {
        this.id_Tipo = id_Tipo;
        this.Nombre = Nombre;
    }

    public TipoUsuarios(int id_Tipo, String Nombre, int Tipo_) {
        this.id_Tipo = id_Tipo;
        this.Nombre = Nombre;
        this.Tipo_=Tipo_;
    }

    public int getId_Tipo() {
        return id_Tipo;
    }

    public void setId_Tipo(int id_Tipo) {
        this.id_Tipo = id_Tipo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getTipo_() {
        return Tipo_;
    }

    public void setTipo_(int Tipo_) {
        this.Tipo_ = Tipo_;
    }
    
}
