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
        String correoLogin = req.getParameter("correoLogin");
        String passwordLogin = req.getParameter("passwordLogin");
        UsuarioDao dao = new UsuarioDao();

        // si el usuario esta vacío
        Usuario usr = dao.getOne(correoLogin,passwordLogin);
        if (usr.getCorreo() == null) {
            // es porque no existe en la bd
            System.out.println("El usuario " + correoLogin + " no existe en la base de datos");
            HttpSession session = req.getSession();
            session.setAttribute("mensaje", "El usuario no existe en la DB");
            resp.sendRedirect("registrarUsuario.html");
        }else{
            // si existe en la bd
            System.out.println("El usuario " + correoLogin + " si esta en la base de datos");
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
