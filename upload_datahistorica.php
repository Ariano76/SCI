<?php include("template/cabecera.php"); ?>

<?php
use Phppot\DataSource;
use PhpOffice\PhpSpreadsheet\Reader\Xlsx;

require_once './administrador/config/bd.php';
require_once './administrador/config/bdPDO.php';
$db = new DataSource();
$conn = $db->getConnection();

$db_1 = new TransactionSCI();
$conn_1 = $db_1->Connect();

//echo $insertId;

require_once ('./vendor/autoload.php');

if (isset($_POST["import"])) {

    //limpiar tabla stage
    

  $allowedFileType = [
    'application/vnd.ms-excel', 'text/xls', 'text/xlsx',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
  ];

  if (in_array($_FILES["file"]["type"], $allowedFileType)) {

    $targetPath = 'uploads/' . $_FILES['file']['name'];
    move_uploaded_file($_FILES['file']['tmp_name'], $targetPath);

    $Reader = new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();

    $spreadSheet = $Reader->load($targetPath);
    $excelSheet = $spreadSheet->getActiveSheet();
    $spreadSheetAry = $excelSheet->toArray();
    $sheetCount = count($spreadSheetAry);

    $insertId = $db_1->limpiarStage("SP_LimpiarTablaStageDataHistorica");

    for ($i = 0; $i <= $sheetCount; $i ++) {
        $dato_01 = "";
        if (isset($spreadSheetAry[$i][0])) {
            $dato_01  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][0]); }
        $dato_02 = "";
        if (isset($spreadSheetAry[$i][1])) {
            $dato_02  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][1]); }
        $dato_03 = "";
        if (isset($spreadSheetAry[$i][2])) {
            $dato_03  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][2]); }
        $dato_04 = "";
        if (isset($spreadSheetAry[$i][3])) {
            $dato_04  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][3]); }
        $dato_05 = "";
        if (isset($spreadSheetAry[$i][4])) {
            $dato_05  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][4]); }
        $dato_06 = "";
        if (isset($spreadSheetAry[$i][5])) {
            $dato_06  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][5]); }
        $dato_07 = "";
        if (isset($spreadSheetAry[$i][6])) {
            $dato_07  = mysqli_real_escape_string($conn, $spreadSheetAry[$i][6]); }
      
      if (
        ! empty($dato_01) || ! empty($dato_02) || ! empty($dato_03) || ! empty($dato_04) || ! empty($dato_05) || ! empty($dato_06) || ! empty($dato_07) ) {
        $query = "insert into stage_data_historica(nombre_1, nombre_2, apellido_1, apellido_2, tipo_documento, numero_documento, sector) values(?, ?, ?, ?, ?, ?, ?)";
        $paramType = "sssssss";
        $paramArray = array($dato_01, $dato_02, $dato_03, $dato_04, $dato_05, $dato_06, $dato_07);
        $insertId = $db->insert($query, $paramType, $paramArray);
                // $query = "insert into tbl_info(name,description) values('" . $name . "','" . $description . "')";
                // $result = mysqli_query($conn, $query);

        if (! empty($insertId)) {        
          $type = "success";
          $message = "Datos importados desde Excel a la Base de Datos Historica:". ' ' .$insertId ." registros.";
        } else {
          $type = "error";
          $message = "Problemas al importar los datos de Excel. Intente de nuevo";
        }
      }
    }
  } else {
    $type = "error";
    $message = "El tipo de archivo seleccionado es invalido. Solo puede subir archivos de Excel.";
  }
}
?>

<div class="col-md-12">

  <div class="card text-dark bg-light">
    <div class="card-header">
      Datos Historicos de Beneficiarios
    </div>
    <div class="card-body">
      <form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data">
        <div class="form-group">
          <label for="txtImagen">Seleccione el archivo Excel a cargar:</label>
          <br>
          <br>
          <input type="file" class="form-control" name="file" id="file" accept=".xls,.xlsx"> 
        </div>
        <br>
        <div class="btn-group" role="group" aria-label="Basic example">
          <button type="submit" id="submit" name="import" value="agregar" class="btn btn-success btn-lg">Importar registros</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="col-md-12">
  <div class=card-text>
      <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($message)) { echo $message; } ?>
      </div>
  </div>
</div>


<?php include("template/pie.php"); ?>