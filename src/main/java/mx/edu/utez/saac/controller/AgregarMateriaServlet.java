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

@WebServlet(name = "AgregarMateriaServlet", value = "/agregarMateria")
public class AgregarMateriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Materia materia = new Materia();
        materia.setNombre(req.getParameter("materia"));
        materia.setDivision(req.getParameter("division"));
        materia.setArea(req.getParameter("area"));
        materia.setDescripcion(req.getParameter("descripcion"));
        materia.setIdMaestro(Integer.parseInt(req.getParameter("id_maestro")));
        materia.setId_carrera(Integer.parseInt(req.getParameter("id_carrera")));

        // Verificación básica
        materia.getIdMaestro();
        if ((materia.getNombre() == null) || materia.getNombre().isEmpty() || (materia.getDivision() == null) || materia.getDivision().isEmpty() || (materia.getArea() == null) || materia.getArea().isEmpty() || (materia.getDescripcion() == null) || materia.getDescripcion().isEmpty()) {

            HttpSession session = req.getSession();
            session.setAttribute("mensajeError", "La materia no se ha guardado correctamente. Por favor intente más tarde o verifique los datos.");
            resp.sendRedirect("agregarMateria.jsp");
            return;
        }

        // Se debe mandar a llamar un DAO que permita insertar
        MateriaDao dao = new MateriaDao();
        if (dao.insert(materia)) {
            // Redirigir a una página de éxito o al índice
            resp.sendRedirect("index.jsp");
        } else {
            // La info no se insertó y regresa al formulario
            HttpSession session = req.getSession();
            session.setAttribute("mensajeError", "Puede que la materia ya esté registrada.");
            resp.sendRedirect("agregarMateria.jsp");
        }
    }
}
