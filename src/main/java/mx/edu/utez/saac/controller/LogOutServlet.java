package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogOutServlet", value = "/logout")
public class LogOutServlet extends HttpServlet {
    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // Obtiene la sesión sin crear una nueva si no existe

        if (session != null) {
            session.invalidate(); // Invalida la sesión actual
            session = request.getSession(); // Crea una nueva sesión para mostrar el mensaje de cerrar sesión
            session.setAttribute("logoutMessage", "Sesión cerrada exitosamente."); // Mensaje de cerrar sesión
        }

        response.sendRedirect("index.jsp"); // Redirige a la página de inicio de sesión

    }
    }



