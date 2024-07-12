package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;

@WebServlet(name = "usuarioServlet", value = "/login")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Conseguir la info del formulario, donde los inputs se llamen así:
        String correo = req.getParameter("correo");
        String contrasena = req.getParameter("contrasena");
        UsuarioDao dao = new UsuarioDao();

        // si el usuario esta vacío
        Usuario usr;
        usr = dao.getOne(correo,contrasena);
        System.out.println(usr);
        if (usr == null || !usr.isEstado()) {
            // es porque no existe en la bd
            System.out.println("El usuario " + correo + " no existe en la base de datos");
            HttpSession session = req.getSession();
            session.setAttribute("mensaje", "El usuario no existe en la DB");
            resp.sendRedirect("index.jsp");

        }else{
            // si existe en la bd
            System.out.println("El usuario " + correo + " si esta en la base de datos");
            resp.sendRedirect("estudiante/bienvenida.jsp");
        }

    }

    @Override
    public void destroy() {
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
