<?php include("template/cabecera.php"); 

use Phpconnect\TransactionSCI;
require_once './administrador/config/bdPDO.php';

$db = new TransactionSCI();
?>

<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Validación de datos</h1>
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

    if(!empty($_POST['opciones'])) {

      foreach($_POST['opciones'] as $value){
        echo "Chosen colour : ".$value.'<br/>';
      }
    }

    $insertId = $db->limpiarStage();


  }
  ?>

  <?php include("template/pie.php"); ?>