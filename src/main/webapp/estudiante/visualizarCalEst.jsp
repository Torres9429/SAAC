<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saac.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Calendario</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="icon" href="${pageContext.request.contextPath}/img/Icono_Saac.ico" type="image/x-icon">
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
            max-width: 300px;

        }

        .custom-select {
            appearance: none; /* Elimina el estilo predeterminado del select */
            -webkit-appearance: none;
            -moz-appearance: none;
            width: 290px;
            height: 45px;
            margin: 15px;
            padding: 10px 50px 10px 15px; /* Espaciado interno */
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
            width: 50px;
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
        .class-en-curso{
            background-color: #096DD9;
            border-color: #034c9b;
            color: #ffffff;
        }
        .class-pendiente{
            background-color: #EBAF14;
            border-color: #eaa402;
            color: #ffffff;
        }
        .class-cancelada{
            background-color: #870808;
            border-color: #620505;
            color: #ffffff;
        }
        .class-finalizada{
            background-color: #043B78;
            border-color: #022e5d;
            color: #ffffff;
        }

    </style>

</head>
<body>
<%
    Usuario user = (Usuario) session.getAttribute("user");
    if (user != null && user.getId_tipo_usuario() == 3) {
        int userId = user.getId();
        List<Asesoria> asesorias = (List<Asesoria>) request.getAttribute("asesorias");
        List<Materia> materias = (List<Materia>) request.getAttribute("materias");
        List<Horario> horarios = (List<Horario>) request.getAttribute("horarios");
        // Obtener el mensaje de la sesión
        String mensaje = (String) session.getAttribute("mensaje");
        // Eliminar el atributo de sesión después de obtener el mensaje
        session.removeAttribute("mensaje");
%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var userId = <%= userId %>;
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialDate: new Date(),
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
            events: [<c:forEach items="${asesorias}" var="asesoria">
                {
                    title: '${asesoria.materia}',
                    start: '${asesoria.dia}T${asesoria.hora_inicio}',
                    end: '${asesoria.dia}T${asesoria.hora_fin}',
                    classNames: ['class-' +
                    (function() {
                        switch (${asesoria.id_status_asesoria}) {
                            case 1: return 'en-curso';
                            case 2: return 'pendiente';
                            case 3: return 'cancelada';
                            case 4: return 'finalizada';
                            default: return '';
                        }
                    })()
                    ],
                    extendedProps: {
                        horarioId: '${asesoria.id_asesoria}',
                        horaInicio: '${asesoria.hora_inicio}',
                        horaFin: '${asesoria.hora_fin}',
                        docenteId: '${asesoria.id_docente}',
                        nombreDocente: '${asesoria.nombre_docente}',
                        materiaId: '${asesoria.id_materia}',
                        carreraId: '${asesoria.id_carrera}',
                        divisionId: '${asesoria.id_division}',
                        aulaId: '${asesoria.id_aula}',
                        dia: '${asesoria.dia}',
                        statusId: '${asesoria.id_status_asesoria}'
                    }
                },
                </c:forEach>],
            eventRender: function(info) {
                var event = info.event;
                var now = new Date();

                var start = new Date(event.startStr);
                var end = new Date(event.endStr);

                // Actualizar el estado basado en la fecha actual
                if (now < start) {
                    event.setProp('classNames', ['class-pendiente']);
                } else if (now > end) {
                    event.setProp('classNames', ['class-finalizada']);
                } else {
                    event.setProp('classNames', ['class-en-curso']);
                }
            },
            eventClick: function(info) {
                // Código para manejar el clic en un evento
                $('#tema').val(info.event.title);
                $('#docenteId').val(info.event.extendedProps.docenteId);
                $('#docente').val(info.event.extendedProps.nombreDocente);
                $('#idUsuario').val(userId);
                $('#idMateria').val(info.event.extendedProps.materiaId);
                $('#aulaId').val(info.event.extendedProps.aulaId);
                $('#horarioId').val(info.event.extendedProps.horarioId);
                $('#dia').val(info.event.extendedProps.dia);
                $('#horaInicio').val(info.event.extendedProps.horaInicio);
                $('#horaFin').val(info.event.extendedProps.horaFin);

                // Obtener el estado de la asesoría
                var statusId = Number(info.event.extendedProps.statusId);
                var idMateria = Number(info.event.extendedProps.materiaId)
                console.log(statusId)

                // Mostrar u ocultar botones según el estado
                if (statusId === 2) { // Pendiente
                    console.log("Pendiente"+statusId)
                    $('#cancelarAsesoria').show();
                    $('#reagendarAsesoria').show();
                } else if (statusId === 1) { // En curso
                    $('#cancelarAsesoria').hide();
                    $('#reagendarAsesoria').hide();
                } else { // Cancelada o Finalizada
                    $('#cancelarAsesoria').hide();
                    $('#reagendarAsesoria').hide();
                }

                $('#solicitarAsesoriaModal').modal('show');

            }
        });

        calendar.render();

        function loadEvents() {
            fetch('getAsesorias?userId=' + userId)
                .then(response => response.json())
                .then(data => {
                    calendar.removeAllEvents();
                    data.forEach(event => {
                        calendar.addEvent({
                            title: event.materia,
                            start: event.dia + 'T' + event.hora_inicio,
                            end: event.dia + 'T' + event.hora_fin,
                            className: 'class-' + event.status,
                            extendedProps: {
                                horarioId: event.id_asesoria,
                                horaInicio: event.hora_inicio,
                                horaFin: event.hora_fin,
                                docenteId: event.docente,
                                nombreDocente: event.nombre_docente,
                                materiaId: event.id_materia,
                                carreraId: event.id_carrera,
                                divisionId: event.id_division,
                                aulaId: event.id_aula,
                                dia: event.dia
                            }
                        });
                    });
                });
            function actualizarEstados() {
                fetch('updateStatus')
                    .then(response => response.text())
                    .then(data => {
                        console.log(data);
                        alert("Estados actualizados correctamente.");
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert("Error al actualizar estados.");
                    });
            }

        }

        // Botón de "Cancelar Asesoría"
        document.getElementById('cancelarAsesoria').addEventListener('click', function() {
            var horarioId = $('#horarioId').val();
            $('#action').val('cancelar');
            $.ajax({
                url: $('#formAsesoria').attr('action'),
                type: 'POST',
                data: $('#formAsesoria').serialize() + '&id=' + horarioId,
                success: function(response) {
                    alert('Asesoría cancelada');
                    $('#solicitarAsesoriaModal').modal('hide');
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    mostrarMensajeModal('Error al cancelar la asesoría: ' + error);
                }
            });
            window.location.reload();
        });

        $(document).ready(function () {
            // Reagendar
            $('#reagendarAsesoria').click(function (event) {
                event.preventDefault();

                var idMateriaValue = $('#idMateria').val();
                var idAsesoriaValue = $('#horarioId').val();

                $('#idMateriaModal').val(idMateriaValue);
                $('#idAsesoriaValue').val(idAsesoriaValue);
                $('#idMateriaText').text(idMateriaValue);

                $('#reagendarModal').modal('show');
                $('#solicitarAsesoriaModal').modal('hide');

                loadHorarios(idMateriaValue);
            });

            // Manejar cambio en el select para actualizar los valores ocultos
            $('#horarioDisp').change(function () {
                var selectedOption = $(this).find('option:selected');

                if (selectedOption.length) {
                    var dia = selectedOption.data('dia');
                    var horaInicio = limpiarHora(selectedOption.data('hora-inicio'));
                    var horaFin = limpiarHora(selectedOption.data('hora-fin'));

                    $('#diaR').val(dia);
                    $('#horaInicioR').val(horaInicio);
                    $('#horaFinR').val(horaFin);
                }
            });

            function loadHorarios(idMateria) {
                if (!idMateria) {
                    console.error('ID de materia no proporcionado.');
                    return;
                }

                $.ajax({
                    url: 'reagendar',
                    type: 'GET',
                    data: { idMateria: idMateria },
                    success: function (response) {
                        try {
                            var horarios = response;
                            var select = $('#horarioDisp');
                            select.empty().append('<option value="" selected disabled>Seleccione...</option>');

                            $.each(horarios, function (i, horario) {
                                var option = $('<option></option>')
                                    .val(horario.id_horario)
                                    .text(horario.dia + " " + limpiarHora(horario.hora_inicio) + " - " + limpiarHora(horario.hora_fin))
                                    .data('dia', horario.dia)
                                    .data('hora-inicio', horario.hora_inicio)
                                    .data('hora-fin', horario.hora_fin);

                                select.append(option);
                            });
                        } catch (e) {
                            console.error('Error al procesar la respuesta:', e);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al cargar los horarios:', error);
                        console.log('Detalles del error:', xhr.responseText);
                    }
                });
            }

            // Función para limpiar el valor de la hora
            function limpiarHora(horaStr) {
                // Quitar espacios y convertir a formato estándar de 24 horas
                var horaLimpia = horaStr.replace(/(\s*a\.&nbsp;m\.|\s*p\.&nbsp;m\.)/g, '').trim();

                // Convertir a formato de 24 horas si es necesario
                return convertTo24Hour(horaLimpia);
            }

            // Función para convertir a formato de 24 horas
            function convertTo24Hour(timeStr) {
                var [time, period] = timeStr.split(' ');
                if (!period) return timeStr; // Si no hay periodo, devolver la hora original
                var [hours, minutes] = time.split(':');
                hours = parseInt(hours, 10);
                if (period.includes('p.&nbsp;m.') && hours !== 12) {
                    hours += 12;
                }
                if (period.includes('a.&nbsp;m.') && hours === 12) {
                    hours = 0;
                }
                return hours.toString().padStart(2, '0') + ':' + minutes;
            }

            $('#guardarReagendar').click(function () {
                var idAsesoria = $('#idAsesoriaValue').val();
                var horarioId = $('#horarioDisp').val();
                var dia = $('#diaR').val();
                var horaInicio = $('#horaInicioR').val();
                var horaFin = $('#horaFinR').val();

                console.log('Enviando datos:', {
                    idAsesoria: idAsesoria,
                    horarioDisp: horarioId,
                    diaR: dia,
                    horaInicioR: horaInicio,
                    horaFinR: horaFin
                });

                $.ajax({
                    url: '/SAAC_war/reagendar',
                    type: 'POST',
                    data: {
                        idAsesoria: idAsesoria,
                        horarioDisp: horarioId,
                        diaR: dia,
                        horaInicioR: horaInicio,
                        horaFinR: horaFin
                    },
                    success: function (response) {
                        console.log('Respuesta del servidor:', response);
                        $('#reagendarModal').modal('hide');
                        window.location.reload(); // O actualizar solo la parte relevante
                    },
                    error: function (xhr, status, error) {
                        console.error('Error al reagendar la asesoría:', error);
                        alert('Error al reagendar la asesoría: ' + xhr.responseText);
                    }
                });
            });
        });
        function submitForm(action) {
            var form = document.getElementById('formAsesoria');
            var actionField = document.getElementById('action');
            actionField.value = action;

            // Enviar formulario al servlet correspondiente
            form.action = getServletUrl(action);
            form.submit();
        }

        function getServletUrl(action) {
            switch(action) {
                case 'iniciar':
                    return 'iniciarAsesoria'; // Servlet para iniciar
                case 'finalizar':
                    return 'finalizarAsesoria'; // Servlet para finalizar
                case 'cancelar':
                    return 'cancelarAsesoria'; // Servlet para cancelar
                default:
                    return '';
            }
        }
        calendar.render();
        loadEvents();

        // Evento change para el select de materias
        document.getElementById('selectMateria').addEventListener('change', function() {
            var selectedMateriaId = this.value;
            filterEventsByMateria(selectedMateriaId);
        });

        function filterEventsByMateria(materiaId) {
            // Obtiene todos los eventos
            var allEvents = calendar.getEvents();

            // Filtra los eventos por materiaId
            allEvents.forEach(function(event) {
                if (event.extendedProps.materiaId == materiaId) {
                    event.setProp('display', 'auto'); // Muestra el evento
                } else {
                    event.setProp('display', 'none'); // Oculta el evento
                }
            });
        }

        // Evento change para el select de Carreras
        document.getElementById('selectCarrera').addEventListener('change', function() {
            var selectedCarreraId = this.value;
            filterEventsByCarrera(selectedCarreraId);
        });

        function filterEventsByCarrera(carreraId) {
            // Obtiene todos los eventos
            var allEvents = calendar.getEvents();

            // Filtra los eventos por carreraId
            allEvents.forEach(function(event) {
                if (event.extendedProps.carreraId == carreraId) {
                    event.setProp('display', 'auto'); // Muestra el evento
                } else {
                    event.setProp('display', 'none'); // Oculta el evento
                }
            });
        }
        // Evento change para el select de Division
        document.getElementById('selectDivision').addEventListener('change', function() {
            var selectedDivisionId = this.value;
            filterEventsByDivision(selectedDivisionId);
        });

        function filterEventsByDivision(divisionId) {
            // Obtiene todos los eventos
            var allEvents = calendar.getEvents();

            // Filtra los eventos por divisionId
            allEvents.forEach(function(event) {
                if (event.extendedProps.divisionId == divisionId) {
                    event.setProp('display', 'auto'); // Muestra el evento
                } else {
                    event.setProp('display', 'none'); // Oculta el evento
                }
            });
        }




    });
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
            console.log("División seleccionada: " + divisionId);
            updateCarreras(divisionId);
        });

        selectCarrera.addEventListener('change', function() {
            var carreraId = this.value;
            console.log("Carrera seleccionada: " + carreraId);
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


<div class="container">
    <div class="row filtrosBusqueda">
        <div class="col-12 col-md-4">
            <div class="custom-select-container">
                <select class="custom-select" name="selectDivision" id="selectDivision">
                    <option value="">División académica</option>
                    <c:forEach items="${divisiones}" var="division">
                        <option value="${division.id_division}">${division.division_academica}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="custom-select-container">
                <select class="custom-select" name="selectCarrera" id="selectCarrera">
                    <option value="" selected disabled>Carrera</option>
                </select>
            </div>
        </div>
        <div class="col-12 col-md-4">
            <div class="custom-select-container">
                <select class="custom-select" name="selectMateria" id="selectMateria">
                    <option value="" selected disabled>Materia</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="statusAsesorias">
                <p class="status" style="background-color: #EBAF14">Pendiente</p>
                <p class="status" style="background-color: #096DD9">En curso</p>
                <p class="status" style="background-color: #870808">Cancelada</p>
                <p class="status" style="background-color: #043B78">Finalizada</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div id='calendar'></div>
        </div>
    </div>
</div>




<!-- Modal HTML aquí -->
<div class="modal fade" id="solicitarAsesoriaModal" tabindex="-1" role="dialog" aria-labelledby="solicitarAsesoriaLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="solicitarAsesoriaLabel">Cancelar</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="cancelarAsesoria" method="post" id="formAsesoria">
                    <div class="form-group">
                        <label for="tema">Materia</label>
                        <input type="text" class="form-control" id="tema" name="tema" readonly>
                    </div>
                    <div class="form-group">
                        <label for="horaInicio">Hora de Inicio</label>
                        <input type="time" class="form-control" id="horaInicio" name="horaInicio" readonly>
                    </div>
                    <div class="form-group">
                        <label for="horaFin">Hora de Fin</label>
                        <input type="time" class="form-control" id="horaFin" name="horaFin" readonly>
                    </div>
                    <div class="form-group">
                        <label for="docente">Docente</label>
                        <input type="text" class="form-control" id="docente" name="docente" readonly>
                    </div>
                    <input type="hidden" id="docenteId" name="docenteId">
                    <input type="hidden" id="idUsuario" name="idUsuario">
                    <input type="hidden" id="idMateria" name="idMateria">
                    <input type="hidden" id="aulaId" name="aulaId">
                    <input type="hidden" id="horarioId" name="horarioId">
                    <input type="hidden" id="dia" name="dia">
                    <input type="hidden" id="action" name="action">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="cancelarAsesoria">Cancelar</button>
                        <button type="submit" class="btn btn-custom" id="reagendarAsesoria"
                                data-idmateria="" data-asesoria="" data-toggle="modal" data-target="#modalReagendar">Reagendar</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal de para REAGENDAR -->
<div id="reagendarModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="reagendarModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reagendarModalLabel">Reagendar Asesoría</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <!-- Aquí se mostrará el idMateria -->
                    <input type="hidden" id="idMateriaModal" name="idMateria" value="${idMateria}">
                    <input type="hidden" id="idAsesoriaValue" name="idAsesoria" value="${horarioId}">
                    <input type="hidden" id="diaR" name="diaR">
                    <input type="hidden" id="horaInicioR" name="horaInicioR">
                    <input type="hidden" id="horaFinR" name="horaFinR">
                    <p>Estás reagendando la materia con ID: <span id="idMateriaText"></span></p>
                </div>

                <div class="form-group">
                    <label for="horarioDisp">Seleccione un horario disponible</label>
                    <select class="custom-select" name="horarioDisp" id="horarioDisp">
                        <option value="" selected disabled>Seleccione...</option>
                    </select>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardarReagendar">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de mensaje -->
<div id="mensajeModal" class="modal-custom" style="display: <%= mensaje != null ? "block" : "none" %>;">
    <div class="modal-content-custom">
        <div class="modal-header-custom">
            <span class="close-custom" onclick="this.parentElement.parentElement.parentElement.style.display='none'">&times;</span>
            <h2>Mensaje</h2>
        </div>
        <div class="modal-body-custom">
            <p><%= mensaje %></p>
        </div>
        <div class="modal-footer-custom">
            <button class="btn-custom" onclick="document.getElementById('mensajeModal').style.display='none'">Cerrar</button>
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