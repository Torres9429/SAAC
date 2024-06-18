const getParameter = (key) => {
    const address = window.location.search;
    const parameterList = new URLSearchParams(address);
    return parameterList.get(key);
};

let numId = 2;  // Inicia en 2 ya que 1 ya está utilizado por el registro estático

const nombre = getParameter('nombreRegistro');
const paterno = getParameter('aPaternoRegistro');
const materno = getParameter('aMaternoRegistro');
const edad = getParameter('edadRegistro');
const carrera = getParameter('carreraRegistro');
const password = getParameter('contraseñaRegistro');

function pintar(nombre, paterno, materno, edad, carrera) {
    const tbody = document.querySelector("#data-table tbody");
    const fila = document.createElement("tr");
    fila.id = 'r' + numId;
    numId++;

    const colNombre = document.createElement("td");
    const colPaterno = document.createElement("td");
    const colMaterno = document.createElement("td");
    const colEdad = document.createElement("td");
    const colCarrera = document.createElement("td");
    const colPassword = document.createElement("td");
    const colModificar = document.createElement("td");
    const colEliminar = document.createElement("td");
    

    colNombre.innerText = nombre;
    colPaterno.innerText = paterno;
    colMaterno.innerText = materno;
    colEdad.innerText = edad;
    colCarrera.innerText = carrera;
    colPassword.innerText = password;

    const btnModificar = document.createElement("button");
    btnModificar.className = "btn btn-primary";
    btnModificar.textContent = "Modificar";
    btnModificar.onclick = () => modificar(fila.id);

    const btnEliminar = document.createElement("button");
    btnEliminar.className = "btn btn-danger";
    btnEliminar.textContent = "Eliminar";
    btnEliminar.onclick = () => eliminar(fila.id);

    colModificar.appendChild(btnModificar);
    colEliminar.appendChild(btnEliminar);

    fila.appendChild(colNombre);
    fila.appendChild(colPaterno);
    fila.appendChild(colMaterno);
    fila.appendChild(colEdad);
    fila.appendChild(colCarrera);
    fila.appendChild(colPassword);
    fila.appendChild(colModificar);
    fila.appendChild(colEliminar);

    tbody.appendChild(fila);
}

if (nombre && paterno && materno && edad && carrera && password) {
    pintar(nombre, paterno, materno, edad, carrera, password);
}

function modificar(id) {
    const row = document.getElementById(id);
    const nombre = row.cells[0].textContent;
    const paterno = row.cells[1].textContent;
    const materno = row.cells[2].textContent;
    const edad = row.cells[3].textContent;
    const carrera = row.cells[4].textContent;
    const password = row.cells[5].textContent;

    // Redirigir con parámetros en la URL
    const params = new URLSearchParams({
        nombreRegistro: nombre,
        aPaternoRegistro: paterno,
        aMaternoRegistro: materno,
        edadRegistro: edad,
        carreraRegistro: carrera,
        contraseñaRegistro: password
    });

    location.href = `registrarUsuario.html?${params.toString()}`;
}

function eliminar(id) {
    const row = document.getElementById(id);
    if (row) {
        row.remove();
    }
}