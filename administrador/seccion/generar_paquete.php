<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once '../config/bdPDO.php';

$db_1 = new TransactionSCI();

//require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $var=true;

  if (!empty($var)) {        
    $type = "success";
    $message = "Datos se importarón al archivo : Reporte_Finanzas_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al importar los datos de Excel. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      SECTOR FINANZAS
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">Este proceso realiza el envío de los datos al coordinador de finanzas para que de inicio al proceso de valorización.</label>
          <br>
          <br>
          <label for="txtImagen">Se recomienda haber revisado previamente el reporte de los datos que se enviaran para estar seguros de esta acción.</label>
          <br>
          <br>          
        </div>
        <div class="col-md-3">
          <label>Seleccione una región:</label>
          <br><br>
          <select name="selectdepa" id="departamento" class="form-control-lg">
            <?php 
            $datos = $db_1->finanzas_traer_regiones();
            foreach($datos as $value) { ?>
              <option value="<?php echo $value['region']; ?>"><?php echo $value['region'];?></option>
            <?php } ?>
          </select>
        </div>
        <br>
        <div class="row">
          <div class="col-md-5">
            <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Enviar datos al coordinardor de Finanzas</button>
          </div>
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