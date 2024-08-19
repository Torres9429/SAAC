package mx.edu.utez.saac.dao;

import mx.edu.utez.saac.model.CalificacionDTO;
import mx.edu.utez.saac.model.Evaluacion;
import mx.edu.utez.saac.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;

public class EvaluacionDao {
    public boolean calificar(Evaluacion ev){
        boolean flag = false;
        String query = "insert into calificacionesev(comentarios, id_calificacion, id_usuario, id_asesoria) values(?,?,?,?)";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, ev.getComentarios());
            ps.setInt(2, ev.getId_calificacion());
            ps.setInt(3, ev.getId_estudiante());
            ps.setInt(4, ev.getId_asesoria());
            if (ps.executeUpdate() > 0) {
                flag = true;
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    //String query = "SELECT a.id_asesoria, a.horario, a.hora_inicio, a.hora_fin, a.dia, a.id_materia, m.materia, "
    //                + "u_docente.nombre AS nombre_docente, u_docente.apellido_paterno AS apellido_docente, "
//                + "ca_docente.descripcion AS calificacion_docente, ev_docente.comentarios AS comentarios_docente, "
//                + "u_estudiante.nombre AS nombre_estudiante, u_estudiante.apellido_paterno AS apellido_estudiante, "
//                + "ca_estudiante.descripcion AS calificacion_estudiante, ev_estudiante.comentarios AS comentarios_estudiante "
//                + "FROM asesoria a "
//                + "INNER JOIN usuario u_docente ON a.docente = u_docente.id_usuario AND u_docente.id_tipo_usuario = 2 "
//                + "LEFT JOIN evaluacion ev_docente ON a.id_asesoria = ev_docente.id_asesoria AND ev_docente.id_docente = u_docente.id_usuario "
//                + "LEFT JOIN calificacion_asesoria ca_docente ON ev_docente.id_calificacion = ca_docente.id_calificacion "
//                + "INNER JOIN usuario u_estudiante ON a.estudiante = u_estudiante.id_usuario AND u_estudiante.id_tipo_usuario = 3 "
//                + "LEFT JOIN evaluacion ev_estudiante ON a.id_asesoria = ev_estudiante.id_asesoria AND ev_estudiante.id_estudiante = u_estudiante.id_usuario "
//                + "LEFT JOIN calificacion_asesoria ca_estudiante ON ev_estudiante.id_calificacion = ca_estudiante.id_calificacion "
//                + "INNER JOIN materia m ON a.id_materia = m.id_materia";

    public ArrayList<CalificacionDTO> getCalificaciones() {
        ArrayList<CalificacionDTO> calificaciones = new ArrayList<>();

        String query = "SELECT \n" +
                "    a.id_asesoria,\n" +
                "    a.horario, \n" +
                "    a.hora_inicio, \n" +
                "    a.hora_fin, \n" +
                "    a.dia, \n" +
                "    a.id_materia, \n" +
                "    m.materia, \n" +
                "    GROUP_CONCAT(DISTINCT \n" +
                "        CONCAT(\n" +
                "            u_estudiante.nombre, ' ', u_estudiante.apellido_paterno, '<br>', \n" +
                "            'Calificación: ', COALESCE(ca_estudiante.descripcion, 'No calificado'), '<br>',\n" +
                "            'Comentarios: ', COALESCE(ev_estudiante.comentarios, 'Sin comentarios'), '<br>'\n" +
                "        )\n" +
                "        ORDER BY u_estudiante.nombre SEPARATOR ' | ') AS calificaciones_estudiante,\n" +
                "    GROUP_CONCAT(DISTINCT \n" +
                "        CONCAT(\n" +
                "            u_docente.nombre, ' ', u_docente.apellido_paterno, '<br>', \n" +
                "            'Calificación: ', COALESCE(ca_docente.descripcion, 'No calificado'), '<br>',\n" +
                "            'Comentarios: ', COALESCE(ev_docente.comentarios, 'Sin comentarios'), '<br>'\n" +
                "        )\n" +
                "        ORDER BY u_docente.nombre SEPARATOR ' | ') AS calificaciones_docente\n" +
                "FROM asesoria a\n" +
                "INNER JOIN usuario u_estudiante ON a.estudiante = u_estudiante.id_usuario\n" +
                "LEFT JOIN calificacionesev ev_estudiante ON ev_estudiante.id_asesoria = a.id_asesoria AND ev_estudiante.id_usuario = u_estudiante.id_usuario\n" +
                "LEFT JOIN calificacion_asesoria ca_estudiante ON ev_estudiante.id_calificacion = ca_estudiante.id_calificacion\n" +
                "LEFT JOIN usuario u_docente ON a.docente = u_docente.id_usuario\n" +
                "LEFT JOIN calificacionesev ev_docente ON ev_docente.id_asesoria = a.id_asesoria AND ev_docente.id_usuario = u_docente.id_usuario\n" +
                "LEFT JOIN calificacion_asesoria ca_docente ON ev_docente.id_calificacion = ca_docente.id_calificacion\n" +
                "INNER JOIN materia m ON a.id_materia = m.id_materia\n" +
                "WHERE u_estudiante.id_tipo_usuario = 3\n" +
                "GROUP BY a.id_asesoria, a.horario, a.hora_inicio, a.hora_fin, a.dia, a.id_materia, m.materia;\n";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                CalificacionDTO calificacion = new CalificacionDTO();
                calificacion.setIdAsesoria(rs.getInt("id_asesoria"));
                calificacion.setHorario(rs.getString("horario"));
                calificacion.setHoraInicio(rs.getTime("hora_inicio"));
                calificacion.setHoraFin(rs.getTime("hora_fin"));
                calificacion.setDia(rs.getDate("dia"));
                calificacion.setIdMateria(rs.getInt("id_materia"));
                calificacion.setMateria(rs.getString("materia"));
                calificacion.setCalificacionEstudiante(rs.getString("calificaciones_estudiante"));
                calificacion.setCalificacionDocente(rs.getString("calificaciones_docente"));

                calificaciones.add(calificacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return calificaciones;
    }





    /*public ArrayList<CalificacionDTO> getCalificaciones() {
        ArrayList<CalificacionDTO> calificaciones = new ArrayList<>();

        try (Connection con = DatabaseConnectionManager.getConnection()) {
            // Consulta para obtener la información básica de la asesoría
            String query1 = "SELECT a.id_asesoria, a.horario, a.hora_inicio, a.hora_fin, a.dia, a.id_materia, m.materia, "
                    + "u_docente.nombre AS nombre_docente, u_docente.apellido_paterno AS apellido_docente, "
                    + "u_estudiante.nombre AS nombre_estudiante, u_estudiante.apellido_paterno AS apellido_estudiante "
                    + "FROM asesoria a "
                    + "INNER JOIN usuario u_docente ON a.docente = u_docente.id_usuario AND u_docente.id_tipo_usuario = 2 "
                    + "INNER JOIN usuario u_estudiante ON a.estudiante = u_estudiante.id_usuario AND u_estudiante.id_tipo_usuario = 3 "
                    + "INNER JOIN materia m ON a.id_materia = m.id_materia";

            try (PreparedStatement pstmt1 = con.prepareStatement(query1);
                 ResultSet rs1 = pstmt1.executeQuery()) {

                while (rs1.next()) {
                    int idAsesoria = rs1.getInt("id_asesoria");

                    // Crear un nuevo objeto CalificacionDTO para almacenar los resultados
                    CalificacionDTO calificacion = new CalificacionDTO();
                    calificacion.setIdAsesoria(idAsesoria);
                    calificacion.setHorario(rs1.getString("horario"));
                    calificacion.setHoraInicio(rs1.getTime("hora_inicio"));
                    calificacion.setHoraFin(rs1.getTime("hora_fin"));
                    calificacion.setDia(rs1.getDate("dia"));
                    calificacion.setIdMateria(rs1.getInt("id_materia"));
                    calificacion.setMateria(rs1.getString("materia"));
                    calificacion.setNombreDocente(rs1.getString("nombre_docente") + " " + rs1.getString("apellido_docente"));
                    calificacion.setNombreEstudiante(rs1.getString("nombre_estudiante") + " " + rs1.getString("apellido_estudiante"));

                    // Consulta para calificación y comentarios del docente
                    String query2 = "SELECT ca_docente.descripcion AS calificacion_docente, ev_docente.comentarios AS comentarios_docente "
                            + "FROM evaluacion ev_docente "
                            + "INNER JOIN calificacion_asesoria ca_docente ON ev_docente.id_calificacion = ca_docente.id_calificacion "
                            + "WHERE ev_docente.id_asesoria = ? AND ev_docente.id_docente IS NOT NULL";  // Asegúrate de que se distingue entre docente y estudiante
                    try (PreparedStatement pstmt2 = con.prepareStatement(query2)) {
                        pstmt2.setInt(1, idAsesoria);
                        try (ResultSet rs2 = pstmt2.executeQuery()) {
                            if (rs2.next()) {
                                calificacion.setCalificacionDocente(rs2.getString("calificacion_docente"));
                                calificacion.setComentariosDocente(rs2.getString("comentarios_docente"));
                            }
                        }
                    }

                    // Consulta para calificación y comentarios del estudiante
                    String query3 = "SELECT ca_estudiante.descripcion AS calificacion_estudiante, ev_estudiante.comentarios AS comentarios_estudiante "
                            + "FROM evaluacion ev_estudiante "
                            + "INNER JOIN calificacion_asesoria ca_estudiante ON ev_estudiante.id_calificacion = ca_estudiante.id_calificacion "
                            + "WHERE ev_estudiante.id_asesoria = ? AND ev_estudiante.id_estudiante IS NOT NULL";  // Asegúrate de que se distingue entre estudiante y docente
                    try (PreparedStatement pstmt3 = con.prepareStatement(query3)) {
                        pstmt3.setInt(1, idAsesoria);
                        try (ResultSet rs3 = pstmt3.executeQuery()) {
                            if (rs3.next()) {
                                calificacion.setCalificacionEstudiante(rs3.getString("calificacion_estudiante"));
                                calificacion.setComentariosEstudiante(rs3.getString("comentarios_estudiante"));
                            }
                        }
                    }

                    // Añadir el objeto CalificacionDTO a la lista
                    calificaciones.add(calificacion);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return calificaciones;
    }*/
}
