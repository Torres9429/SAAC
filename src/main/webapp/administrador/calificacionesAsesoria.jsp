<%@ page import="mx.edu.utez.saac.dao.EvaluacionDao" %>
<%@ page import="mx.edu.utez.saac.model.Evaluacion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.model.CalificacionDTO" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='../css/bootstrap.css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lexend:wght@300;400;700&display=swap">
    <title>Calificaciones Asesoría</title>
    <style>
        body {
            font-family: 'Lexend', sans-serif;
        }
        .form-container {
            display: flex;
            height: 100vh;
        }
        .form-sidebar {
            width: 20%;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-right: 2px solid #009475;
            padding: 15px;
        }
        .form-sidebar h1 {
            color: rgba(0, 148, 117, 0.8); /* #009475 with 80% opacity */
            text-align: center;
        }
        .form-content {
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .card {
            background-color: rgba(0, 148, 117, 0.5); /* #009475 with 50% opacity */
            border: none;
            border-radius: 8px;
            width: 100%;
        }
        .card-header {
            text-align: center;
            color: #002E60;
            margin-bottom: 20px;
        }
        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .card-body label {
            color: #002E60;
        }
        .btn-primary {
            background-color: #3A4C60;
            border-color: #007BFF;
            margin: 5px;
        }
        .nav-tabs {
            margin-bottom: 20px;
        }
    </style>
    <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div class="container">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="usuario.jsp">Usuario</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="materia.jsp">Materia</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="calendario.jsp">Calendario</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="calificacionesAsesoria.jsp">Calificaciones</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="perfil.jsp">Perfil</a>
        </li>
    </ul>
    <div class="form-container">
        <div class="form-sidebar">
            <h1>Calificaciones Asesoría</h1>
        </div>
        <div class="form-content">
            <div class="card">
                <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover">
                    <thead>
                    <tr style="background-color: #80C9BA;">
                        <th>Id Asesoría</th>
                        <th>Materia</th>
                        <th>Horario</th>
                        <th>Docente</th>
                        <th>Calificación Docente</th>
                        <th>Comentarios Docente</th>
                        <th>Estudiante</th>
                        <th>Calificación Estudiante</th>
                        <th>Comentarios Estudiante</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        EvaluacionDao dao = new EvaluacionDao();
                        ArrayList<CalificacionDTO> lista = dao.getCalificaciones();
                        for (CalificacionDTO cal : lista) {
                    %>
                    <tr style="background-color: #80C9BA;">
                        <td><%= cal.getIdAsesoria() %></td>
                        <td><%= cal.getMateria() %></td>
                        <td><%= cal.getHorario() %> <%= cal.getHoraInicio() %> - <%= cal.getHoraFin() %></td>
                        <td><%= cal.getNombreDocente() %></td>
                        <td><%= cal.getCalificacionDocente() %></td>
                        <td><%= cal.getComentariosDocente() %></td>
                        <td><%= cal.getNombreEstudiante() %></td>
                        <td><%= cal.getCalificacionEstudiante() %></td>
                        <td><%= cal.getComentariosEstudiante() %></td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/datatables.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/js/es-MX.json"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const table = document.getElementById('example');
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/js/es-MX.json'
            },
            pageLength: 5,
            responsive: true
        });

    });
</script>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
    }
%>
</body>
</html>
