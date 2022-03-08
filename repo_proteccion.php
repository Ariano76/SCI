<?php include("template/cabecera.php"); ?>

<?php
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Spreadsheet;

//require_once './administrador/config/bd.php';
require_once './administrador/config/bdPDO.php';

$db_1 = new TransactionSCI();

require_once ('./vendor/autoload.php');

if (isset($_POST["import"])) {
  $type = "OK";
  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  //$db_1->cotejo($timestamp1);

  $usuarios = $db_1->select_repo("SP_Select_Mera_Proteccion");

  $spreadsheet = new Spreadsheet();
  $sheet = $spreadsheet->getActiveSheet();
  $sheet->setTitle("Users");
  $sheet->setCellValue("A1", "Fecha Encuesta");
  $sheet->setCellValue("B1", "Región del Beneficiario");
  $sheet->setCellValue("C1", "¿En qué provincia?");
  $sheet->setCellValue("D1", "transit_settle");
  $sheet->setCellValue("E1", "¿En qué distrito?");
  $sheet->setCellValue("F1", "Primer Nombre");
  $sheet->setCellValue("G1", "Segundo Nombre");
  $sheet->setCellValue("H1", "Primer Apellido");
  $sheet->setCellValue("I1", "Segundo Apellido");
  $sheet->setCellValue("J1", "¿Usted con que género se identifica?");
  $sheet->setCellValue("K1", "¿Cuál es su fecha de nacimiento?");
  $sheet->setCellValue("L1", "Edad");
  $sheet->setCellValue("M1", "Tipo de identificación #1 (Cédula)");
  $sheet->setCellValue("N1", "Fecha de caducidad");
  $sheet->setCellValue("O1", "¿Usted cuenta con los siguientes medios de comunicación?");
  $sheet->setCellValue("P1", "¿Cuál es su número de WhatsApp?");
  $sheet->setCellValue("Q1", "¿Cuál es su número de celular para recibir mensajes de texto?");
  $sheet->setCellValue("R1", "En caso de comunicarnos con usted, ¿Cuál de estos números usa con mayor frecuencia?");
  $sheet->setCellValue("S1", "¿Es teléfono propio?");
  $sheet->setCellValue("T1", "¿Cómo accede a internet..?");
  $sheet->setCellValue("U1", "¿Esta viviendo o viajando con otros miembros de la familia?");
  $sheet->setCellValue("V1", "¿Cuántos miembros hay en su familia y viven o viajan con usted? Por favor inclúyase en este número.");
  $sheet->setCellValue("W1", "¿Está usted o alguien de su hogar con quien viaja o vive embarazada?");
  $sheet->setCellValue("X1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?");
  $sheet->setCellValue("Y1", "¿Usted viaja o vive con niños de 5 a 17 años?");
  $sheet->setCellValue("Z1", "¿Todos/as los/as NNA a su cargo se encuentran actualmente matriculados en la escuela?");
  $sheet->setCellValue("AA1", "¿Cuál es el dispositivo que utilizan para participar de las clases virtuales?");
  $sheet->setCellValue("AB1", "¿Qué dificultades ha tenido para matricular a los/as menores?");
  $sheet->setCellValue("AC1", "¿Usted o un miembro de su hogar con los que viaja o vive tiene alguna discapacidad, enfermedad crónica o una enfermedad que no le permite trabajar?");
  $sheet->setCellValue("AD1", "Primer Nombre");
  $sheet->setCellValue("AE1", "Segundo Nombre");
  $sheet->setCellValue("AF1", "Primer Apellido");
  $sheet->setCellValue("AG1", "Segundo Nombre");
  $sheet->setCellValue("AH1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("AI1", "Edad");
  $sheet->setCellValue("AJ1", "Relación");
  $sheet->setCellValue("K1", "¿Cuál es su fecha de nacimiento?");
  $sheet->setCellValue("L1", "Edad");
  $sheet->setCellValue("M1", "Tipo de identificación #1 (Cédula)");
  $sheet->setCellValue("N1", "Fecha de caducidad");
  $sheet->setCellValue("O1", "¿Usted cuenta con los siguientes medios de comunicación?");
  $sheet->setCellValue("P1", "¿Cuál es su número de WhatsApp?");
  $sheet->setCellValue("Q1", "¿Cuál es su número de celular para recibir mensajes de texto?");
  $sheet->setCellValue("R1", "En caso de comunicarnos con usted, ¿Cuál de estos números usa con mayor frecuencia?");
  $sheet->setCellValue("S1", "¿Es teléfono propio?");
  $sheet->setCellValue("T1", "¿Cómo accede a internet..?");
  $sheet->setCellValue("U1", "¿Esta viviendo o viajando con otros miembros de la familia?");
  $sheet->setCellValue("V1", "¿Cuántos miembros hay en su familia y viven o viajan con usted? Por favor inclúyase en este número.");
  $sheet->setCellValue("W1", "¿Está usted o alguien de su hogar con quien viaja o vive embarazada?");
  $sheet->setCellValue("X1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?");
  $sheet->setCellValue("Y1", "¿Usted viaja o vive con niños de 5 a 17 años?");
  $sheet->setCellValue("Z1", "¿Todos/as los/as NNA a su cargo se encuentran actualmente matriculados en la escuela?");

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
    $sheet->setCellValue("M".$i, $usuario[12]);
    $i++;
  }
  $writer = new Xlsx($spreadsheet);
  $writer->save("Reporte_Mera_Proteccion_" . $timestamp1 . ".xlsx");
  $var=true;

  if (!empty($var)) {        
    $type = "success";
    $message = "Datos se importaron al archivo : Reporte_Mera_Proteccion_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al importar los datos de Excel. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      MERA PROTECCIÓN
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este proceso se realiza el cotejo de datos de los nuevos beneficiarios que están en proceso de selección y se validará contra nuestra Base HIstorica, para determinar si en algún momento participaron en otros proyectos de apoyo social.</label>
          <br>
          <br>          
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Generar Reporte</button>
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

<?php include("template/pie.php"); ?>