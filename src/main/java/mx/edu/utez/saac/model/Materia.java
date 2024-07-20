package mx.edu.utez.saac.model;

import java.util.Collection;
import java.util.Collections;

public class Materia {
    private int id_materia;
    private String materia;
    private int id_carrera;

    public Materia() {
    }

    public Materia(int id_materia, String materia, int id_carrera) {
        this.id_materia = id_materia;
        this.materia = materia;
        this.id_carrera = id_carrera;
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

    public void setNombre(String materia) {
    }

    public void setDivision(String division) {
    }

    public void setArea(String area) {
    }

    public void setDescripcion(String descripcion) {
    }

    public void setIdMaestro(int idMaestro) {
    }

    public Collection<Object> getNombre() {
        return java.util.List.of();
    }

    public Collection<Object> getDivision() {

        return java.util.List.of();
    }

    public Collection<Object> getArea() {

        return java.util.List.of();
    }


    public Collection<Object> getDescripcion() {
        return Collections.singleton(false);
    }

    public boolean getIdMaestro() {

        return false;
    }
}
