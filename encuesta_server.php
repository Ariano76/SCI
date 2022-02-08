<?php include("template/cabecera.php"); 

require "vendor/autoload.php";
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include("administrador/config/connection.php");

?>

<!--div class="jumbotron jumbotron-fluid">
  <div class="container">
    <div class="row"-->
      <h1 class="display-4">DATOS DE ENCUESTA</h1> 

      <div class="col-lg-12">
        <table id="tablaUsuarios" class="table table-striped table-bordered table-condensed" style="width:100%">
          <thead class="text-center">
            <tr>
              <th>Id Beneficiario</th>
              <th>Beneficiario</th>
              <th>Fecha Encuesta</th>
              <th>Id Encuestador</th>                                
              <th>Encuestador</th>  
              <th>Region Encuestador</th>
              <th>Como realizo encuesta</th>
              <th>Esta de acuerdo</th>
              <th>Acción</th>
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
            scrollX: true,
            'serverSide': 'true',
            'processing': 'true',
            'paging': 'true',
            'order': [],
            'ajax': {
              'url': 'fetch_data.php',
              'type': 'post',
            },
            "aoColumnDefs": [{
              "bSortable": false,
              "aTargets": [8]
            },

            ]
          });
        });
        $(document).on('submit', '#updateUser', function(e) {
          e.preventDefault();
      //var tr = $(this).closest('tr');
      var nombre = $('#nombreField').val();
      var fecha_encuesta = $('#fecha_encuestaField').val();
      var id_encuestador = $('#id_encuestadorField').val();
      var nombre_encuestador = $('#nombre_encuestadorField').val();
      var region_encuestador = $('#region_encuestadorField').val();
      var como_realizo_encuesta = $('#como_realizo_encuestaField').val();
      var esta_de_acuerdo = $('#esta_de_acuerdoField').val();
      var trid = $('#trid').val();
      var id = $('#id').val();
      if (nombre != '' && fecha_encuesta != '' && id_encuestador != '' && nombre_encuestador != '' && region_encuestador != '' && como_realizo_encuesta != '' && esta_de_acuerdo != '') {
        $.ajax({
          url: "update_user.php",
          type: "post",
          data: {
            nombre: nombre,
            fecha_encuesta: fecha_encuesta,
            id_encuestador: id_encuestador,
            nombre_encuestador: nombre_encuestador,
            region_encuestador: region_encuestador,
            como_realizo_encuesta: como_realizo_encuesta,
            esta_de_acuerdo: esta_de_acuerdo,
            id: id
          },
          success: function(data) {
            var json = JSON.parse(data);
            var status = json.status;
            if (status == 'true') {
              table = $('#tablaUsuarios').DataTable();
              // table.cell(parseInt(trid) - 1,0).data(id);
              // table.cell(parseInt(trid) - 1,1).data(username);
              // table.cell(parseInt(trid) - 1,2).data(email);
              // table.cell(parseInt(trid) - 1,3).data(mobile);
              // table.cell(parseInt(trid) - 1,4).data(city);
              var button = '<td><a href="javascript:void();" data-id="' + id + '" class="btn btn-info btn-sm editbtn">Edit</a> </td>';
              var row = table.row("[id='" + trid + "']");
              row.row("[id='" + trid + "']").data([id, nombre, fecha_encuesta, id_encuestador, nombre_encuestador, region_encuestador, como_realizo_encuesta, esta_de_acuerdo, button]);
              $('#exampleModal').modal('hide');
            } else {
              alert('failed');
            }
          }
        });
      } else {
        alert('Fill all the required fields');
      }
    });
        $('#tablaUsuarios').on('click', '.editbtn ', function(event) {
          var table = $('#tablaUsuarios').DataTable();
          var trid = $(this).closest('tr').attr('id');
      // console.log(selectedRow);
      var id = $(this).data('id');
      $('#exampleModal').modal('show');

      $.ajax({
        url: "get_single_data.php",
        data: {
          id: id
        },
        type: 'post',
        success: function(data) {
          var json = JSON.parse(data);
          $('#nombreField').val(json.nombre);
          $('#fecha_encuestaField').val(json.fecha_encuesta);
          $('#id_encuestadorField').val(json.id_encuestador);
          $('#nombre_encuestadorField').val(json.nombre_encuestador);
          $('#region_encuestadorField').val(json.region_encuestador);
          $('#como_realizo_encuestaField').val(json.como_realizo_encuesta);
          $('#esta_de_acuerdoField').val(json.esta_de_acuerdo);
          $('#id').val(id);
          $('#trid').val(trid);
        }
      })
    });

  </script>
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR DATOS ENCUESTA</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="updateUser">
            <input type="hidden" name="id" id="id" value="">
            <input type="hidden" name="trid" id="trid" value="">
            
            <div class="mb-3 row">
              <label for="nombreField" class="col-md-3 form-label">Nombre Beneficiario</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="nombreField" name="name">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="fecha_encuestaField" class="col-md-3 form-label">Fecha Encuesta</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="fecha_encuestaField" name="email">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="id_encuestadorField" class="col-md-3 form-label">Id Encuestador</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="id_encuestadorField" name="mobile">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="nombre_encuestadorField" class="col-md-3 form-label">Encuestador</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="nombre_encuestadorField" name="City">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="region_encuestadorField" class="col-md-3 form-label">Region Encuestador</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="region_encuestadorField" name="City">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="como_realizo_encuestaField" class="col-md-3 form-label">Como se realizo la encuesta</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="como_realizo_encuestaField" name="City">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="esta_de_acuerdoField" class="col-md-3 form-label">Esta de acuerdo</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="esta_de_acuerdoField" name="City">
              </div>
            </div>
                                                
            <div class="text-center">
              <button type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


  <?php include("template/pie.php"); ?>