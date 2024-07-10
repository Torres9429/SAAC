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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.css">
    <link rel="stylesheet"type="text/css"  href="css/bootstrap.css">
</head>
<body>
<script>

</script>
<style>
    .divTable{
        width: 60%;
    }
</style>
<jsp:include page="/headerMenuUsuario.jsp" />
<h3 style="color: red"><%=(String)request.getSession().getAttribute("mensaje")%></h3>
<div style="display: flex;">
    <h1>HABILITAR</h1>

<div class="divTable">
<table id="example" class="table table-striped table-hover">
    <thead>
    <tr>
        <th>Id</th>
        <th>Nombre</th>
        <th>Correo</th>
        <th>Estado</th>
        <th>Modificar</th>
        <th>E. Fisico</th>
        <th>Deshabilitar</th>
    </tr>
    </thead>
    <tbody>
    <%  // necesitamos acceder a la base de datos y obtener
        // TODOS los usuarios
        UsuarioDao dao = new UsuarioDao();
        ArrayList<Usuario> lista = dao.getAll();
        for(Usuario u : lista){//Por cada usuario de la lista %>
    <tr>
        <td><%=u.getId()%></td>
        <td><%=u.getNombre()%></td>
        <td><%=u.getCorreo()%></td>
        <td><%=u.isEstado() ? "Habilitado":"Deshabilitado"%></td>
        <td><a href="sign_in?id=<%=u.getId()%>">Actualizar</a></td>
        <td><a href="habilitar?id=<%=u.getId()%>">Habilititar</a></td>
        <td><a href="deshabilitar?id=<%=u.getId()%>">Deshabilitar</a></td>
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
            }
        });
    });
</script>
<%
    request.getSession().removeAttribute("mensaje");
%>
</body>
</html>