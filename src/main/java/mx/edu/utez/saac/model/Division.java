package mx.edu.utez.saac.model;

public class Division {
    private int id_division;
    private String division_academica;

    public Division() {
    }

    public Division(int id_division, String division_academica) {
        this.id_division = id_division;
        this.division_academica = division_academica;
    }

    public int getId_division() {
        return id_division;
    }

    public void setId_division(int id_division) {
        this.id_division = id_division;
    }

    public String getDivision_academica() {
        return division_academica;
    }

    public void setDivision_academica(String division_academica) {
        this.division_academica = division_academica;
    }
}
