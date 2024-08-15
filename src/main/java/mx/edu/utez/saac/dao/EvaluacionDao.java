package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Evaluacion;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EvaluacionDao {
    public boolean calificar(Evaluacion ev){
        boolean flag = false;
        String query = "insert into evaluacion(comentarios, id_calificacion, id_estudiante, id_docente, id_asesoria) values(?,?,?,?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, ev.getComentarios());
            ps.setInt(2, ev.getId_calificacion());
            ps.setInt(3, ev.getId_estudiante());
            ps.setInt(4, ev.getId_docente());
            ps.setInt(5, ev.getId_asesoria());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
}
