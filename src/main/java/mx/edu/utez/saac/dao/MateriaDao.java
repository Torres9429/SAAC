package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Materia;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MateriaDao {
    public ArrayList<Materia> getAll(){
        ArrayList<Materia> lista = new ArrayList<>();
        String query = "select * from materia;";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Materia materia = new Materia();
                materia.setId_materia(rs.getInt("id_materia"));
                materia.setMateria(rs.getString("materia"));
                materia.setId_carrera(rs.getInt("id_carrera"));
                lista.add(materia);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public static List<Materia> getMateriasByCarrera(int carreraId) {
        List<Materia> materias = new ArrayList<>();
        String sql = "SELECT id_materia, materia FROM materia WHERE id_carrera = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, carreraId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Materia materia = new Materia();
                materia.setId_materia(rs.getInt("id_materia"));
                materia.setMateria(rs.getString("materia"));
                materias.add(materia);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return materias;
    }

    public boolean insert(Materia materia) {
        return false;
    }
}
