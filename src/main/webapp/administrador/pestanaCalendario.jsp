<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="mx.edu.utez.saac.dao.AsesoriaDao" %>
<%@ page import="mx.edu.utez.saac.model.Asesoria" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Calendario</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/bootstrap.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .nav-tabs {
            background-color: #3A4C60;
            border-radius: 5px;
            padding: 10px;
        }
        .nav-tabs a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            padding: 10px 20px;
        }
        .nav-tabs a.active {
            background-color: #009475;
            border-radius: 5px;
        }
        .container {
            margin-top: 20px;
        }
        .calendar-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .calendar-table th, .calendar-table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        .calendar-table th {
            background-color: #40AE97;
            color: white;
        }
    </style>

    <jsp:include page="/administrador/headerMenuAdministrador.jsp" />
</head>
<body>
<%-- Filtros de sesión para ADMIN--%>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>
<div class="container">
    <div class="table-responsive">

    <table id="example" style="background-color: #80C9BA;" class="table table-striped table-hover">
        <thead>
        <tr>
            <th style="border: white 2px solid">Asesorías finalizadas</th>
            <th style="border: white 2px solid">Asesorías en curso</th>
            <th style="border: white 2px solid">Asesorías pendientes</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Obtener las asesorías de cada estado
            AsesoriaDao daoFinalizadas = new AsesoriaDao();
            ArrayList<Asesoria> finalizadas = daoFinalizadas.getFinalizadas();

            AsesoriaDao daoEnCurso = new AsesoriaDao();
            ArrayList<Asesoria> enCurso = daoEnCurso.getEnCurso();

            AsesoriaDao daoPendientes = new AsesoriaDao();
            ArrayList<Asesoria> pendientes = daoPendientes.getPendientes();

            // Calcular el número máximo de filas que necesitaremos
            int maxRows = Math.max(finalizadas.size(), Math.max(enCurso.size(), pendientes.size()));

            for (int i = 0; i < maxRows; i++) {
        %>
        <tr>
            <td style="border: white 2px solid">
                <%
                    if (i < finalizadas.size()) {
                        Asesoria a = finalizadas.get(i);
                %>
                <div><%= a.getDia() %> <%= a.getHora_inicio() %> - <%= a.getHora_fin() %><br>
                    <%= a.getMateria() %><br>
                    <%= a.getNombre_docente() %>
                </div>
                <% } %>
            </td>
            <td style="border: white 2px solid">
                <%
                    if (i < enCurso.size()) {
                        Asesoria a = enCurso.get(i);
                %>
                <div><%= a.getDia() %> <%= a.getHora_inicio() %> - <%= a.getHora_fin() %><br>
                    <%= a.getMateria() %><br>
                    <%= a.getNombre_docente() %>
                </div>
                <% } %>
            </td>
            <td style="border: white 2px solid">
                <%
                    if (i < pendientes.size()) {
                        Asesoria a = pendientes.get(i);
                %>
                <div><%= a.getDia() %> <%= a.getHora_inicio() %> - <%= a.getHora_fin() %><br>
                    <%= a.getMateria() %><br>
                    <%= a.getNombre_docente() %>
                </div>
                <% } %>
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
        response.sendRedirect(request.getContextPath() + "/accesoDenegado.jsp");
    }
%>
</body>
</html>
