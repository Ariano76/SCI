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

  $usuarios = $db_1->select_repo("SP_Select_Salud");

  $spreadsheet = new Spreadsheet();
  $sheet = $spreadsheet->getActiveSheet();
  $sheet->setTitle("Users");
  $sheet->setCellValue("A1", "Fecha Encuesta");
  $sheet->setCellValue("B1", "ID del encuestador");
  $sheet->setCellValue("C1", "Nombre completo del encuestador");  
  $sheet->setCellValue("D1", "Región del Beneficiario");
  $sheet->setCellValue("E1", "¿Planea instalarse más de un mes?");
  $sheet->setCellValue("F1", "¿En qué provincia?");
  $sheet->setCellValue("G1", "transit_settle");
  $sheet->setCellValue("H1", "Primer Nombre");
  $sheet->setCellValue("I1", "Segundo Nombre");
  $sheet->setCellValue("J1", "Primer Apellido");
  $sheet->setCellValue("K1", "Segundo Apellido");
  $sheet->setCellValue("L1", "¿Usted con que género se identifica?");
  $sheet->setCellValue("M1", "¿Cuál es su fecha de nacimiento?");
  $sheet->setCellValue("N1", "Edad");
  $sheet->setCellValue("O1", "Tipo de identificación #1 (Cédula)");
  $sheet->setCellValue("P1", "Fecha de caducidad");
  $sheet->setCellValue("Q1", "Tipo de identificación #2");
  $sheet->setCellValue("R1", "No. Identificacion #2");
  $sheet->setCellValue("S1", "Fecha de caducidad #2");
  $sheet->setCellValue("T1", "¿Cuál de los documentos se encuentra en físico y es original?");
  $sheet->setCellValue("U1", "¿Cuál es su número de WhatsApp?");
  $sheet->setCellValue("V1", "¿Cuál es su número de celular para recibir mensajes de texto?");
  $sheet->setCellValue("W1", "En caso de comunicarnos con usted, ¿Cuál de estos números usa con mayor frecuencia?");
  $sheet->setCellValue("X1", "¿Es teléfono propio?");
  $sheet->setCellValue("Y1", "¿Cómo accede a internet..?");
  $sheet->setCellValue("Z1", "¿Cuál es su dirección?");
  $sheet->setCellValue("AA1", "¿Esta viviendo o viajando con otros miembros de la familia?");
  $sheet->setCellValue("AB1", "¿Cuántos miembros hay en su familia y viven o viajan con usted? Por favor inclúyase en este número.");
  $sheet->setCellValue("AC1", "¿Está usted o alguien de su hogar con quien viaja o vive embarazada?");
  $sheet->setCellValue("AD1", "¿Cuánto tiempo de gestación tiene?");
  $sheet->setCellValue("AE1", "¿Usted paso por algún control médico en un centro de salud?");
  $sheet->setCellValue("AF1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?");
  $sheet->setCellValue("AG1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?/Lactando con NN <2 años");
  $sheet->setCellValue("AH1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?/No lactando con NN <2 años");
  $sheet->setCellValue("AI1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?/Madre de NN 2-5 años");
  $sheet->setCellValue("AJ1", "¿Usted o alguien de su hogar con la que viaja o vive tiene alguna de las siguientes condiciones?/Ninguno");
  $sheet->setCellValue("AK1", "¿Usted viaja o vive con niños de 5 a 17 años?");
  $sheet->setCellValue("AL1", "¿Usted o un miembro de su hogar con los que viaja o vive tiene alguna discapacidad, enfermedad crónica o una enfermedad que no le permite trabajar?");
  $sheet->setCellValue("AM1", "¿Usted o algún miembro de su hogar tiene algún problema o necesidad de salud?");
  $sheet->setCellValue("AN1", "Primer Nombre Pariente 1");
  $sheet->setCellValue("AO1", "Segundo Nombre");
  $sheet->setCellValue("AP1", "Primer Apellido");
  $sheet->setCellValue("AQ1", "Segundo Apellido");
  $sheet->setCellValue("AR1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("AS1", "Fecha de nacimiento");
  $sheet->setCellValue("AT1", "Edad");
  $sheet->setCellValue("AU1", "Relación");
  $sheet->setCellValue("AV1", "Tipo de Identificacion");
  $sheet->setCellValue("AW1", "No. Identificacion");
  $sheet->setCellValue("AX1", "Primer Nombre Pariente 2");
  $sheet->setCellValue("AY1", "Segundo Nombre");
  $sheet->setCellValue("AZ1", "Primer Apellido");
  $sheet->setCellValue("BA1", "Segundo Apellido");
  $sheet->setCellValue("BB1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("BC1", "Fecha de nacimiento");
  $sheet->setCellValue("BD1", "Edad");
  $sheet->setCellValue("BE1", "Relación");
  $sheet->setCellValue("BF1", "Tipo de Identificacion");
  $sheet->setCellValue("BG1", "No. Identificacion");
  $sheet->setCellValue("BH1", "Primer Nombre Pariente 3");
  $sheet->setCellValue("BI1", "Segundo Nombre");
  $sheet->setCellValue("BJ1", "Primer Apellido");
  $sheet->setCellValue("BK1", "Segundo Apellido");
  $sheet->setCellValue("BL1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("BM1", "Fecha de nacimiento");
  $sheet->setCellValue("BN1", "Edad");
  $sheet->setCellValue("BO1", "Relación");
  $sheet->setCellValue("BP1", "Tipo de Identificacion");
  $sheet->setCellValue("BQ1", "No. Identificacion");
  $sheet->setCellValue("BR1", "Primer Nombre Pariente 4");
  $sheet->setCellValue("BS1", "Segundo Nombre");
  $sheet->setCellValue("BT1", "Primer Apellido");
  $sheet->setCellValue("BU1", "Segundo Apellido");
  $sheet->setCellValue("BV1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("BW1", "Fecha de nacimiento");
  $sheet->setCellValue("BX1", "Edad");
  $sheet->setCellValue("BY1", "Relación");
  $sheet->setCellValue("BZ1", "Tipo de Identificacion");
  $sheet->setCellValue("CA1", "No. Identificacion");
  $sheet->setCellValue("CB1", "Primer Nombre Pariente 5");
  $sheet->setCellValue("CC1", "Segundo Nombre");
  $sheet->setCellValue("CD1", "Primer Apellido");
  $sheet->setCellValue("CE1", "Segundo Apellido");
  $sheet->setCellValue("CF1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("CG1", "Fecha de nacimiento");
  $sheet->setCellValue("CH1", "Edad");
  $sheet->setCellValue("CI1", "Relación");
  $sheet->setCellValue("CJ1", "Tipo de Identificacion");
  $sheet->setCellValue("CK1", "No. Identificacion");
  $sheet->setCellValue("CL1", "Primer Nombre Pariente 6");
  $sheet->setCellValue("CM1", "Segundo Nombre");
  $sheet->setCellValue("CN1", "Primer Apellido");
  $sheet->setCellValue("CO1", "Segundo Apellido");
  $sheet->setCellValue("CP1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("CQ1", "Fecha de nacimiento");
  $sheet->setCellValue("CR1", "Edad");
  $sheet->setCellValue("CS1", "Relación");
  $sheet->setCellValue("CT1", "Tipo de Identificacion");
  $sheet->setCellValue("CU1", "No. Identificacion");
  $sheet->setCellValue("CV1", "Primer Nombre Pariente 7");
  $sheet->setCellValue("CW1", "Segundo Nombre");
  $sheet->setCellValue("CX1", "Primer Apellido");
  $sheet->setCellValue("CY1", "Segundo Apellido");
  $sheet->setCellValue("CZ1", "¿Cuál es la identidad de género?");
  $sheet->setCellValue("DA1", "Fecha de nacimiento");
  $sheet->setCellValue("DB1", "Edad");
  $sheet->setCellValue("DC1", "Relación");
  $sheet->setCellValue("DD1", "Tipo de Identificacion");
  $sheet->setCellValue("DE1", "No. Identificacion");
  $sheet->setCellValue("DF1", "Derivación Salud");
  $sheet->setCellValue("DG1", "Contamos con el programa de Salud que le brindará información y actividades virtuales o presenciales sobre cuidados en salud materno infantil, mecanismos de acceso a la atención de gestantes y niños hasta los cinco años y cuidados en casos de tener alguna");

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
    $sheet->setCellValue("CT".$i, $usuario[97]);
    $sheet->setCellValue("CU".$i, $usuario[98]);
    $sheet->setCellValue("CV".$i, $usuario[99]);
    $sheet->setCellValue("CW".$i, $usuario[100]);
    $sheet->setCellValue("CX".$i, $usuario[101]);
    $sheet->setCellValue("CY".$i, $usuario[102]);
    $sheet->setCellValue("CZ".$i, $usuario[103]);
    $sheet->setCellValue("DA".$i, $usuario[104]);
    $sheet->setCellValue("DB".$i, $usuario[105]);
    $sheet->setCellValue("DC".$i, $usuario[106]);
    $sheet->setCellValue("DD".$i, $usuario[107]);
    $sheet->setCellValue("DE".$i, $usuario[108]);
    $sheet->setCellValue("DF".$i, $usuario[109]);
    $sheet->setCellValue("DG".$i, $usuario[110]);

    $i++;
  }
  $writer = new Xlsx($spreadsheet);
  $writer->save("Reporte_Salud_" . $timestamp1 . ".xlsx");
  $var=true;

  if (!empty($var)) {        
    $type = "success";
    $message = "Datos se importaron al archivo : Reporte_Salud_" . $timestamp1 . ".xlsx";
  } else {
    $type = "error";
    $message = "Problemas al importar los datos de Excel. Intente de nuevo";
  }

}

?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      SECTOR SALUD
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">En este apartado podremos generar el reporte en formato excel con la información de todos los beneficiarios y su información complementaria para enviar al sector de Salud.</label>
          <br>
          <br>          
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Generar Reporte Salud</button>
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