<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Gestión de Sucursales</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    .table th, .table td {
      vertical-align: middle;
    }
    .table-hover tbody tr:hover {
      background-color: #f2f2f2;
    }
    .btn-icon {
      margin-right: 5px;
    }
    .navbar {
      margin-bottom: 20px;
    }
    .nav-item {
      transition: background-color 0.3s;
    }
    .nav-item:hover {
      background-color: #f8f9fa;
    }
  </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Gestión de Sucursales</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="verSucursales();"><i class="fas fa-list"></i> Ver Sucursales</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="agregarSucursal();"><i class="fas fa-plus"></i> Agregar Sucursal</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="MenuEmpleado.jsp"><i class="fas fa-arrow-left"></i> Regresar al Menú</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="cerrarSesion();"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
      </li>
    </ul>
  </div>
</nav>

<div class="container mt-5">
  <h2 class="text-center mb-4">Gestión de Sucursales</h2>

  <!-- Formulario para agregar o editar sucursal -->
  <div class="card mb-4 animate__animated animate__fadeIn">
    <div class="card-header">
      <h4 id="form-title">Agregar Sucursal</h4>
    </div>
    <div class="card-body">
      <form id="sucursalForm" onsubmit="return false;">
        <input type="hidden" id="sucursalId" value="">
        <div class="form-group">
          <label for="nombreSucursal">Nombre de la Sucursal:</label>
          <input type="text" id="nombreSucursal" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="direccion">Dirección:</label>
          <input type="text" id="direccion" class="form-control" required>
        </div>
        <div class="form-group">
          <label for="telefono">Teléfono:</label>
          <input type="text" id="telefono" class="form-control" required pattern="\d{8}">
          <small class="form-text text-muted">El teléfono debe tener 8 dígitos.</small>
        </div>
        <button type="submit" class="btn btn-primary btn-block" id="form-button" onclick="guardarSucursal()">Agregar Sucursal</button>
      </form>
    </div>
  </div>

  <!-- Tabla de sucursales -->
  <table class="table table-bordered table-hover animate__animated animate__fadeIn">
    <thead class="thead-dark">
    <tr>
      <th>ID</th>
      <th>Nombre</th>
      <th>Dirección</th>
      <th>Teléfono</th>
      <th>Acciones</th>
    </tr>
    </thead>
    <tbody id="sucursalTableBody">
    <tr>
      <td colspan="5" class="text-center">No hay sucursales disponibles.</td>
    </tr>
    </tbody>
  </table>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
  let sucursales = []; // Arreglo para almacenar las sucursales
  let editIndex = -1; // Índice de edición

  // Función para actualizar la tabla de sucursales
  function actualizarTabla() {
    const tableBody = $("#sucursalTableBody");
    tableBody.empty();

    if (sucursales.length === 0) {
      tableBody.append(`<tr><td colspan="5" class="text-center">No hay sucursales disponibles.</td></tr>`);
      return;
    }

    sucursales.forEach((sucursal) => {
      const row = $(`
        <tr>
          <td>${sucursal.id}</td>
          <td>${sucursal.nombre}</td>
          <td>${sucursal.direccion}</td>
          <td>${sucursal.telefono}</td>
          <td>
            <button class="btn btn-primary btn-sm" onclick="editarSucursal(${sucursal.id - 1})">
              <i class="fas fa-edit"></i> Editar
            </button>
            <button class="btn btn-danger btn-sm" onclick="eliminarSucursal(${sucursal.id - 1})">
              <i class="fas fa-trash"></i> Eliminar
            </button>
          </td>
        </tr>
      `);
      tableBody.append(row);
    });
  }

  // Función para limpiar el formulario
  function limpiarFormulario() {
    $("#sucursalId").val("");
    $("#nombreSucursal").val("");
    $("#direccion").val("");
    $("#telefono").val("");
    $("#form-title").text("Agregar Sucursal");
    $("#form-button").text("Agregar Sucursal");
    editIndex = -1; // Resetea el índice de edición
  }

  // Función para guardar o editar una sucursal
  function guardarSucursal() {
    const nombre = $("#nombreSucursal").val().trim();
    const direccion = $("#direccion").val().trim();
    const telefono = $("#telefono").val().trim();

    // Validar que todos los campos estén llenos
    if (nombre === "" || direccion === "" || telefono === "") {
      alert("Por favor, completa todos los campos.");
      return;
    }

    if (editIndex === -1) {
      // Agregar nueva sucursal
      const nuevaSucursal = {
        id: sucursales.length + 1, // ID incremental
        nombre: nombre,
        direccion: direccion,
        telefono: telefono
      };
      sucursales.push(nuevaSucursal);
    } else {
      // Editar sucursal existente
      sucursales[editIndex].nombre = nombre;
      sucursales[editIndex].direccion = direccion;
      sucursales[editIndex].telefono = telefono;
    }

    limpiarFormulario();
    actualizarTabla();
  }

  // Función para editar una sucursal
  function editarSucursal(index) {
    const sucursal = sucursales[index];
    $("#sucursalId").val(sucursal.id);
    $("#nombreSucursal").val(sucursal.nombre);
    $("#direccion").val(sucursal.direccion);
    $("#telefono").val(sucursal.telefono);
    $("#form-title").text("Editar Sucursal");
    $("#form-button").text("Actualizar Sucursal");
    editIndex = index; // Establece el índice de edición
  }

  // Función para eliminar una sucursal
  function eliminarSucursal(index) {
    if (confirm(`¿Estás seguro de que deseas eliminar la sucursal "${sucursales[index].nombre}"?`)) {
      sucursales.splice(index, 1);
      actualizarTabla();
    }
  }

  // Función para ver sucursales
  function verSucursales() {
    actualizarTabla();
    limpiarFormulario();
  }

  // Función para agregar una nueva sucursal
  function agregarSucursal() {
    limpiarFormulario();
  }

  // Función para cerrar sesión
  function cerrarSesion() {
    // Implementa la lógica de cierre de sesión
    window.location.href = "login.jsp"; // Redirige a la página de logout
  }

  // Inicializar la tabla
  actualizarTabla();
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
