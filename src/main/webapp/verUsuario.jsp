<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Ver Registro</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="css/loginStyle.css">
    <style>
        .registro {
            max-width: 90%;
            width: auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: justify;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
            text-align: left;
            width: 300px;
        }
    </style>
</head>

<body>
    <div class="registro">
        <div class="row">
            <div id="tabla-datos">
                <h1>Registros</h1>
                <table id="data-table">
                    <thead>
                        <tr>
                            <th>Nombre(s)</th>
                            <th>Apellido Paterno</th>
                            <th>Apellido Materno</th>
                            <th>Edad</th>
                            <th>Carrera</th>
                            <th>Contraseña</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="r1">
                            <td>Natalia</td>
                            <td>Colocia</td>
                            <td>Cruz</td>
                            <td>19</td>
                            <td>Redes</td>
                            <td>ad&4#%</td>
                            <td>
                                <button class="btn btn-primary" onclick="modificar('r1')">Modificar</button>
                            </td>
                            <td>
                                <button class="btn btn-danger" onclick="eliminar('r1')">Eliminar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p id="txt"></p>
                <div class="data-container">
                    <p id="nombre"></p>
                    <p id="paterno"></p>
                    <p id="materno"></p>
                    <p id="edad"></p>
                    <p id="carrera"></p>
                    <p id="password"></p>
                </div>
            </div>
        </div>
    </div>
    <script src="js/scriptVerUsuario.js"></script>
        
    </script>
</body>

</html>
