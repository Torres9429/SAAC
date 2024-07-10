<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <title>Agregar Materia</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .box {
            background-color: #b8e0d2;
            padding: 30px;
            border-radius: 8px;
        }
        .box h3 {
            color: #007BFF;
        }
        .form-group label {
            color: #333;
        }
        .btn-primary {
            background-color: #3A4C60;
            border-color: #007BFF;
        }
    </style>
</head>
<body>
<jsp:include page="/estudiante/headerMenuUsuario.jsp" />
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="box">
                <h3>Agregar Materia</h3>
                <form action="AgregarMateriaServlet" method="post">
                    <div class="form-group">
                        <label for="materia">Materia:</label>
                        <input type="text" class="form-control" id="materia" name="materia" required>
                    </div>
                    <div class="form-group">
                        <label for="division">División:</label>
                        <input type="text" class="form-control" id="division" name="division" required>
                    </div>
                    <div class="form-group">
                        <label for="area">Área:</label>
                        <input type="text" class="form-control" id="area" name="area" required>
                    </div>
                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                    </div>
                    <div class="form-group">
                        <label for="maestro">Maestro:</label>
                        <select class="form-control" id="maestro" name="maestro">
                            <option value="Maestro 1">Maestro 1</option>
                            <option value="Maestro 2">Maestro 2</option>
                            <option value="Maestro 3">Maestro 3</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Agregar Materia</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
