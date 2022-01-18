<?php include("template/cabecera.php"); ?>

<?php
use Phppot\DataSource;
//use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

require_once './administrador/config/bd.php';
require_once './administrador/config/bdPDO.php';
$db = new DataSource();
$conn = $db->getConnection();

$db_1 = new TransactionSCI();
$conn_1 = $db_1->Connect();


//echo $insertId;

require_once ('./vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $db_1->cotejo();
}
?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      Cotejar nuevos beneficiarios en Base de Datos Historica
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este proceso se realiza el cotejo de datos de los nuevos beneficiarios que están en proceso de selección y se validará contra nuestra Base HIstorica, para determinar si en algún momento participaron en otros proyectos de apoyo social.</label>
          <br>
          <br>
          <label for="txtImagen">Este proceso tomará algunos minutos y posteriormente se genera un archivo Excel en el cual se mostraran los resultados del cotejo para su análisis.</label>
          <br>          
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Cotejar Beneficiarios</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="col-md-12">
  <div class=card-text>
    <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($type)) { echo $timestamp1; } ?>
  </div>
</div>
</div>


<?php include("template/pie.php"); ?>