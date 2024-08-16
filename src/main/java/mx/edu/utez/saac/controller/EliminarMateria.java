package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.MateriaDao;

import java.io.IOException;

@WebServlet(name = "EliminarMateria", value = "/eliminarMateria")
public class EliminarMateria extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idMateria = Integer.parseInt(request.getParameter("id_materia"));
        MateriaDao dao = new MateriaDao();

        //boolean eliminado = dao.delete(idMateria);

        if (dao.delete(idMateria)) {
            // Redireccionar o enviar mensaje de éxito
            response.sendRedirect("administrador/eliminarMateria.jsp");
        } else {
            // Manejar el error
            response.sendRedirect("error.jsp");
        }
    }
}
