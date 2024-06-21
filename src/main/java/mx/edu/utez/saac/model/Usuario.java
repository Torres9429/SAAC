package mx.edu.utez.saac.model;

public class Usuario {
    private String nombre;
    private String apellido_paterno;
    private String apellido_materno;
    private int edad;
    private String matricula;
    private String carrera;
    private String correo;
    private String contrasena;
    private boolean estado;
    private int id;
    private String codigo;

    public Usuario() {
    }

    public Usuario(String correo, String contrasena, String codigo) {
        this.correo = correo;
        this.contrasena = contrasena;
        this.codigo = codigo;
    }

    public Usuario(String nombre, String apellido_paterno, String apellido_materno, int edad, String matricula, String carrera, String correo, String contrasena, String estado, int id) {
        this.nombre = nombre;
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.edad = edad;
        this.matricula = matricula;
        this.carrera = carrera;
        this.correo = correo;
        this.contrasena = contrasena;
        this.estado = Boolean.parseBoolean(estado);
        this.id = id;
    }



    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno;
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
}
