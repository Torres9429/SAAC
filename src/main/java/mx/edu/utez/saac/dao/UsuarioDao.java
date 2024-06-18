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
    public Usuario getOne(String correoLogin, String passwordLogin){
        Usuario usuario = new Usuario();
        String query = "select * from usuario where correo_institucional = ? and password = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query); // forma de evitar que inyecten query
            ps.setString(1,correoLogin);
            ps.setString(2,passwordLogin);
            ResultSet rs = ps.executeQuery(); // ejecutar
            if (rs.next()){
                usuario.setCorreo(rs.getString("correo_institucional"));
                usuario.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
}
