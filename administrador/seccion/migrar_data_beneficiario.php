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
  // recupera todos los registros de tabla STAGE_00
  $usuarios = $db_1->select_beneficiarios(); 

  foreach($usuarios as $usuario) {

    $usuarios = $db_1->Insert_beneficiario($usuario[7], $usuario[8], $usuario[9], $usuario[10], $usuario[11], $usuario[12], $usuario[13], $usuario[14], $usuario[15], $usuario[16], $usuario[17], $usuario[18], $usuario[19], $usuario[20], $usuario[21], $usuario[22], $usuario[23], $usuario[24], $usuario[25], $usuario[26], $usuario[27], $usuario[28]); 

  }

/*
  $usuarios = $db_1->resultado_cotejo($timestamp1);

  $spreadsheet = new Spreadsheet();
  $sheet = $spreadsheet->getActiveSheet();
  $sheet->setTitle("Users");
  $sheet->setCellValue("A1", "ID_BUSQUEDA");
  $sheet->setCellValue("B1", "Id_Cotejo");
  $sheet->setCellValue("C1", "Id_Caso");
  $sheet->setCellValue("D1", "Id_Resultado");
  $sheet->setCellValue("E1", "Tipo_Busqueda");
  $sheet->setCellValue("F1", "nombre_1");
  $sheet->setCellValue("G1", "nombre_2");
  $sheet->setCellValue("H1", "apellido_1");
  $sheet->setCellValue("I1", "apellido_2");
  $sheet->setCellValue("J1", "Tipo_Documento");
  $sheet->setCellValue("K1", "Numero_Documento");
  $sheet->setCellValue("L1", "Proyecto");
  $i = 2;
  foreach($usuarios as $usuario) {
    $sheet->setCellValue("A".$i, $usuario[0]);
    $sheet->setCellValue("B".$i, $usuario[1]);
    $sheet->setCellValue("C".$i, $usuario[2]);
    $sheet->setCellValue("D".$i, $usuario[3]);
    $sheet->setCellValue("E".$i, $usuario[4]);
    $sheet->setCellValue("F".$i, $usuario[5]);
    $sheet->setCellValue("G".$i, $usuario[6]);
    $sheet->setCellValue("H".$i, $usuario[7]);
    $sheet->setCellValue("I".$i, $usuario[8]);
    $sheet->setCellValue("J".$i, $usuario[9]);
    $sheet->setCellValue("K".$i, $usuario[10]);
    $sheet->setCellValue("L".$i, $usuario[11]);
    $i++;
  }
  $writer = new Xlsx($spreadsheet);
  $writer->save("Resultado Cotejar Usuarios en Data Historica_" . $timestamp1 . ".xlsx");
  
*/

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
      Migrar datos de beneficiarios validados al proyecto actual
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
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Migrar Datos Beneficiarios Validados</button>
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