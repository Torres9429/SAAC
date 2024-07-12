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
        String mensaje;
        if (dao.habilitar(id)) {
            System.out.println("Usuario habilitado");
            mensaje = "Usuario habilitado con éxito";
        } else {
            mensaje = "Error en la habilitación";
            System.out.println("Error de habilitación");
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensajeHabilitacion", mensaje);

        resp.sendRedirect("habilitarUsuario.jsp");
        //resp.sendRedirect("habilitarUsuario.jsp?mensaje=" + URLEncoder.encode(mensaje, "UTF-8"));
    }
}
