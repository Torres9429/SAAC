package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Carrera;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
                list.add(carrera);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
