<?php include("template/cabecera.php"); 

//require "vendor/autoload.php";
//use PhpOffice\PhpSpreadsheet\Spreadsheet;
//use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include("administrador/config/connection.php");

?>

<!--div class="jumbotron jumbotron-fluid">
  <div class="container">
    <div class="row"-->
      <h1 class="display-4">DATOS DE BENEFICIARIO</h1> 

      <div class="col-lg-12">
        <table id="tablaUsuarios" class="table table-striped table-bordered table-condensed" style="width:100%">
          <thead class="text-center">
            <tr>
              <th>Id Beneficiario</th>
              <th>primer_nombre</th>
              <th>segundo_nombre</th>
              <th>primer_apellido</th>                                
              <th>segundo_apellido</th>  
              <th>region_beneficiario</th>
              <th>otra_region</th>
              <th>se_instalara_en_esta_region</th>
              <th>en_que_provincia</th>
              <th>transit_settle</th>
              <th>en_que_otro_caso_1</th>
              <th>en_que_distrito</th>
              <th>en_que_otro_caso_2</th>
              <th>en_que_otro_caso_3</th>
              <th>genero</th>
              <th>fecha_nacimiento</th>
              <th>tiene_carne_extranjeria</th>
              <th>numero_cedula</th>
              <th>fecha_caducidad_cedula</th>
              <th>tipo_identificacion</th>
              <th>numero_identificacion</th>
              <th>fecha_caducidad_identificacion</th>
              <th>documentos_fisico_original</th>
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
              'url': 'fetch_data_beneficiario.php',
              'type': 'post',
            },
            "aoColumnDefs": [{
              "bSortable": false,
              "aTargets": [8]
            },
            ]
          });
        });
        /*$(document).ready(function(){
          $("#exampleModal").find("input[type=radio]").click(function() {
            alert($('input[type=radio]:checked').val());
          });
        });*/
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
      
      var cod = $("input[type=radio]:checked").val();

      var trid = $('#trid').val();
      var id = $('#id').val();           

      if (nombre != '' && fecha_encuesta != '' && id_encuestador != '' && nombre_encuestador != '' && region_encuestador != '' && como_realizo_encuesta != '' && esta_de_acuerdo != '') {

        console.log("esta_de_acuerdo : " + esta_de_acuerdo);
        console.log("Valor seleccionado en RadioButton : " + cod);
        
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
            esta_de_acuerdo: cod,
            id: id
          },
          success: function(data) {
            var json = JSON.parse(data);
            var status = json.status;
            if (status == 'true') {
              table = $('#tablaUsuarios').DataTable();
              var button = '<td><a href="javascript:void();" data-id="' + id + '" class="btn btn-info btn-sm editbtn">Edit</a> </td>';
              var row = table.row("[id='" + trid + "']");
              row.row("[id='" + trid + "']").data([id, nombre, fecha_encuesta, id_encuestador, nombre_encuestador, region_encuestador, como_realizo_encuesta, cod, button]);
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

          console.log("La Respuesta esta_de_acuerdoField es :" + json.esta_de_acuerdo);

          if (json.esta_de_acuerdo == "1") {
            $('#exampleModal').find(':radio[name=acepto][value="1"]').prop('checked', true);
          } else {
            $('#exampleModal').find(':radio[name=acepto][value="0"]').prop('checked', true);
          }

        }        
      })
    });

  </script>
  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <!--div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"-->
    <div class="modal-dialog" role="document">
    <!--div class="modal-dialog modal-lg" role="document"-->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR DATOS ENCUESTA</h5>
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="updateUser">
            <input type="hidden" name="id" id="id" value="">
            <input type="hidden" name="trid" id="trid" value="">
            
            <div class="mb-3 row">
              <label for="nombreField" class="col-md-3 form-label">Beneficiario</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="nombreField" name="name" disabled>
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
              <label for="como_realizo_encuestaField" class="col-md-3 form-label">Realizo la encuesta</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="como_realizo_encuestaField" name="City">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="esta_de_acuerdoField" class="col-md-3 form-label">Esta de acuerdo</label>
              <div class="col-md-9">
              <label class="radio-inline">
                <input type="radio" name="acepto" id="esta_de_acuerdoField1" value="1"> Si 
              <!--/label>
              <label class="radio-inline"-->
                <input type="radio" name="acepto" id="esta_de_acuerdoField2" value="0"> No 
              </label>
              </div>
            </div>

            <div class="text-center">
              <button type="submit" class="btn btn-primary">Actualizar</button>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


  <?php include("template/pie.php"); ?>