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
</head>
<body>
<%-- Filtros de sesión para ADMIN--%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<style>
    .divTable{
        width: 80%;
        margin: 15px;
        height: 100%;
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
    th{
        border-color: white;
        color: #002E60;
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
        /*height: 30px;*/
    }
    button:hover {
        background-color: #4B6B76;
        color: white;
    }
    .custom-alert {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 300px;
        height: 250px;
        text-align: center;
        z-index: 1000;
    }

    .alert-header {
        background-color: #002E60;
        color: white;
        padding: 10px;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;

        font-size: 18px;
    }

    .alert-body {
        padding: 20px;
        font-size: 16px;
        color: #333;
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
    }
    .modal-footer-custom {
        display: flex;
        justify-content: center;
        padding: 10px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .form-group-custom{
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


<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Modificar materia</h1>
    </div>
    <div class="divTable">
        <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover" >
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
                    <input type="text" id="materia" name="materia" maxlength="45" class="form-control" required>
                </div>
                <div class="form-group-custom">
                    <select class="form-control" name="carrera" id="carrera" required>
                        <option value="Seleccione..." selected disabled>Carrera</option>
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
            pageLength: 10
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
    document.getElementById('edad').addEventListener('input', function () {
        const maxLength = 3; // Máximo de 3 dígitos
        let value = this.value;

        if (value.length > maxLength) {
            this.value = value.slice(0, maxLength); // Truncar a 3 dígitos
        }
    });

</script>
<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>
