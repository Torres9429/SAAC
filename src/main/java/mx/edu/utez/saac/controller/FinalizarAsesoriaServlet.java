package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;

import java.io.IOException;
@WebServlet(name = "FinalizarAsesoriaServlet", value = "/finalizarAsesoria")
public class FinalizarAsesoriaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AsesoriaDao dao = new AsesoriaDao();
        String mensaje;
        if(dao.finalizarAsesoria(id)){
            mensaje = "Asesoría finalizada con éxito.";
        }else{
            mensaje = "Error al finalizar la asesoría, por favor inténtelo de nuevo.";
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);

    }
}
