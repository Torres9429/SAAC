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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .nav-tabs {
            background-color: #3A4C60;
            border-radius: 5px;
            padding: 10px;
        }
        .nav-tabs a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            padding: 10px 20px;
        }
        .nav-tabs a.active {
            background-color: #009475;
            border-radius: 5px;
        }
        .container {
            margin-top: 20px;
        }
        .calendar-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .calendar-table th, .calendar-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .calendar-table th {
            background-color: #40AE97;
            color: white;
        }
        .calendar-table .session {
            padding: 5px;
            background-color: #f2f2f2;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .calendar-table .session.good {
            border-left: 5px solid #009475;
        }
        .calendar-table .session.average {
            border-left: 5px solid #FFD700;
        }
        .calendar-table .session.poor {
            border-left: 5px solid #FF6347;
        }
    </style>

    <jsp:include page="/administrador/headerMenuAdministrador.jsp" />
</head>
<body>
<%-- Filtros de sesión para ADMIN--%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div class="container">
    <div class="nav-tabs">
        <a href="#">Usuario</a>
        <a href="#">Materia</a>
        <a href="#" class="active">Calendario</a>
        <a href="#">Calificaciones</a>
        <a href="#">Perfil</a>
    </div>
    <table class="calendar-table">
        <thead>
        <tr>
            <th>Asesorías finalizadas</th>
            <th>Asesorías en curso</th>
            <th>Asesorías pendientes</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>
                <div class="session good">20/04/2024 13:00 - 14:00<br>Aplicaciones web<br>Ing. Sebastián Sota<br>5/5 Muy buena</div>
                <div class="session good">19/04/2024 15:00 - 16:00<br>Cálculo Diferencial<br>Ing. Luis Daniel Ramírez<br>4/5 Buena</div>
                <div class="session good">19/04/2024 10:00 - 11:00<br>Probabilidad y estadística<br>Ing. Miguel Ángel Flores<br>4/5 Buena</div>
                <div class="session good">18/04/2024 12:00 - 13:00<br>Base de datos<br>Ing. Jazmín Rogel<br>5/5 Muy buena</div>
            </td>
            <td>
                <div class="session good">21/04/2024 11:00 - 12:00<br>Termodinámica<br>Dra. Karen Barrera<br>5/5 Muy buena</div>
                <div class="session good">21/04/2024 11:00 - 12:00<br>Base de datos<br>Ing. Evelin Villalva<br>5/5 Muy buena</div>
            </td>
            <td>
                <div class="session">22/04/2024 15:00 - 16:00<br>Cálculo Diferencial<br>Ing. Luis Daniel Ramírez</div>
                <div class="session">22/04/2024 14:00 - 15:00<br>Química analítica<br>Dra. Marilú Chávez</div>
                <div class="session">22/04/2024 14:00 - 15:00<br>Aplicaciones web<br>Ing. Sebastián Sota</div>
            </td>
        </tr>
        </tbody>
    </table>
    <a href="#" class="btn btn-link">Ver más...</a>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<%
    } else {
    response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>
