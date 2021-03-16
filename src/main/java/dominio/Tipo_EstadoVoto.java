
package dominio;


public class Tipo_EstadoVoto {
  
    private int id_TipoEstadoVoto;
    private String Descripcion;

    public Tipo_EstadoVoto() {
    }

    public Tipo_EstadoVoto(int id_TipoEstadoVoto, String Descripcion) {
        this.id_TipoEstadoVoto = id_TipoEstadoVoto;
        this.Descripcion = Descripcion;
    }



    public int getId_TipoEstadoVoto() {
        return id_TipoEstadoVoto;
    }

    public void setId_TipoEstadoVoto(int id_TipoEstadoVoto) {
        this.id_TipoEstadoVoto = id_TipoEstadoVoto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    
    
}
