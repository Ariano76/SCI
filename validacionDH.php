<?php include("template/cabecera.php"); 

//use TransactionSCI;
require_once './administrador/config/bdPDO.php';

$db = new TransactionSCI();
$conn = $db->Connect();

?>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Validación Datos Historicos</h1>
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

    $cod_03 = $db->update_stored_procedure_DH("SP_UpdateDHSaltoLinea");
    //echo $insertId;
    $cod_04 = $db->update_stored_procedure_DH("SP_UpdateDHBackSlash");
    //echo $insertId;
    $cod_05 = $db->update_stored_procedure_DH("SP_UpdateDHSoloAlfanumericos");
    //echo $insertId;    
    $cod_06 = $db->update_stored_procedure_DH("SP_UpdateDHLimpiarCaracteres_acentos");
    //echo $insertId;
    $cod_07 = $db->update_stored_procedure_DH("SP_UpdateDHLimpiarDobleEspacioBlanco");
    //echo $insertId;
    $cod_08 = $db->update_stored_procedure_DH("SP_UpdateDHTipoDocumento");
    $cod_09 = $db->update_stored_procedure_DH("SP_UpdateDHSoloTextoTipoDocumento");
    $cod_10 = $db->update_stored_procedure_DH("SP_UpdateDHTrim");
    //echo $insertId;



    echo 'Todos los procesos finalizarón satisfactoriamente.';


  }
  ?>

  <?php include("template/pie.php"); ?>