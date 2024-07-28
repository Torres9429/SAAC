package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.model.Carrera;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetCarrerasEstServlet", value = "/getCarreras")
public class GetCarrerasEstServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarreraDao carreraDao = new CarreraDao();
        ArrayList<Carrera> carreras = carreraDao.getAll();
        req.setAttribute("carreras", carreras);

        // Obtener el parámetro de redirección
        String page = req.getParameter("page");
        if ("registrar".equals(page)) {
            req.getRequestDispatcher("registrarUsuario.jsp").forward(req, resp);
        } else if ("agendar".equals(page)) {
            req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
        } else if ("agregar".equals(page)) {
            req.getRequestDispatcher("administrador/agregarUsuario.jsp").forward(req, resp);
        }else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Página no especificada o desconocida.");
        }
    }
}
