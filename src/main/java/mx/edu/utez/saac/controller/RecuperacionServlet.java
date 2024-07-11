package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saac.dao.UsuarioDao;
import mx.edu.utez.saac.model.Usuario;
import mx.edu.utez.saac.utils.GmailSender;
import mx.edu.utez.saac.utils.SimpleRandomStringGenerator;

import java.io.IOException;

@WebServlet(name = "RecuperacionServlet",value = "/solicitudRecuperacion")
public class RecuperacionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Revisar que el codigo exista en la bd
        String codigo = req.getParameter("codigo");
        UsuarioDao dao = new UsuarioDao();
        if (dao.existe(codigo)) {
            // Si existe envia a la pagina de restablecer contraseña
            resp.sendRedirect("recuperacion.jsp?codigo="+codigo);
        }else {
            // Si no existe se le informa al usuario que el codigo no existe o expiró
            System.out.println(codigo);
            req.getSession().setAttribute("mensaje", "El código no sirve o está expirado");
            resp.sendRedirect("index.jsp");
        }


    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Checar que el usuario tenga una cuenta en nuestro sistema
        String correo = req.getParameter("correo");
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne(correo);
        if(u.isEstado()){
            //Significa que además de que si existe si puede cambiar su contraseña
            //2) Generar un código unico para ese usuario
            String codigo = SimpleRandomStringGenerator.generateRandomString(20);
            //3) Insertar ese código en la base de datos
            dao.updateCodigo(u,codigo);
            //4) Generar un correo electronico donde exista un enlace a un Servlet que maneje el código
            try {
                GmailSender gmail = new GmailSender();
                String para = correo;
                String asunto = "Restablecimiento de contraseña";
                String mensaje = "<h1>Le enviamos este mesaje para el restablecimiento de su contraseña</h1>" +
                        "<a href=\"http://localhost:8080/SAAC_war/solicitudRecuperacion?codigo="+codigo+"\">Click para restablecer tu contraseña</a>";
                gmail.sendMail(para,asunto,mensaje);
                req.getSession().setAttribute("mensaje", "Favor de revisar tu correo y tu carpeta de spam");
                resp.sendRedirect("index.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            //No existe o no puede cambiar su contraseña
            req.getSession().setAttribute("mensaje","El usuario no existe en la BD");
            resp.sendRedirect("index.jsp");
        }

    }


    //5) Mandar al usuario a cambiar su contraseña (vista recuperacion.jsp)

}
