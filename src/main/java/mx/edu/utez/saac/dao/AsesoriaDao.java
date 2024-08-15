package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.Asesoria;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class AsesoriaDao {
    public ArrayList<Asesoria> getAsesorias(){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "select * from asesoria;";
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
    public ArrayList<Asesoria> getAsesoriasByUsuario(int idUsuario){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "{CALL getAsesoriasByUsuario(?)};";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            CallableStatement cs = con.prepareCall(query);
            cs.setInt(1, idUsuario);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
                asesoria.setId_docente(rs.getInt("docente"));
                asesoria.setId_estudiante(rs.getInt("estudiante"));
                asesoria.setId_materia(rs.getInt("id_materia"));
                asesoria.setMateria(rs.getString("materia"));
                asesoria.setId_carrera(rs.getInt("id_carrera"));
                asesoria.setId_division(rs.getInt("id_division"));
                asesoria.setId_horario(rs.getInt("horario"));
                asesoria.setId_aula(rs.getInt("id_aula"));
                asesoria.setAula(rs.getString("aula"));
                asesoria.setId_edificio(rs.getInt("id_edificio"));
                asesoria.setEdificio(rs.getString("edificio"));
                asesoria.setId_status_asesoria(rs.getInt("id_status_asesoria"));
                asesoria.setStatus(rs.getString("status"));
                asesoria.setHora_inicio(rs.getTime("hora_inicio"));
                asesoria.setHora_fin(rs.getTime("hora_fin"));
                asesoria.setDia(rs.getDate("dia"));
                asesoria.setNombre_docente(rs.getString("nombre_docente"));
                lista.add(asesoria);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    public boolean solicitar(Asesoria a){
        boolean flag = false;
        String queryCheck = "select * from asesoria where horario = ?;";
        String queryInsert = "insert into asesoria(docente,estudiante,id_materia,horario,id_aula,id_status_asesoria,dudas,hora_inicio,hora_fin,dia) values(?,?,?,?,?,?,?,?,?,?);";
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
                psInsert.setInt(5,a.getId_aula());
                psInsert.setInt(6, 2);
                psInsert.setString(7, a.getDudas());
                psInsert.setTime(8, a.getHora_inicio());
                psInsert.setTime(9, a.getHora_fin());
                psInsert.setDate(10, a.getDia());
                if (psInsert.executeUpdate() > 0) {
                    flag = true;
                }

                psInsert.close();
            } else {
                System.out.println("La asesoria ya fue agendada");
            }
            rsCheck.close();
            psCheck.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }
    public boolean actualizarEstadoAsesorias() {
        boolean flag = false;
        String selectSql = "SELECT id_asesoria, hora_inicio, hora_fin, dia FROM asesoria";
        String updateSql = "UPDATE asesoria SET id_status_asesoria = ? WHERE id_asesoria = ?";

        try (
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement selectStmt = con.prepareStatement(selectSql);
                ResultSet rs = selectStmt.executeQuery();
                PreparedStatement updateStmt = con.prepareStatement(updateSql)) {

            LocalDateTime now = LocalDateTime.now();

            while (rs.next()) {
                int idAsesoria = rs.getInt("id_asesoria");
                LocalDateTime horaInicio = rs.getTimestamp("hora_inicio").toLocalDateTime();
                LocalDateTime horaFin = rs.getTimestamp("hora_fin").toLocalDateTime();
                LocalDateTime dia = rs.getDate("dia").toLocalDate().atStartOfDay();

                int estado;
                if (dia.isAfter(now.toLocalDate().atStartOfDay())) {
                    // Pendiente
                    estado = 2;
                } else if (horaFin.isBefore(now)) {
                    // Finalizada
                    estado = 4;
                } else if (horaInicio.isBefore(now) && horaFin.isAfter(now)) {
                    // En curso
                    estado = 1;
                } else {
                    // Cancelada
                    estado = 3;
                }

                updateStmt.setInt(1, estado);
                updateStmt.setInt(2, idAsesoria);
                updateStmt.addBatch();
                flag = true; // Marca que se ha realizado al menos una actualización
            }

            updateStmt.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flag;
    }

    public boolean iniciarAsesoria(int id){
        boolean flag = false;
        String query = "UPDATE asesoria set id_status_asesoria = 1 WHERE id_asesoria = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }
            ps.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public boolean cancelarAsesoria(int id){
        boolean flag = false;
        String query = "UPDATE asesoria set id_status_asesoria = 3 WHERE id_asesoria = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public boolean finalizarAsesoria(int id){
        boolean flag = false;
        String query = "UPDATE asesoria set id_status_asesoria = 4 WHERE id_asesoria = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    public ArrayList<Asesoria> getPendientes(){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "{CALL GetAsesoriasPendientes()}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
                asesoria.setId_docente(rs.getInt("docente"));
                asesoria.setId_estudiante(rs.getInt("estudiante"));
                asesoria.setId_materia(rs.getInt("id_materia"));
                asesoria.setMateria(rs.getString("materia"));
                asesoria.setId_carrera(rs.getInt("id_carrera"));
                asesoria.setId_division(rs.getInt("id_division"));
                asesoria.setId_horario(rs.getInt("horario"));
                asesoria.setId_aula(rs.getInt("id_aula"));
                asesoria.setAula(rs.getString("aula"));
                asesoria.setId_edificio(rs.getInt("id_edificio"));
                asesoria.setEdificio(rs.getString("edificio"));
                asesoria.setId_status_asesoria(rs.getInt("id_status_asesoria"));
                asesoria.setStatus(rs.getString("status"));
                asesoria.setHora_inicio(rs.getTime("hora_inicio"));
                asesoria.setHora_fin(rs.getTime("hora_fin"));
                asesoria.setDia(rs.getDate("dia"));
                asesoria.setNombre_docente(rs.getString("nombre_docente"));
                lista.add(asesoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ArrayList<Asesoria> getEnCurso(){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "{CALL GetAsesoriasEnCurso()}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
                asesoria.setId_docente(rs.getInt("docente"));
                asesoria.setId_estudiante(rs.getInt("estudiante"));
                asesoria.setId_materia(rs.getInt("id_materia"));
                asesoria.setMateria(rs.getString("materia"));
                asesoria.setId_carrera(rs.getInt("id_carrera"));
                asesoria.setId_division(rs.getInt("id_division"));
                asesoria.setId_horario(rs.getInt("horario"));
                asesoria.setId_aula(rs.getInt("id_aula"));
                asesoria.setAula(rs.getString("aula"));
                asesoria.setId_edificio(rs.getInt("id_edificio"));
                asesoria.setEdificio(rs.getString("edificio"));
                asesoria.setId_status_asesoria(rs.getInt("id_status_asesoria"));
                asesoria.setStatus(rs.getString("status"));
                asesoria.setHora_inicio(rs.getTime("hora_inicio"));
                asesoria.setHora_fin(rs.getTime("hora_fin"));
                asesoria.setDia(rs.getDate("dia"));
                asesoria.setNombre_docente(rs.getString("nombre_docente"));
                lista.add(asesoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public ArrayList<Asesoria> getFinalizadas(){
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "{CALL GetAsesoriasFinalizadas()}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
                asesoria.setId_docente(rs.getInt("docente"));
                asesoria.setId_estudiante(rs.getInt("estudiante"));
                asesoria.setId_materia(rs.getInt("id_materia"));
                asesoria.setMateria(rs.getString("materia"));
                asesoria.setId_carrera(rs.getInt("id_carrera"));
                asesoria.setId_division(rs.getInt("id_division"));
                asesoria.setId_horario(rs.getInt("horario"));
                asesoria.setId_aula(rs.getInt("id_aula"));
                asesoria.setAula(rs.getString("aula"));
                asesoria.setId_edificio(rs.getInt("id_edificio"));
                asesoria.setEdificio(rs.getString("edificio"));
                asesoria.setId_status_asesoria(rs.getInt("id_status_asesoria"));
                asesoria.setStatus(rs.getString("status"));
                asesoria.setHora_inicio(rs.getTime("hora_inicio"));
                asesoria.setHora_fin(rs.getTime("hora_fin"));
                asesoria.setDia(rs.getDate("dia"));
                asesoria.setNombre_docente(rs.getString("nombre_docente"));
                lista.add(asesoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public ArrayList<Asesoria> GetAsesoriasSinEvaluar(int idUsuario) {
        ArrayList<Asesoria> lista = new ArrayList<>();
        String query = "{CALL GetAsesoriasSinEvaluar(?)}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            CallableStatement cs = con.prepareCall(query);
            cs.setInt(1, idUsuario);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                Asesoria asesoria = new Asesoria();
                asesoria.setId_asesoria(rs.getInt("id_asesoria"));
                asesoria.setId_docente(rs.getInt("docente"));
                asesoria.setId_estudiante(rs.getInt("estudiante"));
                asesoria.setId_materia(rs.getInt("id_materia"));
                asesoria.setMateria(rs.getString("materia"));
                asesoria.setId_carrera(rs.getInt("id_carrera"));
                asesoria.setId_division(rs.getInt("id_division"));
                asesoria.setId_horario(rs.getInt("horario"));
                asesoria.setId_aula(rs.getInt("id_aula"));
                asesoria.setAula(rs.getString("aula"));
                asesoria.setId_edificio(rs.getInt("id_edificio"));
                asesoria.setEdificio(rs.getString("edificio"));
                asesoria.setId_status_asesoria(rs.getInt("id_status_asesoria"));
                asesoria.setStatus(rs.getString("status"));
                asesoria.setHora_inicio(rs.getTime("hora_inicio"));
                asesoria.setHora_fin(rs.getTime("hora_fin"));
                asesoria.setDia(rs.getDate("dia"));
                asesoria.setNombre_docente(rs.getString("nombre_docente"));
                lista.add(asesoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
