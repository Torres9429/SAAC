package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Usuario;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDao {
    // CRUD para usuario
    // Read para un usuario
    public Usuario getOne(String correo, String contrasena){
        Usuario usuario = new Usuario();
        String query = "select * from usuario where correo = ? and contrasena = sha2(?, 256);";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            //Connection con = MyConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(query); // forma de evitar que inyecten query
            ps.setString(1,correo);
            ps.setString(2,contrasena);
           // ps.setString(3,codigo);
            ResultSet rs = ps.executeQuery(); // ejecutar
            if (rs.next()){
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
               // usuario.setCodigo(rs.getString("codigo"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    //Método encargado de insertar un nuevo usuario
    public boolean insert(Usuario u){
        boolean flag = false;
        String query = "insert into usuario(nombre,apellido_paterno,apellido_materno,edad,matricula,carrera,correo,contrasena,estado) values(?,?,?,?,?,?,?,sha2(?,256),?);";
        try{
            //Generador de token

            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getApellido_paterno());
            ps.setString(3, u.getApellido_materno());
            ps.setString(4, String.valueOf(u.getEdad()));
            ps.setString(5, u.getMatricula());
            ps.setString(6,u.getCarrera());
            ps.setString(7, u.getCorreo());
            ps.setString(8, u.getContrasena());
            ps.setString(9, "1");



            if (ps.executeUpdate() > 0) {
                flag = true;

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;

    }
}
