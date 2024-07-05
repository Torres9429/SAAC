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
            max-height: 600px;
            margin: 0 auto;
            overflow: scroll;
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
<div class="statusAsesorias"></div>
<div id='calendar'></div>
<button id="add-event-btn">Agregar Evento</button>

<div id="event-form" style="display:none;">
    <label for="title">Título del Evento:</label>
    <input type="text" id="title" name="title"><br>
    <label for="start">Fecha de Inicio:</label>
    <input type="date" id="start" name="start"><br>
    <button id="submit-event">Añadir Evento</button>
</div>

</body>
</html>
