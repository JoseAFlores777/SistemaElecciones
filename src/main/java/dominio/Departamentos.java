
package dominio;


public class Departamentos {
    
    private int id_Departamento;
    private String Nombre;

    public Departamentos() {
    }

    public Departamentos(int id_Departamento, String Nombre) {
        this.id_Departamento = id_Departamento;
        this.Nombre = Nombre;
    }

    public int getId_Departamento() {
        return id_Departamento;
    }

    public void setId_Departamento(int id_Departamento) {
        this.id_Departamento = id_Departamento;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
}
