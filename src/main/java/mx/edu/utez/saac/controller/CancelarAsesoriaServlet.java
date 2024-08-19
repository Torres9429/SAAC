package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;
import mx.edu.utez.saac.dao.UsuarioDao;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;

@WebServlet(name = "CancelarAsesoriaServlet", value = "/cancelarAsesoria")
public class CancelarAsesoriaServlet extends HttpServlet {
    /*@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AsesoriaDao dao = new AsesoriaDao();
        String mensaje;
        if(dao.cancelarAsesoria(id)){
            mensaje = "Asesoría cancelada con éxito.";
        }else{
            mensaje = "Error al cancelar la asesoría, por favor inténtelo de nuevo.";
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        req.getRequestDispatcher("docente/calendarioDocente.jsp").forward(req, resp);

    }*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        AsesoriaDao dao = new AsesoriaDao();
        String mensaje;

        HttpSession session = req.getSession();
        Usuario usuario = (Usuario) session.getAttribute("user");

        if (usuario != null) {
            int userId = usuario.getId(); // Obtiene el ID del usuario
            int tipoUsuario = usuario.getId_tipo_usuario(); // Obtiene el tipo de usuario directamente

            System.out.println("ID del usuario desde la sesión: " + userId);
            System.out.println("Tipo de usuario: " + tipoUsuario);

            // Definir la URL de redirección según el tipo de usuario
            String redirectUrl = "getAsesorias?jsp=" + (tipoUsuario == 2 ? "calDocente" : "calEstudiante");
            System.out.println(redirectUrl);
            switch (action) {
                case "cancelar":
                    int id = Integer.parseInt(req.getParameter("id"));
                    System.out.println("ID de la asesoría a cancelar: " + id);
                    if (dao.cancelarAsesoria(id)) {
                        mensaje = "Asesoría cancelada con éxito.";
                        System.out.println("Asesoría cancelada con éxito");
                    } else {
                        mensaje = "Error al cancelar la asesoría, por favor inténtelo de nuevo.";
                        System.out.println("Error al cancelar la asesoría");
                    }
                    session.setAttribute("mensaje", mensaje);
                    req.getRequestDispatcher(redirectUrl).forward(req, resp);
                    break;

                case "iniciar":
                    int idIniciar = Integer.parseInt(req.getParameter("id"));
                    System.out.println("ID de la asesoría a iniciar: " + idIniciar);
                    if (dao.iniciarAsesoria(idIniciar)) {
                        mensaje = "Asesoría iniciada con éxito.";
                        System.out.println("Asesoría iniciada con éxito");
                    } else {
                        mensaje = "Error al iniciar la asesoría, por favor inténtelo de nuevo.";
                        System.out.println("Error al iniciar la asesoría");
                    }
                    session.setAttribute("mensaje", mensaje);
                    req.getRequestDispatcher(redirectUrl).forward(req, resp);
                    break;

                case "finalizar":
                    int idFinalizar = Integer.parseInt(req.getParameter("id"));
                    System.out.println("ID de la asesoría a finalizar: " + idFinalizar);
                    if (dao.finalizarAsesoria(idFinalizar)) {
                        mensaje = "Asesoría finalizada con éxito.";
                        System.out.println("Asesoría finalizada con éxito");
                    } else {
                        mensaje = "Error al finalizar la asesoría, por favor inténtelo de nuevo.";
                        System.out.println("Error al finalizar la asesoría");
                    }
                    session.setAttribute("mensaje", mensaje);
                    req.getRequestDispatcher(redirectUrl).forward(req, resp);
                    break;

                case "reagendar":
                    int idMateria = Integer.parseInt(req.getParameter("id"));
                    System.out.println("Materia ID: " + idMateria);
                    resp.sendRedirect(req.getContextPath() + "/reagendar");
                    break;

                default:
                    mensaje = "Acción no reconocida.";
                    session.setAttribute("mensaje", mensaje);
                    req.getRequestDispatcher(redirectUrl).forward(req, resp);
                    break;
            }
        } else {
            System.out.println("El usuario no está en la sesión.");
            resp.sendRedirect(req.getContextPath() + "/login.jsp"); // Redirige al login si no hay usuario en la sesión
        }
    }
}