package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.AulaDao;
import mx.edu.utez.saac.dao.DivisionDao;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetDatosCalendar", value = "/getData")
public class GetDatosCalendar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario usuario = new Usuario();
        int id = usuario.getId();

        MateriaDao materiaDao1 = new MateriaDao();
        ArrayList<Materia> materias = materiaDao1.getAll();
        req.setAttribute("materias", materias);

//        MateriaDao materiaDao = new MateriaDao();
//        materiaDao.getMateriaByUsuario(id);

        HorarioDao horarioDao = new HorarioDao();
        ArrayList<Horario> horarios = horarioDao.getAll();
        req.setAttribute("horarios", horarios);

        AulaDao aulaDao = new AulaDao();
        ArrayList<Aula> aulas = aulaDao.getAula();
        req.setAttribute("aulas", aulas);
        System.out.println("aulas"+aulas.size());

        DivisionDao divisionDao = new DivisionDao();
        ArrayList<Division> divisiones = divisionDao.getAll();
        req.setAttribute("divisiones", divisiones);

        CarreraDao carreraDao = new CarreraDao();
        ArrayList<Carrera> carreras = carreraDao.getAll();
        req.setAttribute("carreras", carreras);

        String jspDestino = req.getParameter("jsp");

        // Determinar el JSP a despachar
        if ("agendarEstudiante".equals(jspDestino)) {
            req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
        } else if ("agregarDocente".equals(jspDestino)) {
            req.getRequestDispatcher("docente/agregarAsesoria.jsp").forward(req, resp);
        }
    }
}
