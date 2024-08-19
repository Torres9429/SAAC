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

    <jsp:include page="headerMenuDocente.jsp" />
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 2) {
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
        padding: 30px;
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
    .form-group{
        margin: 15px;
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
        <form method="post" action="horarioDoc">
            <input type="hidden" name="source" value="agregarU">

                <div class="form-group">
                    <label for="dia">Día:</label>
                    <input type="date" name="dia" id="dia" class="form-control">
                </div>
                <div class="form-group" hidden="hidden">
                    <label for="id_usuario">Id usuario:</label>
                    <input type="hidden" id="id_usuario" name="id_usuario" value="${user.id}">
                </div>
                <div class="form-group">
                    <label for="hora-inicio">Hora de inicio:</label>
                    <input type="time" id="hora-inicio" name="hora-inicio" class="form-control" placeholder="Hora de inicio">
                </div>
                <div class="form-group">
                    <label for="hora-fin">Hora de fin:</label>
                    <input type="time" id="hora-fin" name="hora-fin" class="form-control" placeholder="Hora de fin">
                </div>
                <div class="form-group">
                    <label for="materia">Materia:</label>
                    <select class="custom-select" name="materia" id="materia">
                        <option value="" selected disabled>Materia</option>
                        <c:forEach items="${materias}" var="materia">
                            <option value="${materia.id_materia}">${materia.materia}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="aula">Aula:</label>
                    <select class="custom-select" name="aula" id="aula">
                        <option value="" selected disabled>Aula</option>
                        <c:forEach items="${aulas}" var="aula">
                            <option value="${aula.id_aula}">${aula.aula} ${aula.edificio}</option>
                        </c:forEach>
                    </select>
                </div>


            <button type="submit" class="btn btn-custom" id="btnSubmitRegistro" style="margin-top: 40px;">Agregar Asesoria</button>
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
            <button class="btn-custom-modal" onclick="this.parentElement.parentElement.parentElement.style.display='none'">Cerrar</button>
        </div>
    </div>
</div>
<% } %>


<script>


    <%
        } else {
            response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
        }
    %>
</script>
</body>
</html>
