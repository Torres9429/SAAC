package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name = "HabilitarServlet", value = "/habilitar")
public class HabilitarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao dao = new UsuarioDao();
        String mensaje;
        boolean success = dao.habilitar(id);

        // Obtener el parámetro de redirección
        String redirectPage = req.getParameter("page");

        if (success) {
            mensaje = (redirectPage.equals("aprobar"))
                    ? "Usuario aprobado y habilitado con éxito"
                    : "Usuario habilitado con éxito";
        } else {
            mensaje = (redirectPage.equals("aprobar"))
                    ? "Error al aprobar y habilitar el usuario"
                    : "Error en la habilitación del usuario";
        }

        HttpSession session = req.getSession();
        session.setAttribute("mensajeHabilitacion", mensaje);

        if ("aprobar".equals(redirectPage)) {
            resp.sendRedirect(req.getContextPath() + "/administrador/aprobarUsuario.jsp");
        } else {
            resp.sendRedirect(req.getContextPath() + "/administrador/habilitarUsuario.jsp");
        }
    }
}
