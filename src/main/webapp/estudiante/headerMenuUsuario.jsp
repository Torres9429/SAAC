
<%
    // Estas lineas lo que hacen es borrar la caché, si el usuario cierra la sesión, y quiere regresar a la página de atras no lo dejaría
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>

<%@ page import="mx.edu.utez.saac.model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: rocit
  Date: 06/07/2024
  Time: 07:10 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>

<div class="container-fluid">
    <header class="d-flex justify-content-center py-3 custom-header" >
        <ul class="nav nav-pills">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Asesoría
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/getData?jsp=agendarEstudiante">Agendar</a>
                    <a class="dropdown-item" href="#">Cancelar</a>
                    <a class="dropdown-item" href="#">Reagendar</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Calendario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/getMaterias?jsp=agendarEstudiante">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Calificaciones
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/${pageContext.request.contextPath}/agendarAsesoria.jsp">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Perfil
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/perfil">Ver</a>
                    <!--<a class="dropdown-item" href="#">Modificar</a-->
                    <a class="dropdown-item" href="../solicitudRecuperacion.jsp">Restablecer contraseña</a>
                    <div class="dropdown-divider"></div>
                    <a href="${pageContext.request.contextPath}/logout" class="dropdown-item">Cerrar Sesión</a> <!--enlace a servlet-->
                    <!--<a class="dropdown-item" href="/logout" id="logout-btn">Cerrar Sesión</a>-->
                </div>
            </li>
        </ul>
    </header>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</div>

</body>
</html>
