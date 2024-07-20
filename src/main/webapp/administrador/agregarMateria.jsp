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
        /* Tu código CSS aquí */
    </style>
    <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
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
                        <option value="1">Maestro 1</option>
                        <option value="2">Maestro 2</option>
                        <option value="3">Maestro 3</option>
                    </select>
                </div>
                <div class="btn-container">
                    <button type="submit" class="btn btn-primary">Agregar Materia</button>
                </div>
            </form>
            <% if (session.getAttribute("mensajeError") != null) { %>
            <div class="alert alert-danger mt-3">
                <%= session.getAttribute("mensajeError") %>
                <%
                    session.removeAttribute("mensajeError"); // Remove the error message after displaying it
                %>
            </div>
            <% } %>
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
