package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.CarreraDao;
import mx.edu.utez.saac.model.Carrera;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ObtenerCarrerasServlet", value = "/getCarreras")
public class ObtenerCarrerasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        ArrayList<Carrera> list = new ArrayList<>();

        CarreraDao dao = new CarreraDao();
        list = dao.getAll();

        session.setAttribute("carreras",list);
        resp.sendRedirect("registrarUsuario.jsp");
    }
}
