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

@WebServlet(name = "GetAsesorias", value = "/getAsesorias")
public class GetAsesorias extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("user");

        AulaDao aulaDao = new AulaDao();
        ArrayList<Aula> aulas = aulaDao.getAula();
        req.setAttribute("aulas", aulas);
        System.out.println("aulas "+aulas.size());

        DivisionDao divisionDao = new DivisionDao();
        ArrayList<Division> divisiones = divisionDao.getAll();
        req.setAttribute("divisiones", divisiones);

        CarreraDao carreraDao = new CarreraDao();
        ArrayList<Carrera> carreras = carreraDao.getAll();
        req.setAttribute("carreras", carreras);

        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();
        req.setAttribute("materias", materias);
        System.out.println("materias "+materias.size());

        if (user != null) {
            int idUsuario = user.getId();
            System.out.println(idUsuario);
            AsesoriaDao asesoriaDao = new AsesoriaDao();
            ArrayList<Asesoria> asesorias = asesoriaDao.getAsesoriasByUsuario(idUsuario);
            req.setAttribute("asesorias",asesorias);

            // Obtener el parámetro que determina el JSP a despachar
            String jspDestino = req.getParameter("jsp");

            if ("calEstudiante".equals(jspDestino)) {
                req.getRequestDispatcher("estudiante/visualizarCalEst.jsp").forward(req, resp);
            } else if ("calDocente".equals(jspDestino)) {
                req.getRequestDispatcher("docente/calendarioDocente.jsp").forward(req, resp);
            }

        } else {
            resp.sendRedirect("../accesoDenegado.jsp");
        }
    }
}
