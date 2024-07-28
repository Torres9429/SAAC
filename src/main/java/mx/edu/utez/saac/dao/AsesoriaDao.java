package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Asesoria;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class AsesoriaDao {
    public ArrayList<Asesoria> getAsesorias(){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "select * from asesoria where hora_inicio < now();";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    public boolean agendar(Asesoria a){
        boolean flag = false;
        String queryCheck = "select * from asesoria where horario = ?;";
        String queryInsert = "insert into asesoria(docente,estudiante,materia,horario,lugar,id_status_asesoria,dudas,hora_inicio,hora_fin,dia) values(?,?,?,?,?,?,?,?,?,?);";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement psCheck = con.prepareStatement(queryCheck);
            psCheck.setInt(1, a.getId_horario());
            ResultSet rsCheck = psCheck.executeQuery();
            if (!rsCheck.next()){
                PreparedStatement psInsert = con.prepareStatement(queryInsert);
                psInsert.setInt(1,a.getId_docente());
                psInsert.setInt(2, a.getId_estudiante());
                psInsert.setInt(3, a.getId_materia());
                psInsert.setInt(4, a.getId_horario());
                psInsert.setInt(5,a.getId_lugar());
                psInsert.setInt(6, a.getId_status_asesoria());
                psInsert.setString(7, a.getDudas());
                psInsert.setTime(8, a.getHora_inicio());
                psInsert.setTime(9, a.getHora_fin());
                psInsert.setDate(10, a.getDia());
                if (psInsert.executeUpdate() > 0) {
                    flag = true;
                }

                psInsert.close();
            } else {
                System.out.println("La asesoria fue agendada");
            }
            rsCheck.close();
            psCheck.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }
}
