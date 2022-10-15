<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once '../config/bdPDO.php';

$db_1 = new TransactionSCI();

//require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $depa = $_POST["selectdepa"];
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $resultado = $db_1->finanzas_enviar_datos_coordinador($depa, $nombreUsuario);

  $var=true;

  if (!empty($resultado)) {
    switch ($resultado) {
      case 0:
        $type = "error";
        $message = "Se presento un error. Verifique sus datos e intente de nuevo.";
      break;
      case 1:
        $type = "success";
        $message = "Los datos se enviaron correctamente.";
      break;
      case 2:
        $type = "error";
        $message = "No existen datos para enviar.";
      break;
    }
    
    //$message = "Datos se importarón al archivo : Reporte_Finanzas_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al enviar los datos. Verifique sus datos e intente de nuevo.";
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
          <label for="txtImagen">Se recomienda revisar los datos previamente antes de enviarlos al coordinador.</label>
          <br>
          <br>          
        </div>
        <div class="col-md-3">
          <label>Seleccione una región:</label>
          <br><br>
          <select name="selectdepa" id="departamento" class="form-control-lg">
            <option value="" selected>Seleccione región</option>
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