<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	
	<!--link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">  
	<!-- DataTables JS -->
  	<!--script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js">
  	</script-->

	<!-- libreria para utilizar iconos en nuestras paginas  -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">  	

  	<!-- tabla reportes -->
  	<style>
  		table.dataTable thead {
  			background: linear-gradient(to right, #0575E6, #0575E6);
  			color:white;	}
  		</style>  

  	</head>
  	<body>
  		<?php $url="http://".$_SERVER['HTTP_HOST']."/sci" ?>

  		<!--nav class="navbar navbar-expand-md navbar-dark bg-primary"-->
  		<!--nav class="navbar navbar-expand-md navbar-light" style="background-color: #DA291C;"-->
  		<nav class="navbar navbar-expand-md navbar-light bg-white border border-dark">
  			<div class="container-fluid">		
  				<a class="navbar-brand" href="#"></a>
  				<img src="https://www.savethechildren.org.pe/wp-content/themes/save-the-children/images/logo-save-the-children.svg" alt="" width="" height="">
  				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
  					<span class="navbar-toggler-icon"></span>
  				</button>
  				<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  					<div class="navbar-nav">
  						<a class="nav-item nav-link active" href="<?php echo $url."/index.php"?>">Inicio</a>
  						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Beneficiarios</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/general.php" ?>">Datos Generales</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/encuesta.php"?>">Encuesta</a>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/beneficiario.php"?>">Beneficiario</a>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/integrantes.php"?>">Familiares</a>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/comunicacion.php"?>">Comunicación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/nutricion.php"?>">Nutrición</a>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/salud.php"?>">Salud</a>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/educacion.php"?>">Educación</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/derivacion.php"?>">Derivación a sectores</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/estatus.php"?>">Estatus</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/beneficiario/bitacora.php"?>">Bitacora</a>
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
  						<a class="nav-item nav-link" href="<?php echo $url."/cotejo_beneficiarios.php"?>">Cotejar Beneficiarios</a>
  						<!--li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar datos validados</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="upload_datahistorica.php">Datos Historicos</a>
  								<a class="dropdown-item" href="validacionDH.php">Nuevos Beneficiarios</a>
  							</div>
  						</li-->
  						<a class="nav-item nav-link" href="<?php echo $url."/administrador/index.php"?>" tabindex="-1" aria-disabled="true">Administrador</a>
						<li>
  							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reporte a Sectores</a>
  							<div class="dropdown-menu">
  								<a class="dropdown-item" href="<?php echo $url."/repo_proteccion.php"?>">MERA Protección</a>
  								<a class="dropdown-item" href="<?php echo $url."/repo_salud.php"?>">Salud</a>
  								<div class="dropdown-divider"></div>
  								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_dni.php"?>">Nutrición</a>
  								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_nombres.php"?>">Medios de Vida</a>
  							</div>
  						</li>		
  						<!--a class="nav-item nav-link" href="productos.php">Productos</a-->
  					</div>
  				</div>
  			</div>
  		</nav>

  		<div class="container">
  			<br>
  			<!-- Content here -->
  			<div class="row">
