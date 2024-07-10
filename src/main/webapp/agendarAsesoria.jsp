<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Calendario</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='css/bootstrap.css'>
    <link href='https://unpkg.com/@fullcalendar/core/main.css' rel='stylesheet' />
    <link href='https://unpkg.com/@fullcalendar/daygrid/main.css' rel='stylesheet' />
    <script src='https://unpkg.com/@fullcalendar/core/main.js'></script>
    <script src='https://unpkg.com/@fullcalendar/daygrid/main.js'></script>
    <script src='js/index.global.js'></script>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            const fechaActual = new Date();

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialDate: fechaActual,
                initialView: 'timeGridWeek',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                },
                height: 'auto',
                navLinks: true,
                editable: true,
                selectable: true,
                selectMirror: true,
                nowIndicator: true,
                events: [
                    {
                        title: 'All Day Event',
                        start: '2023-01-01',
                    },
                    {
                        title: 'Long Event',
                        start: '2023-01-07',
                        end: '2023-01-10'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2023-01-09T16:00:00'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2023-01-16T16:00:00'
                    },
                    {
                        title: 'Conference',
                        start: '2023-01-11',
                        end: '2023-01-13'
                    },
                    {
                        title: 'Meeting',
                        start: '2023-01-12T10:30:00',
                        end: '2023-01-12T12:30:00'
                    },
                    {
                        title: 'Lunch',
                        start: '2023-01-12T12:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2023-01-12T14:30:00'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2023-01-12T17:30:00'
                    },
                    {
                        title: 'Dinner',
                        start: '2023-01-12T20:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2023-01-13T07:00:00'
                    },
                    {
                        title: 'Click for Google',
                        url: 'http://google.com/',
                        start: '2023-01-28'
                    }
                ]
            });

            calendar.render();

            // Event listener for the add event button
            document.getElementById('add-event-btn').addEventListener('click', function() {
                var today = new Date().toISOString().split('T')[0];
                eventForm(today);
            });

            // Event listener for the submit event button
            document.getElementById('submit-event').addEventListener('click', function() {
                var title = document.getElementById('title').value;
                var start = document.getElementById('start').value;

                if (title && start) {
                    calendar.addEvent({
                        title: title,
                        start: start,
                        allDay: true
                    });
                    // Hide the form
                    document.getElementById('event-form').style.display = 'none';
                    // Clear the form
                    document.getElementById('title').value = '';
                    document.getElementById('start').value = '';
                }
            });
        });

        function eventForm(startDate) {
            document.getElementById('event-form').style.display = 'block';
            document.getElementById('start').value = startDate;
        }

        // Obtén los elementos del DOM para la ventana emergente
        document.addEventListener('DOMContentLoaded', function() {
            var modal = document.getElementById("myModal");
            var btn = document.getElementById("openModalBtn");
            var span = document.getElementsByClassName("close-custom")[0];
            var closeBtn = document.getElementById("submit-btn");
            var cancelBtn = document.getElementById("cancel-btn");

            // Cuando el usuario haga clic en el botón, abre la ventana emergente
            btn.onclick = function() {
                modal.style.display = "block";
            }
            closeBtn.onclick = function() {
                modal.style.display = "none";
            }

            // Cerrar el modal al hacer clic en el botón de cancelar
            cancelBtn.onclick = function() {
                modal.style.display = "none";
            }
            // Cuando el usuario haga clic en <span> (x), cierra la ventana emergente
            span.onclick = function() {
                modal.style.display = "none";
            }

            // Cuando el usuario haga clic en cualquier lugar fuera de la ventana emergente, ciérrala
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        });
    </script>
    <style>

        body {
            margin: 40px 10px;
            padding: 0;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 1100px;
            max-height: 500px;
            margin: 0 auto;
            overflow: scroll;
        }
        .filtrosBusqueda{
            display: flex; /* Flexbox para alinear en una línea */
            justify-content: center; /* Centra el contenido horizontalmente */
            align-items: center;
            margin: 15px;
        }
        .custom-select-container {
            position: relative;
            width: 300px; /* Ajusta el ancho según sea necesario */
        }

        .custom-select {
            appearance: none; /* Elimina el estilo predeterminado del select */
            -webkit-appearance: none;
            -moz-appearance: none;
            width: 290px;
            margin: 15px;
            padding: 10px 40px 10px 15px; /* Espaciado interno */
            font-size: 16px;
            color: #6c7a89; /* Color del texto */
            background-color: #f2f2f2; /* Color de fondo */
            border: 1px solid #e0e0e0; /* Borde */
            border-radius: 10px; /* Bordes redondeados */
            cursor: pointer;
            position: relative;
        }

        /* Estilos del icono de flecha */
        .custom-select-container::after {
            content: '▼'; /* Icono de flecha */
            font-size: 12px;
            background-color: #009475;
            color: #002E60; /* Color del icono */
            height: 45px; /* Alinea el fondo al alto del select */
            width: 40px;
            display: flex; /* Utiliza flexbox para centrar el icono */
            justify-content: center; /* Centra el icono horizontalmente */
            align-items: center; /* Centra el icono verticalmente */
            position: absolute;
            right: -7px;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none; /* Evita que el icono interfiera con la selección */
            border-radius: 0 10px 10px 0; /* Bordes redondeados solo en la esquina derecha */
        }

        .custom-select option {
            background-color: #ffffff;
            color: #000000;
        }
        .status {
            border-radius: 5px;
            width: 100px;
            text-align: center;
            color: white;
            margin: 5px; /* Agrega un margen para separar los elementos */
        }
        .statusAsesorias {
            width: 90%;
            display: flex; /* Flexbox para alinear en una línea */
            justify-content: center; /* Centra el contenido horizontalmente */
            align-items: center; /* Centra el contenido verticalmente */
            margin: 5px;
        }
        /* Estilos para la ventana emergente */
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
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
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
            justify-content: space-between;
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
            padding: 10px 20px;
            cursor: pointer;
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

    </style>
</head>
<body>
<div class="container-fluid">
    <header class="d-flex justify-content-center py-3 custom-header" >
        <ul class="nav nav-pills">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Asesoría
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.jsp">Agendar</a>
                    <a class="dropdown-item" href="#">Cancelar</a>
                    <a class="dropdown-item" href="#">Reagendar</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Calendario
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.jsp">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Calificaciones
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="agendarAsesoria.jsp">Ver</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Perfil
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="perfil.jsp">Ver</a>
                    <a class="dropdown-item" href="#">Modificar</a>
                    <a class="dropdown-item" href="#">Restablecer contraseña</a>
                    <div class="dropdown-divider"></div>
                    <a href="/logout" class="dropdown-item">Cerrar Sesión</a>
                    <!--<a class="dropdown-item" href="/logout" id="logout-btn">Cerrar Sesión</a>-->
                </div>
            </li>
        </ul>
    </header>
</div>
<div class="filtrosBusqueda">
    <div class="custom-select-container">
        <select class="custom-select" name="selectMateria" id="selectMateria">
            <option value="">Materia</option>
            <option value="1">Aplicaciones web</option>
            <option value="2">Base de datos</option>
        </select>
    </div>
    <div class="custom-select-container">
        <select class="custom-select" name="selectCarrera" id="selectCarrera">
            <option value="">Carrera</option>
            <option value="1">Desarrollo de software</option>
            <option value="2">Infraestructura de redes dígitales</option>
        </select>
    </div>
    <div class="custom-select-container">
        <select class="custom-select" name="selectDivision" id="selectDivision">
            <option value="">División académica</option>
            <option value="1">DATID</option>
            <option value="2">DAMI</option>
        </select>
    </div>


</div>
<div class="statusAsesorias">
    <p class="status " style="background-color: #EBAF14">Pendiente</p>
    <p class="status " style="background-color: #096DD9">En curso</p>
    <p class="status " style="background-color: #870808">Cancelada</p>
    <p class="status " style="background-color: #EB1414">Rechazada</p>
    <p class="status " style="background-color: #009475">Aceptada</p>
    <p class="status " style="background-color: #8C3AAA">Modificada</p>
    <p class="status " style="background-color: #043B78">Finalizada</p>
</div>

<div id='calendar'></div>

<button id="openModalBtn" class="btn btn-primary">Solicitar Asesoría</button>

<div id="myModal" class="modal-custom">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom">&times;</span>
            <h2>Solicitar Asesoría</h2>
        </div>
        <div class="modal-body-custom">
            <form id="solicitud-form">
                <div class="form-group-custom">
                    <label for="tema">Tema:</label>
                    <input type="text" id="tema" name="tema" class="form-control" placeholder="Tema">
                </div>
                <div class="form-group-custom">
                    <label for="hora-inicio">Hora de inicio:</label>
                    <input type="time" id="hora-inicio" name="hora-inicio" class="form-control" placeholder="Hora de inicio">
                </div>
                <div class="form-group-custom">
                    <label for="hora-fin">Hora de fin:</label>
                    <input type="time" id="hora-fin" name="hora-fin" class="form-control" placeholder="Hora de fin">
                </div>
                <div class="form-group-custom">
                    <label for="dudas">Dudas específicas:</label>
                    <input type="text" id="dudas" name="dudas" class="form-control" placeholder="Dudas...">
                </div>
            </form>
        </div>
        <div class="modal-footer-custom">
            <button id="submit-btn" class="btn-custom">Solicitar</button>
            <button id="cancel-btn" class="btn-custom">Cancelar</button>
        </div>
    </div>
</div>
<!--<button id="add-event-btn">Agregar Evento</button>

<div id="event-form" style="display:none;">
    <label for="title">Título del Evento:</label>
    <input type="text" id="title" name="title"><br>
    <label for="start">Fecha de Inicio:</label>
    <input type="date" id="start" name="start"><br>
    <button id="submit-event">Añadir Evento</button>
</div>-->

</body>
</html>
