<?php 
include('../administrador/config/connection.php');
$nombre_beneficiario = $_POST['nombre_beneficiario'];
$numero_cedula = $_POST['numero_cedula'];
$nombre_1a = $_POST['nombre_1a'];
$nombre_1b = $_POST['nombre_1b'];
$apellido_1a = $_POST['apellido_1a'];
$apellido_1b = $_POST['apellido_1b'];
$genero_1 = $_POST['genero_1'];
$fecha_nacimiento_1 = $_POST['fecha_nacimiento_1'];
$relacion_1 = $_POST['relacion_1'];
$otro_1 = $_POST['otro_1'];
$tipo_identificacion_1 = $_POST['tipo_identificacion_1'];
$numero_identificacion_1 = $_POST['numero_identificacion_1'];

$id = $_POST['id'];

$sql = "UPDATE `integrantes` SET  `nombre_1a`= '$nombre_1a', `nombre_1b`='$nombre_1b', `apellido_1a`='$apellido_1a', `apellido_1b`='$apellido_1b', `genero_1`='$genero_1', `fecha_nacimiento_1`='$fecha_nacimiento_1', `relacion_1`='$relacion_1', `otro_1`='$otro_1', `tipo_identificacion_1`='$tipo_identificacion_1', `numero_identificacion_1`='$numero_identificacion_1'
   WHERE id_beneficiario='$id' ";

$query= mysqli_query($con,$sql);
$lastId = mysqli_insert_id($con);

if($query==true)
{
    $data = array(
        'status'=>'true',
    );
    echo json_encode($data);
}
else
{
   $data = array(
    'status'=>'false',
);
   echo json_encode($data);
} 

?>