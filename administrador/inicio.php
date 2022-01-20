<?php include("template/cabecera.php");
?>

<div class="col-md-12">
	<div class="jumbotron">
		<h1 class="display-3">Bienvenido <?php echo $nombreUsuario; ?> !</h1>
		<p class="lead">Estamos en la seccion de administracion del sistema web.</p>
		<hr class="m-y-md">
		<p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
		<p class="lead">
			<a class="btn btn-primary btn-lg" href="seccion/productos.php" role="button">Administrar Libros</a>
		</p>
	</div>
</div>

<?php include("template/pie.php");
?>