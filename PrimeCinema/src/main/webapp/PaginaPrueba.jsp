<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Página de Prueba</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background: linear-gradient(45deg, #6a11cb, #2575fc);
      color: white;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      animation: gradient 5s ease infinite;
    }

    @keyframes gradient {
      0% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
      100% {
        background-position: 0% 50%;
      }
    }

    .container {
      text-align: center;
      background-color: rgba(255, 255, 255, 0.1);
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    }

    h1 {
      font-size: 2.5em;
      margin-bottom: 20px;
      animation: fadeIn 2s;
    }

    p {
      font-size: 1.2em;
      animation: fadeIn 2s 0.5s;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Página de Prueba</h1>
  <p>¡Bienvenido a tu página de prueba!</p>
  <p>Este es un ejemplo de animación CSS en una página JSP.</p>
</div>
</body>
</html>