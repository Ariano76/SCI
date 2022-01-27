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
	<title>Administración SCI</title>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


	<!-- JS dependencies -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- Bootstrap 4 dependency -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<!-- libreria para utilizar iconos en nuestras paginas  -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	<!-- bootbox code -->
	<script type="text/javascript" src="script/bootbox.min.js"></script>
	<script type="text/javascript" src="script/deleteRecords.js"></script>


</head>
<body>

	<?php $url="http://".$_SERVER['HTTP_HOST']."/sci" ?>

	<nav class="navbar navbar-expand-md navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Save The Children</a>		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">	      
				<a class="nav-item nav-link active" href="#">Administrador del sitio web</a>
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/inicio.php" ?>">Inicio</a>				
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/usuarios.php?id=null" ?>">Usuarios</a>
				<li>
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar datos validados</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_historica.php" ?>">Datos Historicos</a>
						<a class="dropdown-item" href="">Nuevos Beneficiarios</a>
					</div>
				</li>
				<!--a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/productos.php" ?>">Libros</a-->
				<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
				<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>	      
			</div>
		</div>
	</nav>

	<div class="container">
		<br><br>
		<div class="row">