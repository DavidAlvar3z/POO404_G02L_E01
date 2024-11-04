<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 20px;
    }
    h1, h2 {
      color: #333;
    }
  </style>
</head>
<body>

<div class="container mt-5">
  <h1 class="text-center">Selección de Funciones</h1>

  <form action="compra.jsp" method="get">
    <div class="form-group">
      <label for="peliculaSelect">Seleccionar Película:</label>
      <select id="peliculaSelect" name="pelicula" class="form-control" required>
        <option value="">-- Elige una película --</option>
        <option value="1">Película 1</option>
        <option value="2">Película 2</option>
        <option value="3">Película 3</option>
        <option value="4">Película 4</option>
        <option value="5">Película 5</option>
        <option value="6">Película 6</option>
        <option value="7">Película 7</option>
        <option value="8">Película 8</option>
      </select>
    </div>

    <div class="form-group">
      <label for="horarioSelect">Seleccionar Horario:</label>
      <select id="horarioSelect" name="horario" class="form-control" required>
        <option value="">-- Elige un horario --</option>
        <option value="14:00">14:00 - 2D - $5.00</option>
        <option value="16:30">16:30 - 3D - $7.00</option>
        <option value="19:00">19:00 - VIP - $10.00</option>
        <option value="15:00">15:00 - 2D - $5.00</option>
        <option value="17:30">17:30 - 3D - $7.00</option>
        <option value="20:00">20:00 - VIP - $10.00</option>
        <option value="12:00">12:00 - 2D - $5.00</option>
        <option value="15:30">15:30 - 3D - $7.00</option>
        <option value="13:00">13:00 - 2D - $5.00</option>
        <option value="18:30">18:30 - 3D - $7.00</option>
        <option value="14:30">14:30 - 2D - $5.00</option>
        <option value="20:00">20:00 - VIP - $10.00</option>
        <option value="15:00">15:00 - 3D - $7.00</option>
        <option value="19:00">19:00 - 2D - $5.00</option>
        <option value="17:00">17:00 - VIP - $10.00</option>
        <option value="21:00">21:00 - 3D - $7.00</option>
        <option value="16:00">16:00 - 2D - $5.00</option>
        <option value="18:30">18:30 - VIP - $10.00</option>
      </select>
    </div>

    <div class="form-group">
      <label for="salaSelect">Seleccionar Sala:</label>
      <select id="salaSelect" name="sala" class="form-control" required>
        <option value="1">Sala 1</option>
        <option value="2">Sala 2</option>
        <option value="3">Sala 3</option>
      </select>
    </div>

    <button type="submit" class="btn btn-success">Comprar</button>
  </form>
</div>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>