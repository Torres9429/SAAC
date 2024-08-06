package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.AsesoriaDao;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
@WebServlet(name = "AsesoriaUpdater", value = "/updateStatus")
public class AsesoriaUpdater extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AsesoriaDao asesoriaDao = new AsesoriaDao();
        boolean result = asesoriaDao.actualizarEstadoAsesorias();

        if (result) {
            resp.getWriter().write("Estados de las asesorías actualizados correctamente.");
        } else {
            resp.getWriter().write("No se actualizaron los estados.");
        }
    }


}

