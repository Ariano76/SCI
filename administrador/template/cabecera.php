<?php 

session_start();

if (!isset($_SESSION['usuario'])) {
	header("Location:../index.php");	
}else {
	if ($_SESSION['usuario'] == 'ok') {
		$nombreUsuario = $_SESSION['nombreUsuario'];
	}
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Page Title</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>

	<?php $url="http://".$_SERVER['HTTP_HOST']."/sci" ?>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Save The Children</a>
		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">	      
				<a class="nav-item nav-link active" href="#">Administrador del sitio web</a>
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/inicio.php" ?>">Inicio</a>				
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/usuarios.php?id=null" ?>">Usuarios</a>
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/productos.php" ?>">Libros</a>
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
				<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>	      
			</div>
		</div>
	</nav>

	<div class="container">
		<br><br>
		<div class="row">