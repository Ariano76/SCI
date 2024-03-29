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
	<!--meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Administración SCI</title>

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

	<!-- JS dependencies -->
	<!--script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script-->

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>	

	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
	<!-- DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css">

	<!-- libreria para utilizar iconos en nuestras paginas  -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

	<!-- tabla reportes -->
	<style>
		table.dataTable thead {background: linear-gradient(to right, #0575E6, #0575E6);
			color:white;}
			.success {
				background: #c7efd9;
				border: #bbe2cd 1px solid;
			}
			.error {
				background: #fbcfcf;
				border: #f3c6c7 1px solid;
			}
			.firma {
				background: #FFF3CD;
				border: #f3c6c7 1px solid;
			}
			div#response.display-block {
				display: block;
			}
			/* ============ desktop view ============ */
			@media all and (min-width: 992px) {

				.dropdown-menu li{
					position: relative;
				}
				.dropdown-menu .submenu{ 
					display: none;
					position: absolute;
					left:100%; top:-7px;
				}
				.dropdown-menu .submenu-left{ 
					right:100%; left:auto;
				}

				.dropdown-menu > li:hover{ background-color: #f1f1f1 }
				.dropdown-menu > li:hover > .submenu{
					display: block;
				}
			}	
/* ============ desktop view .end// ============ */

/* ============ small devices ============ */
@media (max-width: 991px) {

	.dropdown-menu .dropdown-menu{
		margin-left:0.7rem; margin-right:0.7rem; margin-bottom: .5rem;
	}

}	
/* ============ small devices .end// ============ */
</style>

<script type="text/javascript">
//	window.addEventListener("resize", function() {
//		"use strict"; window.location.reload(); 
//	});


document.addEventListener("DOMContentLoaded", function(){

    	/////// Prevent closing from click inside dropdown
    	document.querySelectorAll('.dropdown-menu').forEach(function(element){
    		element.addEventListener('click', function (e) {
    			e.stopPropagation();
    		});
    	})

		// make it as accordion for smaller screens
		if (window.innerWidth < 992) {

			// close all inner dropdowns when parent is closed
			document.querySelectorAll('.navbar .dropdown').forEach(function(everydropdown){
				everydropdown.addEventListener('hidden.bs.dropdown', function () {
					// after dropdown is hidden, then find all submenus
					this.querySelectorAll('.submenu').forEach(function(everysubmenu){
					  	// hide every submenu as well
					  	everysubmenu.style.display = 'none';
					  });
				})
			});
			
			document.querySelectorAll('.dropdown-menu a').forEach(function(element){
				element.addEventListener('click', function (e) {

					let nextEl = this.nextElementSibling;
					if(nextEl && nextEl.classList.contains('submenu')) {	
				  		// prevent opening link if link needs to open dropdown
				  		e.preventDefault();
				  		console.log(nextEl);
				  		if(nextEl.style.display == 'block'){
				  			nextEl.style.display = 'none';
				  		} else {
				  			nextEl.style.display = 'block';
				  		}

				  	}
				  });
			})
		}
		// end if innerWidth
	}); 
	// DOMContentLoaded  end
</script>

</head>
<body>

	<?php $url="http://".$_SERVER['HTTP_HOST']."/sci" ?>
	<?php 
	if ($_SESSION['rolusuario']==1) { // ROL ADMINISTRADOR
		?>
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
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/usuarios.php?id=4" ?>">Mantenimiento Usuarios</a>	
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Datos KOBO</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/uploadfile.php"?>">Cargar Nuevos beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/validacion.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_excel.php"?>">Validar registros mismo documento</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios_nuevos.php"?>">Cotejar Nuevos Beneficiarios con data historica</a>
								<a class="dropdown-item" href="<?php echo $url."/upload_observaciones.php"?>">Subir Observaciones</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Data Historica</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/upload_datahistorica.php"?>">Cargar bases internas y de aliados</a>
								<a class="dropdown-item" href="<?php echo $url."/validacionDH.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios.php"?>">Cotejar Nuevos Datos Historicos</a>
							</div>
						</li>			
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar Datos</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_historica.php" ?>">Datos Historicos Nuevos Validados</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_beneficiario.php" ?>">Nuevos Beneficiarios Validados</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes Control</a>
							<div class="dropdown-menu">
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
		<?php 
	} elseif($_SESSION['rolusuario']==2) { // ROL ANALISTA
		?>
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
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Datos KOBO</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/uploadfile.php"?>">Cargar Nuevos beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/validacion.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_excel.php"?>">Validar registros mismo documento</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios_nuevos.php"?>">Cotejar Nuevos Beneficiarios con data historica</a>
								<a class="dropdown-item" href="<?php echo $url."/upload_observaciones.php"?>">Subir Observaciones</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Data Historica</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/upload_datahistorica.php"?>">Cargar bases internas y de aliados</a>
								<a class="dropdown-item" href="<?php echo $url."/validacionDH.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios.php"?>">Cotejar Nuevos Datos Historicos</a>
							</div>
						</li>			
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar Datos</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_historica.php" ?>">Datos Historicos Nuevos Validados</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_beneficiario.php" ?>">Nuevos Beneficiarios Validados</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes Control</a>
							<div class="dropdown-menu">
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
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Finanzas</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/paquete_finanzas.php" ?>">Consultar datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/generar_paquete.php" ?>">Enviar datos a coordinador</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/finanza/finanza_paquete.php" ?>">Consultar estado de paquetes</a>
							</div>
						</li>						
						<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
						<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>
					</div>
				</div>
			</div>
		</nav>
		<?php	
	} elseif($_SESSION['rolusuario']==3) { // ROL GERENCIA
		?>
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
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Datos KOBO</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/uploadfile.php"?>">Cargar Nuevos beneficiarios</a>
								<a class="dropdown-item" href="<?php echo $url."/validacion.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacion_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_excel.php"?>">Validar registros mismo documento</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios_nuevos.php"?>">Cotejar Nuevos Beneficiarios con data historica</a>
								<a class="dropdown-item" href="<?php echo $url."/upload_observaciones.php"?>">Subir Observaciones</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Data Historica</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/upload_datahistorica.php"?>">Cargar bases internas y de aliados</a>
								<a class="dropdown-item" href="<?php echo $url."/validacionDH.php"?>">Limpieza de datos</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_dni.php"?>">Documentos con incidencias</a>
								<a class="dropdown-item" href="<?php echo $url."/repo_validacionDH_nombres.php"?>">Nombres con incidencias</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/cotejo_beneficiarios.php"?>">Cotejar Nuevos Datos Historicos</a>
							</div>
						</li>			
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Migrar Datos</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_historica.php" ?>">Datos Historicos Nuevos Validados</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_beneficiario.php" ?>">Nuevos Beneficiarios Validados</a>
							</div>
						</li>
						<li>
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Reportes Control</a>
							<div class="dropdown-menu">
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
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Gerencia</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#"> Maestros &raquo; </a>
									<ul class="submenu dropdown-menu">
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/actividad.php"?>">Actividades</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/adulto.php"?>">Es Adulto</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/discapacidad.php"?>">Discapacidad</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/genero.php"?>">Genero</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/gestante.php"?>">Gestante</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/indigena.php"?>">Indigena</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/region.php"?>">Región</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/nacionalidad.php"?>">Nacionalidad</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/proyecto.php"?>">Proyecto</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tema.php"?>">Tema</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/subtema.php"?>">Sub Tema</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/responsable_registro.php"?>">Responsable registro</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tiempo_gestacion.php"?>">Tiempo Gestación</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tipo_proyecto.php"?>">Tipo Proyecto</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tipo_discapacidad.php"?>">Tipo Discapacidad</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tipo_documento.php"?>">Tipo Documento</a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/tipo_organizacion.php"?>">Tipo Organización</a></li>
									</ul>
								</li>
								<li><a class="dropdown-item" href="<?php echo $url."/uploadfile_gerencia.php"?>"> Cargar Datos de Proyectos </a></li>
								<li><a class="dropdown-item" href="<?php echo $url."/gerencia/validacion_datos.php"?>"> Validar Datos </a></li>
								<li><a class="dropdown-item" href="<?php echo $url."/administrador/seccion/migrar_data_gerencia.php"?>">Migrar datos</a></li>
								<li><a class="dropdown-item" href="#"> Reporte Total Reach &raquo; </a>
									<ul class="submenu dropdown-menu">
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_actividades_page.php"?>"> Actividades </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_subtemas_page.php"?>"> Subtemas </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_temas_page.php"?>"> Temas </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_proyectos_page.php"?>"> Proyectos </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_tipoproyectos_page.php"?>"> Tipo de Proyectos </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_region_tri_page.php"?>"> Región x trimestre </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_region_page.php"?>"> Región </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_pais_page.php"?>"> Total General </a></li>
									</ul>
								</li>
								<li><a class="dropdown-item" href="#"> Reporte TR Filtros &raquo; </a>
									<ul class="submenu dropdown-menu">
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_actividades_gestante_page.php"?>"> Actividades </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_subtemas_gestante_page.php"?>"> Subtemas </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_temas_gestante_page.php"?>"> Temas </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_proyectos_gestante_page.php"?>"> Proyectos </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_tipoproyectos_gestante_page.php"?>"> Tipo de Proyectos </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_region_tri_gestante_page.php"?>"> Región x trimestre </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_region_gestante_page.php"?>"> Región </a></li>
										<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_pais_gestante_page.php"?>"> Total General </a></li>
									</ul>
								</li>								
								<li><a class="dropdown-item" href="<?php echo $url."/gerencia/repo/repo_powerbi_page.php"?>"> Reporte Power BI </a></li>
							</ul>
						</li>
						<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
						<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>
					</div>
				</div>
			</div>
		</nav>
		<?php	
	} else{ // PARA USUARIOS DE FINANZAS
		?>
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
						<a class="nav-item nav-link" href="<?php echo $url."/administrador/seccion/cerrar.php"?>">Cerrar</a>
						<a class="nav-item nav-link" href="<?php echo $url;?>">Ver sitio web</a>
					</div>
				</div>
			</div>
		</nav>
		<?php	
	}
	?>

	<div class="container">
		<br><br>
		<div class="row">