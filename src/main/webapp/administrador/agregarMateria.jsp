<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saac.dao.CarreraDao" %>
<%@ page import="mx.edu.utez.saac.model.Carrera" %>
<%@ page import="mx.edu.utez.saac.dao.MateriaDao" %>
<%@ page import="mx.edu.utez.saac.model.Materia" %>
<%@ page import="mx.edu.utez.saac.model.Division" %>
<%@ page import="mx.edu.utez.saac.dao.DivisionDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Agregar Materia</title>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='../css/bootstrap.css'>
    <!--style>
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
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
        }
        .container {
            margin-top: 50px;
        }
        .box {
            background-color: #80C9BA;
            padding: 40px;
            border-radius: 8px;
            width: 60%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
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
            height: 100vh; /* Añadido para ocupar toda la altura de la ventana */
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
        .form-group {
            margin-bottom: 15px;
            width: 100%;
        }
        .form-group label {
            color: #002E60;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .btn-primary {
            background-color: #3A4C60;
            border-color: #007BFF;
            padding: 10px 20px;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary:hover {
            background-color: #2c3e50;
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

        .form-group-custom {
            margin-bottom: 15px;
        }

        .btn-custom {
            background-color: #002E60;
            color: white;
            border: none;
            cursor: pointer;
            margin: 10px;
            height: 30px;
            align-items: center;
            align-content: center;
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
    </style-->
    <jsp:include page="/administrador/headerMenuAdministrador.jsp" />
</head>
<body>
<style>
    body {
        background-color: #f8f9fa;
    }
    .container {
        margin-top: 50px;
    }
    .form-container {
        background-color: #80C9BA;
        padding: 20px;
        border-radius: 10px;
        margin: 10px;
        height: 100%;
        width: 100%;
    }
    .form-title {
        color: #009475;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .form-group label {
        color: #002E60;
        font-weight: bold;
    }
    .form-group input, .form-group select {
        border: none;
        border-radius: 5px;
        box-shadow: none;
    }
    .btn-custom {
        background-color: #3A4C60;
        color: white;
        border: none;
        border-radius: 5px;
        width: auto;
        height: 40px;
        font-size: 18px;
        margin-left: 45%;
    }
    .btn-custom:hover {
        background-color: #536880;
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

    .form-group-custom {
        margin-bottom: 15px;
    }

    .btn-custom-modal {
        background-color: #002E60;
        color: white;
        border: none;
        cursor: pointer;
        margin: 10px;
        height: 30px;
        align-items: center;
        align-content: center;
    }

    .btn-custom-modal:hover {
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
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 1) {
%>

<div style="display: flex; align-content: center; height: 100%; width: 100%; padding: 10px;">
    <div class="divText">
        <h1>Agregar Materia</h1>
    </div>
    <div class="form-container">
        <form method="post" action="agregarMateria">
            <div class="form-group">
                <label for="materia">Materia:</label>
                <input type="text" class="form-control" id="materia" name="materia" required>
            </div>
            <div class="form-group">
                <select class="form-control" name="selectDivision" id="selectDivision">
                    <option value="">División académica</option>
                    <%
                        DivisionDao dao = new DivisionDao();
                        ArrayList<Division> lista = dao.getAll();
                        for(Division d : lista) {
                    %>
                    <option value="<%= d.getId_division()%>"><%=d.getDivision_academica()%></option>
                    <%}%>
                </select>
            </div>
            <div class="form-group">
                <select class="form-control" name="selectCarrera" id="selectCarrera">
                    <option value="" selected disabled>Carrera</option>
                </select>
            </div>
            <button type="submit" class="btn btn-custom" id="btnSubmitRegistro" style="margin-top: 40px;">Agregar Asesoria</button>
        </form>
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
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var selectDivision = document.getElementById('selectDivision');
        var selectCarrera = document.getElementById('selectCarrera');
        var selectMateria = document.getElementById('selectMateria');

        var carreras = [];
        <%
            CarreraDao daoC = new CarreraDao();
            ArrayList<Carrera> listaC = daoC.getAll();
            for(Carrera c : listaC) {
        %>
        carreras.push({id: "<%= c.getId_carrera() %>", nombre: "<%= c.getCarrera() %>", divisionId: "<%= c.getId_division() %>"});
        <%
            }
        %>

        var materias = [];
        <%
            MateriaDao daoM = new MateriaDao();
            ArrayList<Materia> listaM = daoM.getAll();
            for(Materia m : listaM) {
        %>
        materias.push({id: "<%= m.getId_materia() %>", nombre: "<%= m.getMateria() %>", carreraId: "<%= m.getId_carrera() %>"});
        <%
            }
        %>

        selectDivision.addEventListener('change', function() {
            var divisionId = this.value;
            updateCarreras(divisionId);
        });

        selectCarrera.addEventListener('change', function() {
            var carreraId = this.value;
            updateMaterias(carreraId);
        });

        function updateCarreras(divisionId) {
            var filteredCarreras = carreras.filter(function(carrera) {
                return carrera.divisionId == divisionId;
            });

            selectCarrera.innerHTML = '<option value="" selected disabled>Carrera</option>';
            filteredCarreras.forEach(function(carrera) {
                var option = document.createElement('option');
                option.value = carrera.id;
                option.text = carrera.nombre;
                selectCarrera.appendChild(option);
            });

            selectMateria.innerHTML = '<option value="" selected disabled>Materia</option>';
        }

        function updateMaterias(carreraId) {
            var filteredMaterias = materias.filter(function(materia) {
                return materia.carreraId == carreraId;
            });

            selectMateria.innerHTML = '<option value="" selected disabled>Materia</option>';
            filteredMaterias.forEach(function(materia) {
                var option = document.createElement('option');
                option.value = materia.id;
                option.text = materia.nombre;
                selectMateria.appendChild(option);
            });
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
