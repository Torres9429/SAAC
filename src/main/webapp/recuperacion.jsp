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
    <title>Recuperar contraseña</title>
</head>
<body>
<form method="post" action="updateContra">
    <label>Ingresa tu nueva contraseña:</label>
    <input type="password" name="contrasena" required>
    <br>
    <input type="hidden" name="codigo" value="<%=request.getParameter("codigo")%>">
    <input type="submit" value="Cambiar contraseña">
</form>
</body>
</html>
