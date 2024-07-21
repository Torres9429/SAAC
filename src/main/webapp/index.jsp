<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio de sesión</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
</head>

<body>
    <div class="login-container">
        <img src="img/Logo-utez.png" alt="Logo UTEZ">
        <h1>Inicio de sesión</h1>
        <form action="login" method="post">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="Correo" name="correo" required>
            </div>
            <br>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Contraseña" name="contrasena" required>
            </div>
            <br>
            <div class="form-group">
                <center>
                    <button type="submit" class="btn btn-primary">
                        Iniciar sesión
                    </button>
                    <a href="solicitudRecuperacion.jsp" class="forgot-password">¿Olvidaste tu contraseña?</a>
                    <a href="${pageContext.request.contextPath}/getCarreras?page=registrar" class="forgot-password">¿No tienes una cuenta? Registrarse</a>

                </center>
            </div>
        </form>
        <%
            HttpSession sesion = request.getSession();
            String mensaje = (String) sesion.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <p style="color: red"><%= mensaje %></p>
        <%
                sesion.removeAttribute("mensaje"); // Eliminar el mensaje de la sesión
            }
        %>
        <%-- Mostrar mensaje de cerrar sesión si existe --%>
        <%
            String logoutMessage = (String) sesion.getAttribute("logoutMessage");
            if (logoutMessage != null) {
        %>
        <p style="color: green"><%= logoutMessage %></p>
        <%
                sesion.removeAttribute("logoutMessage"); // Eliminar el mensaje de cierre de sesión
            }
        %>

    </div>
    <script src="js/bootstrap.js">
        
    </script>
</body>
</html>