<?php include("../administrador/template/cabecera.php"); 

include("../administrador/config/connection.php");

?>
      <h1 class="display-8">CONSULTA PAQUETES ENVIADOS AL COORDINADOR</h1> 

      <div class="col-lg-12">
        <table id="tablaUsuarios" class="table table-striped table-bordered table-condensed w-auto small" style="width:100%">
          <thead class="text-center">
            <tr>
              <th>Codigo</th>
              <th>Estado&nbsp;de&nbsp;envio</th>
              <th>Fecha&nbsp;de&nbsp;envio</th>
              <th>Nombre&nbsp;de&nbsp;usuario</th>
              <th>Estado&nbsp;aprobación</th>
              <th>N°&nbsp;de&nbsp;beneficiarios</th>
              <th>Observaciones</th>
            </tr>
          </thead>
        </table>   
      </div>

      <script type="text/javascript">
        $(document).ready(function() {
          $('#tablaUsuarios').DataTable({
            "fnCreatedRow": function(nRow, aData, iDataIndex) {
              $(nRow).attr('id', aData[0]);
            },
            
            'serverSide': 'true',
            'processing': 'true',
            'paging': 'true',
            'order': [],
            'ajax': {
              'url': 'fetch_data_finanza_paquete.php',
              'type': 'post',
            },
            "aoColumnDefs": [{
              "bSortable": false,
              "aTargets": [6]
            },
            ]
          });
        });
  </script>


  <?php include("../administrador/template/pie.php"); ?>