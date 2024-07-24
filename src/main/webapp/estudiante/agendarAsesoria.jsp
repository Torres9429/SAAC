<%@ page import="mx.edu.utez.saac.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Calendario</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="../img/Icono_Saac.ico" type="image/x-icon">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
    <link href='https://unpkg.com/@fullcalendar/core/main.css' rel='stylesheet' />
    <link href='https://unpkg.com/@fullcalendar/daygrid/main.css' rel='stylesheet' />
    <script src='https://unpkg.com/@fullcalendar/core/main.js'></script>
    <script src='https://unpkg.com/@fullcalendar/daygrid/main.js'></script>
    <script src='${pageContext.request.contextPath}/js/index.global.js'></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css' rel='stylesheet' />
    <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet' />
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
    <script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <jsp:include page="headerMenuUsuario.jsp" />
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

            // calendar.render();

            // Event listener for the add event button
            /*   document.getElementById('add-event-btn').addEventListener('click', function() {
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
           });*/

            /*function eventForm(startDate) {
                document.getElementById('event-form').style.display = 'block';
                document.getElementById('start').value = startDate;
            }*/

            /* // Obtén los elementos del DOM para la ventana emergente
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
                 }*/
        });

        /*  $(document).ready(function() {
              // Llama al servlet para obtener las carreras al cargar la página
              $.ajax({
                  url: '/filtrosCal',  // URL del servlet
                  type: 'GET',
                  success: function(data) {
                      // Aquí puedes procesar la respuesta si es necesario
                      console.log('datos cargados correctamente');
                  },
                  error: function(xhr, status, error) {
                      console.error('Error al cargar los datos:', error);
                  }
              });
          });*/

        /*
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('selectDivision').addEventListener('change', function () {
                const divisionId = this.value;
                fetchCarreras(divisionId);
            });

            document.getElementById('selectCarrera').addEventListener('change', function () {
                const carreraId = this.value;
                fetchMaterias(carreraId);
            });
        });
        */

        // ↓↓↓ Manejo de dropdowns-------------------------------------------------------------------------------------
        // Convertir datos de JSP a JavaScript
        var divisiones = [];
        <c:forEach items="${divisiones}" var="division">
        divisiones.push({id: "${division.id_division}", nombre: "${division.division_academica}"});
        </c:forEach>;

        var carreras = [];
        <c:forEach items="${carreras}" var="carrera">
        carreras.push({id: "${carrera.id_carrera}", nombre: "${carrera.carrera}", divisionId: "${carrera.id_division}"});
        </c:forEach>;

        var materias = [];
        <c:forEach items="${materias}" var="materia">
        materias.push({id: "${materia.id_materia}", nombre: "${materia.materia}", carreraId: "${materia.id_carrera}"});
        </c:forEach>;


        console.log(divisiones);
        console.log(carreras);
        console.log(materias);


        document.addEventListener('DOMContentLoaded', function() {
            var selectDivision = document.getElementById('selectDivision');
            var selectCarrera = document.getElementById('selectCarrera');
            var selectMateria = document.getElementById('selectMateria');

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

                selectMateria.innerHTML = '<option value="" selected disabled>Materia</option>'; // Clear Materia options
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
        // ↑↑↑ Manejo de dropdowns-------------------------------------------------------------------------------------

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
            height: 45px;
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
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 3) {
%>
<div class="filtrosBusqueda">
    <div class="custom-select-container">
        <select class="custom-select" name="selectDivision" id="selectDivision">
            <option value="">División académica</option>
            <c:forEach items="${divisiones}" var="division">
                <option value="${division.id_division}">${division.division_academica}</option>
            </c:forEach>
        </select>
    </div>
    <div class="custom-select-container">
        <select class="custom-select" name="selectCarrera" id="selectCarrera">
            <option value="" selected disabled>Carrera</option>
        </select>
    </div>
    <div class="custom-select-container">
        <select class="custom-select" name="selectMateria" id="selectMateria">
            <option value="" selected disabled>Materia</option>
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


<!-- Modal HTML aquí -->
<!-- Modal HTML -->
<div class="modal fade" id="solicitarAsesoriaModal" tabindex="-1" role="dialog" aria-labelledby="solicitarAsesoriaLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="solicitarAsesoriaLabel">Solicitar Asesoría</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="horarioForm" action="../horario" method="post">
                    <div class="form-group">
                        <label for="tema">Tema</label>
                        <input type="text" class="form-control" id="tema">
                    </div>
                    <div class="form-group">
                        <label for="horaInicio">Hora de Inicio</label>
                        <input type="text" class="form-control" id="horaInicio" name="horaInicio">
                    </div>
                    <div class="form-group">
                        <label for="horaFin">Hora de Fin</label>
                        <input type="text" class="form-control" id="horaFin" name="horaFin">
                    </div>
                    <div class="form-group">
                        <label for="dudas">Dudas específicas</label>
                        <textarea class="form-control" id="dudas"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" id="submit-event">Solicitar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    } else {
        response.sendRedirect("../accesoDenegado.jsp");
    }
%>
</body>
</html>