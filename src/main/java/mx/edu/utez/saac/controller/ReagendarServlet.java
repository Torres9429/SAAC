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
import java.util.ArrayList;

@WebServlet(name = "ReagendarServlet", value = "/reagendar")
public class ReagendarServlet extends HttpServlet {
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
            ArrayList<Horario> horarios = dao.getHorariosByMateria(idUsuario);
            req.setAttribute("horarios", horarios);
            // Obtener el parámetro que determina el JSP a despachar
            String jspDestino = req.getParameter("jsp");

            // Determinar el JSP a despachar
            if ("est".equals(jspDestino)) {
                req.getRequestDispatcher("estudiante/reagendar.jsp").forward(req, resp);
            } else if ("doc".equals(jspDestino)) {
                req.getRequestDispatcher("docente/reagendarAsesoria.jsp").forward(req, resp);
            }

        } else {
            resp.sendRedirect("../accesoDenegado.jsp");
        }
    }
}
