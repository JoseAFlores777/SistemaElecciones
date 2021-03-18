
package dominio;


public class Tipo_EstadoMesa {
        private int id_TipoEstadoMesa;
    private String Descripcion;

    public Tipo_EstadoMesa() {
    }

    public Tipo_EstadoMesa(int id_TipoEstadoMesa, String Descripcion) {
        this.id_TipoEstadoMesa = id_TipoEstadoMesa;
        this.Descripcion = Descripcion;
    }

    public int getId_TipoEstadoMesa() {
        return id_TipoEstadoMesa;
    }

    public void setId_TipoEstadoMesa(int id_TipoEstadoMesa) {
        this.id_TipoEstadoMesa = id_TipoEstadoMesa;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
}
