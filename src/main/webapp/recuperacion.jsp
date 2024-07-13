<%--
  Created by IntelliJ IDEA.
  User: Derick
  Date: 01/07/2024
  Time: 03:01 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Restablecer contraseña</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
</head>

<body>
<div class="login-container" style="height: 430px">
    <img src="img/Logo-utez.png" alt="Logo UTEZ">
    <h1>Restablecer contraseña</h1>
    <form method="post" action="updateContra">
        <div class="form-group">
            <input type="password" class="form-control" name="contrasena" placeholder="Contraseña nueva" required>
        </div>
        <br>
        <input type="hidden" name="codigo" value="<%=request.getParameter("codigo")%>">
        <input type="submit" value="Cambiar contraseña" class="btn btn-primary">
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

</div>
<script src="js/bootstrap.js">

</script>
</body>
</html>
