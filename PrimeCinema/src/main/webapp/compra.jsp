<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compra de Entradas</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .btn-confirm {
            background-color: #28a745;
            color: white;
        }
        .btn-confirm:hover {
            background-color: #218838;
        }
    </style>
    <script>
        $(document).ready(function() {
            // Ejemplo de cálculo del total (precio simulado)
            const precioEntrada = 5.00;
            const numButacasSeleccionadas = 2; // Cambia según el número de butacas seleccionadas
            const total = precioEntrada * numButacasSeleccionadas;
            $('#totalPagar').text(total.toFixed(2));

            // Muestra el campo "monto recibido" si el pago es en efectivo
            $('#pago').change(function() {
                if ($(this).val() === 'efectivo') {
                    $('#efectivo').show();
                } else {
                    $('#efectivo').hide();
                }
            });

            $('#confirmar').on('click', function() {
                const montoRecibido = parseFloat($('#montoRecibido').val());
                const cambio = montoRecibido - total;

                if (isNaN(montoRecibido) || montoRecibido < total) {
                    alert("Por favor, ingrese un monto válido que cubra el total.");
                    return;
                }

                alert(`Compra confirmada. Cambio: $${cambio.toFixed(2)}`);
                // Redirigir a cartelera.jsp después de confirmar
                window.location.href = 'cartelera.jsp';
            });
        });
    </script>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center animate__animated animate__fadeIn">Compra de Entradas</h1>
    <p class="text-center">Total a pagar: $<span id="totalPagar"></span></p>

    <!-- Opciones de pago -->
    <div class="form-group">
        <label for="pago">Método de pago:</label>
        <select id="pago" class="form-control">
            <option value="tarjeta">Tarjeta</option>
            <option value="efectivo">Efectivo</option>
        </select>
    </div>

    <div id="efectivo" class="form-group" style="display: none;">
        <label for="montoRecibido">Monto recibido:</label>
        <input type="number" id="montoRecibido" class="form-control" placeholder="Ingrese el monto recibido">
    </div>

    <button id="confirmar" class="btn btn-confirm btn-block">Confirmar Compra</button>
</div>
</body>
</html>
