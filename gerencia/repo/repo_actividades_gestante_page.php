<?php include("../../administrador/template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once '../../administrador/config/bdPDO.php';

$db_1 = new TransactionSCI();

//require_once ('../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  //$db_1->cotejo($timestamp1);
  //$writer->save("Reporte_Mera_Proteccion_" . $timestamp1 . ".xlsx");
  
  $var=true;

  if (!empty($var)) {        
    $type = "success";
    $message = "Datos se importaron al archivo : Reporte_Proteccion_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al importar los datos de Excel. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      REPORTE TOTAL REACH DE ACTIVIDADES - GESTANTE
    </div>
    <div class="card-body">
      <form action="repo_actividades_gestante.php" method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este apartado podremos generar el reporte en formato excel que nos permitirá conocer el número de beneficiarios que han participado en cada una de las diferentes actividades realizadas.</label>
          <br>
          <br>          
        </div>
        
        <br>
        <div class="row">
          <div class="col-md-3">
            <label>Discapacidad:</label>
            <br><br>
            <select name="selectdiscapacidad" id="departamento" class="form-control-lg">
              <option value="0" disabled selected>Seleccione item</option>
              <?php 
              $datos = $db_1->poblar_combobox("SP_list_discapacidad");
              foreach($datos as $value) { ?>
                <option value="<?php echo $value['id_discapacidad']; ?>"><?php echo $value['nom_discapacidad'];?></option>
              <?php } ?>
            </select>
          </div>
          <br>
          <div class="col-md-3">
            <label>Gestantes:</label>
            <br><br>
            <select name="selectgestante" id="departamento" class="form-control-lg">
              <option value="0" disabled selected>Seleccione item</option>          
              <?php 
              $datos = $db_1->poblar_combobox("SP_list_gestante");
              foreach($datos as $value) { ?>
                <option value="<?php echo $value['id_gestante']; ?>"><?php echo $value['nom_gestante'];?></option>
              <?php } ?>
            </select>
          </div>        
          <div class="col-md-3">
            <label>Nacionalidad:</label>
            <br><br>
            <select name="selectnacionalidad" id="departamento" class="form-control-lg">
              <option value="0" disabled selected>Seleccione item</option>          
              <?php 
              $datos = $db_1->poblar_combobox("SP_list_nacionalidad");
              foreach($datos as $value) { ?>
                <option value="<?php echo $value['id_nacionalidad']; ?>"><?php echo $value['nom_nacionalidad'];?></option>
              <?php } ?>
            </select>
          </div>   
        </div>        
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Generar Reporte Actividades</button>
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

<?php include("../../administrador/template/pie.php"); ?>