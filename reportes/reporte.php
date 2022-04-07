<?php include("../administrador/template/cabecera.php"); ?>

<?php

//require_once './administrador/config/bd.php';
require_once ('../administrador/config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();
//echo $insertId;

require_once ('../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $db_1->migrar_data_historica();

  $var=true;
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
      Reportes de Control
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">Este proceso realiza la migración de datos de nuevos beneficiarios del ambiente Stage a la tabla de Datos Históricos.</label>
          <br>
          <br>
          <label for="txtImagen">Este proceso borrará cualquier información existente en la tabla de Datos Históricos y la reemplazará con los nuevos datos.</label>
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
    <div class="card-body">
      <div class="row">
        <div class="col-md-6">
          <!--button class="btn btn-primary" onclick="CargarDatosGraficoBar()">Grafico Bar</button-->  
          <canvas id="myChartV" width="100" height="100"></canvas>
        </div>        
        <div class="col-md-6">
          <!--button class="btn btn-primary" onclick="CargarDatosGraficoBarHorizontal()">Grafico Bar Horizontal</button--> 
          <canvas id="myChartH" width="100" height="100"></canvas>
        </div>   
      </div>
        <div class="col-md-6">
          <!--button class="btn btn-primary" onclick="CargarDatosGraficoBarHorizontal()">Grafico Bar Horizontal</button--> 
          <canvas id="myChartPie" width="100" height="100"></canvas>
        </div>   
      </div>
      
      
      <br>
    </div>

  </div>
</div>
<div class="col-md-12">
  <div class=card-text>
    <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($var)) { echo $message; } ?>
  </div>
</div>
</div>




<?php include("../administrador/template/pie.php"); ?>