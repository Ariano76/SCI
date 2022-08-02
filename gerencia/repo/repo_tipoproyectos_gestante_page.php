<?php include("../../administrador/template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

require_once '../../administrador/config/bdPDO.php';

$db_1 = new TransactionSCI();

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      REPORTE TOTAL REACH TIPO DE PROYECTOS - GESTANTE
    </div>
    <div class="card-body">
      <form action="repo_tipoproyectos_gestante.php" method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este apartado podremos generar el reporte en formato excel que nos permitirá conocer el número de beneficiarios que han participado en cada uno de los diferentes tipo de proyectos realizados.</label>
          <br>
          <br>          
        </div>
        
        <br>
        <div class="col-md-3">
          <label>Gestantes:</label>
          <br><br>
          <select name="selectgestante" id="departamento" class="form-control-lg">
            <!--option value="" disabled selected>Seleccione región</option-->            
            <?php 
            $datos = $db_1->poblar_combobox("SP_list_gestante");
            foreach($datos as $value) { ?>
              <option value="<?php echo $value['id_gestante']; ?>"><?php echo $value['nom_gestante'];?></option>
            <?php } ?>
          </select>
        </div>
        <br>              
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Generar Reporte Tipo de Proyectos</button>
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