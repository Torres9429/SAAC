package mx.edu.utez.saac.model;

public class Carrera {
    private int id_carrera;
    private String carrera;
    private int id_division;

    public Carrera() {
    }

    public Carrera(int id_carrera, String carrera, int id_division) {
        this.id_carrera = id_carrera;
        this.carrera = carrera;
        this.id_division = id_division;
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

    public int getId_division() {
        return id_division;
    }

    public void setId_division(int id_division) {
        this.id_division = id_division;
    }
}
