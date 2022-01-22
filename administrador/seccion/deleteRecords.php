<?php

//require_once '../config/bdPDO.php';

//$db_1 = new TransactionSCI();
//$codigo = $_REQUEST['empid']
include_once("db_connect.php");

if($_REQUEST['empid']) {

	//$resultset = $db_1->delete_usuario($codigo);
	$sql = "DELETE FROM usuarios WHERE id_usuario='".$_REQUEST['empid']."'";
	$resultset = mysqli_query($conn, $sql) or die("database error:". mysqli_error($conn));	
	if($resultset) {
		echo "Record Deleted";
	}
}
?>
