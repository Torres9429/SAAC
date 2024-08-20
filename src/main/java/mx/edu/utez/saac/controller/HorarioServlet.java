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
        LocalDateTime fechaActual = LocalDateTime.now();

        // Convertir la fecha recibida a LocalDateTime
        Date fechaDia = Date.valueOf(req.getParameter("dia"));
        LocalDateTime fechaRecibida = fechaDia.toLocalDate().atTime(Time.valueOf(horaInicioStr).toLocalTime());

        // Validar si la fecha recibida es anterior a la fecha actual
        if (fechaRecibida.isBefore(fechaActual)) {
            mensaje = "No se puede agregar un horario con una fecha anterior a la actual.";
            System.out.println("Error: Fecha anterior a la actual");
        } else {
            horario.setHora_inicio(Time.valueOf(horaInicioStr));
            horario.setHora_fin(Time.valueOf(horaFinStr));
            horario.setDia(fechaDia);
            horario.setMateria(Integer.parseInt(req.getParameter("materia")));
            horario.setId_usuario(Integer.parseInt(req.getParameter("id_usuario")));
            horario.setId_aula(Integer.parseInt(req.getParameter("aula")));

            HorarioDao dao = new HorarioDao();
            if (dao.guardarHorario(horario)){
                mensaje = "Horario agregado con éxito";
                System.out.println("exito");
            } else {
                mensaje = "Ha ocurrido un error, por favor, inténtelo más tarde";
                System.out.println("error");
            }
        }

        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        resp.sendRedirect("docente/agregarAsesoria.jsp");
    }


}
