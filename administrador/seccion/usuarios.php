<?php include("../template/cabecera.php") ?>
<?php 

$txtID = (isset($_POST['txtID']))?$_POST['txtID']:"";
$txtNombre = (isset($_POST['txtNombre']))?$_POST['txtNombre']:"";
$txtCorreo = (isset($_POST['txtCorreo']))?$_POST['txtCorreo']:"";
$txtNomRol = (isset($_POST['txtNomRol']))?$_POST['txtNomRol']:"";
$optRoles = (isset($_POST['optRoles']))?$_POST['optRoles']:"";
$accion = (isset($_POST['accion']))?$_POST['accion']:"";

require_once '../config/bdPDO.php';
$db_1 = new TransactionSCI();

	$nuevorol = 2;
	if ($optRoles == "Administrador") {
		$nuevorol = 1;
	}

switch ($accion) {

	case "agregar":
	$db_1->insert_usuario($txtNombre, $txtCorreo, $nuevorol, 1);	
	header("Location:usuarios.php");
	break;

	case "modificar":
	//$usuario = $db_1->update_usuario($txtID, $txtNombre, $txtCorreo, $nuevorol, 1);	
	$db_1->update_usuario($txtID, $txtNombre, $txtCorreo, $nuevorol, 1);	
	header("Location:usuarios.php");
	break;

	case "cancelar":
	header("Location:usuarios.php");
	break;

	case "seleccionar":
	$usuario = $db_1->select_usuario($txtID);
	foreach ($usuario as $value) {
		$txtNombre = $value['nombre_usuario'];
		$txtCorreo = $value['correo'];
		$txtNomRol = $value['nombre_rol'];
	}
	break;

	case "borrar":
	header("Location:usuarios.php");
	break;
}

// OBTENER LISTA DE USUARIOS
$usuarios = $db_1->select_usuarios();

?>
 <!-- JS dependencies -->
<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script-->
<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script-->
<!--script src="https://code.jquery.com/jquery-3.3.1.min.js"></script-->
<!--script src="https://code.jquery.com/jquery-3.1.1.min.js"></script-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap 4 dependency -->
<!--script src="popper.min.js"></script-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- libreria para utilizar iconos en nuestras paginas  -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- bootbox code -->
<script type="text/javascript" src="script/bootbox.min.js"></script>
<script type="text/javascript" src="script/deleteRecords.js"></script>

<div class="col-md-4">

	<div class="card text-dark bg-light">
		<div class="card-header">
			Datos del Usuario
		</div>
		<div class="card-body">

			<form method="POST" enctype="multipart/form-data">

				<div class="form-group">
					<label for="txtID">ID:</label>
					<input required readonly type="text" class="form-control" value="<?php echo $txtID; ?>" name="txtID" id="txtID" placeholder="ID">			
				</div>

				<div class="form-group">
					<label for="txtNombre">Usuario:</label>
					<input required type="text" class="form-control" value="<?php echo $txtNombre; ?>" name="txtNombre" id="txtNombre" placeholder="Nombre del usuario">			
				</div>

				<div class="form-group">
					<label for="txtCorreo">Correo:</label>
					<input required type="email" class="form-control" value="<?php echo $txtCorreo; ?>" name="txtCorreo" id="txtCorreo" placeholder="Correo">			
				</div>

				<div class="form-group">
					<label for="txtRol">Rol:</label><br>
					<select name="optRoles">
						<option value="Administrador"<?=$txtNomRol == 'Administrador' ? ' selected="selected"' : '';?>>Administrador</option>
						<option value="Analista"<?=$txtNomRol == 'Analista' ? ' selected="selected"' : '';?>>Analista</option>
					</select>
				</div>

				<div class="btn-group" role="group" aria-label="Basic example" >
					<button type="submit" name="accion" <?php echo($accion=="seleccionar")?"disabled":""; ?> value="agregar" class="btn btn-success btn-sm">Agregar</button>
					<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":""; ?> value="modificar" class="btn btn-warning btn-sm">Modificar</button>
					<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":""; ?> value="cancelar" class="btn btn-info btn-sm">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="col-md-8">

	<table class="table table-bordered table-inverse table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>Usuario</th>
				<th>Correo</th>
				<th>Rol</th>
				<th>Borrar</th>
				<th>Password</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($usuarios as $usuario) {?>

				<tr>
					<td><?php echo $usuario['id_usuario'] ?></td>
					<td><?php echo $usuario['nombre_usuario'] ?></td>
					<td><?php echo $usuario['correo'] ?></td>
					<td><?php echo $usuario['nombre_rol'] ?></td>
					<td align="center">							
						<a class="delete_employee" data-emp-id="<?php echo $usuario["id_usuario"];?>" href=#>
						<i class="fas fa-trash-alt"></i>
						</a>
					</td>
					<td align="center">							
						<a class="delete_employee" data-emp-id="<?php echo $usuario["id_usuario"];?>" href=#>
						<i class="fas fa-recycle"></i>
						</a>
					</td>

					<td>
						<form method="POST"> 
							<input type="hidden" name="txtID" value="<?php echo $usuario['id_usuario'];?>" />
							<input type="hidden" name="txtNomRol" value="<?php echo $usuario['nombre_rol'];?>" />
							<input type="submit" name="accion" value="seleccionar" class="btn btn-primary btn-sm" />
							<!--<input type="submit" name="accion" value="borrar" class="btn btn-danger btn-sm" href="javascript:void(0)"/>-->
							<!--input type="submit" name="accion" value="reset pass" class="btn btn-danger btn-sm" /-->

						</form>
					</td>
				</tr>
			<?php 
		} 
		?>
		</tbody>
	</table>

</div>


<?php include("../template/pie.php") ?>