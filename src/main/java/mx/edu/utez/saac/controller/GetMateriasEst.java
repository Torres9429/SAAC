package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Materia;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetMateriasEst",value ="/getMateriasEst" )
public class GetMateriasEst extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MateriaDao materiaDao = new MateriaDao();
        ArrayList<Materia> materias = materiaDao.getAll();
        System.out.println("Materias: " + materias);

        req.setAttribute("materias", materias);
        req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);
    }
}
