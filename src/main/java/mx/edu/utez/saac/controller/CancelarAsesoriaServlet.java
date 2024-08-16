package mx.edu.utez.saac.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saac.dao.AsesoriaDao;

import java.io.IOException;

@WebServlet(name = "CancelarAsesoriaServlet", value = "/cancelarAsesoria")
public class CancelarAsesoriaServlet extends HttpServlet {
    /*@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        AsesoriaDao dao = new AsesoriaDao();
        String mensaje;
        if(dao.cancelarAsesoria(id)){
            mensaje = "Asesoría cancelada con éxito.";
        }else{
            mensaje = "Error al cancelar la asesoría, por favor inténtelo de nuevo.";
        }
        HttpSession session = req.getSession();
        session.setAttribute("mensaje", mensaje);

        req.getRequestDispatcher("docente/calendarioDocente.jsp").forward(req, resp);

    }*/

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        AsesoriaDao dao = new AsesoriaDao();
        String mensaje;
        HttpSession session = req.getSession();

        switch (action) {
            case "cancelar":
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println(id);
                if(dao.cancelarAsesoria(id)){
                    mensaje = "Asesoría cancelada con éxito.";
                    System.out.println("cancelada con exito");
                }else{
                    mensaje = "Error al cancelar la asesoría, por favor inténtelo de nuevo.";
                    System.out.println("error al cancelar");
                }
                session.setAttribute("mensaje", mensaje);
                req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);
                break;

            case "iniciar":
                int idIniciar = Integer.parseInt(req.getParameter("id"));
                System.out.println(idIniciar);
                if(dao.iniciarAsesoria(idIniciar)){
                    mensaje = "Asesoría iniciada con éxito.";
                    resp.sendRedirect(req.getContextPath() + "/calendarioDocente.jsp");
                    System.out.println("iniciada con exito");
                }else{
                    mensaje = "Error al iniciar la asesoría, por favor inténtelo de nuevo.";
                    System.out.println("error al iniciar");
                }
                session.setAttribute("mensaje", mensaje);
                req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);
                break;

            case "finalizar":
                int idFinalizar = Integer.parseInt(req.getParameter("id"));
                System.out.println(idFinalizar);
                if(dao.finalizarAsesoria(idFinalizar)){
                    mensaje = "Asesoría finalizada con éxito.";
                    System.out.println("finalizada con exito");
                }else{
                    mensaje = "Error al finalizar la asesoría, por favor inténtelo de nuevo.";
                    System.out.println("error al finzalizar");
                }
                session.setAttribute("mensaje", mensaje);
                req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);
                break;

            case "reagendar":
                int idMateria = Integer.parseInt(req.getParameter("id"));
                System.out.println("Materia: "+ idMateria);
            resp.sendRedirect("/reagendar");

                break;
            default:
                mensaje = "Acción no reconocida.";
                session.setAttribute("mensaje", mensaje);
                req.getRequestDispatcher("getAsesorias?jsp=calDocente").forward(req, resp);
                break;
        }

    }
}
