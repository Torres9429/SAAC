package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletConfig;
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
    Usuario usr;
    UsuarioDao dao;
    @Override
    public void init(ServletConfig config) throws ServletException {
        usr = new Usuario();
        dao = new UsuarioDao();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Conseguir la info del formulario, donde los inputs se llamen así:
        String correo = req.getParameter("correo");
        String contrasena = req.getParameter("contrasena");
        HttpSession session = req.getSession(false);

        // si el usuario esta vacío
        usr = dao.getOne(correo, contrasena);

        System.out.println("ID " + usr.getId());
        System.out.println("Nombre " + usr.getNombre());
        System.out.println("Tipo " + usr.getId_tipo_usuario());

        if (usr == null || !usr.isEstado()) {
            // es porque no existe en la bd
            System.out.println("El usuario " + correo + " no existe en la base de datos");
            session = req.getSession();
            session.setAttribute("mensaje", "El usuario no está registrado");
            resp.sendRedirect("index.jsp");

        } else {
            // si existe en la bd
            System.out.println("El usuario " + correo + " si esta en la base de datos");
            session = req.getSession();
            session.setAttribute("user", usr); // manda la sesion con el valor user al jsp
            req.setAttribute("user", usr); // manda la sesion con el valor user al jsp

            if (usr.getId_tipo_usuario() == 1) {
                resp.sendRedirect("administrador/bienvenidaAdmin.jsp");
            } else if (usr.getId_tipo_usuario() == 2) {
                resp.sendRedirect("docente/bienvenidaDocente.jsp"); // de momento se puso a estudiante porque no encontre la de docente
            } else if (usr.getId_tipo_usuario() == 3) {
                resp.sendRedirect("estudiante/bienvenida.jsp");
            } else {
                resp.sendRedirect("index.jsp");
            }

        }
    }

    @Override
    public void destroy() {
    }
}
