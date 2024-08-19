<%@ page import="mx.edu.utez.saac.dao.MateriaDao" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="mx.edu.utez.saac.model.Carrera" %>
<%@ page import="mx.edu.utez.saac.dao.CarreraDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modificar Materia</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <jsp:include page="/administrador/headerMenuAdministrador.jsp" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
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
        th, td {
            border-color: white;
            color: #002E60;
            text-align: center;
        }
        input {
            background-color: #3A4C60;
            border-radius: 5px;
            color: white;
            width: 90px;
            height: 30px;
            border: hidden;
            text-align: center;
            cursor: pointer;
        }
        .modal-custom {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
        .modal-content-custom {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
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
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Modificar Materia</h1>
    </div>
    <div class="divTable">
        <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover">
            <thead>
            <tr style="background-color: #80C9BA;">
                <th>Id</th>
                <th>Nombre de la materia</th>
                <th>Carrera</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <%
                MateriaDao dao = new MateriaDao();
                ArrayList<Materia> lista = dao.getAll();
                for (Materia m : lista) {
            %>
            <tr style="background-color: #80C9BA;">
                <td><%= m.getId_materia() %></td>
                <td><%= m.getMateria() %></td>
                <td><%= m.getCarrera() %></td>
                <td>
                    <button class="openModalBtn"
                            data-id-materia="<%= m.getId_materia() %>"
                            data-nombre="<%= m.getMateria() %>"
                            data-carrera="<%= m.getCarrera() %>">Modificar</button>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal de edición -->
<div id="myModal" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom">&times;</span>
            <h2>Modificar materia</h2>
        </div>
        <div class="modal-body-custom">
            <form id="solicitud-form" method="post" action="${pageContext.request.contextPath}/modificarMateria">
                <div class="form-group-custom">
                    <label for="idMateria">Id:</label>
                    <input type="number" name="idMateria" id="idMateria" class="form-control" readonly>
                </div>
                <div class="form-group-custom">
                    <label for="materia">Materia:</label>
                    <input type="text" id="materia" name="materia" maxlength="45" class="form-control">
                </div>
                <div class="form-group-custom">
                    <select class="form-control" name="carrera" id="carrera" required>
                        <option value="" selected disabled>Carrera</option>
                        <%
                            CarreraDao daoA = new CarreraDao();
                            ArrayList<Carrera> listaA = daoA.getAll();
                            for(Carrera A : listaA){
                        %>
                        <option value="<%= A.getId_carrera() %>"><%= A.getCarrera() %></option>
                        <% } %>
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
            pageLength: 8
        });
    });

    // Abre el modal de edición cuando se hace clic en cualquier botón "Modificar"
    document.addEventListener('DOMContentLoaded', function () {
        var modal = document.getElementById("myModal");
        var btns = document.getElementsByClassName("openModalBtn");
        var span = document.getElementsByClassName("close-custom")[0];
        var closeBtn = document.getElementById("submit-btn");
        var cancelBtn = document.getElementById("cancel-btn");

        Array.from(btns).forEach(function (btn) {
            btn.onclick = function () {
                var idMateria = this.getAttribute("data-id-materia");
                var nombre = this.getAttribute("data-nombre");
                var carrera = this.getAttribute("data-carrera");

                document.getElementById('idMateria').value = idMateria;
                document.getElementById('materia').value = nombre;

                // Seleccionar la opción correspondiente en el campo de carrera
                var carreraSelect = document.getElementById('carrera');
                carreraSelect.value = carrera;

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
<%
    } else {
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
    }
%>
</body>
</html>
