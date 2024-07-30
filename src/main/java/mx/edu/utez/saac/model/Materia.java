package mx.edu.utez.saac.model;

public class Materia {
    private int id_materia;
    private String nombre;
    private int id_carrera;
    private String division;
    private String area;
    private String descripcion;
    private int id_maestro;

    public Materia() {
    }

    public Materia(int id_materia, String nombre, int id_carrera, String division, String area, String descripcion, int id_maestro) {
        this.id_materia = id_materia;
        this.nombre = nombre;
        this.id_carrera = id_carrera;
        this.division = division;
        this.area = area;
        this.descripcion = descripcion;
        this.id_maestro = id_maestro;
    }

    public int getId_materia() {
        return id_materia;
    }

    public void setId_materia(int id_materia) {
        this.id_materia = id_materia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(int id_carrera) {
        this.id_carrera = id_carrera;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_maestro() {
        return id_maestro;
    }

    public void setId_maestro(int id_maestro) {
        this.id_maestro = id_maestro;
    }

    public void setIdMaestro(int idMaestro) {
    }

    public void getIdMaestro() {
    }

    public void setMateria(String materia) {
    }
}
