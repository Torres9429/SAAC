<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
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
            color: #009475;
        }
        .form-content {
            width: 80%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .box {
            background-color: #40AE97;
            padding: 40px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            color: #ffffff;
            margin-right: 10px;
        }
        .form-group input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #3A4C60;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #2c3e50;
        }
        .data-box {
            background-color: #E0F2F1;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            color: #002E60;
        }
        .data-box p {
            margin: 5px 0;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .btn-container button {
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #3A4C60;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-container button:hover {
            background-color: #2c3e50;
        }
        .icono {
            width: 100px;
            height: auto;
            display: block;
            margin: 0 auto 20px;
        }

    </style>

    <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
</head>
<body>
<%-- Filtros de sesión para ADMIN--%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div class="form-container">
    <div class="form-sidebar">
        <h1>Eliminar Materia</h1>
    </div>
    <div class="form-content">
        <div class="box">
            <img src="../img/Icono.png" class="icono" alt="Icono">
            <form action="EliminarMateriaServlet" method="post">
                <div class="form-group">
                    <label for="materia">Matrícula:</label>
                    <input type="text" class="form-control" id="materia" name="materia" required>
                    <button type="submit" class="btn btn-primary">Consultar</button>
                </div>
            </form>
            <div class="data-box">
                <p><strong>División:</strong> <span id="division">DATID</span></p>
                <p><strong>Área:</strong> <span id="area">Tecnologías de la Información</span></p>
                <p><strong>Descripción:</strong> <span id="descripcion">Materia especializa en la división DATID</span></p>
                <p><strong>Maestros:</strong> <span id="maestros">Lázaro Ríos Gutiérrez</span></p>
            </div>
            <div class="btn-container">
                <button onclick="window.location.href='EliminarMateriaServlet'">Eliminar materia</button>
                <button onclick="window.location.href='logout.jsp'">Salir</button>
            </div>
        </div>
    </div>
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
