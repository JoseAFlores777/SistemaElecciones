
package dominio;

import datos.VotoDaoJDBC;


public class Voto {
    
    private int id_Voto;
    private int id_Mesa;
    private int id_Partido;
    private int id_Tipo;
    private String id_Persona;
    private int Votos;

    public Voto() {
    }

    public Voto(int id_Voto, int id_Mesa, int id_Partido, int id_Tipo, String id_Persona, int Votos) {
        this.id_Voto = id_Voto;
        this.id_Mesa = id_Mesa;
        this.id_Partido = id_Partido;
        this.id_Tipo = id_Tipo;
        this.id_Persona = id_Persona;
        this.Votos = Votos;
    }

    public Voto(int id_Mesa, String id_Persona) {
        this.id_Mesa = id_Mesa;
        this.id_Persona = id_Persona;
    }

    public int getId_Voto() {
        return id_Voto;
    }

    public void setId_Voto(int id_Voto) {
        this.id_Voto = id_Voto;
    }

    public int getId_Mesa() {
        return id_Mesa;
    }

    public void setId_Mesa(int id_Mesa) {
        this.id_Mesa = id_Mesa;
    }

    public int getId_Partido() {
        
        return Integer.parseInt(new VotoDaoJDBC().Referencia(getId_Persona(),4));
    }
    
    public String getPartido_Nom() {
        
        return new VotoDaoJDBC().Referencia(String.valueOf(getId_Partido()),2);
    }

    public void setId_Partido(int id_Partido) {
        this.id_Partido = id_Partido;
    }

    public int getId_Tipo() {
        return id_Tipo;
    }
    public String getTipo_Des() {
        return new VotoDaoJDBC().Referencia(String.valueOf(getId_Tipo()),1);
    }

    public void setId_Tipo(int id_Tipo) {
        this.id_Tipo = id_Tipo;
    }

    public String getId_Persona() {
        return id_Persona;
    }
    public String getPersona_Nomb() {
        return new VotoDaoJDBC().Referencia(getId_Persona(),3);
    }

    public void setId_Persona(String id_Persona) {
        this.id_Persona = id_Persona;
    }

    public int getVotos() {
        return Votos;
    }

    public void setVotos(int Votos) {
        this.Votos = Votos;
    }
    
    
    
}
