<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='../css/bootstrap.css'>
    <style>
        .divText {
            border-right: 4px solid #BFB4B4;
            width: 20%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #009475;
            height: 100%;
            margin: 15px;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .container {
            margin-top: 50px;
        }
        .box {
            background-color: #40AE97;
            padding: 40px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
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
            height: 100vh; /* Añadido para ocupar toda la altura de la ventana */
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
        .form-group {
            margin-bottom: 15px;
            width: 100%;
        }
        .form-group label {
            color: #002E60;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #3A4C60;
            border-color: #007BFF;
            padding: 10px 20px;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #2c3e50;
        }
        .modal-custom {
            display: none;
            position: fixed;
            z-index: 1055;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content-custom {
            background-color: #fefefe;
            margin: 10% auto;
            border: 1px solid #888;
            width: 30%;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .modal-header-custom {
            background-color: #002E60;
            color: white;
            padding: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .modal-body-custom {
            padding: 20px;
        }

        .modal-footer-custom {
            display: flex;
            justify-content: center;
            padding: 10px;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .form-group-custom {
            margin-bottom: 15px;
        }

        .btn-custom {
            background-color: #002E60;
            color: white;
            border: none;
            cursor: pointer;
            margin: 10px;
            height: 30px;
            align-items: center;
            align-content: center;
        }

        .btn-custom:hover {
            background-color: #004080;
        }

        .close-custom {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-custom:hover,
        .close-custom:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
    <jsp:include page="/administrador/headerMenuAdministrador.jsp" />
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>

<div class="form-container">
    <div class="form-sidebar">
        <h1>Agregar Materia</h1>
    </div>
    <div class="form-content">
        <div class="box">
            <form action="AgregarMateriaServlet" method="post">
                <div class="form-group">
                    <label for="materia">Materia:</label>
                    <input type="text" class="form-control" id="materia" name="materia" required>
                </div>
                <div class="form-group">
                    <label for="division">Division:</label>
                    <select class="form-control" id="division" name="division" required>
                        <option value="Division 1">Division 1</option>
                        <option value="Division 2">Division 2</option>
                        <option value="Division 3">Division 3</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="area">Area:</label>
                    <input type="text" class="form-control" id="area" name="area" required>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripcion:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                </div>
                <div class="form-group">
                    <label for="id_maestro">Maestro:</label>
                    <select class="form-control" id="id_maestro" name="id_maestro" required>
                        <option value="Maestro 1">Maestro 1</option>
                        <option value="Maestro 2">Maestro 2</option>
                        <option value="Maestro 3">Maestro 3</option>
                    </select>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">Agregar Materia</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<%
    // Obtener el mensaje de la sesión
    String mensaje = (String) session.getAttribute("mensajeError");
    // Eliminar el atributo de sesión después de obtener el mensaje
    session.removeAttribute("mensajeError");
%>

<% if (mensaje != null && !mensaje.isEmpty()) { %>
<div class="modal-custom" style="display: block;">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">&times;</span>
            <h2>Mensaje</h2>
        </div>
        <div class="modal-body-custom">
            <p><%= mensaje %></p>
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">Cerrar</button>
        </div>
    </div>
</div>
<% } %>
<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>
