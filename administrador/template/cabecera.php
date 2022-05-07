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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- JS dependencies -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<!-- DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">

	<!-- Bootstrap 4 dependency -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

	<!-- libreria para utilizar iconos en nuestras paginas  -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	<!-- tabla reportes -->
	<style>
		table.dataTable thead {background: linear-gradient(to right, #0575E6, #0575E6);
			color:white;}
		</style>
	</head>
	<body>

		<?php $url="http://".$_SERVER['HTTP_HOST']."/sci" ?>

		<!--nav class="navbar navbar-expand-md navbar-dark bg-primary"-->
		<nav class="navbar navbar-expand-md navbar-light bg-white border border-dark">
			<div class="container-fluid">		
				<a class="navbar-brand" href="<?php echo $url."/administrador/inicio.php" ?>">
					<img src="https://www.savethechildren.org.pe/wp-content/themes/save-the-children/images/logo-save-the-children.svg" alt="" width="" height="">
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
					</a>
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
					<div class="navbar-nav">
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Usuarios</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/usuarios.php?id=null" ?>">Mantenimiento Usuarios</a>	
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Informacion KOBO</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/uploadfile.php"?>">Nuevos beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/validacion.php"?>">Validación</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_nombres.php"?>">Nombres con incidencias</a>

							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Data Historica</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/upload_datahistorica.php"?>">Beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/validacionDH.php"?>">Validación</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_nombres.php"?>">Nombres con incidencias</a>
							</div>
						</li>			
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Cotejar datos</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios.php"?>">Cotejar Beneficiarios</a>
								<div class="dropdown-divider"></div>
								<div class="dropdown-menu-lg-left"> 
									<a class="dropdown-item active" href="">Migrar Datos Validados</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_beneficiario.php" ?>">Nuevos Beneficiarios</a>
									<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_historica.php" ?>">Datos Historicos</a>
								</div>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes Control</a>
							<div class="dropdown-menu">
								<!--a class="dropdown-item" href="<?php echo $url."/reportes/reporte.php" ?>">Reportes Control</a-->
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_001.php" ?>">Número de beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_002.php" ?>">Número de hogares con embarazadas</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_003.php" ?>">Hogares con familiares con discapacidad</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_004.php" ?>">Número de NNA matriculados en la escuela</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_005.php" ?>">Familias que viajan con menores de 17 años</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_006.php" ?>">Hogares con familiares que tienen ingresos</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_007.php" ?>">Número de integrantes por hogar</a>
								<a class="dropdown-item" href="<?php echo $url."/reportes/reporte_008.php" ?>">Número de infantes menores de 18 años</a>
							</div>
						</li>					
						<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
						<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>
					</div>
				</div>
			</div>
		</nav>

		<div class="container">
			<br><br>
			<div class="row">