<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Agregar Asesoría</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="/docente/headerMenuDocente.jsp" />
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    user.getId();
    if (user != null && user.getId_tipo_usuario() == 2) {
        List<Materia> materias = (List<Materia>) request.getAttribute("materias");
%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var modal = document.getElementById("myModal");
        var btns = document.getElementsByClassName("openModalBtn");
        var span = document.getElementsByClassName("close-custom")[0];
        var closeBtn = document.getElementById("submit-btn");
        var cancelBtn = document.getElementById("cancel-btn");
        var diaSelect = document.getElementById("dia");

        // Abre el modal cuando se hace clic en cualquier botón "Agregar"
        Array.from(btns).forEach(function(btn) {
            btn.onclick = function() {
                // Establece el día en el modal según el botón que se presionó
                var dia = this.getAttribute('data-day');
                diaSelect.value = dia;

                modal.style.display = "block";
            }
        });

        // Cierra el modal al hacer clic en el botón "Cancelar"
        cancelBtn.onclick = function() {

            modal.style.display = "none";
        }

        // Cierra el modal al hacer clic en el botón "Solicitar"
        closeBtn.onclick = function() {
            document.getElementById('solicitud-form').submit();
            modal.style.display = "none";
            // Aquí puedes enviar el formulario o realizar otra acción
        }

        // Cierra el modal al hacer clic en el botón de cerrar (x)
        span.onclick = function() {
            modal.style.display = "none";
        }

        // Cierra el modal al hacer clic en cualquier lugar fuera de él
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>
<style>
    .divTable{
        width: 80%;
        margin: 15px;
        height: 100%;
    }
    .divText{
        border-right: 4px solid #BFB4B4;
        width: 20%; /* Ancho fijo del 20% */
        height: 85vh; /* Alto completo de la ventana de visualización */
        display: flex;
        flex-direction: column;
        justify-content: center; /* Centra verticalmente el contenido */
        align-items: center; /* Centra horizontalmente el contenido */
        color: #009475;
        margin: 15px;
        box-sizing: border-box; /* Incluye padding y border en el ancho y alto */
    }
    table {
        width: 90%;
        margin: 40px auto;
        border-collapse: collapse;
        text-align: center;
        background-color: #80C9BA ;
        color: #002E60;

    }
    th, td {
        padding: 12px;
        border-bottom: 2px solid #ddd;
        border-right: 2px solid #ddd;
        height: 70px;
    }
    td{
        font-size: larger;
    }
    th {
        background-color: #80C9BA;
        color: #002E60;
        font-size: large;
        font-weight: bold;
    }
    button {
        background-color: #3A4C60;
        border: none;
        color: white;
        text-align: center;
        display: inline-block;
        font-size: 16px;
        width: 100px;
        cursor: pointer;
        border-radius: 4px;
        height: 30px;
    }
    button:hover{
        background-color: #4B6B76;
        color: white;
    }
    .header-div {
        width: 100%;
        height: 100%;
        text-align: center;
        background-color: #33A991;
        box-shadow: 0 4px 4px -2px rgba(0, 0, 0, 0.3); /* Sombra hacia abajo */
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0; /* Elimina cualquier margen */
        padding: 12px; /* Elimina cualquier padding */
        box-sizing: border-box;
        position: relative; /* Añadido para z-index funcione */
        z-index: 2;
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

    .btn-custom {
        background-color: #002E60;
        color: white;
        border: none;
        cursor: pointer;
        margin: 10px;
        height: 30px;
        align-items: center;
        align-content: center;
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
<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Agregar Asesoría</h1>
    </div>
    <div class="divTable">
        <table>
            <tr>
                <th colspan="4" style="padding: 0;  border-bottom: none; font-size: larger; font-weight: bolder">
                    <div class="header-div">Horarios</div>
                </th>
            </tr>
            <tr>
                <th>Días disponibles</th>
                <th>Horario</th>
                <th>Materia</th>
                <th>Operación</th>
            </tr>
            <tr>
                <td>Lunes</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Lunes">Agregar</button></td>
            </tr>
            <tr>
                <td>Martes</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Martes">Agregar</button></td>
            </tr>
            <tr>
                <td>Miércoles</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Miércoles">Agregar</button></td>
            </tr>
            <tr>
                <td>Jueves</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Jueves">Agregar</button></td>
            </tr>
            <tr>
                <td>Viernes</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Viernes">Agregar</button></td>
            </tr>
            <tr>
                <td>Sábado</td>
                <td>-----------------</td>
                <td>-----------------</td>
                <td><button class="openModalBtn" data-day="Sábado">Agregar</button></td>
            </tr>
        </table>
    </div>
</div>

<div id="myModal" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom">&times;</span>
            <h2>Agregar horario</h2>
        </div>
        <div class="modal-body-custom">
            <form id="solicitud-form" method="post" action="horarioDoc">
                <div class="form-group-custom" >
                    <label for="dia">Día:</label>
                    <input type="date" name="dia" id="dia" class="form-control">
                </div>
                <div class="form-group-custom" hidden="hidden">
                    <label for="hora-inicio">Id usuario:</label>
                    <input type="hidden" id="id_usuario" name="id_usuario" value="${user.id}">
                </div>
                <div class="form-group-custom">
                    <label for="hora-inicio">Hora de inicio:</label>
                    <input type="time" id="hora-inicio" name="hora-inicio" class="form-control" placeholder="Hora de inicio">
                </div>
                <div class="form-group-custom">
                    <label for="hora-fin">Hora de fin:</label>
                    <input type="time" id="hora-fin" name="hora-fin" class="form-control" placeholder="Hora de fin">
                </div>
                <div class="form-group-custom">
                    <label for="materia">Materia:</label>
                    <select class="custom-select" name="materia" id="materia">
                        <option value="" selected disabled>Materia</option>
                        <c:forEach items="${materias}" var="materia">
                            <option value="${materia.id_materia}">${materia.materia}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group-custom">
                    <label for="aula">Aula:</label>
                    <select class="custom-select" name="aula" id="aula">
                        <option value="" selected disabled>Aula</option>
                        <c:forEach items="${aulas}" var="aula">
                            <option value="${aula.id_aula}">${aula.aula} ${aula.edificio}</option>
                        </c:forEach>
                    </select>
                </div>
            </form>
        </div>
        <div class="modal-footer-custom">
            <button id="submit-btn" class="btn-custom">Agregar</button>
            <button id="cancel-btn" class="btn-custom">Cancelar</button>
        </div>
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

<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>
