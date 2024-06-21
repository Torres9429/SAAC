<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Registrarse</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
    
</head>

<body>
    <div class="login-container">
        <img src="img/Logo-utez.png" alt="Logo UTEZ">
        <h1>Registrarse</h1>
        <div class="row">
            <div class="col">
                <form action="registrarUsuario" method="post" id="registro-form">
                    <div class="form-group">
                        <input type="text" id="nombreRegistro" name="nombreRegistro" class="form-control" placeholder="Nombre(s)">
                    </div>
                    <div class="form-group">
                        <input type="text" id="paternoRegistro" name="paternoRegistro" class="form-control" placeholder="Apellido Paterno">
                    </div>
                    <div class="form-group">
                        <input type="text" id="maternoRegistro" name="maternoRegistro" class="form-control" placeholder="Apellido Materno">
                    </div>
                    <div class="form-group">
                        <input type="number" id="edadRegistro" name="edadRegistro" class="form-control" placeholder="Edad">
                    </div>
                    <div class="form-group">
                        <input type="text" id="matriculaRegistro" name="matriculaRegistro" class="form-control" placeholder="Matrícula">
                    </div>
                    <div class="form-group">
                        <input type="text" id="carreraRegistro" name="carreraRegistro" class="form-control" placeholder="Carrera">
                    </div>
                    <div class="form-group">
                        <input type="email" id="correoRegistro" name="correoRegistro" class="form-control" placeholder="Correo institucional">
                    </div>
                    <div class="form-group">
                        <input type="password" id="contraseña1Registro" name="contraseña1Registro" class="form-control" placeholder="Contraseña">
                    </div>
                    <div class="form-group">
                        <input type="password" id="contraseña2Registro" name="contraseña2Registro" class="form-control" placeholder="Confirme su contraseña">
                    </div>
                    <center>
                        <button type="submit" class="btn btn-primary" id="btnSubmitRegistro">
                            Crear cuenta
                        </button>
                    </center>
                </form>
                <%
                    HttpSession sesion = request.getSession();
                    String mensaje = (String) sesion.getAttribute("mensaje");
                    if(mensaje != null){ %>
                <p style="color: red"><%=mensaje%></p>
                <% } %>
            </div>
        </div>
    </div>
    <script src="js/scriptRegistro.js" ></script>
    
</body>

</html>