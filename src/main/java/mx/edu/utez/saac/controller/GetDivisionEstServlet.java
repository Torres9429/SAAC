package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.DivisionDao;
import mx.edu.utez.saac.model.Division;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetDivisionEstServlet", value = "/getDivEst")
public class GetDivisionEstServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DivisionDao divisionDao = new DivisionDao();
        ArrayList<Division> divisiones = divisionDao.getAll();
        req.setAttribute("divisiones", divisiones);
        req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
    }
}
