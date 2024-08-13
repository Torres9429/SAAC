package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.UsuarioDao;
import mx.edu.utez.saac.model.Usuario;

import java.io.IOException;

@WebServlet(name="RegistrarUsuarioServlet", value = "/registrarUsuario")
public class RegistrarUsuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario u = new Usuario();
        u.setNombre(req.getParameter("nombreRegistro"));
        u.setApellido_paterno(req.getParameter("paternoRegistro"));
        u.setApellido_materno(req.getParameter("maternoRegistro"));
        u.setEdad(Integer.parseInt(req.getParameter("edadRegistro")));
        u.setMatricula(req.getParameter("matriculaRegistro"));
        u.setCarrera(Integer.parseInt(req.getParameter("carreraRegistro")));
        u.setCorreo(req.getParameter("correoRegistro"));
        u.setId_tipo_usuario(Integer.parseInt(req.getParameter("rolRegistro")));

        String source = req.getParameter("source");

        if (req.getParameter("contraseña1Registro").equals(req.getParameter("contraseña2Registro"))){
            u.setContrasena(req.getParameter("contraseña1Registro"));
            System.out.println("Contraseñas correctas");
        } else {
            //Si las contraseñas son diferentes
            HttpSession session = req.getSession();
            session.setAttribute("mensajeError","Las contraseñas no coinciden");
            if ("agregarU".equals(source)) {
                req.getRequestDispatcher("administrador/agregarUsuario.jsp").forward(req, resp);
            } else if ("registrarU".equals(source)) {
                req.getRequestDispatcher("registrarUsuario.jsp").forward(req, resp);
            }
            System.out.println("Contraseñas diferentes");
            return;
        }

        u.setEstado(true);

        //Se debe mandar a llamar un DAO que permita insertar
        UsuarioDao dao = new UsuarioDao();
        if (dao.insert(u)) {
            //respuesta hacia un jsp
            if ("agregarU".equals(source)) {
                HttpSession session = req.getSession();
                session.setAttribute("mensajeError","Usuario registrado exitosamente");
                req.getRequestDispatcher("administrador/agregarUsuario.jsp").forward(req, resp);
            } else if ("registrarU".equals(source)) {
                req.getRequestDispatcher("index.jsp").forward(req, resp);
            }
        } else {
            //la info no se insertó y regresa al formulario
            HttpSession session = req.getSession();
            session.setAttribute("mensajeError","Puede que el usuario ya esté registrado");
            if ("agregarU".equals(source)) {
                req.getRequestDispatcher("administrador/agregarUsuario.jsp").forward(req, resp);
            } else if ("registrarU".equals(source)) {
                req.getRequestDispatcher("registrarUsuario.jsp").forward(req, resp);
            }
        }
    }
}