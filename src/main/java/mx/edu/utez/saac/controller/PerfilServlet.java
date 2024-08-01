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
            System.out.println("Detalles del usuario recuperados: " + usuario.getId_tipo_usuario());

            if (usuario != null) {
                req.setAttribute("userDetails", userDetails);

                // Redirigir a la vista correcta según el tipo de usuario
                switch (usuario.getId_tipo_usuario()) {
                    case 1: // Administrador
                        req.getRequestDispatcher("administrador/modificarUsuario.jsp").forward(req, resp);
                        break;
                    case 2: // Docente
                        req.getRequestDispatcher("docente/perfilDocente.jsp").forward(req, resp);
                        break;
                    case 3: // Estudiante
                        req.getRequestDispatcher("estudiante/perfil.jsp").forward(req, resp);
                        break;
                    default:
                        resp.sendRedirect("index.jsp");
                        System.out.println("error al redirigir al servlet");
                        break;
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user");
        String mensaje;
        if (usuario != null) {
            int userId = Integer.parseInt(req.getParameter("idUsuario"));
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
                mensaje = "¡Los cambios ingresados han sido guardados exitosamente!";
                session.setAttribute("mensaje", mensaje);
                resp.sendRedirect(req.getContextPath() + "/perfil");
                System.out.println("Actualización exitosa");
            } else {
                // Error en la actualización, redirige al perfil con un mensaje de error
                req.setAttribute("error", "No se pudo actualizar la información.");
                switch (usuario.getId_tipo_usuario()) {
                    case 1: // Administrador
                        req.getRequestDispatcher("administrador/modificarUsuario.jsp").forward(req, resp);
                        break;
                    case 2: // Docente
                        req.getRequestDispatcher("docente/perfilDocente.jsp").forward(req, resp);
                        break;
                    case 3: // Estudiante
                        req.getRequestDispatcher("estudiante/perfil.jsp").forward(req, resp);
                        break;
                    default:
                        resp.sendRedirect("index.jsp");
                        break;
                }
                System.out.println("Error en la actualización");
                mensaje = "Ocurrió un error al guardar los cambios, por favor, inténtelo más tarde";
                session.setAttribute("mensaje", mensaje);
            }
        } else {
            resp.sendRedirect("index.jsp");
            System.out.println("error al redirigir al con el post");
        }
    }
}
