package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.*;
import mx.edu.utez.saac.model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetMateriasServlet", value = "/getMaterias")
public class GetMateriasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Carga inicial de la página

        Usuario usuario = new Usuario();
        int id = usuario.getId();

        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();
        req.setAttribute("materias", materias);

        AulaDao aulaDao = new AulaDao();
        ArrayList<Aula> aulas = aulaDao.getAula();
        req.setAttribute("aulas", aulas);
        System.out.println("aulas"+aulas.size());

        MateriaDao mdao = new MateriaDao();
        mdao.getMateriaByUsuario(id);

        DivisionDao divisionDao = new DivisionDao();
        ArrayList<Division> divisiones = divisionDao.getAll();
        req.setAttribute("divisiones", divisiones);

        CarreraDao carreraDao = new CarreraDao();
        ArrayList<Carrera> carreras = carreraDao.getAll();
        req.setAttribute("carreras", carreras);

        HorarioDao horarioDao = new HorarioDao();
        ArrayList<Horario> horarios = horarioDao.getAll();
        req.setAttribute("horarios", horarios);
        System.out.println("horarios:"+horarios.size());
        // Obtener el parámetro que determina el JSP a despachar
        String jspDestino = req.getParameter("jsp");

        // Determinar el JSP a despachar
        if ("agendarEstudiante".equals(jspDestino)) {
            req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
        } else if ("agregarDocente".equals(jspDestino)) {
            req.getRequestDispatcher("docente/agregarAsesoria.jsp").forward(req, resp);
        }


    }
}
