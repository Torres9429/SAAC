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
    <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
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
        border-style: hidden;
    }
    button:hover{
        background-color: #4B6B76;
        color: white;
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
    .btn-custom {
        background-color: #3A4C60;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 5px;
    }

    .btn-custom:hover {
        background-color: #536880;
    }
    .modal-custom {
        display: none;
        position: fixed;
        z-index: 1055;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content-custom {
        background-color: #fefefe;
        margin: 10% auto;
        border: 1px solid #888;
        width: 30%;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }

    .modal-header-custom {
        background-color: #002E60;
        color: white;
        padding: 10px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .modal-body-custom {
        padding: 20px;
        text-align: center;
    }

    .modal-footer-custom {
        display: flex;
        justify-content: center;
        padding: 10px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }

    .form-group-custom {
        margin-bottom: 15px;
    }

    .btn-custom {
        background-color: #002E60;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        margin: 10px;
    }

    .btn-custom:hover {
        background-color: #004080;
    }

    .close-custom {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close-custom:hover,
    .close-custom:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
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
        <form action="perfil" method="post" id="perfilForm">
            <div class="campos-form">
                <label for="nombre">Nombre:</label><br>
                <input type="text" disabled name="nombre" id="nombre" maxlength="45" value="<%= userDetails != null ? userDetails.getNombre() : "" %>">
            </div>
            <div class="campos-form">
                <label for="ap1">Apellido paterno:</label><br>
                <input type="text" disabled name="apellido_paterno" id="ap1" maxlength="45" value="<%= userDetails != null ? userDetails.getApellido_paterno() : "" %>">
            </div>
            <div class="campos-form">
                <label for="ap2">Apellido materno:</label><br>
                <input type="text" disabled name="apellido_materno" id="ap2" maxlength="45" value="<%= userDetails != null ? userDetails.getApellido_materno() : "" %>">
            </div>
            <div class="campos-form">
                <label for="edad">Edad:</label><br>
                <input type="number" disabled name="edad" id="edad" maxlength="3" value="<%= userDetails != null ? userDetails.getEdad() : "" %>">
            </div>
            <input type="hidden" name="idUsuario" id="idUsuario" value="<%=userDetails.getId()%>">
            <!-- Agregar input para fecha si es necesario -->
            <!-- <div class="campos-form">
                    <label for="fechaNac">Fecha de nacimiento:</label><br>
                    <input type="date" disabled name="fechaNac" id="fechaNac" value="<%= userDetails != null ? userDetails.getFecha_creacion() : "" %>">
                </div> -->
            <div class="div-btn">
                <button type="button" id="activar-btn" onclick="activarInputs()">Editar perfil</button>
                <button type="submit" id="guardar-btn" style="display: none;" onclick="mostrarModalConfirmacion()">Guardar</button>
            </div>
        </form>
    </div>
</div>
<%
    // Obtener el mensaje de la sesión
    String mensaje = (String) session.getAttribute("mensaje");
    // Eliminar el atributo de sesión después de obtener el mensaje
    session.removeAttribute("mensaje");
%>

<% if (mensaje != null && !mensaje.isEmpty()) { %>
<div class="modal-custom" style="display: block;">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">&times;</span>
            <h2>Mensaje</h2>
        </div>
        <div class="modal-body-custom">
            <p><%= mensaje %></p>
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">Cerrar</button>
        </div>
    </div>
</div>
<% } %>
<!-- Modal de Confirmación -->
<div id="modalConfirmacion" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom" onclick="cerrarModalConfirmacion()">&times;</span>
            <h2>Confirmación</h2>
        </div>
        <div class="modal-body-custom">
            <p>¿Estás seguro de que deseas guardar los cambios?</p>
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="confirmarGuardar()">Sí</button>
            <button class="btn-custom" onclick="cerrarModalConfirmacion()">No</button>
        </div>
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
    function mostrarModalConfirmacion() {
        document.getElementById('modalConfirmacion').style.display = 'block';
        return false;  // Prevenir el envío del formulario
    }

    function cerrarModalConfirmacion() {
        document.getElementById('modalConfirmacion').style.display = 'none';
    }

    function confirmarGuardar() {
        document.getElementById('modalConfirmacion').style.display = 'none';
        document.getElementById('perfilForm').submit();  // Enviar el formulario
    }
    // Prevenir el envío del formulario hasta que se confirme
    document.getElementById('perfilForm').addEventListener('submit', function(event) {
        event.preventDefault();  // Prevenir el envío del formulario
        mostrarModalConfirmacion();  // Mostrar el modal de confirmación
    });
    document.getElementById('edad').addEventListener('input', function () {
        const maxLength = 3; // Máximo de 3 dígitos
        let value = this.value;

        if (value.length > maxLength) {
            this.value = value.slice(0, maxLength); // Truncar a 3 dígitos
        }
    });
</script>
</body>
</html>
