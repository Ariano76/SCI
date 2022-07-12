<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once ('../config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();

//echo $insertId;

require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $db_1->migrar_data_gerencia();
  
  //$var=true;
  if (!empty($var)) {        
    $type = "success";
    $message = "La migración se ha realizado con exito.";
  } else {
    $type = "error";
    $message = "Hubierón problemas al momento de la migración. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      Migrar datos de proyectos validados a la Tabla Resultados de Proyectos
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">Este proceso realiza la migración de datos de los proyectos del ambiente Stage a la tabla de Resultados de Proyectos.</label>
          <br>
          <br>
          <label for="txtImagen">Este proceso borrará cualquier información existente en la tabla de Resultados de Proyectos y la reemplazará con los nuevos datos.</label>
          <br>
          <br>
          <label for="txtImagen">Verificar si realmente desea realizar este proceso ya que los datos eliminados no podrán ser recuperados.</label>
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Migrar Datos Historicos</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="col-md-12">
  <div class=card-text>
    <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($var)) { echo $message; } ?>
  </div>
</div>
</div>

<?php include("../template/pie.php"); ?>