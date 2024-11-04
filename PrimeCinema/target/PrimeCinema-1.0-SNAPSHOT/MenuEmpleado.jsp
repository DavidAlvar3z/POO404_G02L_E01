<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Menú de Empleado</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  <style>
    body {
      background-color: #f8f9fa;
    }
    .menu-title {
      margin-bottom: 20px;
    }
    .list-group-item {
      transition: all 0.3s ease;
    }
    .list-group-item:hover {
      background-color: #007bff;
      color: white;
      transform: scale(1.05);
    }
    .list-group-item i {
      margin-right: 10px;
    }
  </style>
</head>
<body>
<div class="container mt-5">
  <h2 class="text-center menu-title animate__animated animate__fadeIn">Menú de Empleado</h2>

  <%
    String rolLogueado = (String) session.getAttribute("rolLogueado");
    if (rolLogueado == null || !"empleado".equals(rolLogueado)) {
      response.sendRedirect("login.jsp");
    }
  %>

  <div class="list-group animate__animated animate__fadeIn">
    <a href="RegistroSucursal.jsp" class="list-group-item list-group-item-action">
      <i class="fas fa-store"></i> Registro de Sucursal
    </a>
    <a href="RegistroSalaYPeliculas.jsp" class="list-group-item list-group-item-action">
      <i class="fas fa-film"></i> Registro de Sala
    </a>
    <a href="RegistroSalaYPeliculas.jsp" class="list-group-item list-group-item-action">
      <i class="fas fa-video"></i> Registro de Películas
    </a>
  </div>

  <div class="mt-3">
    <a href="login.jsp" class="btn btn-secondary btn-block">Cerrar Sesión</a>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>
