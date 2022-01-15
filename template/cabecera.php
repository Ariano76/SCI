<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">

	<!-- jQuery -->
	<script type="text/javascript" 
	src="https://code.jquery.com/jquery-3.5.1.js">
</script>
<!-- DataTables CSS -->
<link rel="stylesheet"
href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">  
<!-- DataTables JS -->
  	<!--script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js">
  	</script-->

  	<!-- tabla reportes -->
  	<style>
  		table.dataTable thead {
  			background: linear-gradient(to right, #0575E6, #0575E6);
  			color:white;	}
  		</style>  

  	</head>
  	<body>

  		<nav class="navbar navbar-expand-md navbar-dark bg-primary">
  			<div class="container-fluid">		
  				<a class="navbar-brand" href="#">Save The Children</a>
  				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
  					<span class="navbar-toggler-icon"></span>
  				</button>
  				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  					<div class="navbar-nav">
  						<a class="nav-item nav-link active" href="index.php">Inicio</a>
  						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Beneficiarios</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="#">Encuesta</a>
  								<a class="dropdown-item" href="#">Beneficiario</a>
  								<a class="dropdown-item" href="#">Familiares</a>
  								<a class="dropdown-item" href="#">Comunicación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="#">Nutrición</a>
  								<a class="dropdown-item" href="#">Salud</a>
  								<a class="dropdown-item" href="#">Educación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="#">Derivación a sectores</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="#">Estatus</a>
  							</div>
  						</li>
  						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Informacion KOBO</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="uploadfile.php">Nuevos beneficiarios</a>
  								<a class="dropdown-item" href="validacion.php">Validación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="repo_validacion_dni.php">Documentos con incidencias</a>
  								<a class="dropdown-item" href="repo_validacion_nombres.php">Nombres con incidencias</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="#">Cotejo en Base Historica</a>
  							</div>
  						</li>					
  						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Data Historica</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="upload_datahistorica.php">Beneficiarios</a>
  								<a class="dropdown-item" href="validacionDH.php">Validación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="repo_validacionDH_dni.php">Documentos con incidencias</a>
  								<a class="dropdown-item" href="repo_validacionDH_nombres.php">Nombres con incidencias</a>
  							</div>
  						</li>					
  						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar datos validados</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="upload_datahistorica.php">Datos Historicos</a>
  								<a class="dropdown-item" href="validacionDH.php">Nuevos Beneficiarios</a>
  							</div>
  						</li>
  						<a class="nav-item nav-link" href="administrador\index.php" tabindex="-1" aria-disabled="true">Administrador</a>
  						<a class="nav-item nav-link" href="nosotros.php">Nosotros</a>
  						<a class="nav-item nav-link" href="productos.php">Productos</a>
  					</div>
  				</div>
  			</div>
  		</nav>

  		<div class="container">
  			<br>
  			<!-- Content here -->
  			<div class="row">
