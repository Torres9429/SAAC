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
    <title>Consultar usuarios</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="stylesheet"type="text/css"  href="../css/bootstrap.css">
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
    input{
        background-color: #3A4C60;
        border-radius: 5px;
        color: white;
        width: 90px;
        height: 30px;
        border: hidden;
        text-align: center;
    }

</style>


<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Consultar Usuario</h1>
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

            </tr>
            <% } %>
            </tbody>
        </table>
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