<?php include("../administrador/template/cabecera.php"); ?>

<?php

//require_once './administrador/config/bd.php';
require_once ('../administrador/config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();
//echo $insertId;

require_once ('../vendor/autoload.php');

?>

<div class="col-md-12">
  <div class="card text-dark bg-light">
    <div class="card-header">
      Reportes de Control
    </div>
    <div class="card-body">
      <!--form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data"-->
      <div class="form-group">
        <label for="txtImagen">En esta seccion podremos consultar los reportes de benficiarios por regiones.</label>
      </div>
      <br>
      <label for="txtImagen">Seleccione una región.</label>
      <br><br>
      <select name="selecttam" id="departamento" class="form-control-lg">
        <option value="" disabled selected>Seleccione una región</option>
        <?php 
        $datos = $db_1->traer_regiones();
        foreach($datos as $value) { ?>
          <option value="<?php echo $value['region']; ?>"><?php echo $value['region'];?></option>
        <?php } ?>
      </select>          
      <br>
      <br>
      <div class="btn-group" role="group" aria-label="Basic example">
        <button 
        class="btn btn-success btn-lg" onclick="CargarDatosGraficoBarParametro()">Consultar</button>
      </div>
      <br>
      <br>      
      <div class="col-md-6">
        <canvas id="myCharBarParam" width="100" height="100"></canvas>
      </div>
      <!--/form-->
    </div>
    <br>
  </div>

</div>
</div>
<div class="col-md-12">
  <div class=card-text>
    <div class="<?php if(!empty($type)) { echo $type . " alert alert-success role=alert"; } ?>"><?php if(!empty($var)) { echo $message; } ?>
  </div>
</div>
</div>

<script>

  let myChart;
  
  function CargarDatosGraficoBarParametro(){
    var region = $("#departamento").val();
    $.ajax({
      url:'controlador_grafico_parametro.php',
      type:'POST',
      data:{
        dato_region:region
      }
    }).done(function(resp){
      var titulo = [];
      var cantidad_1 = [];
      var colores = [];
      var data = JSON.parse(resp);
      for (var i = 0; i < data.length; i++) {
        titulo.push(data[i]['genero']);
        cantidad_1.push(data[i]['18-24']);
        /*cantidad_2.push(data[i]['25-49']);
        cantidad_3.push(data[i]['50+']);
        cantidad_4.push(data[i]['<18']);*/
        colores.push(colorRGB());
      }
      pintarGrafico('bar',titulo,cantidad_1,colores,'x','# de beneficiarios por regiones','myCharBarParam')
    })
  }

  function pintarGrafico(tipo,titulo,c1,colores,tipoAxis,encabezado,id){
    const ctx = document.getElementById(id);
    /* El bloque if solo se utilizara si queremos pintar varios graficos en la misma pagina. antes de dibujar un nuevo grafico, se valida si existe previamente, si es asi se elimina y se dibija el nuevo grafico.*/

    if (myChart) {
      myChart.destroy();
    }
    myChart = new Chart(ctx, {
      type: tipo,
      data: {
        labels: titulo,
        datasets: [
        {
          axis: tipoAxis,
          label: 'Hombre',
          data: c1,
          backgroundColor: ['rgba(54, 162, 235, 0.2)'],
          borderColor: ['rgba(54, 162, 235, 1)'],
          borderWidth: 1,
          stack: 'Stack 0',
        },
        {
          axis: tipoAxis,
          label: 'Mujer',
          data: c1,
          backgroundColor: ['rgba(255, 99, 132, 0.2)'],
          borderColor: ['rgba(255, 99, 132, 1)'],
          borderWidth: 1,
          stack: 'Stack 1',
        },
        {
          axis: tipoAxis,
          label: 'Otro',
          data: c1,
          backgroundColor: ['rgba(75, 192, 192, 0.2)'],
          borderColor: ['rgba(75, 192, 192, 1)'],
          borderWidth: 1,
          stack: 'Stack 2'
        }/*,
        {
          axis: tipoAxis,
          label: 'Otro1',
          data: c4,
          backgroundColor: ['rgba(75, 192, 192, 0.2)'],
          borderColor: ['rgba(75, 192, 192, 1)'],
          borderWidth: 1,
          stack: 'Stack 3'
        }*/
        ]
      },
      plugins: [ChartDataLabels],
      options: {
        indexAxis: tipoAxis,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  function generarNumero(numero){
    return (Math.random()*numero).toFixed(0);
  }

  function colorRGB(){
    var coolor = "("+generarNumero(255)+"," + generarNumero(255) + "," + generarNumero(255) +")";
    return "rgb" + coolor;
  }   
</script>

<?php include("../administrador/template/pie.php"); ?>