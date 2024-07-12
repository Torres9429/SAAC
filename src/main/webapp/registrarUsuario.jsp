<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registrarse</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
</head>

<body>
<div class="login-container">
    <img src="img/Logo-utez.png" alt="Logo UTEZ">
    <h1>Registrarse</h1>
    <div class="row">
        <div class="col">
            <form action="registrarUsuario" method="post" id="registro-form" onsubmit="return validarCorreo()">
                <div class="form-group">
                    <input type="text" id="nombreRegistro" name="nombreRegistro" class="form-control" placeholder="Nombre(s)" required>
                </div>
                <div class="form-group">
                    <input type="text" id="paternoRegistro" name="paternoRegistro" class="form-control" placeholder="Apellido Paterno" required>
                </div>
                <div class="form-group">
                    <input type="text" id="maternoRegistro" name="maternoRegistro" class="form-control" placeholder="Apellido Materno" required>
                </div>
                <div class="form-group">
                    <input type="number" id="edadRegistro" name="edadRegistro" class="form-control" placeholder="Edad" required>
                </div>
                <div class="form-group">
                    <input type="text" id="matriculaRegistro" name="matriculaRegistro" class="form-control" placeholder="Matrícula" required>
                </div>
                <div class="form-group">
                    <select class="form-control" id="carreraRegistro" name="carreraRegistro" required>
                        <option value="">Carrera</option>
                        <option value="14">Desarrollo de Software Multiplataforma</option>
                        <option value="2">Infraestructura de redes dígitales</option>
                        <option value="3">Diseño Digital</option>
                        <option value="4">Mantenimiento Industrial</option>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control" id="rolRegistro" name="rolRegistro" required>
                        <option value="">Registrarse como:</option>
                        <option value="1">Administrador</option>
                        <option value="2">Docente</option>
                        <option value="3">Estudiante</option>
                    </select>
                </div>
                <div class="form-group">
                    <input type="email" id="correoRegistro" name="correoRegistro" class="form-control" placeholder="Correo institucional" required>
                </div>
                <div class="form-group">
                    <input type="password" id="contraseña1Registro" name="contraseña1Registro" class="form-control" placeholder="Contraseña" required>
                </div>
                <div class="form-group">
                    <input type="password" id="contraseña2Registro" name="contraseña2Registro" class="form-control" placeholder="Confirme su contraseña" required>
                </div>
                <center>
                    <button type="submit" class="btn btn-primary" id="btnSubmitRegistro">
                        Crear cuenta
                    </button>
                    <a href="index.jsp" class="forgot-password">¿Ya tienes una cuenta? Iniciar sesión</a>
                </center>
            </form>
            <div id="mensajeError" style="color: red;"></div>
            <%
                HttpSession sesion = request.getSession();
                String mensaje = (String) sesion.getAttribute("mensajeError");
                if (mensaje != null) {
            %>
            <p style="color: red"><%= mensaje %></p>
            <%
                    sesion.removeAttribute("mensajeError"); // Eliminar el mensaje de la sesión
                }
            %>
        </div>
    </div>
</div>
<script>
    function validarCorreo() {
        const emailRegex = /^[a-zA-Z0-9._%+-]+@utez\.edu\.mx$/;
        const correo = document.getElementById('correoRegistro').value;
        const mensajeError = document.getElementById('mensajeError');

        if (!emailRegex.test(correo)) {
            mensajeError.textContent = 'Por favor, ingrese un correo institucional válido (@utez.edu.mx).';
            return false;
        }

        mensajeError.textContent = ''; // Limpiar cualquier mensaje de error previo
        return true;
    }
</script>
</body>

</html>
