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

@WebServlet(name = "PerfilServlet", value = "/perfil")
public class PerfilServlet extends HttpServlet {
    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        usuarioDao = new UsuarioDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user");

        if (usuario != null) {
            int userId = usuario.getId(); // Obtiene el ID del usuario
            System.out.println("ID del usuario desde la sesión: " + userId);

            Usuario userDetails = usuarioDao.getUsuarioById(userId);
            System.out.println("Detalles del usuario recuperados: " + userDetails);

            if (userDetails != null) {
                req.setAttribute("userDetails", userDetails);
                req.getRequestDispatcher("docente/perfilDocente.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("index.jsp");
            }
        } else {
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user");

        if (usuario != null) {
            int userId = usuario.getId();
            String nombre = req.getParameter("nombre");
            String apellidoPaterno = req.getParameter("apellido_paterno");
            String apellidoMaterno = req.getParameter("apellido_materno");
            int edad = Integer.parseInt(req.getParameter("edad"));

            Usuario userToUpdate = new Usuario();
            userToUpdate.setId(userId);
            userToUpdate.setNombre(nombre);
            userToUpdate.setApellido_paterno(apellidoPaterno);
            userToUpdate.setApellido_materno(apellidoMaterno);
            userToUpdate.setEdad(edad);

            boolean updated = usuarioDao.guardarDatos(userToUpdate);

            if (updated) {
                // Actualización exitosa, redirige al perfil actualizado
                resp.sendRedirect(req.getContextPath() + "/perfil");
                System.out.println("Actualización exitosa");
            } else {
                // Error en la actualización, redirige al perfil con un mensaje de error
                req.setAttribute("error", "No se pudo actualizar la información.");
                req.getRequestDispatcher("/docente/perfilDocente.jsp").forward(req, resp);
                System.out.println("Error en la actualización");
            }
        } else {
            resp.sendRedirect("index.jsp");
        }
    }
}


