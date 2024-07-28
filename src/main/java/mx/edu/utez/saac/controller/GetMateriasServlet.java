package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.dao.DivisionDao;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetMateriasServlet", value = "/getMaterias")
public class GetMateriasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Carga inicial de la página
        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();
        req.setAttribute("materias", materias);

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

        /*/ Obtener el parámetro de redirección
        String page = req.getParameter("page");

        if ("agregarAsesoria".equals(page) && user.getId_tipo_usuario() == 2) { // Docente
            req.getRequestDispatcher("docente/agregarAsesoria.jsp").forward(req, resp);
        } else if ("agendarAsesoria".equals(page) && user.getId_tipo_usuario() == 3) { // Estudiante
            req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
        }else if("modificarAsesoria".equals(page) && user.getId_tipo_usuario() == 2){
            req.getRequestDispatcher("docente/modificarAsesoria.jsp").forward(req, resp);
        } else {
            // Enviar un error si la página no está especificada o el tipo de usuario no coincide
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Página no especificada o acceso denegado.");
        }*/
    }
}
