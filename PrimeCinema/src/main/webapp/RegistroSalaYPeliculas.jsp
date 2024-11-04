<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro de Salas y Películas</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .table th, .table td {
      vertical-align: middle;
    }
    .table-hover tbody tr:hover {
      background-color: #f2f2f2;
    }
    .navbar {
      margin-bottom: 20px;
    }
  </style>
  <script>
    // Inicialización de datos desde el localStorage
    let salas = JSON.parse(localStorage.getItem('salas')) || [];
    let peliculas = JSON.parse(localStorage.getItem('peliculas')) || [];

    // Función para mostrar salas en la tabla
    function mostrarSalas() {
      const tablaSalas = document.getElementById('tablaSalas');
      tablaSalas.innerHTML = '';
      salas.forEach((sala, index) => {
        const fila = `<tr>
                        <td>${index + 1}</td>
                        <td>${sala.sucursal}</td>
                        <td>${sala.numeroSala}</td>
                        <td>${sala.pelicula}</td>
                        <td>${sala.horarios.join(', ')}</td>
                      </tr>`;
        tablaSalas.innerHTML += fila;
      });
    }

    // Función para mostrar películas en la tabla
    function mostrarPeliculas() {
      const tablaPeliculas = document.getElementById('tablaPeliculas');
      tablaPeliculas.innerHTML = '';
      peliculas.forEach((pelicula, index) => {
        const fila = `<tr>
                        <td>${index + 1}</td>
                        <td>${pelicula.nombre}</td>
                        <td>${pelicula.genero}</td>
                        <td>${pelicula.clasificacion}</td>
                        <td>${pelicula.formato}</td>
                        <td>${pelicula.valor}</td>
                      </tr>`;
        tablaPeliculas.innerHTML += fila;
      });
    }

    // Función para agregar una sala
    function guardarSala(event) {
      event.preventDefault(); // Evita la recarga de la página
      const sucursal = document.getElementById('sucursal').value;
      const numeroSala = document.getElementById('numeroSala').value;
      const pelicula = document.getElementById('peliculaSala').value;
      const horarios = document.getElementById('horarios').value.split(',').map(h => h.trim());

      if (sucursal && numeroSala && pelicula && horarios.length) {
        const nuevaSala = { sucursal, numeroSala, pelicula, horarios };
        salas.push(nuevaSala);
        localStorage.setItem('salas', JSON.stringify(salas)); // Guardar en localStorage
        document.getElementById('salaForm').reset();
        mostrarSalas();
      } else {
        alert("Por favor completa todos los campos.");
      }
    }

    // Función para agregar una película
    function guardarPelicula(event) {
      event.preventDefault(); // Evita la recarga de la página
      const nombre = document.getElementById('nombrePelicula').value;
      const genero = document.getElementById('genero').value;
      const clasificacion = document.getElementById('clasificacion').value;
      const formato = document.querySelector('input[name="formato"]:checked').value;
      const valor = document.getElementById('valor').value;

      if (nombre && genero && clasificacion && formato && valor) {
        const nuevaPelicula = { nombre, genero, clasificacion, formato, valor };
        peliculas.push(nuevaPelicula);
        localStorage.setItem('peliculas', JSON.stringify(peliculas)); // Guardar en localStorage
        document.getElementById('peliculaForm').reset();
        mostrarPeliculas();
      } else {
        alert("Por favor completa todos los campos.");
      }
    }

    // Cargar los datos al iniciar la página
    window.onload = function() {
      mostrarSalas();
      mostrarPeliculas();
    };
  </script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Registro de Salas y Películas</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="MenuEmpleado.jsp">Volver a Menú Empleado</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-5">

  <!-- Formulario para agregar sala -->
  <h2 class="text-center mb-4">Registro de Salas</h2>
  <div class="card mb-4">
    <div class="card-header">
      <h4>Agregar Sala</h4>
    </div>
    <div class="card-body">
      <form id="salaForm" onsubmit="guardarSala(event)">
        <div class="form-group">
          <label for="sucursal">Sucursal:</label>
          <input type="text" id="sucursal" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="numeroSala">Número de Sala:</label>
          <input type="text" id="numeroSala" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="peliculaSala">Película Proyectada:</label>
          <input type="text" id="peliculaSala" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="horarios">Horarios (separados por comas):</label>
          <input type="text" id="horarios" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Agregar Sala</button>
      </form>
    </div>
  </div>

  <!-- Tabla para mostrar salas -->
  <h3 class="text-center mb-4">Salas Registradas</h3>
  <table class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>#</th>
      <th>Sucursal</th>
      <th>Número de Sala</th>
      <th>Película Proyectada</th>
      <th>Horarios</th>
    </tr>
    </thead>
    <tbody id="tablaSalas"></tbody>
  </table>

  <!-- Formulario para agregar película -->
  <h2 class="text-center mb-4">Registro de Películas</h2>
  <div class="card mb-4">
    <div class="card-header">
      <h4>Agregar Película</h4>
    </div>
    <div class="card-body">
      <form id="peliculaForm" onsubmit="guardarPelicula(event)">
        <div class="form-group">
          <label for="nombrePelicula">Nombre:</label>
          <input type="text" id="nombrePelicula" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="genero">Género:</label>
          <input type="text" id="genero" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="clasificacion">Clasificación:</label>
          <input type="text" id="clasificacion" class="form-control" required>
        </div>
        <div class="form-group">
          <label>Formato:</label><br>
          <label class="form-check-label">
            <input type="radio" name="formato" value="Tradicional" required> Tradicional
          </label>
          <label class="form-check-label ml-3">
            <input type="radio" name="formato" value="3D"> 3D
          </label>
        </div>
        <div class="form-group">
          <label for="valor">Valor de la función:</label>
          <input type="number" id="valor" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Agregar Película</button>
      </form>
    </div>
  </div>

  <!-- Tabla para mostrar películas -->
  <h3 class="text-center mb-4">Películas Registradas</h3>
  <table class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>#</th>
      <th>Nombre</th>
      <th>Género</th>
      <th>Clasificación</th>
      <th>Formato</th>
      <th>Valor</th>
    </tr>
    </thead>
    <tbody id="tablaPeliculas"></tbody>
  </table>

</div>
</body>
</html>
