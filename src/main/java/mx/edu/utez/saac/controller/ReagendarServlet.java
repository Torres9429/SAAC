package mx.edu.utez.saac.controller;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;
import mx.edu.utez.saac.dao.AulaDao;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Aula;
import mx.edu.utez.saac.model.Horario;
import mx.edu.utez.saac.model.Materia;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@WebServlet(name = "ReagendarServlet", value = "/reagendar")
public class ReagendarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //int idMateria = Integer.parseInt(request.getParameter("idMateria"));
        String idMateriaParam = request.getParameter("idMateria");


        if (idMateriaParam == null || idMateriaParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de materia no proporcionado");
            return;
        }

        int idMateria;
        try {
            idMateria = Integer.parseInt(idMateriaParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de materia inválido");
            return;
        }
        HorarioDao dao = new HorarioDao();
        ArrayList<Horario> lista = dao.getHorariosByMateria(idMateria);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        String json = gson.toJson(lista);
        out.print(json);
        out.flush();
    }
//horario, horaInicio, horaFin,dia,asesoria
private static final Map<String, String> MONTHS_MAP = new HashMap<>();

    static {
        MONTHS_MAP.put("ene.", "01");
        MONTHS_MAP.put("feb.", "02");
        MONTHS_MAP.put("mar.", "03");
        MONTHS_MAP.put("abr.", "04");
        MONTHS_MAP.put("may.", "05");
        MONTHS_MAP.put("jun.", "06");
        MONTHS_MAP.put("jul.", "07");
        MONTHS_MAP.put("ago.", "08");
        MONTHS_MAP.put("sep.", "09");
        MONTHS_MAP.put("oct.", "10");
        MONTHS_MAP.put("nov.", "11");
        MONTHS_MAP.put("dic.", "12");
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int asesoria = Integer.parseInt(req.getParameter("idAsesoria"));
            int horario = Integer.parseInt(req.getParameter("horarioDisp"));

            // Normalizar la fecha: reemplazar el mes abreviado en español
            String diaStr = req.getParameter("diaR");
            for (Map.Entry<String, String> entry : MONTHS_MAP.entrySet()) {
                if (diaStr.contains(entry.getKey())) {
                    diaStr = diaStr.replace(entry.getKey(), entry.getValue());
                    break;
                }
            }

            // Parsear la fecha en formato 'MM dd, yyyy'
            SimpleDateFormat dateFormat = new SimpleDateFormat("MM dd, yyyy", Locale.ENGLISH);
            java.util.Date parsedDate = dateFormat.parse(diaStr);
            Date dia = new Date(parsedDate.getTime());

            // Parsear la hora en formato 'HH:mm'
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Time horaInicio = new Time(timeFormat.parse(req.getParameter("horaInicioR")).getTime());
            Time horaFin = new Time(timeFormat.parse(req.getParameter("horaFinR")).getTime());

            AsesoriaDao dao = new AsesoriaDao();
            String mensaje;
            if (dao.reagendarAsesoria(horario, horaInicio, horaFin,dia,asesoria)) {
                mensaje = "Asesoría reagendada con éxito.";
            } else {
                mensaje = "Error al reagendar la asesoría, por favor inténtelo de nuevo.";
            }
            req.getSession().setAttribute("mensaje", mensaje);

            resp.setStatus(HttpServletResponse.SC_OK);
        } catch (ParseException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

}
