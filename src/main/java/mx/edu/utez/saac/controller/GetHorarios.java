package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AulaDao;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Aula;
import mx.edu.utez.saac.model.Horario;
import mx.edu.utez.saac.model.Materia;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

@WebServlet(name = "GetHorarios", value = "/getHorarios")
public class GetHorarios extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("user");

        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();
        req.setAttribute("materias", materias);

        AulaDao aulaDao = new AulaDao();
        ArrayList<Aula> aulas = aulaDao.getAula();
        req.setAttribute("aulas", aulas);

        if (user != null) {
            int idUsuario = user.getId();
            System.out.println(idUsuario);
            HorarioDao dao = new HorarioDao();
            ArrayList<Horario> horarios = dao.getHorarios(idUsuario);
            req.setAttribute("horarios", horarios);
            // Obtener el parámetro que determina el JSP a despachar
            String jspDestino = req.getParameter("jsp");

            // Determinar el JSP a despachar
            if ("modificar".equals(jspDestino)) {
                req.getRequestDispatcher("docente/modificarAsesoria.jsp").forward(req, resp);
            } else if ("consultar".equals(jspDestino)) {
                req.getRequestDispatcher("docente/consultarAsesoria.jsp").forward(req, resp);
            }

        } else {
            resp.sendRedirect("../accesoDenegado.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Horario horario = new Horario();

        /*String horaInicioStr = req.getParameter("hora-inicio") + ":00";
        String horaFinStr = req.getParameter("hora-fin") + ":00";*/
        String horaInicioStr = req.getParameter("hora-inicio");
        String horaFinStr = req.getParameter("hora-fin");

        // Convertir las horas a formato "HH:MM:SS"
        String timeFormat = "HH:mm";
        SimpleDateFormat dateFormat = new SimpleDateFormat(timeFormat);
        SimpleDateFormat sqlTimeFormat = new SimpleDateFormat("HH:mm:ss");

        // Parsear las cadenas de hora
        Time horaInicio = null;
        try {
            horaInicio = new Time(dateFormat.parse(horaInicioStr).getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        Time horaFin = null;
        try {
            horaFin = new Time(dateFormat.parse(horaFinStr).getTime());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        horario.setHora_inicio(Time.valueOf(horaInicio.toLocalTime()));
        horario.setHora_fin(Time.valueOf(horaFin.toLocalTime()));
        horario.setDia(Date.valueOf(req.getParameter("dia")));
        horario.setMateria(Integer.parseInt(req.getParameter("materia")));
        horario.setId_usuario(Integer.parseInt(req.getParameter("id_usuario")));
        horario.setId_horario(Integer.parseInt(req.getParameter("id_horario")));
        horario.setId_aula(Integer.parseInt(req.getParameter("aula")));

        HorarioDao dao = new HorarioDao();
        String mensaje;

        if (dao.updateHorario(horario)){
            mensaje = "Los cambios se han guardado con éxito";
            System.out.println("Éxito update");

        }else {
            mensaje = "Error al guardar los cambios";
            System.out.println("Error update");

        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        // Obtener la lista actualizada de horarios y materias
        ArrayList<Horario> horariosActualizados = dao.getHorarios(horario.getId_usuario());
        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();

        // Establecer las listas como atributos de la request
        req.setAttribute("horarios", horariosActualizados);
        req.setAttribute("materias", materias);
        req.getRequestDispatcher("docente/modificarAsesoria.jsp").forward(req, resp);

    }
}
