package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Division;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DivisionDao {
    public ArrayList<Division> getAll(){
        ArrayList<Division> lista = new ArrayList<>();
        String query = "select * from division_academica;";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Division div = new Division();
                div.setId_division(rs.getInt("id_division"));
                div.setDivision_academica(rs.getString("division_academica"));
                lista.add(div);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
