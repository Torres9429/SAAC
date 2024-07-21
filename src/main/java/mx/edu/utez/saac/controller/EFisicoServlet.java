package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name = "EFisicoServlet", value = "/rechazar")
public class EFisicoServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao dao = new UsuarioDao();
        HttpSession sesion = req.getSession();
        String mensaje;

        if (dao.eliminarFisico(id)) {
            mensaje = "Usuario eliminado con éxito";
        } else {
            mensaje = "Error en la eliminación";
        }

        HttpSession session = req.getSession();
        session.setAttribute("mensajeHabilitacion", mensaje);
        resp.sendRedirect(req.getContextPath() + "/administrador/aprobarUsuario.jsp");
    }
}
