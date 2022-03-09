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

  $usuarios = $db_1->select_repo("SP_Select_Nutricion");

  $spreadsheet = new Spreadsheet();
  $sheet = $spreadsheet->getActiveSheet();
  $sheet->setTitle("Users");
  $sheet->setCellValue("A1", "Fecha Encuesta");
  $sheet->setCellValue("B1", "Región del Beneficiario");
  $sheet->setCellValue("C1", "¿En qué provincia?");
  $sheet->setCellValue("D1", "¿En qué distrito?");
  $sheet->setCellValue("E1", "transit_settle");
  $sheet->setCellValue("F1", "Primer Nombre");
  $sheet->setCellValue("G1", "Segundo Nombre");
  $sheet->setCellValue("H1", "Primer Apellido");
  $sheet->setCellValue("I1", "Segundo Apellido");
  $sheet->setCellValue("J1", "¿Usted con que género se identifica?");
  $sheet->setCellValue("K1", "¿Cuál es su fecha de nacimiento?");
  $sheet->setCellValue("L1", "Edad");
  $sheet->setCellValue("M1", "Tipo de identificación #1 (Cédula)");
  $sheet->setCellValue("N1", "Tipo de identificación #2");
  $sheet->setCellValue("O1", "No. Identificacion #2");
  $sheet->setCellValue("P1", "¿Cuál es su número de WhatsApp?");
  $sheet->setCellValue("Q1", "¿Cuál es su número de celular para recibir mensajes de texto?");
  $sheet->setCellValue("R1", "¿Es teléfono propio?");
  $sheet->setCellValue("S1", "¿Cuál es su dirección?");
  $sheet->setCellValue("T1", "¿Esta viviendo o viajando con otros miembros de la familia?");
  $sheet->setCellValue("U1", "¿Cuántos miembros hay en su familia y viven o viajan con usted? Por favor inclúyase en este número.");
  $sheet->setCellValue("V1", "¿Está usted o alguien de su hogar con quien viaja o vive embarazada?");
  $sheet->setCellValue("W1", "¿Cuánto tiempo de gestación tiene?");
  $sheet->setCellValue("X1", "¿Usted paso por algún control médico en un centro de salud?");
  $sheet->setCellValue("Y1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?");
  $sheet->setCellValue("Z1", "¿Usted o un miembro de su hogar con los que viaja o vive tiene alguna discapacidad, enfermedad crónica o una enfermedad que no le permite trabajar?");
  $sheet->setCellValue("AA1", "Primer Nombre Pariente 1");
  $sheet->setCellValue("AB1", "Segundo Nombre");
  $sheet->setCellValue("AC1", "Primer Apellido");
  $sheet->setCellValue("AD1", "Segundo Apellido");
  $sheet->setCellValue("AE1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("AF1", "Fecha de nacimiento");
  $sheet->setCellValue("AG1", "Edad");
  $sheet->setCellValue("AH1", "Relación");
  $sheet->setCellValue("AI1", "Tipo de Identificacion");
  $sheet->setCellValue("AJ1", "No. Identificacion");
  $sheet->setCellValue("AK1", "Primer Nombre Pariente 2");
  $sheet->setCellValue("AL1", "Segundo Nombre");
  $sheet->setCellValue("AM1", "Primer Apellido");
  $sheet->setCellValue("AN1", "Segundo Apellido");
  $sheet->setCellValue("AO1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("AP1", "Fecha de nacimiento");
  $sheet->setCellValue("AQ1", "Edad");
  $sheet->setCellValue("AR1", "Relación");
  $sheet->setCellValue("AS1", "Tipo de Identificacion");
  $sheet->setCellValue("AT1", "No. Identificacion");
  $sheet->setCellValue("AU1", "Primer Nombre Pariente 3");
  $sheet->setCellValue("AV1", "Segundo Nombre");
  $sheet->setCellValue("AW1", "Primer Apellido");
  $sheet->setCellValue("AX1", "Segundo Apellido");
  $sheet->setCellValue("AY1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("AZ1", "Fecha de nacimiento");
  $sheet->setCellValue("BA1", "Edad");
  $sheet->setCellValue("BB1", "Relación");
  $sheet->setCellValue("BC1", "Tipo de Identificacion");
  $sheet->setCellValue("BD1", "No. Identificacion");
  $sheet->setCellValue("BE1", "Primer Nombre Pariente 4");
  $sheet->setCellValue("BF1", "Segundo Nombre");
  $sheet->setCellValue("BG1", "Primer Apellido");
  $sheet->setCellValue("BH1", "Segundo Apellido");
  $sheet->setCellValue("BI1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("BJ1", "Fecha de nacimiento");
  $sheet->setCellValue("BK1", "Edad");
  $sheet->setCellValue("BL1", "Relación");
  $sheet->setCellValue("BM1", "Tipo de Identificacion");
  $sheet->setCellValue("BN1", "No. Identificacion");
  $sheet->setCellValue("BO1", "Primer Nombre Pariente 5");
  $sheet->setCellValue("BP1", "Segundo Nombre");
  $sheet->setCellValue("BQ1", "Primer Apellido");
  $sheet->setCellValue("BR1", "Segundo Apellido");
  $sheet->setCellValue("BS1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("BT1", "Fecha de nacimiento");
  $sheet->setCellValue("BU1", "Edad");
  $sheet->setCellValue("BV1", "Relación");
  $sheet->setCellValue("BW1", "Tipo de Identificacion");
  $sheet->setCellValue("BX1", "No. Identificacion");
  $sheet->setCellValue("BY1", "Primer Nombre Pariente 6");
  $sheet->setCellValue("BZ1", "Segundo Nombre");
  $sheet->setCellValue("CA1", "Primer Apellido");
  $sheet->setCellValue("CB1", "Segundo Apellido");
  $sheet->setCellValue("CC1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("CD1", "Fecha de nacimiento");
  $sheet->setCellValue("CE1", "Edad");
  $sheet->setCellValue("CF1", "Relación");
  $sheet->setCellValue("CG1", "Tipo de Identificacion");
  $sheet->setCellValue("CH1", "No. Identificacion");
  $sheet->setCellValue("CI1", "Primer Nombre Pariente 7");
  $sheet->setCellValue("CJ1", "Segundo Nombre");
  $sheet->setCellValue("CK1", "Primer Apellido");
  $sheet->setCellValue("CL1", "Segundo Apellido");
  $sheet->setCellValue("CM1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("CN1", "Fecha de nacimiento");
  $sheet->setCellValue("CO1", "Edad");
  $sheet->setCellValue("CP1", "Relación");
  $sheet->setCellValue("CQ1", "Tipo de Identificacion");
  $sheet->setCellValue("CR1", "No. Identificacion");
  $sheet->setCellValue("CS1", "Contamos con el programa de Nutrición que le brindará información y actividades virtuales o presenciales sobre alimentación y prácticas saludables en mujeres gestantes, lactantes, niñas y niños hasta los 5 años de edad. Participar de este programa requiere de su tiempo y compromiso para acceder a capacitaciones virtuales / presenciales y/o por teléfono. ¿Estaría usted o algún miembro de su familia interesado y disponible para participar en el programa de nutrición de Save the Children y autoriza ser contactado para esto?");

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
    $sheet->setCellValue("N".$i, $usuario[13]);
    $sheet->setCellValue("O".$i, $usuario[14]);
    $sheet->setCellValue("P".$i, $usuario[15]);
    $sheet->setCellValue("Q".$i, $usuario[16]);
    $sheet->setCellValue("R".$i, $usuario[17]);
    $sheet->setCellValue("S".$i, $usuario[18]);
    $sheet->setCellValue("T".$i, $usuario[19]);
    $sheet->setCellValue("U".$i, $usuario[20]);
    $sheet->setCellValue("V".$i, $usuario[21]);
    $sheet->setCellValue("W".$i, $usuario[22]);
    $sheet->setCellValue("X".$i, $usuario[23]);
    $sheet->setCellValue("Y".$i, $usuario[24]);
    $sheet->setCellValue("Z".$i, $usuario[25]);
    $sheet->setCellValue("AA".$i, $usuario[26]);
    $sheet->setCellValue("AB".$i, $usuario[27]);
    $sheet->setCellValue("AC".$i, $usuario[28]);
    $sheet->setCellValue("AD".$i, $usuario[29]);
    $sheet->setCellValue("AE".$i, $usuario[30]);
    $sheet->setCellValue("AF".$i, $usuario[31]);
    $sheet->setCellValue("AG".$i, $usuario[32]);
    $sheet->setCellValue("AH".$i, $usuario[33]);
    $sheet->setCellValue("AI".$i, $usuario[34]);
    $sheet->setCellValue("AJ".$i, $usuario[35]);
    $sheet->setCellValue("AK".$i, $usuario[36]);
    $sheet->setCellValue("AL".$i, $usuario[37]);
    $sheet->setCellValue("AM".$i, $usuario[38]);
    $sheet->setCellValue("AN".$i, $usuario[39]);
    $sheet->setCellValue("AO".$i, $usuario[40]);
    $sheet->setCellValue("AP".$i, $usuario[41]);
    $sheet->setCellValue("AQ".$i, $usuario[42]);
    $sheet->setCellValue("AR".$i, $usuario[43]);
    $sheet->setCellValue("AS".$i, $usuario[44]);
    $sheet->setCellValue("AT".$i, $usuario[45]);
    $sheet->setCellValue("AU".$i, $usuario[46]);
    $sheet->setCellValue("AV".$i, $usuario[47]);
    $sheet->setCellValue("AW".$i, $usuario[48]);
    $sheet->setCellValue("AX".$i, $usuario[49]);
    $sheet->setCellValue("AY".$i, $usuario[50]);
    $sheet->setCellValue("AZ".$i, $usuario[51]);
    $sheet->setCellValue("BA".$i, $usuario[52]);
    $sheet->setCellValue("BB".$i, $usuario[53]);
    $sheet->setCellValue("BC".$i, $usuario[54]);
    $sheet->setCellValue("BD".$i, $usuario[55]);
    $sheet->setCellValue("BE".$i, $usuario[56]);
    $sheet->setCellValue("BF".$i, $usuario[57]);
    $sheet->setCellValue("BG".$i, $usuario[58]);
    $sheet->setCellValue("BH".$i, $usuario[59]);
    $sheet->setCellValue("BI".$i, $usuario[60]);
    $sheet->setCellValue("BJ".$i, $usuario[61]);
    $sheet->setCellValue("BK".$i, $usuario[62]);
    $sheet->setCellValue("BL".$i, $usuario[63]);
    $sheet->setCellValue("BM".$i, $usuario[64]);
    $sheet->setCellValue("BN".$i, $usuario[65]);
    $sheet->setCellValue("BO".$i, $usuario[66]);
    $sheet->setCellValue("BP".$i, $usuario[67]);
    $sheet->setCellValue("BQ".$i, $usuario[68]);
    $sheet->setCellValue("BR".$i, $usuario[69]);
    $sheet->setCellValue("BS".$i, $usuario[70]);
    $sheet->setCellValue("BT".$i, $usuario[71]);
    $sheet->setCellValue("BU".$i, $usuario[72]);
    $sheet->setCellValue("BV".$i, $usuario[73]);
    $sheet->setCellValue("BW".$i, $usuario[74]);
    $sheet->setCellValue("BX".$i, $usuario[75]);
    $sheet->setCellValue("BY".$i, $usuario[76]);
    $sheet->setCellValue("BZ".$i, $usuario[77]);
    $sheet->setCellValue("CA".$i, $usuario[78]);
    $sheet->setCellValue("CB".$i, $usuario[79]);
    $sheet->setCellValue("CC".$i, $usuario[80]);
    $sheet->setCellValue("CD".$i, $usuario[81]);
    $sheet->setCellValue("CE".$i, $usuario[82]);
    $sheet->setCellValue("CF".$i, $usuario[83]);
    $sheet->setCellValue("CG".$i, $usuario[84]);
    $sheet->setCellValue("CH".$i, $usuario[85]);
    $sheet->setCellValue("CI".$i, $usuario[86]);
    $sheet->setCellValue("CJ".$i, $usuario[87]);
    $sheet->setCellValue("CK".$i, $usuario[88]);
    $sheet->setCellValue("CL".$i, $usuario[89]);
    $sheet->setCellValue("CM".$i, $usuario[90]);
    $sheet->setCellValue("CN".$i, $usuario[91]);
    $sheet->setCellValue("CO".$i, $usuario[92]);
    $sheet->setCellValue("CP".$i, $usuario[93]);
    $sheet->setCellValue("CQ".$i, $usuario[94]);
    $sheet->setCellValue("CR".$i, $usuario[95]);
    $sheet->setCellValue("CS".$i, $usuario[96]);
    $i++;
  }
  $writer = new Xlsx($spreadsheet);
  $writer->save("Reporte_Nutricion_" . $timestamp1 . ".xlsx");
  $var=true;

  if (!empty($var)) {        
    $type = "success";
    $message = "Datos se importaron al archivo : Reporte_Nutricion_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al importar los datos de Excel. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      SECTOR NUTRICIÓN
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este apartado podremos generar el reporte en formato excel con la información de todos los beneficiarios y su información complementaria para enviar al sector de Nutricón.</label>
          <br>
          <br>          
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Generar Reporte Nutrición</button>
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