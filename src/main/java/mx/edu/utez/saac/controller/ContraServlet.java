package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name="ContraServlet", value = "/updateContra")
public class ContraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contrasena = req.getParameter("contrasena");
        String codigo = req.getParameter("codigo");
        UsuarioDao dao = new UsuarioDao();
        //Deberiamos cambiar la contra y el codigo de una vez
        if(dao.updateContrasena(contrasena, codigo)){
            //Si se hizo
            resp.sendRedirect("index.jsp");
        }else{
            //no se hizo
        }
    }
}
