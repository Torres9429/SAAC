package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;
import mx.edu.utez.saac.model.Asesoria;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet(name = "SolicitarAsesoriaServlet", value = "/solicitarAsesoria")
public class SolicitarAsesoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mensaje;
        Asesoria asesoria = new Asesoria();
        asesoria.setId_docente(Integer.parseInt(req.getParameter("docenteId")));
        asesoria.setId_estudiante(Integer.parseInt(req.getParameter("idUsuario")));
        asesoria.setId_materia(Integer.parseInt(req.getParameter("idMateria")));
        asesoria.setId_horario(Integer.parseInt(req.getParameter("horarioId")));
        asesoria.setId_lugar(Integer.parseInt(req.getParameter("aulaId")));
        asesoria.setDudas(req.getParameter("dudas"));
        asesoria.setHora_inicio(Time.valueOf(req.getParameter("horaInicio")));
        asesoria.setHora_fin(Time.valueOf(req.getParameter("horaFin")));
        asesoria.setDia(Date.valueOf(req.getParameter("dia")));

        AsesoriaDao dao = new AsesoriaDao();
        if (dao.solicitar(asesoria)){
            mensaje = "Asesoria agendada con éxito";
            System.out.println("exito");
        }else {
            mensaje = "Error al agendar la asesoría, puede que la asesoria ya haya sido agendada";
            System.out.println("error");
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        resp.sendRedirect("getMaterias?jsp=agendarEstudiante");
    }
}
