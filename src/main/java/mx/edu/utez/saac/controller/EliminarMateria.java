package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.MateriaDao;

import java.io.IOException;

@WebServlet(name = "EliminarMateria", value = "/eliminarMateria")
public class EliminarMateria extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idMateria = Integer.parseInt(request.getParameter("id_materia"));
        MateriaDao dao = new MateriaDao();
        String mensaje;
        //boolean eliminado = dao.delete(idMateria);

        if (dao.delete(idMateria)) {
            // Redireccionar o enviar mensaje de éxito
            mensaje = "Materia agregada con éxito";
            System.out.println("exito");
        } else {
            // Manejar el error
            mensaje = "Ha ocurrido un error, por favor, inténtelo más tarde";
            System.out.println("error");

        }
        HttpSession session = request.getSession();
        session.setAttribute("mensaje", mensaje);
        response.sendRedirect("administrador/eliminarMateria.jsp");
    }
}
