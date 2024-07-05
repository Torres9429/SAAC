<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/loginStyle.css'>
    <title>Solicitud de Recuperación</title>
</head>
<body>
<div class="login-container">
    <img src="img/Logo-utez.png" alt="Logo UTEZ">
    <h1>Solicitud de Recuperación de Contraseña</h1>
    <form method="post" action="solicitudRecuperacion">
        <div class="form-group">
            <input type="email" class="form-control" required name="correo" placeholder="ejemplo@utez.edu.mx">
        </div><br>
        <button type="submit" class="btn btn-primary">Solicitar</button>
    </form>
</div>
</body>
</html>
