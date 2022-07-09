<?php include("../administrador/template/cabecera.php"); 

//use TransactionSCI;
require_once '../administrador/config/bdPDO.php';

$db = new TransactionSCI();
$conn = $db->Connect();

?>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-8">Validación de datos de los Proyectos</h1>
    <p class="lead">Identificación de las principales incidencias presente en los datos.</p>    
    
    <form method="post" action="">
      <br>
      <!--input type="submit" value="Procesar registros" name="submit" -->
      <button type="submit" id="submit" name="submit" value="Submit" class="btn btn-success btn-lg">Procesar registros</button>
    </form>

  </div>

  <?php
  if(isset($_POST['submit'])){
    
    $cod_00 = $db->validarDataGerencia("SP_UpdateAscii");
    $cod_01 = $db->validarDataGerencia("SP_UpdateDobleEspacioBlanco");
    $cod_02 = $db->validarDataGerencia("SP_UpdateTab");
    $cod_03 = $db->validarDataGerencia("SP_UpdateSaltoLinea");
    $cod_04 = $db->validarDataGerencia("SP_UpdateLetrasPuntoGuion");
    $cod_05 = $db->validarDataGerencia("SP_UpdateBackSlash");
    $cod_06 = $db->validarDataGerencia("SP_UpdateNewLineReturnLine");
    $cod_07 = $db->validarDataGerencia("SP_UpdateTrim");
    $cod_08 = $db->validarDataGerencia("SP_UpdateRecodificarSiNo");
    $cod_09 = $db->validarDataGerencia("SP_UpdateInfoTransito");

    if ($cod_00 == 1 && $cod_01 == 1 && $cod_02 == 1 && $cod_03 == 1 && $cod_04 == 1 && $cod_05 == 1 && $cod_06 == 1 && $cod_07 == 1 && $cod_08 == 1 && $cod_09 == 1) {
      $type = "success";
      $message = "Todos los procesos finalizarón satisfactoriamente.";
    }else{
      $type = "error";
      $message = "Se encontrarón incidencias en los siguientes variables. Intente de nuevo.". $cod_00 ."-". $cod_01 ."-". $cod_02 ."-". $cod_03 ."-". $cod_04 ."-". $cod_05."-". $cod_06 ."-". $cod_07."-". $cod_08."-". $cod_09;
    }
  }
  ?>

  <div class="col-md-12">
    <div class=card-text>&nbsp;</div>
  </div>
  <div class="col-md-12">
    <div class=card-text>
      <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($message)) { echo $message; } ?>
    </div>
  </div>
</div>


<?php include("../administrador/template/pie.php"); ?>