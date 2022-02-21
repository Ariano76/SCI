<?php 

require_once '../administrador/config/bdPDObenef.php';

$db = new TransactionSCI();
$conn = $db->Connect();

$nombre_beneficiario = $_POST['nombre_beneficiario'];
$primer_nombre = $_POST['primer_nombre'];
$segundo_nombre = $_POST['segundo_nombre'];
$primer_apellido = $_POST['primer_apellido'];
$segundo_apellido = $_POST['segundo_apellido'];
$numero_cedula = $_POST['numero_cedula'];
$tipo_identificacion = $_POST['tipo_identificacion'];
$numero_identificacion = $_POST['numero_identificacion'];
$cual_es_su_numero_whatsapp = $_POST['cual_es_su_numero_whatsapp'];
$cual_es_su_numero_recibir_sms = $_POST['cual_es_su_numero_recibir_sms'];
$fecha_nacimiento = $_POST['fecha_nacimiento'];

$id = $_POST['id'];

$cod_00 = $db->Update_General($primer_nombre, $segundo_nombre, $primer_apellido, $segundo_apellido, $numero_cedula, $tipo_identificacion, $numero_identificacion, $cual_es_su_numero_whatsapp, $cual_es_su_numero_recibir_sms, $fecha_nacimiento, $id);

//$sql = "UPDATE `beneficiario` SET  `primer_nombre`='$primer_nombre',  `segundo_nombre`='$segundo_nombre',  `primer_apellido`='$primer_apellido',  `segundo_apellido`='$segundo_apellido',  `numero_cedula`='$numero_cedula', `tipo_identificacion`='$tipo_identificacion',  `numero_identificacion`='$numero_identificacion', `fecha_nacimiento`='$fecha_nacimiento' WHERE id_beneficiario='$id' ";
//$query= mysqli_query($con,$sql);
//$lastId = mysqli_insert_id($con);

if($cod_00==1) // El SP DEVUELVE 1
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