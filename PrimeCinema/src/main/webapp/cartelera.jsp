<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Cartelera de Películas</title>
</head>
<body>

<div class="container mt-5">
  <h1 class="text-center">Cartelera de Películas</h1>

  <div id="carouselExampleIndicators" class="carousel slide mb-4" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="./IMG/Foto1.jpeg" class="d-block w-100" alt="Película Destacada 1">
      </div>
      <div class="carousel-item">
        <img src="./IMG/Foto3.webp" class="d-block w-100" alt="Película Destacada 2">
      </div>
      <div class="carousel-item">
        <img src="./IMG/Foto6.jpg" class="d-block w-100" alt="Película Destacada 3">
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Anterior</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Siguiente</span>
    </a>
  </div>

  <div class="row">
    <!-- Carta 1 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto1.jpeg" class="card-img-top" alt="Película 1">
        <div class="card-body">
          <h5 class="card-title">Guardians of the Galaxy Vol. 3</h5>
          <p class="card-text">Género: Acción, Aventura</p>
          <p class="card-text">Precio: $12.00</p>
          <p class="card-text">Horarios: 14:00, 16:30, 19:00, 21:30</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal1">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>

    <!-- Carta 2 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto2.avif" class="card-img-top" alt="Película 2">
        <div class="card-body">
          <h5 class="card-title">Spider-Man: Across the Spider-Verse</h5>
          <p class="card-text">Género: Animación, Acción</p>
          <p class="card-text">Precio: $10.00</p>
          <p class="card-text">Horarios: 15:00, 17:30, 20:00</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal2">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>

    <!-- Carta 3 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto3.webp" class="card-img-top" alt="Película 3">
        <div class="card-body">
          <h5 class="card-title">Fast X</h5>
          <p class="card-text">Género: Acción, Aventura</p>
          <p class="card-text">Precio: $15.00</p>
          <p class="card-text">Horarios: 16:00, 19:00, 22:00</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal3">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>

    <!-- Carta 4 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto5.webp" class="card-img-top" alt="Película 4">
        <div class="card-body">
          <h5 class="card-title">The Little Mermaid</h5>
          <p class="card-text">Género: Fantasía, Musical</p>
          <p class="card-text">Precio: $12.00</p>
          <p class="card-text">Horarios: 13:00, 15:15, 17:30</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal4">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>

    <!-- Carta 5 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto6.jpg" class="card-img-top" alt="Película 5">
        <div class="card-body">
          <h5 class="card-title">Transformers: Rise of the Beasts</h5>
          <p class="card-text">Género: Acción, Ciencia Ficción</p>
          <p class="card-text">Precio: $14.00</p>
          <p class="card-text">Horarios: 18:00, 21:00, 23:30</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal5">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>

    <!-- Carta 6 -->
    <div class="col-md-4 mb-4">
      <div class="card">
        <img src="./IMG/Foto4.jpg" class="card-img-top" alt="Película 6">
        <div class="card-body">
          <h5 class="card-title">Elemental</h5>
          <p class="card-text">Género: Animación, Familiar</p>
          <p class="card-text">Precio: $10.00</p>
          <p class="card-text">Horarios: 13:00, 15:30, 18:00</p>
          <button class="btn btn-primary" data-toggle="modal" data-target="#modal6">Detalles</button>
          <a href="seleccionFuncion.jsp" class="btn btn-success">Comprar</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modales para Detalles de Películas -->
<div id="modales">
  <!-- Modal 1 -->
  <div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel1">Detalles de Guardians of the Galaxy Vol. 3</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: El equipo de los Guardianes de la Galaxia se embarca en una misión para proteger a uno de sus propios miembros.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 2 -->
  <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="modalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel2">Detalles de Spider-Man: Across the Spider-Verse</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: Miles Morales regresa para una nueva aventura mientras se encuentra con diferentes Spider-Personas en el multiverso.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 3 -->
  <div class="modal fade" id="modal3" tabindex="-1" role="dialog" aria-labelledby="modalLabel3" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel3">Detalles de Fast X</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: La familia Toretto se enfrenta a un nuevo enemigo que busca venganza.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 4 -->
  <div class="modal fade" id="modal4" tabindex="-1" role="dialog" aria-labelledby="modalLabel4" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel4">Detalles de The Little Mermaid</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: La historia de Ariel, una joven sirena que anhela ser humana.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 5 -->
  <div class="modal fade" id="modal5" tabindex="-1" role="dialog" aria-labelledby="modalLabel5" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel5">Detalles de Transformers: Rise of the Beasts</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: Un nuevo capítulo en la saga de Transformers que explora la historia de los Maximals y los Predacons.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 6 -->
  <div class="modal fade" id="modal6" tabindex="-1" role="dialog" aria-labelledby="modalLabel6" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel6">Detalles de Elemental</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Descripción: Un viaje a través de un mundo donde los elementos son personajes que enfrentan sus diferencias.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
