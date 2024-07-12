<%--
  Created by IntelliJ IDEA.
  User: rocit
  Date: 11/07/2024
  Time: 10:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Aprobar Usuario</title>
    <jsp:include page="headerMenuAdministrador.jsp"/>
</head>
<body>

<div style="display: flex; align-content: center; height: 80%">
    <div class="divText" style="" >
        <h1>Habilitar/ Deshabilitar usuario</h1>
    </div>


    <div class="divTable">
        <table id="example" style="background-color: #80C9BA; height: 100%" class="table table-striped table-hover" >
            <thead>
            <tr style="background-color: #80C9BA;">
                <th>Id</th>
                <th>Matrícula</th>
                <th>Datos</th>
                <th>Estado</th>
                <th>Aprobar / rechazar</th>
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
                <td><a href="habilitar?id=<%=u.getId()%>">Habilitar</a></td>
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


        // Obtener mensaje de sesión
        const mensaje = '<%= (String) session.getAttribute("mensajeHabilitacion") %>';

        // Mostrar alert solo si el mensaje no es nulo ni vacío
        if (mensaje && mensaje.trim().length > 0 && mensaje !== "null") {
            const modal = document.createElement('div');
            modal.classList.add('modal-custom');
            modal.innerHTML = `
                <div class="modal-content-custom">
                    <div class="modal-header-custom">
                        <span class="close-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">&times;</span>
                        <h2>Mensaje</h2>
                    </div>
                    <div class="modal-body-custom">
                        <p>${mensaje}</p>
                    </div>
                    <div class="modal-footer-custom">
                        <button class="btn-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">Cerrar</button>
                    </div>
                </div>
            `;
            document.body.appendChild(modal);
            modal.style.display = 'block';
        }


        // Eliminar el atributo de sesión después de mostrar el mensaje
        <% session.removeAttribute("mensajeHabilitacion"); %>

    });

</script>

</body>
</html>
