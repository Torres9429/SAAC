package mx.edu.utez.saac.dao;

import com.google.api.client.util.DateTime;
import mx.edu.utez.saac.model.Usuario;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

import static mx.edu.utez.saac.utils.DatabaseConnectionManager.getConnection;

public class UsuarioDao {
    // CRUD para usuario
    // Read para un usuario
    public Usuario getOne(String correo, String contrasena){
        Usuario usuario = new Usuario();
        String query = "select * from usuario where correo = ? and contrasena = sha2(?, 256);";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query); // forma de evitar que inyecten query
            ps.setString(1,correo);
            ps.setString(2,contrasena);
            System.out.println(ps);
            ResultSet rs = ps.executeQuery(); // ejecutar
            if (rs.next()){
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setEstado(rs.getBoolean("status"));

            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //Método encargado de insertar un nuevo usuario
    public boolean insert(Usuario u){
        boolean flag = false;
        String queryCheck = "SELECT * FROM usuario WHERE correo = ?;";
        String queryInsert = "INSERT INTO usuario(id_tipo_usuario,status,nombre, apellido_paterno, apellido_materno, edad, matricula, carrera, correo, contrasena, codigo, fecha_creacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, SHA2(?, 256), ?, ?);";

        try {
            Connection con = getConnection();

            // Ver si el usuario ya existe
            PreparedStatement psCheck = con.prepareStatement(queryCheck);
            psCheck.setString(1, u.getCorreo());
            ResultSet rsCheck = psCheck.executeQuery();

            if (!rsCheck.next()) {
                LocalDateTime fechaHora = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String fechaHoraFormatted = fechaHora.format(formatter);
                PreparedStatement psInsert = con.prepareStatement(queryInsert);
                psInsert.setInt(1,u.getId_tipo_usuario());
                psInsert.setInt(2,0);
                psInsert.setString(3, u.getNombre());
                psInsert.setString(4, u.getApellido_paterno());
                psInsert.setString(5, u.getApellido_materno());
                psInsert.setString(6, String.valueOf(u.getEdad()));
                psInsert.setString(7, u.getMatricula());
                psInsert.setInt(8, u.getCarrera());
                psInsert.setString(9, u.getCorreo());
                psInsert.setString(10, u.getContrasena());
                psInsert.setString(11, null);
                psInsert.setString(12,fechaHoraFormatted);

                if (psInsert.executeUpdate() > 0) {
                    flag = true;
                }

                psInsert.close();
            } else {
                System.out.println("El usuario ya existe.");
            }

            rsCheck.close();
            psCheck.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }
    public boolean updateCodigo(Usuario u, String codigo) {
        boolean flag = false;
        String query = "update usuario set codigo = ? where id_usuario = ?;";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,codigo);
            ps.setInt(2,u.getId());
            if(ps.executeUpdate()>0){
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;

    }

    public boolean existe(String codigo) {
        boolean flag = false;
        String query = "SELECT * FROM usuario WHERE codigo = ?";
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, codigo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                flag = true;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }


    public boolean updateContrasena(String contrasena, String codigo) {
        boolean flag = false;
        String query = "update usuario set contrasena = sha2(?,256), codigo = null where codigo = ?";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,contrasena);
            ps.setString(2, codigo);
            if(ps.executeUpdate()>0){
                flag = true;
            }
            ps.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public Usuario getOne(String correo) {
        Usuario usuario = new Usuario();
        String query = "select * from usuario where correo = ?;";
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,correo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setEstado(rs.getBoolean("status"));
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    public ArrayList<Usuario> getAll() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = "select * from usuario;";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setMatricula(rs.getString("matricula"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido_paterno(rs.getString("apellido_paterno"));
                u.setApellido_materno(rs.getString("apellido_materno"));
                u.setEdad(rs.getInt("edad"));
                u.setContrasena(rs.getString("contrasena"));
                u.setCorreo(rs.getString("correo"));
                u.setEstado(rs.getBoolean("status"));
                u.setId_tipo_usuario(rs.getInt("id_tipo_usuario"));
                lista.add(u);
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return lista;
    }

    public boolean eliminarLogico(int id) {
        boolean flag = false;
        String query = "update usuario set status = false where id_usuario = ?";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            if(ps.executeUpdate()>0){
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
    public boolean eliminarFisico(int id) {
        boolean flag = false;
        String query = "delete from usuario where id_usuario = ?";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            if(ps.executeUpdate()>0){
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public boolean habilitar(int id) {
        boolean flag = false;
        String query = "update usuario set status = true where id_usuario = ?";
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            if(ps.executeUpdate()>0){
                flag = true;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    public Usuario getUsuarioById(int id) {
        Usuario usuario = null;
        String query = "SELECT * FROM usuario WHERE id_usuario = ?"; // Asegúrate de que el nombre de la columna es correcto

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            System.out.println("Ejecutando consulta con ID: " + id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                usuario = new Usuario();
                usuario.setId(resultSet.getInt("id_usuario"));
                usuario.setNombre(resultSet.getString("nombre"));
                usuario.setApellido_paterno(resultSet.getString("apellido_paterno"));
                usuario.setApellido_materno(resultSet.getString("apellido_materno"));
                usuario.setEdad(resultSet.getInt("edad"));
                usuario.setMatricula(resultSet.getString("matricula"));



                // Depuración: Imprimir valores recuperados
                System.out.println("Usuario recuperado: " + usuario);
            } else {
                System.out.println("No se encontró el usuario con id: " + id);
            }
        } catch (SQLException e) {
            System.err.println("Error en la consulta SQL: " + e.getMessage());
            e.printStackTrace();
        }

        return usuario;
    }
    public boolean guardarDatos(Usuario usuario){
        boolean flag = false;
        String query = "update usuario set nombre = ?, apellido_paterno = ?, apellido_materno = ?, edad = ? where id_usuario = ?;";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido_paterno());
            ps.setString(3, usuario.getApellido_materno());
            ps.setInt(4, usuario.getEdad());
            ps.setInt(5, usuario.getId());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public ArrayList<Usuario> getDeshabilitados() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = "SELECT * FROM usuario WHERE status = 0;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setMatricula(rs.getString("matricula"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido_paterno(rs.getString("apellido_paterno"));
                u.setApellido_materno(rs.getString("apellido_materno"));
                u.setCorreo(rs.getString("correo"));
                u.setEstado(rs.getBoolean("status"));
                lista.add(u);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }
}
