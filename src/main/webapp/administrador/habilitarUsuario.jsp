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
    <title>Habilitar/Deshabilitar</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="stylesheet"type="text/css"  href="../css/bootstrap.css">
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
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
    input{
        background-color: #3A4C60;
        border-radius: 5px;
        color: white;
        width: 90px;
        height: 30px;
        border: hidden;
        text-align: center;
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


<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Habilitar/ Deshabilitar usuario</h1>
    </div>
    <div class="divTable">
    <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover" >
        <thead>
        <tr style="background-color: #80C9BA;">
            <th>Id</th>
            <th>Matrícula</th>
            <th>Datos</th>
            <th>Estado</th>
            <th>Modificar</th>
            <th></th>
            <th></th>
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
                <%=u.getCorreo()%>
            </td>
            <td><%=u.isEstado() ? "Habilitado":"Deshabilitado"%></td>
            <td><a href="sign_in?id=<%=u.getId()%>">Actualizar</a></td>
            <td><a href="${pageContext.request.contextPath}/habilitar?id=<%=u.getId()%>&page=habilitar">Habilitar</a></td>
            <td><a href="../deshabilitar?id=<%=u.getId()%>">Deshabilitar</a></td>
        </tr>
        <% } %>
        </tbody>
    </table>
    </div>
</div>

<%
    // Obtener el mensaje de la sesión
    String mensaje = (String) session.getAttribute("mensajeHabilitacion");
    // Eliminar el atributo de sesión después de obtener el mensaje
    session.removeAttribute("mensajeHabilitacion");
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


</script>
<%
    } else {
    response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>