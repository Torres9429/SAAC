package mx.edu.utez.saac.model;

import java.sql.Date;
import java.sql.Time;

public class Asesoria {
    private int id_asesoria;
    private int id_docente;
    private int id_estudiante;
    private int id_materia;
    private int id_lugar;
    private int id_horario;
    private int id_status_asesoria;
    private String dudas;
    private Time hora_inicio;
    private Time hora_fin;
    private Date dia;

    public Asesoria() {
    }

    public Asesoria(int id_asesoria, int id_docente, int id_estudiante, int id_materia, int id_horario, int id_lugar, int id_status_asesoria, String dudas, Time hora_inicio, Time hora_fin, Date dia) {
        this.id_asesoria = id_asesoria;
        this.id_docente = id_docente;
        this.id_estudiante = id_estudiante;
        this.id_materia = id_materia;
        this.id_horario = id_horario;
        this.id_lugar = id_lugar;
        this.id_status_asesoria = id_status_asesoria;
        this.dudas = dudas;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.dia = dia;
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

    public int getId_horario() {
        return id_horario;
    }

    public void setId_horario(int id_horario) {
        this.id_horario = id_horario;
    }

    public int getId_lugar() {
        return id_lugar;
    }

    public void setId_lugar(int id_lugar) {
        this.id_lugar = id_lugar;
    }

    public int getId_status_asesoria() {
        return id_status_asesoria;
    }

    public void setId_status_asesoria(int id_status_asesoria) {
        this.id_status_asesoria = id_status_asesoria;
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
}
