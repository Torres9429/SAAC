<%@ page import="mx.edu.utez.saac.dao.MateriaDao" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eliminar Materia</title>
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
    </style>
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Eliminar Materia</h1>
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
                    <form action="${pageContext.request.contextPath}/eliminarMateria" method="post">
                        <input type="hidden" name="id_materia" value="<%= m.getId_materia() %>">
                        <input type="submit" value="Eliminar">
                    </form>
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
            pageLength: 10
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
