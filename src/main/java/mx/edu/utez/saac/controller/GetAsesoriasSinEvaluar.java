package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;
import mx.edu.utez.saac.dao.AulaDao;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.dao.DivisionDao;
import mx.edu.utez.saac.model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetAsesoriasSinEvaluar", value = "/getAsesoriasSinEvaluar")
public class GetAsesoriasSinEvaluar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario user = (Usuario) session.getAttribute("user");

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

        if (user != null) {
            int idUsuario = user.getId();
            System.out.println(idUsuario);
            AsesoriaDao asesoriaDao = new AsesoriaDao();
            ArrayList<Asesoria> asesorias = asesoriaDao.GetAsesoriasSinEvaluar(idUsuario);
            req.setAttribute("asesorias",asesorias);

            // Obtener el parámetro que determina el JSP a despachar
            String jspDestino = req.getParameter("jsp");

            if ("estudiante".equals(jspDestino)) {
                req.getRequestDispatcher("estudiante/calificarAsesoriaE.jsp").forward(req, resp);
            } else if ("docente".equals(jspDestino)) {
                req.getRequestDispatcher("docente/calificarAsesoriaD.jsp").forward(req, resp);
            }

        } else {
            resp.sendRedirect("../accesoDenegado.jsp");
        }
    }
}
