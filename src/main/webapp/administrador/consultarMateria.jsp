<%@ page import="mx.edu.utez.saac.dao.MateriaDao" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Consultar Materia</title>
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
        .form-container {
            display: flex;
            height: 100vh;
        }
        .form-sidebar {
            width: 20%;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-right: 2px solid #009475;
            padding: 15px;
        }
        .form-sidebar h1 {
            color: #009475;
        }
        .form-content {
            width: 80%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .box {
            background-color: #009475;
            padding: 40px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .form-group label {
            color: #ffffff;
            margin-right: 10px;
        }
        .form-group input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }
        .form-group button {
            padding: 10px 20px;
            background-color: #3A4C60;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #2c3e50;
        }
        .data-box {
            background-color: #E0F2F1;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            color: #002E60;
        }
        .data-box p {
            margin: 5px 0;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .btn-container button {
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #3A4C60;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-container button:hover {
            background-color: #2c3e50;
        }
        .icono {
            width: 100px;
            height: auto;
            display: block;
            margin: 0 auto 20px;
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
        th {
            border-color: white;
            color: #002E60;
        }
        input {
            background-color: #3A4C60;
            border-radius: 5px;
            color: white;
            width: 90px;
            height: 30px;
            border: hidden;
            text-align: center;
        }
    </style>
</head>
<body>
<%-- Filtros de sesión para ADMIN--%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div style="display: flex; align-content: center; height: 80%">
    <div class="divText">
        <h1>Consultar Materia</h1>
    </div>
    <div class="divTable">
        <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover">
            <thead>
            <tr style="background-color: #80C9BA;">
                <th>Id</th>
                <th>Nombre de la materia</th>
                <th>Carrera</th>
            </tr>
            </thead>
            <tbody>
            <%
                MateriaDao dao = new MateriaDao();
                ArrayList<Materia> lista = dao.getAll();
                for (Materia m : lista) {
            %>
            <tr style="background-color: #80C9BA;">
                <td><%=m.getId_materia()%></td>
                <td><%= m.getMateria() %></td>
                <td><%=m.getCarrera() %></td>
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
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
    }
%>
</body>
</html>
