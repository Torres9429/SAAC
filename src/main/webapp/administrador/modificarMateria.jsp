<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='../css/bootstrap.css'>
    <title>Modificar Materia</title>
    <style>
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
            color: rgba(0, 148, 117, 0.8); /* #009475 with 80% opacity */
        }
        .form-content {
            width: 80%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }
        .card {
            background-color: rgba(0, 148, 117, 0.5); /* #009475 with 50% opacity */
            border: none;
            border-radius: 8px;
            width: 100%;
        }
        .form-group label {
            color: #fff;
        }
        .btn-primary {
            background-color: #3A4C60;
            border-color: #007BFF;
        }
    </style>
    <jsp:include page="/estudiante/headerMenuUsuario.jsp" />
</head>
<body>
<div class="form-container">
    <div class="form-sidebar">
        <h1>Modificar Materia</h1>
    </div>
    <div class="form-content">
        <div class="container">
            <div class="card">
                <div class="card-header">
                    <div class="form-group">
                        <label for="nombreMateria" style="color: white;">Nombre:</label>
                        <input type="text" class="form-control" id="nombreMateria" name="nombreMateria" value="${materia.nombre}" required>
                    </div>
                </div>
                <div class="card-body">
                    <form action="ModificarMateriaServlet" method="post">
                        <div class="form-group">
                            <label for="division">División:</label>
                            <select class="form-control" id="division" name="division" required>
                                <option value="Division 1" ${materia.division == 'Division 1' ? 'selected' : ''}>División 1</option>
                                <option value="Division 2" ${materia.division == 'Division 2' ? 'selected' : ''}>División 2</option>
                                <option value="Division 3" ${materia.division == 'Division 3' ? 'selected' : ''}>División 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="area">Área:</label>
                            <input type="text" class="form-control" id="area" name="area" value="${materia.area}" required>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción:</label>
                            <input type="text" class="form-control" id="descripcion" name="descripcion" value="${materia.descripcion}" required>
                        </div>
                        <div class="form-group">
                            <label for="maestro">Maestro(s):</label>
                            <select class="form-control" id="maestro" name="maestro" required>
                                <option value="Maestro 1" ${materia.maestro == 'Maestro 1' ? 'selected' : ''}>Maestro 1</option>
                                <option value="Maestro 2" ${materia.maestro == 'Maestro 2' ? 'selected' : ''}>Maestro 2</option>
                                <option value="Maestro 3" ${materia.maestro == 'Maestro 3' ? 'selected' : ''}>Maestro 3</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Modificar Materia</button>
                    </form>
                </div>
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
