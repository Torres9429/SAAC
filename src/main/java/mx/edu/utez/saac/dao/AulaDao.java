package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Aula;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AulaDao {
    public ArrayList<Aula> getAula(){
        ArrayList<Aula> lista = new ArrayList<>();
        String query = "{CALL getLugar}";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Aula aula = new Aula();
                aula.setId_aula(rs.getInt("id_aula"));
                aula.setAula(rs.getString("aula"));
                aula.setId_edificio(rs.getInt("id_edificio"));
                aula.setEdificio(rs.getString("edificio"));
                lista.add(aula);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

}
