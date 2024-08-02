package mx.edu.utez.saac.model;

public class Materia {
    private int id_materia;
    private String materia;
    private int id_carrera;
    private String carrera;


    public Materia() {
    }

    public Materia(int id_materia, String materia, int id_carrera, String carrera) {
        this.id_materia = id_materia;
        this.materia = materia;
        this.id_carrera = id_carrera;
        this.carrera = carrera;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public int getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(int id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
}
