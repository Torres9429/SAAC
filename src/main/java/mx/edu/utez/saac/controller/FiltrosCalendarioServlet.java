package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Materia;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "FiltrosCalendarioServlet",value ="/filtrosCal" )
public class FiltrosCalendarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Materia> lista = new ArrayList<>();

        MateriaDao dao = new MateriaDao();
        lista = dao.getAll();

        session.setAttribute("materia",lista);
        resp.sendRedirect("docente/calendarioDocente.jsp");
    }
}
