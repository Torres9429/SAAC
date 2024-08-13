<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: rocit
  Date: 27/07/2024
  Time: 07:25 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Agregar usuario</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <!--script-- src="https://code.jquery.com/jquery-3.6.0.min.js"></script-->

    <jsp:include page="headerMenuAdministrador.jsp" />
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        margin-top: 50px;
    }
    .form-container {
        background-color: #80C9BA;
        padding: 20px;
        border-radius: 10px;
        margin: 10px;
        height: 100%;
        width: 100%;
    }
    .form-title {
        color: #009475;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .form-group label {
        color: #002E60;
        font-weight: bold;
    }
    .form-group input, .form-group select {
        border: none;
        border-radius: 5px;
        box-shadow: none;
    }
    .btn-custom {
        background-color: #3A4C60;
        color: white;
        border: none;
        border-radius: 5px;
        width: auto;
        height: 40px;
        font-size: 18px;
        margin-left: 45%;
    }
    .btn-custom:hover {
        background-color: #536880;
    }
    .divText{
        border-right: 4px solid #BFB4B4;
        width: 20%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center; /* Centra horizontalmente */
        color: #009475;
        height: 100%; /* Ocupa toda la altura del padre */
        margin: 15px;
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

    .btn-custom-modal {
        background-color: #002E60;
        color: white;
        border: none;
        cursor: pointer;
        margin: 10px;
        height: 30px;
        align-items: center;
        align-content: center;
    }

    .btn-custom-modal:hover {
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
<div style="display: flex; align-content: center; height: 85%; width: 100%; padding: 10px;">
        <div class="divText">
            <h1>Agregar Usuario</h1>
        </div>
            <div class="form-container">
                <form action="registrarUsuario" method="post" onsubmit="return validarCorreo()">
                    <input type="hidden" name="source" value="agregarU">
                    <div class="form-row">
                        <div class="form-group col-md-3">
                            <label for="nombreRegistro">Nombre</label>
                            <input type="text" class="form-control" id="nombreRegistro" name="nombreRegistro" placeholder="Nombre(s)" maxlength="45">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="paternoRegistro">Apellido Paterno</label>
                            <input type="text" class="form-control" id="paternoRegistro" name="paternoRegistro" placeholder="Apellido Paterno" maxlength="45">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="maternoRegistro">Apellido Materno</label>
                            <input type="text" class="form-control" id="maternoRegistro" name="maternoRegistro" placeholder="Apellido Materno" maxlength="45">
                        </div>
                        <div class="form-group col-md-3">
                            <label for="edadRegistro">Edad</label>
                            <input type="number" class="form-control" id="edadRegistro" name="edadRegistro" placeholder="Edad" maxlength="3">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="matriculaRegistro">Matrícula</label>
                        <input type="text" class="form-control" id="matriculaRegistro" name="matriculaRegistro"  maxlength="12" placeholder="Matrícula">
                    </div>
                    <div class="form-group">
                        <label for="carreraRegistro">Carrera</label>
                        <select id="carreraRegistro" name="carreraRegistro" class="form-control">
                            <option value="" selected disabled>Carrera</option>
                            <c:forEach items="${carreras}" var="carrera">
                                <option value="${carrera.id_carrera}">${carrera.carrera}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="rolRegistro">Tipo</label>
                        <select id="rolRegistro" name="rolRegistro" class="form-control">
                            <option selected>Usuario</option>
                            <option value="1">Admin</option>
                            <option value="2">Docente</option>
                            <option value="3">Estudiante</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="correoRegistro">Correo</label>
                        <input type="email" class="form-control" id="correoRegistro" name="correoRegistro" placeholder="Correo institucional" maxlength="45">
                        <div id="mensajeError" style="color: red; font-weight: bold;"></div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="contraseña1Registro" >Contraseña</label>
                            <input type="password" class="form-control" id="contraseña1Registro" name="contraseña1Registro" placeholder="Contraseña">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="contraseña2Registro">Confirmar contraseña</label>
                            <input type="password" class="form-control"  id="contraseña2Registro" name="contraseña2Registro" placeholder="Contraseña">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-custom" id="btnSubmitRegistro">Agregar Usuario</button>
                </form>
        </div>

</div>
<%
    // Obtener el mensaje de la sesión
    String mensaje = (String) session.getAttribute("mensajeError");
    // Eliminar el atributo de sesión después de obtener el mensaje
    session.removeAttribute("mensajeError");
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
            <button class="btn-custom-modal" onclick="this.parentElement.parentElement.parentElement.style.display='none'">Cerrar</button>
        </div>
    </div>
</div>
<% } %>


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
    <%
        } else {
        response.sendRedirect("../accesoDenegado.jsp");
        }
    %>
</script>
</body>
</html>
