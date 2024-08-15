package mx.edu.utez.saac.model;

public class Evaluacion {
    private int id_evaluacion;
    private String comentarios;
    private int id_calificacion;
    private String calificacion;
    private int id_estudiante;
    private String estudiante;
    private int id_docente;
    private String docente;
    private int id_asesoria;

    public Evaluacion() {
    }

    public Evaluacion(int id_evaluacion, String comentarios, int id_calificacion, String calificacion, int id_estudiante, String estudiante, int id_docente, String docente, int id_asesoria) {
        this.id_evaluacion = id_evaluacion;
        this.comentarios = comentarios;
        this.id_calificacion = id_calificacion;
        this.calificacion = calificacion;
        this.id_estudiante = id_estudiante;
        this.estudiante = estudiante;
        this.id_docente = id_docente;
        this.docente = docente;
        this.id_asesoria = id_asesoria;
    }

    public int getId_evaluacion() {
        return id_evaluacion;
    }

    public void setId_evaluacion(int id_evaluacion) {
        this.id_evaluacion = id_evaluacion;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public int getId_calificacion() {
        return id_calificacion;
    }

    public void setId_calificacion(int id_calificacion) {
        this.id_calificacion = id_calificacion;
    }

    public String getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    public int getId_estudiante() {
        return id_estudiante;
    }

    public void setId_estudiante(int id_estudiante) {
        this.id_estudiante = id_estudiante;
    }

    public String getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(String estudiante) {
        this.estudiante = estudiante;
    }

    public int getId_docente() {
        return id_docente;
    }

    public void setId_docente(int id_docente) {
        this.id_docente = id_docente;
    }

    public String getDocente() {
        return docente;
    }

    public void setDocente(String docente) {
        this.docente = docente;
    }

    public int getId_asesoria() {
        return id_asesoria;
    }

    public void setId_asesoria(int id_asesoria) {
        this.id_asesoria = id_asesoria;
    }
}
