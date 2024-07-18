package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Carrera;
import mx.edu.utez.saac.model.Materia;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ObtenerCarrerasServlet", value = "/getCarreras")
public class GetCarrerasEstServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarreraDao carreraDao = new CarreraDao();
        ArrayList<Carrera> carreras = carreraDao.getAll();
        req.setAttribute("carreras",  carreras);
        req.getRequestDispatcher("estudiante/agendarAsesoria.jsp").forward(req, resp);

    }
}
