package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "HabilitarServlet", value = "/habilitar")
public class HabilitarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao dao = new UsuarioDao();
        HttpSession sesion = req.getSession();
        String mensaje;
        if (dao.habilitar(id)) {
            mensaje = "Usuario habilitado con éxito";
        } else {
            mensaje = "Falló la habilitación";
        }
        resp.sendRedirect("habilitarUsuario.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
    }
}
