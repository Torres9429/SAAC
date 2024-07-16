<%--
  Created by IntelliJ IDEA.
  User: rocit
  Date: 15/07/2024
  Time: 02:59 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Agregar Asesoría</title>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <jsp:include page="/docente/headerMenuDocente.jsp" />
</head>
<body>
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
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
        text-align: center;
        background-color: #80C9BA ;
        color: #002E60;
    }
    th, td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
        border-right: 1px solid #ddd;
    }
    th {
        background-color: #80C9BA;
        color: #002E60;
    }
    .btn {
        background-color: #3A4C60;
        border: none;
        color: white;
        text-align: center;
        display: inline-block;
        font-size: 16px;
        width: 100px;
        cursor: pointer;
        border-radius: 4px;
    }
    .btn:hover{
        background-color: #4B6B76;
        color: white;
    }
    .header-div {
        width: 100%;
        height: 100%;
        text-align: center;
        background-color: #33A991;
        box-shadow: 0 4px 4px -2px rgba(0, 0, 0, 0.3); /* Sombra hacia abajo */
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0; /* Elimina cualquier margen */
        padding: 12px; /* Elimina cualquier padding */
        box-sizing: border-box;
        position: relative; /* Añadido para z-index funcione */
        z-index: 2;
    }
</style>
    <div style="display: flex; align-content: center; height: 80%">>
        <div class="divText">
            <h1>Agregar Asesoría</h1>
        </div>
        <div class="divTable">
            <table>
                <tr>
                    <th colspan="4" style="padding: 0;  border-bottom: none;">
                        <div class="header-div">Horarios</div>
                    </th>
                </tr>
                <tr>
                    <th>Días disponibles</th>
                    <th>Horario</th>
                    <th>Materia</th>
                    <th>Operación</th>
                </tr>
                <tr>
                    <td>Lunes</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
                <tr>
                    <td>Martes</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
                <tr>
                    <td>Miércoles</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
                <tr>
                    <td>Jueves</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
                <tr>
                    <td>Viernes</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
                <tr>
                    <td>Sábado</td>
                    <td>-----------------</td>
                    <td>-----------------</td>
                    <td><button class="btn">Agregar</button></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
