<%@ page import="mx.edu.utez.saac.model.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: estef
  Date: 04/07/2024
  Time: 09:02 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 3) {
%>


<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>
