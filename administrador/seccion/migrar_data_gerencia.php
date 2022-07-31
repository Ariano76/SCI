<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

require_once ('../config/bdPDO.php');

$db_1 = new TransactionSCI();
$contperiodos = 0;
$xperiodos = "";
//$conn_1 = $db_1->Connect();

require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $check = $_POST["flexRadioDefault"];
  $conta = $_POST["txtContPeriodos"];
  $xper = $_POST["txtPeriodos"];

  
  //echo "<script>console.log('Dato del Check: " . $check . "' );</script>"; 
  //echo "<script>console.log('Numero de periodos: " . $conta . "' );</script>"; 
  //echo "<script>console.log('Años encontrados: " . $xper . "' );</script>"; 
  //$var=true;
  if ($conta > 0) { 
    $var = $db_1->migrar_data_gerencia($check,$xper);
    if (!empty($var) && $var == 1) { 
      $type = "success";
      $message = "La migración se ha realizado con exito.";           
    } else {
      $type = "error";
      $message = "Se presentarón problemas al momento de la migración. Intente de nuevo";           
    }       
  } else {
    echo "<script>console.log('entre al else:' );</script>"; 
    $type = "error";
    $message = "Se presentarón problemas al momento de la migración. No se identificaron años. Intente de nuevo";
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
                $contperiodos ++;
                $xperiodos .= $periodo[0] .",";
              }
              $xperiodos = substr($xperiodos,0,strlen($xperiodos)-1);
            }
            ?>
            <p class="card-text"><h5>¿Desea reemplazar los datos existente de los periodos identificados en esta nueva carga?</h5></p>
          </div>

          <div class="mb-3 row">
            <div class="col-md-4">&nbsp;</div>
            <div class="col-md-4">             
              <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="1" checked>
                <label class="form-check-label" for="flexRadioDefault1">
                  NO deseo reemplazar los datos existentes.
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="2">
                <label class="form-check-label" for="flexRadioDefault2">
                  SI deseo reemplazar los datos existentes.
                </label>
              </div>
              <input type="hidden" name="txtContPeriodos" value="<?php echo $contperiodos;?>" />
              <input type="hidden" name="txtPeriodos" value="<?php echo $xperiodos;?>" />
            </div>
            <div class="col-md-4">&nbsp;</div>
          </div>
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Migrar Datos</button>
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