package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;

import java.io.IOException;

@WebServlet(name = "IniciarAsesoriaServlet", value = "/iniciarAsesoria")
public class IniciarAsesoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        System.out.println(idStr);
        String mensaje;

        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                System.out.println("id asesoria"+id);

                AsesoriaDao dao = new AsesoriaDao();
                if (dao.iniciarAsesoria(id)) {
                    mensaje = "Asesoría iniciada con éxito.";
                } else {
                    mensaje = "Error al iniciar la asesoría, por favor inténtelo de nuevo.";
                }
            } catch (NumberFormatException e) {
                mensaje = "El ID proporcionado no es un número válido.";
                e.printStackTrace();
            }
        } else {
            mensaje = "El parámetro ID no se ha proporcionado o está vacío.";
        }

        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);
    }
}
