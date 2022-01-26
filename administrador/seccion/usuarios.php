<?php include("../template/cabecera.php") ?>
<?php 

$txtID = (isset($_POST['txtID']))?$_POST['txtID']:"";
$txtNombre = (isset($_POST['txtNombre']))?$_POST['txtNombre']:"";
$txtCorreo = (isset($_POST['txtCorreo']))?$_POST['txtCorreo']:"";
$txtNomRol = (isset($_POST['txtNomRol']))?$_POST['txtNomRol']:"";
$optRoles = (isset($_POST['optRoles']))?$_POST['optRoles']:"";
$accion = (isset($_POST['accion']))?$_POST['accion']:"";
$id = $_GET['id'];

require_once '../config/bdPDO.php';
$db_1 = new TransactionSCI();

$nuevorol = 2;
if ($optRoles == "Administrador") {
	$nuevorol = 1;
}

switch ($accion) {

	case "agregar":
	$result = $db_1->insert_usuario($txtNombre, $txtCorreo, $nuevorol, 1);
	header("Location:usuarios.php?id=$result");
	break;

	case "modificar":
	//$usuario = $db_1->update_usuario($txtID, $txtNombre, $txtCorreo, $nuevorol, 1);	
	$db_1->update_usuario($txtID, $txtNombre, $txtCorreo, $nuevorol, 1);	
	header("Location:usuarios.php?id=null");
	break;

	case "cancelar":
	header("Location:usuarios.php?id=null");
	break;

	case "seleccionar":
	$usuario = $db_1->select_usuario($txtID);
	foreach ($usuario as $value) {
		$txtNombre = $value['nombre_usuario'];
		$txtCorreo = $value['correo'];
		$txtNomRol = $value['nombre_rol'];
		$id=2;
	}
	break;

	case "borrar":
	header("Location:usuarios.php?id=null");
	break;
}

// OBTENER LISTA DE USUARIOS
$usuarios = $db_1->select_usuarios();

?>

<?php
if($id == 1){
	echo "<script>bootbox.alert('El usuario se creo satisfactoriamente.');</script>";
}
elseif($id == 0){
	echo "<script>bootbox.alert('Hubo un error al momento de crear el usuario. Revise!');</script>";
}
?>

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
					<input required type="email" class="form-control" value="<?php echo $txtCorreo; ?>" name="txtCorreo" id="txtCorreo" placeholder="Ingrese correo electronico">			
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
					<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":"";?> value="modificar" class="btn btn-warning btn-sm">Modificar</button>
					<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":"";?> value="cancelar" class="btn btn-info btn-sm">Cancelar</button>
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
						<a class="update_pass" data-emp-id="<?php echo $usuario["id_usuario"];?>" href=#>
							<i class="fas fa-recycle"></i>
						</a>
					</td>

					<td>
						<form method="POST"> 
							<input type="hidden" name="txtID" value="<?php echo $usuario['id_usuario'];?>" />
							<input type="hidden" name="txtNomRol" value="<?php echo $usuario['nombre_rol'];?>" />
							<input type="hidden" name="txtAdd" value="OK" />
							<input type="submit" name="accion" value="seleccionar" class="btn btn-primary btn-sm" />

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