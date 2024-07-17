<%
  // Estas lineas lo que hacen es borrar la caché, si el usuario cierra la sesión, y quiere regresar a la página de atras no lo dejaría
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.
%>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
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
  <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
</head>
<body class="body-image">
<%
  Usuario user = (Usuario) session.getAttribute("user");
  if (user != null && user.getId_tipo_usuario() == 3) {
%>


<div class="caja">
  <h1 style="color: #009475; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); margin-top: 10px;">¡Bienvenido Halcón!</h1>
  <br>
  <hr class="separator">
  <br>
  <!--<h2 style="color: #002E60; margin-top: 10px;">Maximiliano Carsi Castrejon</h2>-->
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
    response.sendRedirect("../accesoDenegado.jsp");
  }
%>
</body>
</html>
