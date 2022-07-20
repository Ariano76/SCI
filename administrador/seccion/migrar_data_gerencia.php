<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

require_once ('../config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();

require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $var = $db_1->migrar_data_gerencia();
  echo "<script>console.log('Dato de la variable var: " . $var . "' );</script>"; 
  //$var=true;
  if (!empty($var)) { 
    echo "<script>console.log('entre al if: " . $var . "' );</script>"; 
    if ( $var == 1 ) {
      $type = "success";
      $message = "La migración se ha realizado con exito.";           
    } else {
      $type = "error";
      $message = "Hubierón problemas al momento de la migración. Intente de nuevo";           
    }       
  } else {
    echo "<script>console.log('entre al ese:' );</script>"; 
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
        </div>        
        <br>
        <div class="card text-center">          
          <div class="card-body">
            <h4 class="card-title">Periodos Identificados</h4>
            <?php 
            $periodos = $db_1->select_periodos_data_gerencia();
            if (!empty($periodos)) {
              foreach ($periodos as $periodo) {
                ?>
                <label for="txtPeriodo">Año :&nbsp;</label><?php echo($periodo[0]) ?><br>
                <?php 
              }
            }
            ?>
            <p class="card-text"><h5>¿Desea reemplazar los datos existente de los periodos identificados en esta nueva carga?</h5></p>
          </div>
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