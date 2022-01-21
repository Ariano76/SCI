<?php include("../template/cabecera.php") ?>
<?php 

$txtID = (isset($_POST['txtID']))?$_POST['txtID']:"";
$txtNombre = (isset($_POST['txtNombre']))?$_POST['txtNombre']:"";
$txtCorreo = (isset($_POST['txtCorreo']))?$_POST['txtCorreo']:"";
$txtNomRol = (isset($_POST['txtNomRol']))?$_POST['txtNomRol']:"";
$accion = (isset($_POST['accion']))?$_POST['accion']:"";

require_once '../config/bdPDO.php';
$db_1 = new TransactionSCI();

switch ($accion) {
	case "agregar":
	$sql = $conexion->prepare("insert into libros (nombre,imagen) values (:nombre,:imagen)
		;");
	$sql->bindparam(":nombre", $txtNombre);

	$fecha=new DateTime();
	$nombreArchivo = ($txtImagen!="")?$fecha->getTimestamp()."_".$_FILES['txtImagen']['name']:"img.jpg";
	$tmpImagen = $_FILES['txtImagen']['tmp_name'];

	if ($tmpImagen!="") {
		move_uploaded_file($tmpImagen, "../../img/".$nombreArchivo);
	}

	$sql->bindparam(":imagen", $nombreArchivo);
	$sql->execute();

	header("Location:productos.php");

	break;

	case "modificar":
	$sql = $conexion->prepare("update libros set nombre=:nombre where idlibros=:id");
	$sql->bindparam(":id", $txtID);
	$sql->bindparam(":nombre", $txtNombre);
	$sql->execute();

	if ($txtImagen!="") {

		$fecha=new DateTime();
		$nombreArchivo = ($txtImagen!="")?$fecha->getTimestamp()."_".$_FILES['txtImagen']['name']:"img.jpg";
		$tmpImagen = $_FILES['txtImagen']['tmp_name'];

		move_uploaded_file($tmpImagen, "../../img/".$nombreArchivo);

		$sql = $conexion->prepare("select * from libros where idlibros=:id");
		$sql->bindparam(":id", $txtID);
		$sql->execute();
		$libro = $sql->fetch(PDO::FETCH_LAZY);

		if (isset($libro["imagen"]) && ($libro['imagen']!= 'img.jpg')) {
			if (file_exists('../../img/'.$libro['imagen'])) {
				unlink('../../img/'.$libro['imagen']);
			}
		}

		$sql = $conexion->prepare("update libros set imagen=:imagen where idlibros=:id");
		$sql->bindparam(":id", $txtID);
		$sql->bindparam(":imagen", $nombreArchivo);
		$sql->execute();

	}

	header("Location:productos.php");

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
	$sql = $conexion->prepare("select imagen from libros where idlibros=:id");
	$sql->bindparam(":id", $txtID);
	$sql->execute();
	$libro = $sql->fetch(PDO::FETCH_LAZY);

	if (isset($libro["imagen"]) && ($libro['imagen']!= 'img.jpg')) {
		if (file_exists('../../img/'.$libro['imagen'])) {
			unlink('../../img/'.$libro['imagen']);
		}
	}

	$sql = $conexion->prepare("delete from libros where idlibros=:id");
	$sql->bindparam(":id", $txtID);
	$sql->execute();

	header("Location:productos.php");

	break;
}

// OBTENER LISTA DE USUARIOS
$listaLibros = $db_1->select_usuarios();

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
					<input required type="email" class="form-control" value="<?php echo $txtCorreo; ?>" name="txtCorreo" id="txtCorreo" placeholder="Correo">			
				</div>

				<div class="form-group">
					<label for="txtRol">Rol:</label><br>
						<select>
							<option value="Administrador"<?=$txtNomRol == 'Administrador' ? ' selected="selected"' : '';?>>Administrador</option>
							<option value="Analista"<?=$txtNomRol == 'Analista' ? ' selected="selected"' : '';?>>Analista</option>
						</select>

					</div>

					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="submit" name="accion" <?php echo($accion=="seleccionar")?"disabled":""; ?> value="agregar" class="btn btn-success btn-lg">Agregar</button>
						<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":""; ?> value="modificar" class="btn btn-warning btn-lg">Moficar</button>
						<button type="submit" name="accion" <?php echo($accion!=="seleccionar")?"disabled":""; ?> value="cancelar" class="btn btn-info btn-lg">Cancelar</button>
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
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($listaLibros as $libro) {?>

					<tr>
						<td><?php echo $libro['id_usuario'] ?></td>
						<td><?php echo $libro['nombre_usuario'] ?></td>
						<td><?php echo $libro['correo'] ?></td>
						<td><?php echo $libro['nombre_rol'] ?></td>

						<td>
							<form method="POST"> 
								<input type="hidden" name="txtID" value="<?php echo $libro['id_usuario'];?>" />
								<input type="hidden" name="txtNomRol" value="<?php echo $libro['nombre_rol'];?>" />
								<input type="submit" name="accion" value="seleccionar" class="btn btn-primary" />
								<input type="submit" name="accion" value="borrar" class="btn btn-danger" />
								<input type="submit" name="accion" value="clave" class="btn btn-warning" />
							</form>
						</td>
					</tr>
				<?php } ?>
			</tbody>
		</table>

	</div>


	<?php include("../template/pie.php") ?>