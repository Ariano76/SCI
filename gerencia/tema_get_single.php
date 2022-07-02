<?php include("../administrador/config/connection.php");
$id = $_POST['id'];
$sql = "SELECT * FROM tema WHERE id_tema='$id' LIMIT 1";
$query = mysqli_query($con,$sql);
$row = mysqli_fetch_assoc($query);
echo json_encode($row);
?>
