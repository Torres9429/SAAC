<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <title>Ver Perfil</title>
</head>
<body>
<div class="b-example-divider"></div>
<div class="container-fluid">
    <header class="d-flex justify-content-center py-3 custom-header">
        <ul class="nav nav-pills">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Asesoría
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.html">Agendar</a>
                    <a class="dropdown-item" href="#">Cancelar</a>
                    <a class="dropdown-item" href="#">Reagendar</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Calendario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.html">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#"  role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Calificaciones
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.html">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Perfil
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="perfil.jsp">Ver</a>
                    <a class="dropdown-item" href="#">Modificar</a>
                    <a class="dropdown-item" href="restablecerContra.jsp">Restablecer contraseña</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Cerrar Sesión</a>
                </div>
            </li>
        </ul>
    </header>
</div>
<div class="box-information">
    <div class="left">
        <center>
            <img src="img/Icono_Perfil.png" width="200px" height="200px"><br><br>
            <hr class="separator-left"><br>
            <h3 style="color: #002E60">Nombre Nombre Apellido Apellido<br>
                Matrícula
            </h3>
            <p>Carrera</p>
        </center>
    </div>

    <div class="right">
        <h3 style="color: #002E60">Nombre: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
        <h3 style="color: #002E60">Apellido paterno: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
        <h3 style="color: #002E60">Apellido materno: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
        <h3 style="color: #002E60">Edad: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
        <h3 style="color: #002E60">Fecha de nacimiento: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
        <h3 style="color: #002E60">Estado civil: </h3>
        <p style="color: #002E60">texto</p>
        <hr class="separator-right">
       <!-- boton -->
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
