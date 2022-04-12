<?php
	require_once ('../administrador/config/bdPDO.php');
	$region = $_POST['dato_region'];
	$sp = $_POST['dato_sp'];
	$MG = new TransactionSCI();
	$consulta = $MG -> traer_datos_reporte_parametro($sp, $region);
	echo json_encode($consulta);

?>