package mx.edu.utez.saac.model;

import java.sql.Date;
import java.sql.Time;

public class Horario {
    private int id_horario;
    private Time hora_inicio;
    private Time hora_fin;
    private Date dia;
    private int materia;
    private String nombre_materia;
    private int id_usuario;
    private String nombre_docente;
    private int id_aula;
    private String aula;
    private int id_edificio;
    private String edificio;
    private int division;
    private int carrera;

    public Horario() {
    }

    public Horario(int id_horario, Time hora_inicio, Time hora_fin, Date dia, int materia, String nombre_materia, int id_usuario, String nombre_docente, int id_aula, String aula, int id_edificio, String edificio, int division, int carrera) {
        this.id_horario = id_horario;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.dia = dia;
        this.materia = materia;
        this.nombre_materia = nombre_materia;
        this.id_usuario = id_usuario;
        this.nombre_docente = nombre_docente;
        this.id_aula = id_aula;
        this.aula = aula;
        this.id_edificio = id_edificio;
        this.edificio = edificio;
        this.division = division;
        this.carrera = carrera;
    }

    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public Time getHora_inicio() {
        return hora_inicio;
    }

    public void setHora_inicio(Time hora_inicio) {
        this.hora_inicio = hora_inicio;
    }

    public Time getHora_fin() {
        return hora_fin;
    }

    public void setHora_fin(Time hora_fin) {
        this.hora_fin = hora_fin;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getMateria() {
        return materia;
    }

    public void setMateria(int materia) {
        this.materia = materia;
    }

    public String getNombre_materia() {
        return nombre_materia;
    }

    public void setNombre_materia(String nombre_materia) {
        this.nombre_materia = nombre_materia;
    }

    public String getNombre_docente() {
        return nombre_docente;
    }

    public void setNombre_docente(String nombre_docente) {
        this.nombre_docente = nombre_docente;
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

    public int getDivision() {
        return division;
    }

    public void setDivision(int division) {
        this.division = division;
    }

    public int getCarrera() {
        return carrera;
    }

    public void setCarrera(int carrera) {
        this.carrera = carrera;
    }
}
