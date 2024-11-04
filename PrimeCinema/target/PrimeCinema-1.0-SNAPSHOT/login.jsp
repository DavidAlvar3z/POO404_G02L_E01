<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .btn-primary, .btn-secondary {
            transition: transform 0.3s;
        }
        .btn-primary:hover, .btn-secondary:hover {
            transform: scale(1.05);
        }
        .logo {
            font-family: 'Roboto', sans-serif;
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center logo mb-4">Mi Aplicación - Iniciar Sesión</h2>

    <% if (request.getParameter("success") != null) { %>
    <div class="alert alert-success">Registro exitoso. Ahora puedes iniciar sesión.</div>
    <% } %>

    <form action="login.jsp" method="post" class="shadow p-4 rounded">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="contraseña">Contraseña:</label>
            <input type="password" id="contraseña" name="contraseña" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="rol">Tipo de Usuario:</label>
            <select id="rol" name="rol" class="form-control" required>
                <option value="cliente">Cliente</option>
                <option value="empleado">Empleado</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Ingresar</button>
        <div class="text-center mt-3">
            <a href="registro.jsp" class="btn btn-secondary">¿No tienes cuenta? Regístrate</a>
        </div>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String email = request.getParameter("email");
            String contraseña = request.getParameter("contraseña");
            String rol = request.getParameter("rol");

            String emailRegistrado = (String) session.getAttribute("emailRegistrado");
            String contraseñaRegistrada = (String) session.getAttribute("contraseñaRegistrada");
            String rolRegistrado = (String) session.getAttribute("rolRegistrado");

            if (email != null && contraseña != null && rol != null
                    && email.equals(emailRegistrado)
                    && contraseña.equals(contraseñaRegistrada)
                    && rol.equals(rolRegistrado)) {

                session.setAttribute("usuarioLogueado", emailRegistrado);
                session.setAttribute("rolLogueado", rolRegistrado);

                if ("empleado".equals(rolRegistrado)) {
                    response.sendRedirect("MenuEmpleado.jsp");
                } else {
                    response.sendRedirect("cartelera.jsp");
                }
            } else {
                out.println("<div class='alert alert-danger mt-3'>Error: El email, la contraseña o el tipo de usuario son incorrectos.</div>");
            }
        }
    %>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
