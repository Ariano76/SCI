<?php
	require_once ('../administrador/config/bdPDO.php');
	$sp = $_POST['dato_sp'];
	$MG = new TransactionSCI();
	$consulta = $MG -> traer_datos_reporte_sin_parametro($sp);
	echo json_encode($consulta);

?>