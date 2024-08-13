<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mx.edu.utez.saac.dao.UsuarioDao" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: rocit
  Date: 08/07/2024
  Time: 09:24 p. m.
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Modificar usuario</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <jsp:include page="headerMenuAdministrador.jsp" />
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
        <h1>Modificar usuario</h1>
    </div>
    <div class="divTable">
        <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover" >

            <thead>
            <tr style="background-color: #80C9BA;">
                <th>Id</th>
                <th>Matrícula</th>
                <th>Datos</th>
                <th>Correo</th>
                <th>Estado</th>
                <th>Cargo</th>
                <th>Operación</th>
            </tr>
            </thead>
            <tbody>
            <%  // necesitamos acceder a la base de datos y obtener
                // TODOS los usuarios
                UsuarioDao dao = new UsuarioDao();
                ArrayList<Usuario> lista = dao.getAll();
                for(Usuario u : lista){//Por cada usuario de la lista %>
            <tr style="background-color: #80C9BA;">
                <td><%=u.getId()%></td>
                <td><%=u.getMatricula()%></td>

                <td><%=u.getNombre()%>
                    <%=u.getApellido_paterno()%>
                    <%=u.getApellido_materno()%> <br>
                    <%=u.getEdad()%> años

                </td>
                <td><%=u.getCorreo()%></td>
                <td><%=u.isEstado() ? "Habilitado":"Deshabilitado"%></td>
                <td>
                    <%
                        String tipoUsuario = "";
                        int idTipoUsuario = u.getId_tipo_usuario();

                        if (idTipoUsuario == 1) {
                            tipoUsuario = "Admin";
                        } else if (idTipoUsuario == 2) {
                            tipoUsuario = "Docente";
                        } else if (idTipoUsuario == 3) {
                            tipoUsuario = "Estudiante";
                        }
                    %>
                    <%= tipoUsuario %>
                </td>
                <td><button class="openModalBtn"
                            data-id-usuario="<%=u.getId()%>"
                            data-nombre="<%=u.getNombre()%>"
                            data-paterno="<%=u.getApellido_paterno()%>"
                            data-materno="<%=u.getApellido_materno()%>"
                            data-edad="<%=u.getEdad()%>">Modificar</button></td>

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
            <h2>Modificar usuario</h2>
        </div>
        <div class="modal-body-custom">
            <form id="solicitud-form" method="post" action="${pageContext.request.contextPath}/perfil">
                <div class="form-group-custom">
                    <label for="idUsuario">Id:</label>
                    <input type="number" name="idUsuario" id="idUsuario" class="form-control" readonly>
                </div>
                <div class="form-group-custom">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre"  maxlength="45" class="form-control">
                </div>
                <div class="form-group-custom" >
                    <label for="apellido_paterno">Apellido paterno:</label>
                    <input type="text" id="apellido_paterno" name="apellido_paterno" maxlength="45" class="form-control">
                </div>
                <div class="form-group-custom" >
                    <label for="apellido_materno">Apellido paterno:</label>
                    <input type="text" id="apellido_materno" name="apellido_materno" maxlength="45" class="form-control">
                </div>
                <div class="form-group-custom">
                    <label for="edad">Edad:</label>
                    <input type="number" id="edad" name="edad" maxlength="3" class="form-control" >
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
            pageLength: 7
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
                var idUsuario = this.getAttribute("data-id-usuario");
                var nombre = this.getAttribute("data-nombre");
                var paterno = this.getAttribute("data-paterno");
                var materno = this.getAttribute("data-materno");
                var edad = this.getAttribute("data-edad");

                document.getElementById('idUsuario').value = idUsuario;
                document.getElementById('nombre').value = nombre;
                document.getElementById('apellido_paterno').value = paterno;
                document.getElementById('apellido_materno').value = materno;
                document.getElementById('edad').value = edad;

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
