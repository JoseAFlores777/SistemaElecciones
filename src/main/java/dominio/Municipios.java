
package dominio;

public class Municipios {
    
    private int id_Municipio;
    private int id_Departamento;
    private String Nombre;

    public Municipios() {
    }

    public int getId_Departamento() {
        return id_Departamento;
    }

    public void setId_Departamento(int id_Departamento) {
        this.id_Departamento = id_Departamento;
    }

    public Municipios(int id_Municipio, int id_Departamento, String Nombre) {
        this.id_Municipio = id_Municipio;
        this.id_Departamento = id_Departamento;
        this.Nombre = Nombre;
    }

    public Municipios(int id_Municipio, String Nombre) {
        this.id_Municipio = id_Municipio;
        this.Nombre = Nombre;
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
    
    
    
}
