package mx.edu.utez.saac.model;

import java.sql.Date;
import java.sql.Time;

public class CalificacionDTO {
    private int idAsesoria;
    private String materia;
    private String horario;
    private Time horaInicio;
    private Time horaFin;
    private Date dia;  // Agregado para almacenar la fecha de la asesoría
    private int idMateria;
    private String nombreDocente;
    private String calificacionDocente;  // Se cambió a String para coincidir con la descripción
    private String comentariosDocente;
    private String nombreEstudiante;
    private String calificacionEstudiante;  // Se cambió a String para coincidir con la descripción
    private String comentariosEstudiante;

    // Getters y Setters
    public int getIdAsesoria() {
        return idAsesoria;
    }

    public void setIdAsesoria(int idAsesoria) {
        this.idAsesoria = idAsesoria;
    }

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public Time getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Time horaInicio) {
        this.horaInicio = horaInicio;
    }

    public Time getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(Time horaFin) {
        this.horaFin = horaFin;
    }

    public Date getDia() {
        return dia;
    }

    public void setDia(Date dia) {
        this.dia = dia;
    }

    public int getIdMateria() {
        return idMateria;
    }

    public void setIdMateria(int idMateria) {
        this.idMateria = idMateria;
    }

    public String getNombreDocente() {
        return nombreDocente;
    }

    public void setNombreDocente(String nombreDocente) {
        this.nombreDocente = nombreDocente;
    }

    public String getCalificacionDocente() {
        return calificacionDocente;
    }

    public void setCalificacionDocente(String calificacionDocente) {
        this.calificacionDocente = calificacionDocente;
    }

    public String getComentariosDocente() {
        return comentariosDocente;
    }

    public void setComentariosDocente(String comentariosDocente) {
        this.comentariosDocente = comentariosDocente;
    }

    public String getNombreEstudiante() {
        return nombreEstudiante;
    }

    public void setNombreEstudiante(String nombreEstudiante) {
        this.nombreEstudiante = nombreEstudiante;
    }

    public String getCalificacionEstudiante() {
        return calificacionEstudiante;
    }

    public void setCalificacionEstudiante(String calificacionEstudiante) {
        this.calificacionEstudiante = calificacionEstudiante;
    }

    public String getComentariosEstudiante() {
        return comentariosEstudiante;
    }

    public void setComentariosEstudiante(String comentariosEstudiante) {
        this.comentariosEstudiante = comentariosEstudiante;
    }
}
