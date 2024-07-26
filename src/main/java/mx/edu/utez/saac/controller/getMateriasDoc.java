package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.dao.DivisionDao;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.*;

import java.io.IOException;
import java.util.ArrayList;
@WebServlet(name = "getMateriasDoc", value = "/getMateriasDoc")
public class getMateriasDoc extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario user = (Usuario) req.getSession().getAttribute("user");
        if (user != null && user.getId_tipo_usuario() == 2) {
            MateriaDao materiaDao = new MateriaDao();
            ArrayList<Materia> materias = materiaDao.getAll();
            req.setAttribute("materias", materias); // Obtener la lista de materias

            DivisionDao divisionDao = new DivisionDao();
            ArrayList<Division> divisiones = divisionDao.getAll();
            req.setAttribute("divisiones", divisiones); //Lista de Divisiones

            CarreraDao carreraDao = new CarreraDao();
            ArrayList<Carrera> carreras = carreraDao.getAll();
            req.setAttribute("carreras", carreras); //Lista de Carreras

            HorarioDao horarioDao = new HorarioDao();
            ArrayList<Horario> horarios = horarioDao.getHorarios(user.getId()); // Obtener la lista de horarios del usuario
            req.setAttribute("horarios", horarios);
            req.getRequestDispatcher("docente/calendarioDocente.jsp").forward(req, resp);
        }
    }
}
