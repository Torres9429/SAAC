package mx.edu.utez.saac.model;

import java.sql.Date;
import java.sql.Time;

public class Asesoria {
    private int id_asesoria;
    private int id_docente;
    private int id_estudiante;
    private int id_materia;
    private String materia;
    private int id_carrera;
    private int id_division;
    private int id_aula;
    private String aula;
    private int id_edificio;
    private String edificio;

    private int id_horario;
    private int id_status_asesoria;
    private String status;
    private String dudas;
    private Time hora_inicio;
    private Time hora_fin;
    private Date dia;
    private String nombre_docente;

    public Asesoria() {
    }

    public Asesoria(int id_asesoria, int id_docente, int id_estudiante, int id_materia, String materia, int id_carrera, int id_division, int id_aula, String aula, int id_edificio, String edificio, int id_horario, int id_status_asesoria, String status, String dudas, Time hora_inicio, Time hora_fin, Date dia, String nombre_docente) {
        this.id_asesoria = id_asesoria;
        this.id_docente = id_docente;
        this.id_estudiante = id_estudiante;
        this.id_materia = id_materia;
        this.materia = materia;
        this.id_carrera = id_carrera;
        this.id_division = id_division;
        this.id_aula = id_aula;
        this.aula = aula;
        this.id_edificio = id_edificio;
        this.edificio = edificio;
        this.id_horario = id_horario;
        this.id_status_asesoria = id_status_asesoria;
        this.status = status;
        this.dudas = dudas;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.dia = dia;
        this.nombre_docente = nombre_docente;
    }

    public int getId_asesoria() {
        return id_asesoria;
    }

    public void setId_asesoria(int id_asesoria) {
        this.id_asesoria = id_asesoria;
    }

    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
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

    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
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

    public int getId_status_asesoria() {
        return id_status_asesoria;
    }

    public void setId_status_asesoria(int id_status_asesoria) {
        this.id_status_asesoria = id_status_asesoria;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDudas() {
        return dudas;
    }

    public void setDudas(String dudas) {
        this.dudas = dudas;
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

    public int getId_carrera() {
        return id_carrera;
    }

    public void setId_carrera(int id_carrera) {
        this.id_carrera = id_carrera;
    }

    public int getId_division() {
        return id_division;
    }

    public void setId_division(int id_division) {
        this.id_division = id_division;
    }

    public String getNombre_docente() {
        return nombre_docente;
    }

    public void setNombre_docente(String nombre_docente) {
        this.nombre_docente = nombre_docente;
    }
}
