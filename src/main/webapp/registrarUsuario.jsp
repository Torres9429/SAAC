<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
<div class="login-container">
    <img src="img/Logo-utez.png" alt="Logo UTEZ">
    <h1>Registrarse</h1>
    <div class="row">
        <div class="col">
            <form action="registrarUsuario" method="post" id="registro-form" onsubmit="return validarCorreo()">
                <input type="hidden" name="source" value="registrarU">
                <div class="form-group">
                    <input type="text" id="nombreRegistro" name="nombreRegistro" class="form-control" placeholder="Nombre(s)" maxlength="45" required>
                </div>
                <div class="form-group">
                    <input type="text" id="paternoRegistro" name="paternoRegistro" class="form-control" placeholder="Apellido Paterno" maxlength="45" required>
                </div>
                <div class="form-group">
                    <input type="text" id="maternoRegistro" name="maternoRegistro" class="form-control" placeholder="Apellido Materno" maxlength="45" required>
                </div>
                <div class="form-group">
                    <input type="number" id="edadRegistro" name="edadRegistro" class="form-control" placeholder="Edad" maxlength="3" required>
                </div>
                <div class="form-group">
                    <input type="text" id="matriculaRegistro" name="matriculaRegistro" class="form-control" maxlength="12" placeholder="Matrícula" required>
                </div>
                <div class="form-group">
                    <select class="form-control" id="carreraRegistro" name="carreraRegistro" required>
                        <option value="" selected disabled>Carrera</option>
                        <c:forEach items="${carreras}" var="carrera">
                            <option value="${carrera.id_carrera}">${carrera.carrera}</option>
                        </c:forEach>
                        <!--<option value="1">Desarrollo de Software Multiplataforma</option>
                        <option value="2">Infraestructura de redes dígitales</option>
                        <option value="3">Diseño Digital</option>
                        <option value="4">Mantenimiento Industrial</option>-->
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
                    <input type="email" id="correoRegistro" name="correoRegistro" class="form-control" placeholder="Correo institucional"  required>
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
    $(document).ready(function() {
        // Llama al servlet para obtener las carreras al cargar la página
        $.ajax({
            url: 'getCarreras',  // URL del servlet
            type: 'GET',
            success: function(data) {
                // Aquí puedes procesar la respuesta si es necesario
                console.log('Carreras cargadas correctamente');
            },
            error: function(xhr, status, error) {
                console.error('Error al cargar las carreras:', error);
            }
        });
    });
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
    document.getElementById('edadRegistro').addEventListener('input', function () {
        const maxLength = 3; // Máximo de 3 dígitos
        let value = this.value;

        if (value.length > maxLength) {
            this.value = value.slice(0, maxLength); // Truncar a 3 dígitos
        }
    });

</script>
</body>

</html>
