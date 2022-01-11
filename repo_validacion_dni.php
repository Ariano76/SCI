<?php include("template/cabecera.php"); 

//use TransactionSCI;
require_once './administrador/config/bdPDO.php';

$db = new TransactionSCI();
$conn = $db->Connect();

$usuarios = $db->incidencia_Doc_Identidad();

?>

<!--div class="jumbotron jumbotron-fluid">
  <div class="container">
    <div class="row"-->
      <h1 class="display-4">Observaciones en campos númericos</h1>
    <!--p class="lead">Identificación de las principales incidencias presente en los datos y su corrección.</p-->    

      <div class="col-lg-12">
        <table id="tablaUsuarios" class="table-striped table-bordered" style="width:100%">
          <thead class="text-center">
            <tr>
              <th colspan="2">Encuesta</th>
              <th colspan="4">Beneficiario</th>
              <th colspan="7">Integrante</th>
            </tr>

            <th>User_id</th>
            <th>Id Encuestador</th>
            <th>Documento #1</th>
            <th>Documento #2</th>
            <th>número WhatsApp</th>
            <th>número SMS</th>
            <th>1</th>
            <th>2</th>
            <th>3</th>
            <th>4</th>
            <th>5</th>
            <th>6</th>
            <th>7</th>
          </thead>
          <tbody>
            <?php
            foreach($usuarios as $usuario){
              ?>
              <tr>
                <td><?php echo $usuario[0]?></td>
                <td><?php echo $usuario[1]?></td>
                <td><?php echo $usuario[2]?></td>
                <td><?php echo $usuario[3]?></td>
                <td><?php echo $usuario[4]?></td>
                <td><?php echo $usuario[5]?></td>
                <td><?php echo $usuario[6]?></td>
                <td><?php echo $usuario[7]?></td>
                <td><?php echo $usuario[8]?></td>
                <td><?php echo $usuario[9]?></td>
                <td><?php echo $usuario[10]?></td>
                <td><?php echo $usuario[11]?></td>
                <td><?php echo $usuario[12]?></td>
              </tr>
              <?php
            }
            ?>
          </tbody>
        </table>
      </div>


  

  <?php include("template/pie.php"); ?>