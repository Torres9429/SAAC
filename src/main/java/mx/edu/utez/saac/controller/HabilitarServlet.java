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
        HttpSession sesion = req.getSession();
        if(dao.habilitar(id)){
            
            sesion.setAttribute("mensaje","Usuario habilitado con éxito");
        }else{
            sesion.setAttribute("mensaje","Falló la habilitación");
        }
        resp.sendRedirect("habilitarUsuario.jsp");
    }
}
