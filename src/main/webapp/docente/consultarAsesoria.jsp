<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="mx.edu.utez.saac.model.Horario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Consultar Asesoría</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="/docente/headerMenuDocente.jsp" />
    <style>
        .divTable {
            width: 80%;
            margin: 15px;
            height: 100%;
        }
        .divText {
            border-right: 4px solid #BFB4B4;
            width: 20%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: #009475;
            height: 100%;
            margin: 15px;
        }
        table {
            width: 90%;
            margin: 40px auto;
            border-collapse: collapse;
            text-align: center;
            background-color: #80C9BA;
            color: #002E60;
        }
        th, td {
            padding: 12px;
            border-bottom: 2px solid #ddd;
            border-right: 2px solid #ddd;
            height: 70px;
        }
        td {
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
        button:hover {
            background-color: #4B6B76;
            color: white;
        }
        .header-div {
            width: 100%;
            height: 100%;
            text-align: center;
            background-color: #33A991;
            box-shadow: 0 4px 4px -2px rgba(0, 0, 0, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 12px;
            box-sizing: border-box;
            position: relative;
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
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 2) {
        List<Materia> materias = (List<Materia>) request.getAttribute("materias");
        List<Horario> horarios = (List<Horario>) request.getAttribute("horarios");

        // Obtener el mensaje de la sesión
        String mensaje = (String) session.getAttribute("mensaje");
        // Eliminar el atributo de sesión después de obtener el mensaje
        session.removeAttribute("mensaje");
%>

<!-- Modal de mensaje -->
<div id="mensajeModal" class="modal-custom" style="display: <%= mensaje != null ? "block" : "none" %>;">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">&times;</span>
            <h2>Mensaje</h2>
        </div>
        <div class="modal-body-custom">
            <p><%= mensaje %></p>
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="document.getElementById('mensajeModal').style.display='none'">Cerrar</button>
        </div>
    </div>
</div>

<!-- Código de la tabla y el modal de edición -->
<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Consultar Asesoría</h1>
    </div>
    <div class="divTable">
        <table>
            <tr>
                <th colspan="4" style="padding: 0; border-bottom: none; font-size: larger; font-weight: bolder">
                    <div class="header-div">Horarios</div>
                </th>
            </tr>
            <tr>
                <th>Fecha</th>
                <th>Horario</th>
                <th>Materia</th>
                <th>Operación</th>
            </tr>
            <c:choose>
                <c:when test="${empty horarios}">
                    <p>No hay horarios disponibles.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${horarios}" var="horario">
                        <tr>
                            <td>${horario.dia}</td>
                            <td>${horario.hora_inicio} - ${horario.hora_fin}</td>
                            <td>${horario.nombre_materia}</td>
                            <td>
                                <button class="openModalBtn"
                                        data-dia="${horario.dia}"
                                        data-hora-inicio="${horario.hora_inicio}"
                                        data-hora-fin="${horario.hora_fin}"
                                        data-materia="${horario.nombre_materia}"
                                        data-docente="${horario.nombre_docente}">Consultar</button>
                                        <!--AGREGAR PARA ESTADO ASESORIA-->
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>

<!-- Modal de consulta -->
<div id="myModal" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom">&times;</span>
            <h2>Información</h2>
        </div>
        <div class="modal-body-custom">
            <div class="form-group-custom">Horario: <span id="modalHoraInicio"></span> - <span id="modalHoraFin"></span></div>
            <div class="form-group-custom">Día: <span id="modalDia"></span></div>
            <div class="form-group-custom">Materia: <span id="modalMateria"></span></div>
            <div class="form-group-custom">Docente: <span id="modalDocente"></span></div>
            <!--<div class="form-group-custom">Estado: <span id="modalEstado"></span></div>-->
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="document.getElementById('myModal').style.display='none'">Cerrar</button>
        </div>
    </div>
</div>

<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>

<script>
    // Abre el modal de edición cuando se hace clic en cualquier botón "Editar"
    document.addEventListener('DOMContentLoaded', function () {
        var modal = document.getElementById("myModal");
        var btns = document.getElementsByClassName("openModalBtn");
        var span = document.getElementsByClassName("close-custom")[0];

        span.onclick = function () {
            modal.style.display = "none";
        }

        Array.from(btns).forEach(function (btn) {
            btn.onclick = function () {
                document.getElementById('modalHoraInicio').textContent = this.getAttribute("data-hora-inicio");
                document.getElementById('modalHoraFin').textContent = this.getAttribute("data-hora-fin");
                document.getElementById('modalMateria').textContent = this.getAttribute("data-materia");
                document.getElementById('modalDocente').textContent = this.getAttribute("data-docente");
                document.getElementById('modalDia').textContent = this.getAttribute("data-dia");
                //document.getElementById('modalEstado').textContent = this.getAttribute("data-estado");

                modal.style.display = "block";
            }
        });

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>
</body>
</html>
