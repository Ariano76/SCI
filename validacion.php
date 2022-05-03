<?php include("administrador/template/cabecera.php"); 

//use TransactionSCI;
require_once './administrador/config/bdPDO.php';

$db = new TransactionSCI();
$conn = $db->Connect();

?>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-8">Validación de datos</h1>
    <p class="lead">Identificación de las principales incidencias presente en los datos y su corrección.</p>    
    <p class="lead">Habilite los procesos a ejecutarse.</p>    
    
    <form method="post" action="">
      <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault" name='opciones[]' value="Opcion_01" checked>
        <label class="form-check-label" for="flexSwitchCheckDefault">Limpiar espacios en blanco</label>
      </div>
      <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked_1" name='opciones[]' value="Opcion_02" checked>
        <label class="form-check-label" for="flexSwitchCheckChecked_1">Limpiar caracteres especiales</label>
      </div>
      <div class="form-check form-switch">
        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked_2" name='opciones[]' value="Opcion_03" checked>
        <label class="form-check-label" for="flexSwitchCheckChecked_2">Recodificar respuestas</label>
      </div>
      <br>
      <!--input type="submit" value="Procesar registros" name="submit" -->
      <button type="submit" id="submit" name="submit" value="Submit" class="btn btn-success btn-lg">Procesar registros</button>
    </form>

  </div>

  <?php
  if(isset($_POST['submit'])){

/*    if(!empty($_POST['opciones'])) {

      foreach($_POST['opciones'] as $value){
        echo "Chosen colour : ".$value.'<br/>';
      }
    }
*/
    $cod_00 = $db->limpiarDataKobo("SP_UpdateAscii",$nombreUsuario);
    $cod_01 = $db->limpiarDataKobo("SP_UpdateDobleEspacioBlanco",$nombreUsuario);
    $cod_02 = $db->limpiarDataKobo("SP_UpdateTab",$nombreUsuario);
    $cod_03 = $db->limpiarDataKobo("SP_UpdateSaltoLinea",$nombreUsuario);
    $cod_04 = $db->limpiarDataKobo("SP_UpdateLetrasPuntoGuion",$nombreUsuario);
    $cod_05 = $db->limpiarDataKobo("SP_UpdateBackSlash",$nombreUsuario);
    $cod_00 = $db->limpiarDataKobo("SP_UpdateNewLineReturnLine",$nombreUsuario);
    $cod_06 = $db->limpiarDataKobo("SP_UpdateTrim",$nombreUsuario);
    $cod_07 = $db->limpiarDataKobo("SP_UpdateRecodificarSiNo",$nombreUsuario);
    $cod_08 = $db->limpiarDataKobo("SP_UpdateInfoTransito",$nombreUsuario);

    echo 'Todos los procesos finalizarón satisfactoriamente.';

  }

  ?>

  <?php include("administrador/template/pie.php"); ?>