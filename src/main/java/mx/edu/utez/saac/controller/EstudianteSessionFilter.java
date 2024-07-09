package mx.edu.utez.saac.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.http.HttpRequest;

@WebFilter(urlPatterns ={
        "/bienvenida.jsp",
        "/headerMenuUsuario.jsp",
        "/agendarAsesoria.jsp"
})
public class EstudianteSessionFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        //Obtener la sesión
        HttpSession session = httpRequest.getSession(false);
        // Checar si la sesión tiene un atributo “tipoSesion” con valor “admin” (convertido a booleano en este caso)
        boolean isStudent = false;
        if(session != null){
            isStudent = session.getAttribute("tipoSesion").equals("admin");
        }
        if (isStudent) {//Si es administrador la siguiente línea otorga acceso al recurso solicitado
            chain.doFilter(request, response);
        } else {// Si no lo redirigimos a una página de acceso denegado
            httpResponse.sendRedirect("accesoDenegado.jsp");
        }
    }

}
