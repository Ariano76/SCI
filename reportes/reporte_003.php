<?php include("../administrador/template/cabecera.php"); ?>

<?php

//require_once './administrador/config/bd.php';
require_once ('../administrador/config/bdPDO.php');

$db_1 = new TransactionSCI();
//$conn_1 = $db_1->Connect();
//echo $insertId;

//require_once ('../vendor/autoload.php');

?>

<div class="col-md-12">
  <div class="card text-dark bg-light">
    <div class="card-header">
      Reportes de Control - Número de hogares con miembros que presentan alguna discapacidad por rango de edad y regiones
    </div>
    <div class="card-body">
      <!--form method="POST" name="frmExcelImport" id="frmExcelImport" enctype="multipart/form-data"-->
      <div class="row">
        <div class="col-md-6">
          <select name="selecttam" id="departamento" class="form-control-lg">
            <option value="" disabled selected>Seleccione una región</option>
            <?php 
            $datos = $db_1->traer_regiones();
            foreach($datos as $value) { ?>
              <option value="<?php echo $value['region']; ?>"><?php echo $value['region'];?></option>
            <?php } ?>
          </select>                
        </div>
        <div class="col-md-3" aria-label="Basic example">
          <button 
          class="btn btn-success btn-lg" onclick="CargarDatosGraficoBarParametro('SP_reporte_03_discapacidad_x_region')">Consultar</button>
        </div>
        <div class="col-md-3" aria-label="Basic example">
          <button 
          class="btn btn-success btn-lg" onclick="CargarDatosTabla('SP_reporte_03_discapacidad_x_region_00')">Datos en Tabla</button>
        </div>        
      </div>
      <br>
      <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
          <canvas id="myCharBarParam" width="100" height="75"></canvas>
        </div>
        <div class="col-md-3">&nbsp;</div>
      </div>
      <div class="row">
        <div class="col-md-12" id="myDataTable">
          <!--canvas id="myDataTable"></canvas-->
        </div>        
      </div>            
      <!--/form-->
    </div>
    <br>
  </div>

</div>
</div>

<script>

  let myChart;
  let numSpan = 0;
  
  function CargarDatosGraficoBarParametro(storedprocedure){
    var region = $("#departamento").val();
    $.ajax({
      url:'controlador_grafico_parametro.php',
      type:'POST',
      data:{
        dato_region:region,
        dato_sp:storedprocedure
      }
    }).done(function(resp){
      var titulo = [];
      var cantidad_1 = [];
      var cantidad_2 = [];
      var cantidad_3 = [];
      var cantidad_4 = [];
      var colores = [];
      var data = JSON.parse(resp);
      for (var i = 0; i < data.length; i++) {
        titulo.push(data[i]['algun_miembro_tiene_discapacidad']);
        cantidad_1.push(data[i]['18-24']);
        cantidad_2.push(data[i]['25-49']);
        cantidad_3.push(data[i]['50+']);
        cantidad_4.push(data[i]['<18']);
        colores.push(colorRGB());
      }
      pintarGrafico('bar',titulo,cantidad_1,cantidad_2,cantidad_3,cantidad_4,colores,'x','# de beneficiarios por regiones','myCharBarParam')
    })
  }

  function CargarDatosTabla(storedprocedure){    
    //var region = $("#departamento").val();
    $.ajax({
      url:'controlador_grafico_sin_parametro.php',
      type:'POST',
      data:{
        //dato_region:region,
        dato_sp:storedprocedure
      }
    }).done(function(resp){
      
      var col = [];
      var data = JSON.parse(resp);
      var tableBody = document.getElementById("myDataTable");
      for (var i = 0; i < data.length; i++) {
        for (var key in data[i]) {
          if (col.indexOf(key) === -1) {
            col.push(key);
          }
        }
      }
       // CREATE DYNAMIC TABLE.
      var table = document.createElement("table");
      table.className = 'table table-striped table-bordered table-condensed';

      // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.
      var tr = table.insertRow(-1);                   // TABLE ROW.
        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th");      // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
          }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < data.length; i++) {
            tr = table.insertRow(-1);
            for (var j = 0; j < col.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = data[i][col[j]];
            }
        }
        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("myDataTable");
        //ctx = divContainer.getContext('2d');

        //divContainer.innerHTML = "";
        //divContainer.appendChild(table);
        if( numSpan == 0 ){
          divContainer.append(table);
          numSpan += 1;
        }
        console.log(numSpan)
    })
  }
  
  function pintarGrafico(tipo,titulo,c1,c2,c3,c4,colores,tipoAxis,encabezado,id){
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
          label: '18-24',
          data: c1,
          backgroundColor: ['rgba(54, 162, 235, 0.2)'],
          borderColor: ['rgba(54, 162, 235, 1)'],
          borderWidth: 1,
          stack: 'Stack 0',
        },
        {
          axis: tipoAxis,
          label: '25-49',
          data: c2,
          backgroundColor: ['rgba(255, 99, 132, 0.2)'],
          borderColor: ['rgba(255, 99, 132, 1)'],
          borderWidth: 1,
          stack: 'Stack 1',
        },
        {
          axis: tipoAxis,
          label: '50+',
          data: c3,
          backgroundColor: ['rgba(75, 192, 192, 0.2)'],
          borderColor: ['rgba(75, 192, 192, 1)'],
          borderWidth: 1,
          stack: 'Stack 2'
        },
        {
          axis: tipoAxis,
          label: '<18',
          data: c4,
          backgroundColor: ['rgba(255, 205, 86, 0.2)'],
          borderColor: ['rgba(255, 205, 86, 1)'],
          borderWidth: 1,
          stack: 'Stack 3'
        }
        ]
      },
      plugins: [ChartDataLabels],
      options: {
        plugins: {
          title: {
            display: true,
            text: 'Número de Familias con Embarazadas por Rango de Edad'
          },
        },

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