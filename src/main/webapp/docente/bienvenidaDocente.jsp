<%@ page import="mx.edu.utez.saac.model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: estef
  Date: 12/07/2024
  Time: 11:01 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Inicio</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="/docente/headerMenuDocente.jsp" />
</head>
<body class="body-image">
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 2) {
%>

<div class="caja">
    <h1 style="color: #009475; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); margin-top: 10px;">¡Bienvenido Halcón!</h1>
    <br>
    <hr class="separator">
    <br>
    <h2 style="color: #002E60FF; margin-top: 10px;">
        <%=user.getNombre()%>
    </h2>
</div>

<div class="social-icons">
    <a href="https://www.instagram.com/utezmorelos/?hl=es" target="_blank"><i class="fab fa-instagram"></i> Instagram</a>
    <a href="https://www.facebook.com/UTEZ.Morelos/?locale=es_LA" target="_blank"><i class="fab fa-facebook-f"></i> Facebook</a>
</div>
<!-- social-icons -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
    }
%>
</body>
</html>