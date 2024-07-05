<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Inicio</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="body-image">
<div class="container-fluid">
  <header class="d-flex justify-content-center py-3 custom-header" >
    <ul class="nav nav-pills">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
          Asesoría
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="agendarAsesoria.jsp">Agendar</a>
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
          <a class="dropdown-item" href="agendarAsesoria.jsp">Ver</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
           aria-haspopup="true" aria-expanded="false">
          Calificaciones
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="agendarAsesoria.jsp">Ver</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Perfil
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="prueba2.html">Ver</a>
          <a class="dropdown-item" href="#">Modificar</a>
          <a class="dropdown-item" href="#">Restablecer contraseña</a>
          <div class="dropdown-divider"></div>
          <a href="/logout" class="dropdown-item">Cerrar Sesión</a>
          <!--<a class="dropdown-item" href="/logout" id="logout-btn">Cerrar Sesión</a>-->
        </div>
      </li>
    </ul>
  </header>
</div>

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

</body>
</html>