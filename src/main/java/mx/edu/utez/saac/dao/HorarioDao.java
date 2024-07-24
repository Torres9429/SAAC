package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Horario;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class HorarioDao {
    public boolean guardarHorario(Horario horario){
        boolean flag = false;
        String query = "insert into horario(hora_inicio,hora_fin,dia,id_materia,id_usuario) values(?,?,?,?,?);";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);

            ps.setTime(1, Time.valueOf(String.valueOf(horario.getHora_inicio())));
            ps.setTime(2, Time.valueOf(String.valueOf(horario.getHora_fin())));
            ps.setDate(3, horario.getDia());
            ps.setInt(4, horario.getMateria());
            ps.setInt(5, horario.getId_usuario());
            if (ps.executeUpdate() > 0) {
                System.out.println("query correcto");
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public ArrayList<Horario> getHorarios(int idUsuario) {
        ArrayList<Horario> list = new ArrayList<>();
        String query = "{CALL GetHorariosPorUsuario(?)}"; // Llamada al procedimiento almacenado

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            CallableStatement cs = con.prepareCall(query);
            cs.setInt(1, idUsuario);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Horario horario = new Horario();
                horario.setId_horario(rs.getInt("id_horario"));
                horario.setHora_inicio(rs.getTime("hora_inicio"));
                horario.setHora_fin(rs.getTime("hora_fin"));
                horario.setDia(rs.getDate("dia"));
                horario.setMateria(rs.getInt("id_materia"));
                horario.setNombre_materia(rs.getString("materia"));
                list.add(horario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /*public ArrayList<Horario> getHorarios(int idUsuario){
        ArrayList<Horario> list = new ArrayList<>();
        String query = "{CALL GetHorariosPorUsuario(?)}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Horario horario = new Horario();
                horario.setHora_inicio(rs.getTime("hora_inicio"));
                horario.setHora_fin(rs.getTime("hora_fin"));
                horario.setDia(rs.getDate("dia"));
                horario.setNombre_materia(rs.getString("materia"));
                horario.setId_usuario(rs.getInt("id_usuario"));
                list.add(horario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }*/
    public boolean updateHorario(Horario horario){
        boolean flag = false;
        String query = "update horario set hora_inicio = ?, hora_fin = ?, dia = ?, id_materia = ? where id_horario = ?;";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setTime(1, horario.getHora_inicio());
            ps.setTime(2, horario.getHora_fin());
            ps.setDate(3, horario.getDia());
            ps.setInt(4, horario.getMateria());
            ps.setInt(5, horario.getId_horario());
            if (ps.executeUpdate()>0){
                flag = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }
}
