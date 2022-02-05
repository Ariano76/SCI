<?php include("../template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once ('../config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();



require_once ('../../vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);
  // recupera todos los registros de tabla STAGE_00
  $usuarios = $db_1->select_beneficiarios(); 

  foreach($usuarios as $usuario) {
    $d01 = ($usuario[7] == '') ? null : $usuario[7];
    $d02 = ($usuario[8] == '') ? null : $usuario[8];
    $d03 = ($usuario[9] == '') ? null : $usuario[9];
    $d04 = ($usuario[10] == '') ? null : $usuario[10];
    $d05 = ($usuario[11] == '') ? null : $usuario[11];
    $d06 = ($usuario[12] == '') ? null : $usuario[12];
    $d07 = ($usuario[13] == '') ? null : $usuario[13];
    $d08 = ($usuario[14] == '') ? null : $usuario[14];
    $d09 = ($usuario[15] == '') ? null : $usuario[15];
    $d10 = ($usuario[16] == '') ? null : $usuario[16];
    $d11 = ($usuario[17] == '') ? null : $usuario[17];
    $d12 = ($usuario[18] == '') ? null : $usuario[18];
    $d13 = ($usuario[19] == '') ? null : $usuario[19];
    $d14 = ($usuario[20] == '') ? null : $usuario[20];
    if ($usuario[21] == '') {
      $d15 = '2000/01/01';
      }else{
        $x = $db_1->validar_fecha_espanol($usuario[21]);
          $d15 = ($x) ?  $usuario[21] : '2000/01/01';
      }
    //$d15 = ($db_1->validar_fecha_espanol($usuario[21]) == true) ? $usuario[21] : NULL ;

    $d16 = ($usuario[22] == '') ? null : $usuario[22];
    $d17 = ($usuario[23] == '') ? null : $usuario[23];
    //$d18 = ($db_1->validar_fecha_espanol($usuario[24]) == true) ? $usuario[24] : NULL ;
    if ($usuario[24] == '') {
      $d18 = '2000/01/01';
      }else{
        $x = $db_1->validar_fecha_espanol($usuario[24]);
          $d18 = ($x) ?  $usuario[24] : '2000/01/01';
      }
    $d19 = ($usuario[25] == '') ? null : $usuario[25];
    $d20 = ($usuario[26] == '') ? null : $usuario[26];
    //$d21 = ($db_1->validar_fecha_espanol($usuario[27]) == true) ?  $usuario[27] : NULL ;
    if ($usuario[27] == '') {
      $d21 = '2000/01/01';
      }else{
        $x = $db_1->validar_fecha_espanol($usuario[27]);
          $d21 = ($x) ?  $usuario[27] : '2000/01/01';
      }
    $d22 = ($usuario[28] == '') ? null : $usuario[28];    

    $xCod = $db_1->Insert_beneficiario($d01, $d02, $d03, $d04, $d05, $d06, $d07, $d08, $d09, $d10, $d11, $d12, $d13, $d14, $d15, $d16, $d17, $d18, $d19, $d20, $d21, $d22); 
    //echo $xCod."<br>";    
    

    // RUTINA PARA INSERTAR REGISTROS EN TABLA ENCUESTA
    //$d01 = ($usuario[1] == '') ? null : $usuario[1];
    if ($usuario[1] == '') {
      $d01 = '2000/01/01';
      }else{
        $x = $db_1->validar_fecha_espanol($usuario[1]);
          $d01 = ($x) ?  $usuario[1] : '2000/01/01';
      }
    $d02 = ($usuario[2] == '') ? null : $usuario[2];
    $d03 = ($usuario[3] == '') ? null : $usuario[3];
    $d04 = ($usuario[4] == '') ? null : $usuario[4];
    $d05 = ($usuario[5] == '') ? null : $usuario[5];
    $d06 = ($usuario[6] == '') ? null : $usuario[6];

    $db_1->Insert_encuesta($d01, $d02, $d03, $d04, $d05, $d06, $xCod); 

    // RUTINA PARA INSERTAR REGISTROS EN TABLA COMUNICACION

    $d01 = (empty($usuario[29])) ? null : $usuario[29];
    $d02 = (empty($usuario[30])) ? null : $usuario[30];
    $d03 = (empty($usuario[31])) ? null : $usuario[31];
    $d04 = (empty($usuario[32])) ? null : $usuario[32];
    $d05 = (empty($usuario[33])) ? null : $usuario[33];
    $d06 = (empty($usuario[34])) ? null : $usuario[34];
    $d07 = (empty($usuario[35])) ? null : $usuario[35];
    $d08 = (empty($usuario[36])) ? null : $usuario[36];
    $d09 = (empty($usuario[37])) ? null : $usuario[37];
    $d10 = (empty($usuario[38])) ? null : $usuario[38];
    $d11 = (empty($usuario[39])) ? null : $usuario[39];
    $d12 = (empty($usuario[40])) ? null : $usuario[40];
    $d13 = (empty($usuario[41])) ? null : $usuario[41];
    $d14 = (empty($usuario[42])) ? null : $usuario[42];

    $db_1->Insert_comunicacion($d01, $d02, $d03, $d04, $d05, $d06, $d07, $d08, $d09, $d10, $d11, $d12, $d13, $d14, $xCod); 

    // RUTINA PARA INSERTAR REGISTROS EN TABLA NUTRICION

    $d01 = (empty($usuario[43])) ? null : $usuario[43];
    $d02 = (empty($usuario[44])) ? null : $usuario[44];
    $d03 = (empty($usuario[45])) ? null : $usuario[45];
    $d04 = (empty($usuario[46])) ? null : $usuario[46];
    $d05 = (empty($usuario[47])) ? null : $usuario[47];
    $d06 = (empty($usuario[48])) ? null : $usuario[48];
    $d07 = (empty($usuario[49])) ? null : $usuario[49];
    $d08 = (empty($usuario[50])) ? null : $usuario[50];

    $db_1->Insert_nutricion($d01, $d02, $d03, $d04, $d05, $d06, $d07, $d08, $xCod); 



  


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