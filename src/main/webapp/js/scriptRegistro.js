const form = document.getElementById("registro-form");
        const btnSubmit = document.getElementById("btnSubmitRegistro");

        //Obtención de datos
        btnSubmit.addEventListener("click", (e) => {
            //e.preventDefault;
            const nombre = document.getElementById("nombreRegistro").value;
            const paterno = document.getElementById("aPaternoRegistro").value;
            const materno = document.getElementById("aMaternoRegistro").value;
            const carrera = document.getElementById("carreraRegistro").value;
            const edad = document.getElementById("edadRegistro").value;
            const password = document.getElementById("contraseñaRegistro").value;

            console.log(`Nombre: ${nombre}, Apellido Paterno: ${paterno}, Apellido Materno: ${materno}, Edad: ${edad}`);

        });
        getParameter = (key) => {
            // url de la ventana actual
            address = window.location.search;

            //Objeto de tipo URLSearchParams
            parameterList = new URLSearchParams(address);
            //Regresa el valor del parámetro “key”
            return parameterList.get(key);


        }
        console.log(getParameter("nombreRegistro"));
        document.getElementById('nombreRegistro').value = getParameter('nombreRegistro') || '';
        document.getElementById('aPaternoRegistro').value = getParameter('aPaternoRegistro') || '';
        document.getElementById('aMaternoRegistro').value = getParameter('aMaternoRegistro') || '';
        document.getElementById('edadRegistro').value = getParameter('edadRegistro') || '';
        document.getElementById('carreraRegistro').value = getParameter('carreraRegistro') || '';
        document.getElementById('contraseñaRegistro').value = getParameter('contraseñaRegistro') || '';