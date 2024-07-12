package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;

import java.io.IOException;
@WebServlet(name = "DeshabilitarServlet", value = "/deshabilitar")
public class DeshabilitarServlet extends HttpServlet {



    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        UsuarioDao dao = new UsuarioDao();
        String mensaje;
        if(dao.eliminarLogico(id)){
            mensaje = "Usuario deshabilitado con éxito";
        }else{
            mensaje = "Falló la deshabilitación";
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensajeHabilitacion", mensaje);

        resp.sendRedirect("habilitarUsuario.jsp");
    }
}