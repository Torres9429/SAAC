package mx.edu.utez.saac.model;

public class Aula {
    private int id_aula;
    private String aula;
    private int id_edificio;
    private String edificio;

    public Aula() {
    }

    public Aula(int id_aula, String aula, int id_edificio, String edificio) {
        this.id_aula = id_aula;
        this.aula = aula;
        this.id_edificio = id_edificio;
        this.edificio = edificio;
    }

    public int getId_aula() {
        return id_aula;
    }

    public void setId_aula(int id_aula) {
        this.id_aula = id_aula;
    }

    public String getAula() {
        return aula;
    }

    public void setAula(String aula) {
        this.aula = aula;
    }

    public int getId_edificio() {
        return id_edificio;
    }

    public void setId_edificio(int id_edificio) {
        this.id_edificio = id_edificio;
    }

    public String getEdificio() {
        return edificio;
    }

    public void setEdificio(String edificio) {
        this.edificio = edificio;
    }
}
