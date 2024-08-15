package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.EvaluacionDao;
import mx.edu.utez.saac.model.Evaluacion;

import java.io.IOException;

@WebServlet(name = "CalificarAsesoriaServlet", value = "/calificar")
public class CalificarAsesoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mensaje;
        Evaluacion evaluacion = new Evaluacion();
        evaluacion.setComentarios(req.getParameter("comentarios"));
        evaluacion.setId_calificacion(Integer.parseInt(req.getParameter("calificacion")));
        evaluacion.setId_estudiante(Integer.parseInt(req.getParameter("estudiante")));
        evaluacion.setId_docente(Integer.parseInt(req.getParameter("docente")));
        evaluacion.setId_asesoria(Integer.parseInt(req.getParameter("id_asesoria")));

        String page = req.getParameter("page");

        EvaluacionDao evaluacionDao = new EvaluacionDao();
        if (evaluacionDao.calificar(evaluacion)) {
            if ("docente".equals(page)) {
                HttpSession session = req.getSession();
                session.setAttribute("mensaje","Calificación registrada exitosamente");
                req.getRequestDispatcher("docente/calificarAsesoriaD.jsp").forward(req, resp);
            } else if ("estudiante".equals(page)) {
                HttpSession session = req.getSession();
                session.setAttribute("mensaje","Calificación registrada exitosamente");
                req.getRequestDispatcher("estudiante/calificarAsesoriaE.jsp").forward(req, resp);
            }
        }else {
            if ("docente".equals(page)) {
                HttpSession session = req.getSession();
                session.setAttribute("mensaje","Ocurrió un error al registrar la calificación, intente de nuevo");
                req.getRequestDispatcher("docente/calificarAsesoriaD.jsp").forward(req, resp);
            } else if ("estudiante".equals(page)) {
                HttpSession session = req.getSession();
                session.setAttribute("mensaje","Ocurrió un error al registrar la calificación, intente de nuevo");
                req.getRequestDispatcher("estudiante/calificarAsesoriaE.jsp").forward(req, resp);
            }
        }

    }
}
