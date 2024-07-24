package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Carrera;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarreraDao {
    public ArrayList<Carrera> getAll(){
        ArrayList<Carrera> list = new ArrayList<>();
        String query = "select * from carrera;";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Carrera carrera = new Carrera();
                carrera.setId_carrera(rs.getInt("id_carrera"));
                carrera.setCarrera(rs.getString("carrera"));
                carrera.setId_division(rs.getInt("id_division"));
                list.add(carrera);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Carrera> getCarrerasByDivision(int divisionId) {
        List<Carrera> carreras = new ArrayList<>();
        String sql = "SELECT id_carrera, carrera FROM carrera WHERE id_division = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, divisionId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setId_carrera(rs.getInt("id_carrera"));
                carrera.setCarrera(rs.getString("carrera"));
                carreras.add(carrera);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carreras;
    }
}
