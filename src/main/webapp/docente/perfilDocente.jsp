<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<html>
<head>
    <title>Perfil</title>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <jsp:include page="/docente/headerMenuDocente.jsp" />
</head>
<body>
<style>
    .cont {
        display: flex;
        height: 85%;
        width: 100%;
        margin: 0;
    }
    .info-user {
        width: 30%;
        height: 100%;
        background-color: #80C9BA;
        margin: 10px 20px 10px 20px;
        padding: 30px 15px 10px 15px;
        border-radius: 15px;
        text-align: center;
        align-items: center;
    }
    .div-info {
        width: 65%;
        height: 100%;
        background-color: #80C9BA;
        padding: 50px;
        margin: 10px;
        border-radius: 15px;
        font-size: 20px;
        color: #002E60;
    }
    .campos-form {
        border-bottom: 3px solid #009475;
        width: 100%;
    }
    .campos-form-edit {
        border-bottom: none; /* Sin borde al editar */
    }
    input {
        background-color: transparent;
        border-style: hidden;
        font-size: 20px;
        color: #002E60;
        padding: 5px;
        width: 350px;

    }
    label {
        font-weight: bold;
    }
    button {
        background-color: #3A4C60;
        width: 150px;
        color: white;
        border-radius: 5px;
        margin: 5px;
    }
    .div-btn {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }
    .input-editar {
        background-color: #ffffff; /* Color de fondo cuando se edita */
        border-radius: 5px;
        padding: 5px;
    }

    .input-no-editar {
        background-color: transparent; /* Color de fondo cuando no se edita */
    }
</style>
<div class="cont">
    <div class="info-user">
        <img src="${pageContext.request.contextPath}/img/Icono_Perfil.png" width="200px" height="200px"><br><br>
        <h3 style="color: #002E60; border-top: 3px solid #9D9D9D; padding-top: 10px;">
            <%
                Usuario userDetails = (Usuario) request.getAttribute("userDetails");
                if (userDetails != null) {
            %>
            <%= userDetails.getNombre() %> <%= userDetails.getApellido_paterno() %> <%= userDetails.getApellido_materno() %><br>
            Matrícula: <%= userDetails.getMatricula() %>
            <%
            } else {
            %>
            Usuario no encontrado.
            <%
                }
            %>
        </h3>
        <p>Carrera</p>
    </div>
    <div class="div-info">
        <form action="perfil" method="post">
            <div class="campos-form">
                <label for="nombre">Nombre:</label><br>
                <input type="text" disabled name="nombre" id="nombre" value="<%= userDetails != null ? userDetails.getNombre() : "" %>">
            </div>
            <div class="campos-form">
                <label for="ap1">Apellido paterno:</label><br>
                <input type="text" disabled name="apellido_paterno" id="ap1" value="<%= userDetails != null ? userDetails.getApellido_paterno() : "" %>">
            </div>
            <div class="campos-form">
                <label for="ap2">Apellido materno:</label><br>
                <input type="text" disabled name="apellido_materno" id="ap2" value="<%= userDetails != null ? userDetails.getApellido_materno() : "" %>">
            </div>
            <div class="campos-form">
                <label for="edad">Edad:</label><br>
                <input type="number" disabled name="edad" id="edad" value="<%= userDetails != null ? userDetails.getEdad() : "" %>">
            </div>
            <!-- Agregar input para fecha si es necesario -->
            <!-- <div class="campos-form">
                    <label for="fechaNac">Fecha de nacimiento:</label><br>
                    <input type="date" disabled name="fechaNac" id="fechaNac" value="<%= userDetails != null ? userDetails.getFecha_creacion() : "" %>">
                </div> -->
            <div class="div-btn">
                <button type="button" id="activar-btn" onclick="activarInputs()">Editar perfil</button>
                <button type="submit" id="guardar-btn" style="display: none;">Guardar</button>
            </div>
        </form>
    </div>
</div>
<script>
    function activarInputs() {
        // Obtén todos los inputs y divs que deseas modificar
        const inputs = document.querySelectorAll('.campos-form input');
        const divs = document.querySelectorAll('.campos-form');

        // Cambiar el estado de los inputs y aplicar la clase editada a los divs
        inputs.forEach(input => {
            input.disabled = false; // Habilita los inputs
            input.classList.remove('input-no-editar'); // Elimina la clase que indica que no están editables
            input.classList.add('input-editar'); // Añade la clase que indica que están editables
        });

        divs.forEach(div => {
            div.classList.remove('campos-form'); // Elimina la clase original
            div.classList.add('campos-form-edit'); // Añade la clase para indicar que está en modo edición
        });

        // Asegúrate de que los IDs correspondan a los inputs en tu HTML
        document.getElementById("nombre").disabled = false;
        document.getElementById("ap1").disabled = false;
        document.getElementById("ap2").disabled = false;
        document.getElementById("edad").disabled = false;
        // Descomentar si tienes un input para fecha
        // document.getElementById("fechaNac").disabled = false;

        // Mostrar el botón de guardar y ocultar el de activar
        document.getElementById("activar-btn").style.display = "none";
        document.getElementById("guardar-btn").style.display = "block";
    }

</script>
</body>
</html>
