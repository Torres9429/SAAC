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

@WebServlet(name = "ModificarMateria", value = "/modificarMateria")
public class ModificarMateria extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mensaje;
        Materia materia = new Materia();
        materia.setId_materia(Integer.parseInt(req.getParameter("idMateria")));
        materia.setMateria(req.getParameter("materia"));
        materia.setId_carrera(Integer.parseInt(req.getParameter("carrera")));

        MateriaDao dao = new MateriaDao();

        if (dao.modificar(materia)){
            mensaje = "Materia modificada con éxito";
            System.out.println("exito");
        }else {
            mensaje = "Ha ocurrido un error, por favor, inténtelo más tarde";
            System.out.println("error");
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);
        resp.sendRedirect("administrador/modificarMateria.jsp");
    }
}
