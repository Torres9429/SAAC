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

    public Horario() {
    }

    public Horario(int id_horario, Time hora_inicio, Time hora_fin, Date dia, int id_usuario, int materia, String nombre_materia, String nombre_docente) {
        this.id_horario = id_horario;
        this.hora_inicio = hora_inicio;
        this.hora_fin = hora_fin;
        this.dia = dia;
        this.id_usuario = id_usuario;
        this.materia = materia;
        this.nombre_materia = nombre_materia;
        this.nombre_docente = nombre_docente;
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
}
