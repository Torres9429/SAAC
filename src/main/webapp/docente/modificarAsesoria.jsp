<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="mx.edu.utez.saac.model.Horario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.dao.AulaDao" %>
<%@ page import="mx.edu.utez.saac.model.Aula" %>
<%@ page import="mx.edu.utez.saac.dao.HorarioDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Modificar Asesoría</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
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
            z-index: 5000;
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
        <h1>Modificar Asesoría</h1>
    </div>

    <div class="divTable">
        <div>
        <table  style="background-color: #80C9BA; margin-top: 0; margin-bottom: 0;" class="table table-striped table-hover">
            <tr>
                <th style="padding: 0; border-bottom: none; font-size: larger; font-weight: bolder; margin: 0">
                    <div class="header-div">Horarios</div>
                </th>
            </tr>
        </table>
        </div>
        <table id="example" style="background-color: #80C9BA; margin-top: 0;" class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Horario</th>
                    <th>Materia</th>
                    <th>Lugar</th>
                    <th>Operación</th>

                </tr>
            </thead>

            <%--
                HorarioDao dao = new HorarioDao();
                ArrayList<Horario> lista = dao.getAll();
                for(Horario h : lista){ %>
            <tr>
                <td><%=h.getDia()%></td>
                <td><%=h.getHora_inicio()%> - <%=h.getHora_fin()%> </td>
                <td><%=h.getNombre_materia()%> </td>
                <td><%=h.getAula()%>  <%=h.getEdificio()%> </td>
                <td>
                    <button class="openModalBtn"
                            data-id-horario="<%=h.getId_horario()%>"
                            data-dia="<%=h.getDia()%> "
                            data-hora-inicio="<%=h.getHora_inicio()%> "
                            data-hora-fin="<%=h.getHora_fin()%> "
                            data-materia="<%=h.getMateria()%> "
                            data-lugar="<%=h.getAula()%>  - <%=h.getEdificio()%> ">Editar</button>
                </td>
            </tr> <% } --%>
            <tbody>
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
                            <td>${horario.aula} ${horario.edificio}</td>
                            <td>
                                <button class="openModalBtn"
                                        data-id-horario="${horario.id_horario}"
                                        data-dia="${horario.dia}"
                                        data-hora-inicio="${horario.hora_inicio}"
                                        data-hora-fin="${horario.hora_fin}"
                                        data-materia="${horario.materia}"
                                        data-lugar="${horario.aula} - ${horario.edificio}">Editar</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>

        </table>
    </div>
</div>

<!-- Modal de edición -->
<div id="myModal" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom">&times;</span>
            <h2>Modificar horario</h2>
        </div>
        <div class="modal-body-custom">
            <form id="solicitud-form" method="post" action="getHorarios">
                <div class="form-group-custom">
                    <label for="dia">Día:</label>
                    <input type="date" name="dia" id="dia" class="form-control">
                </div>
                <div class="form-group-custom" hidden>
                    <label for="hora-inicio">Id usuario:</label>
                    <input type="hidden" id="id_usuario" name="id_usuario" value="${user.id}">
                </div>
                <div class="form-group-custom" hidden>
                    <label for="id_horario">Id horario:</label>
                    <input type="hidden" id="id_horario" name="id_horario">
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
                        <%
                            AulaDao daoA = new AulaDao();
                            ArrayList<Aula> listaA = daoA.getAula();
                            for(Aula A : listaA){//Por cada usuario de la lista
                        %>
                            <option value="<%= A.getId_aula()%>"><%=A.getAula() +" "+ A.getEdificio()%></option>
                       <%}%>
                    </select>
                </div>
            </form>
        </div>
        <div class="modal-footer-custom">
            <button id="submit-btn" class="btn-custom">Guardar</button>
            <button id="cancel-btn" class="btn-custom">Cancelar</button>
        </div>
    </div>
</div>

<%
    } else {
        response.sendRedirect("${pageContext.request.contextPath}/accesoDenegado.jsp");
    }
%>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.0.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/datatables.js"></script>
<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap5.js"></script>
<script src="${pageContext.request.contextPath}/js/es-MX.json"></script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const table = document.getElementById('example');
        new DataTable(table, {
            language: {
                url: '${pageContext.request.contextPath}/js/es-MX.json'
            },
            pageLength: 5,
            responsive: true
        });

    });

    // Abre el modal de edición cuando se hace clic en cualquier botón "Editar"
    document.addEventListener('DOMContentLoaded', function () {
        var modal = document.getElementById("myModal");
        var btns = document.getElementsByClassName("openModalBtn");
        var span = document.getElementsByClassName("close-custom")[0];
        var closeBtn = document.getElementById("submit-btn");
        var cancelBtn = document.getElementById("cancel-btn");

        Array.from(btns).forEach(function (btn) {
            btn.onclick = function () {
                var idHorario = this.getAttribute("data-id-horario");
                var dia = this.getAttribute("data-dia");
                var horaInicio = this.getAttribute("data-hora-inicio");
                var horaFin = this.getAttribute("data-hora-fin");
                var materia = this.getAttribute("data-materia");
                var lugar = this.getAttribute("data-lugar");

                document.getElementById('id_horario').value = idHorario;
                document.getElementById('dia').value = dia;
                document.getElementById('hora-inicio').value = horaInicio;
                document.getElementById('hora-fin').value = horaFin;
                document.getElementById('materia').value = materia;
                document.getElementById("aula").value = lugar;

                modal.style.display = "block";
            }
        });

        cancelBtn.onclick = function () {
            modal.style.display = "none";
        }

        closeBtn.onclick = function () {
            document.getElementById('solicitud-form').submit();
            modal.style.display = "none";
        }

        span.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>
</body>
</html>
