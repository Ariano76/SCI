<?php
	require_once ('../administrador/config/bdPDO.php');
	$region = $_POST['dato_region'];	
	$MG = new TransactionSCI();
	$consulta = $MG -> traer_datos_reporte_parametro($region);
	echo json_encode($consulta);

?>