<?php 
require "../../vendor/autoload.php";
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

require_once '../../administrador/config/bdPDO.php';

$db = new TransactionSCI();

  $dt = date('Y-m-d H:i:s');
  $timestamp1 = strtotime($dt);

  $gestante = $_POST["selectgestante"];
  $txt1 = $_POST["txtgestante"];
  $discapacidad = $_POST["selectdiscapacidad"];
  $txt2 = $_POST["txtdiscapacidad"];
  $nacionalidad = $_POST["selectnacionalidad"];
  $txt3 = $_POST["txtnacionalidad"];

  if ($gestante>0) {
    $usuarios = $db->select_repo_gerencia_gestante("SP_repo_gerencia_actividades_gestante",$gestante);
    $retVal = 'Gestante' . "_" . $txt1;
  } elseif ($discapacidad>0) {
    $usuarios = $db->select_repo_gerencia_gestante("SP_repo_gerencia_actividades_discapacidad",$discapacidad);
    $retVal = 'Discapacidad' . "_" . $txt2;
  } else {
    $usuarios = $db->select_repo_gerencia_gestante("SP_repo_gerencia_actividades_nacionalidad",$nacionalidad);
    $retVal = 'Nacionalidad' . "_" . $txt3;
  }
  $name = "Reporte_total_reach_subtemas_".$retVal;

  $spreadsheet = new Spreadsheet();
  $sheet = $spreadsheet->getActiveSheet();
  $sheet->setTitle($retVal);
  $sheet->setCellValue("A1", "Año");
  $sheet->setCellValue("B1", "Trimestre");
  $sheet->setCellValue("C1", "id_tipo_proyecto");
  $sheet->setCellValue("D1", "Tipo de Proyecto");
  $sheet->setCellValue("E1", "id_proyecto");
  $sheet->setCellValue("F1", "Proyecto");
  $sheet->setCellValue("G1", "id_tema");
  $sheet->setCellValue("H1", "Tema");
  $sheet->setCellValue("I1", "id_subtema");
  $sheet->setCellValue("J1", "Subtema");
  $sheet->setCellValue("K1", "id_región");
  $sheet->setCellValue("L1", "Región");
  $sheet->setCellValue("M1", "Niñas");
  $sheet->setCellValue("N1", "Niños");
  $sheet->setCellValue("O1", "Otros menores");
  $sheet->setCellValue("P1", "Subtotal menores");
  $sheet->setCellValue("Q1", "Mujeres");
  $sheet->setCellValue("R1", "Hombres");
  $sheet->setCellValue("S1", "Otros adultos");
  $sheet->setCellValue("T1", "Subtotal adultos");
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
    $i++;
  }

  $writer = new Xlsx($spreadsheet);
  $fileName = $name . "_" . $timestamp1 . ".xlsx";
  header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  header('Content-Disposition: attachment; filename="'. urlencode($fileName).'"');
  header('Cache-Control: max-age=0');

  $writer = \PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xlsx');
  $writer->save('php://output');  

?>