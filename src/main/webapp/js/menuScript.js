document.getElementById('logout-btn').addEventListener('click', function() {
    fetch('/logout', {
        method: 'POST',
        credentials: 'include' // Incluir credenciales (como cookies) en la solicitud
    })
        .then(response => {
            if (response.ok) {
                // Redirigir al usuario a la página de inicio de sesión o página pública
                window.location.href = 'index.jsp';
            } else {
                alert('Error al cerrar sesión');
            }
        });
});
