<?php 
include('../administrador/config/connection.php');
$nom_nacionalidad = $_POST['nom_nacionalidad'];

$id = $_POST['id'];

$sql = "UPDATE `nacionalidad` SET  `nom_nacionalidad`= '$nom_nacionalidad' 
WHERE id_nacionalidad='$id' ";

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