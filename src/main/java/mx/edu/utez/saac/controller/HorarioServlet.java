package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.model.Horario;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.DayOfWeek;
import java.util.ArrayList;

@WebServlet(name = "HorarioServlet", value = "/horarioDoc")
public class HorarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Horario horario = new Horario();
        String mensaje;

        String horaInicioStr = req.getParameter("hora-inicio") + ":00";
        String horaFinStr = req.getParameter("hora-fin") + ":00";

        horario.setHora_inicio(Time.valueOf(horaInicioStr));
        horario.setHora_fin(Time.valueOf(horaFinStr));
        horario.setDia(Date.valueOf(req.getParameter("dia")));
        horario.setMateria(Integer.parseInt(req.getParameter("materia")));
        horario.setId_usuario(Integer.parseInt(req.getParameter("id_usuario")));

        HorarioDao dao = new HorarioDao();
        if (dao.guardarHorario(horario)){
            mensaje = "Horario agregado con éxito";
            System.out.println("exito");
        }else {
            mensaje = "Ha ocurrido un error, por favor, inténtelo más tarde";
            System.out.println("error");
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        resp.sendRedirect("docente/agregarAsesoria.jsp");
    }

}
