package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.HorarioDao;
import mx.edu.utez.saac.dao.MateriaDao;
import mx.edu.utez.saac.model.Materia;

import java.io.IOException;

@WebServlet(name = "AgregarMateriaServlet", value = "/agregarMateria")
public class AgregarMateriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mensaje;
        Materia materia = new Materia();
        materia.setMateria(req.getParameter("materia"));
        materia.setId_carrera(Integer.parseInt(req.getParameter("selectCarrera")));

        MateriaDao dao = new MateriaDao();

        if (dao.insert(materia)){
            mensaje = "Materia agregada con éxito";
            System.out.println("exito");
        }else {
            mensaje = "Ha ocurrido un error, por favor, inténtelo más tarde";
            System.out.println("error");
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);
        resp.sendRedirect("administrador/agregarMateria.jsp");


        /* Verificación básica
        materia.getIdMaestro();
        if ((materia.getMateria() == null) || materia.getMateria().isEmpty() || (materia.getDivision() == null) || materia.getDivision().isEmpty() || (materia.getArea() == null) || materia.getArea().isEmpty() || (materia.getDescripcion() == null) || materia.getDescripcion().isEmpty()) {

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
        }*/
    }
}
