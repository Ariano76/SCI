<?php include("../template/cabecera.php"); 

//require "vendor/autoload.php";
//use PhpOffice\PhpSpreadsheet\Spreadsheet;
//use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

include("../administrador/config/connection.php");

?>

<!--div class="jumbotron jumbotron-fluid">
  <div class="container">
    <div class="row"-->
      <h1 class="display-8">DATOS DE LOS INTEGRANTES</h1> 

      <div class="col-lg-12">
        <table id="tablaUsuarios" class="table table-striped table-bordered table-condensed w-auto small nowrap" style="width:100%">
          <thead class="text-center">
            <tr>
              <th>Codigo</th>
              <th>Nombre&nbsp;del&nbsp;Beneficiario</th>
              <th>Numero&nbsp;de&nbsp;cedula</th>
              <th>Primer&nbsp;nombre</th>
              <th>Segundo&nbsp;nombre</th>
              <th>Primer&nbsp;apellido</th>
              <th>Segundo&nbsp;apellido</th>
              <th>Genero</th>
              <th>Fecha&nbsp;de&nbsp;nacimiento</th>
              <th>Parentesco</th>
              <th>Otro</th>
              <th>Tipo&nbsp;de&nbsp;identificación&nbsp;</th>
              <th>Numero&nbsp;de&nbsp;identificación&nbsp;</th>
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
              'url': 'fetch_data_integrantes.php',
              'type': 'post',
            },
            "aoColumnDefs": [{
              "bSortable": false,
              "aTargets": [13]
            },
            ]
          });
        });
        $(document).on('submit', '#updateUser', function(e) {
          e.preventDefault();
      //var tr = $(this).closest('tr');
      var nombre_beneficiario = $('#nombre_beneficiarioField').val();
      var numero_cedula = $('#numero_cedulaField').val();
      var nombre_1a = $('#nombre_1aField').val();
      var nombre_1b = $('#nombre_1bField').val();
      var apellido_1a = $('#apellido_1aField').val();
      var apellido_1b = $('#apellido_1bField').val();
      var genero_1 = $('#genero_1Field').val();
      var fecha_nacimiento_1 = $('#fecha_nacimiento_1Field').val();
      var relacion_1 = $('#relacion_1Field').val();
      var otro_1 = $('#otro_1Field').val();      
      var tipo_identificacion_1 = $('#tipo_identificacion_1Field').val();
      var numero_identificacion_1 = $('#numero_identificacion_1Field').val();

      var trid = $('#trid').val();
      var id = $('#id').val();           

/*      if (region_beneficiario != '' && otra_region != '' && se_instalara_en_esta_region != '' && en_que_provincia != '' && transit_settle != '' && en_que_otro_caso_1 != '' && en_que_distrito != ''  && en_que_otro_caso_2 != '' && en_que_otro_caso_3 != '' && primer_nombre != '' && segundo_nombre != '' && primer_apellido != '' && segundo_apellido != '' && genero != '' && fecha_nacimiento != '' && tiene_carne_extranjeria != '' && numero_cedula != '' && fecha_caducidad_cedula != '' && tipo_identificacion != '' && numero_identificacion != '' && fecha_caducidad_identificacion != '' && documentos_fisico_original ) {
  */
        //console.log("esta_de_acuerdo : " + esta_de_acuerdo);
        //console.log("Valor seleccionado en RadioButton : " + cod);
        
        $.ajax({
          url: "update_user_integrantes.php",
          type: "post",
          data: {
            nombre_beneficiario: nombre_beneficiario,
            numero_cedula: numero_cedula,
            nombre_1a: nombre_1a,
            nombre_1b: nombre_1b,
            apellido_1a: apellido_1a,
            apellido_1b: apellido_1b,
            genero_1: genero_1,
            fecha_nacimiento_1: fecha_nacimiento_1,
            relacion_1: relacion_1,
            otro_1: otro_1,
            tipo_identificacion_1: tipo_identificacion_1,
            numero_identificacion_1: numero_identificacion_1,
            id: id
          },
          success: function(data) {
            var json = JSON.parse(data);
            var status = json.status;
            if (status == 'true') {
              table = $('#tablaUsuarios').DataTable();
              var button = '<td><a href="javascript:void();" data-id="' + id + '" class="btn btn-info btn-sm editbtn">Edit</a> </td>';
              var row = table.row("[id='" + trid + "']");
              row.row("[id='" + trid + "']").data([id, nombre_beneficiario, numero_cedula, nombre_1a, nombre_1b, apellido_1a, apellido_1b, genero_1, fecha_nacimiento_1, relacion_1, otro_1, tipo_identificacion_1, numero_identificacion_1, button]);
              $('#exampleModal').modal('hide');
            } else {
              alert('failed');
            }
          }
        });
/*      } else {
        alert('Fill all the required fields');
      }*/
    });
        $('#tablaUsuarios').on('click', '.editbtn ', function(event) {
          var table = $('#tablaUsuarios').DataTable();
          var trid = $(this).closest('tr').attr('id');
      // console.log(selectedRow);
      var id = $(this).data('id');
      $('#exampleModal').modal('show');

      $.ajax({
        url: "get_single_general.php",
        data: {
          id: id
        },
        type: 'post',
        success: function(data) {
          var json = JSON.parse(data);
          $('#nombre_beneficiarioField').val(json.nombre_beneficiario);
          $('#primer_nombreField').val(json.primer_nombre);
          $('#segundo_nombreField').val(json.segundo_nombre);
          $('#primer_apellidoField').val(json.primer_apellido);
          $('#segundo_apellidoField').val(json.segundo_apellido);
          $('#numero_cedulaField').val(json.numero_cedula);
          $('#tipo_identificacionField').val(json.tipo_identificacion);
          $('#numero_identificacionField').val(json.numero_identificacion);
          $('#cual_es_su_numero_whatsappField').val(json.cual_es_su_numero_whatsapp);
          $('#cual_es_su_numero_recibir_smsField').val(json.cual_es_su_numero_recibir_sms);
          $('#fecha_nacimientoField').val(json.fecha_nacimiento);
          
          $('#id').val(id);
          $('#trid').val(trid);

          //console.log("cual_es_su_numero_whatsapp :" + json.cual_es_su_numero_whatsapp);
          //console.log("cual_es_su_numero_recibir_sms :" + json.cual_es_su_numero_recibir_sms);
        }        
      })
    });

  </script>
  <!-- Modal -->
  <!--div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"-->
  <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <!--div class="modal-dialog" role="document"-->
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR DATOS GENERALES BENEFICIARIOS</h5>
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="updateUser">
            <input type="hidden" name="id" id="id" value="">
            <input type="hidden" name="trid" id="trid" value="">

            <div class="row">
              <div class="col-3">
                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                  <a class="nav-link active" id="integ1-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Familiar 1</a>
                  <a class="nav-link" id="integ2-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Familiar 2</a>
                  <a class="nav-link" id="integ3-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Familiar 3</a>
                  <a class="nav-link" id="integ4-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">Familiar 4</a>
                </div>
              </div>
              <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                  <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                    <label for="nombre_beneficiarioField" class="col-md-9 form-label">Nombre del Beneficiario</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="nombre_beneficiarioField" name="name" disabled>
                    </div>
                    <label for="numero_cedulaField" class="col-md-9 form-label">Numero cedula</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="numero_cedulaField" name="cedula" maxlength="25" disabled>
                    </div>
                    <label for="primer_nombreField" class="col-md-3 form-label">1er Nombre</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="primer_nombreField" name="name1" maxlength="50">
                    </div>
                    <label for="segundo_nombreField" class="col-md-3 form-label">2do Nombre</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="segundo_nombreField" name="name2" maxlength="50">
                    </div> 
                    <label for="primer_apellidoField" class="col-md-3 form-label">1er Apelido</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="primer_apellidoField" name="ape1" maxlength="50">
                    </div>
                    <label for="segundo_apellidoField" class="col-md-3 form-label">2do Apellido</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="segundo_apellidoField" name="ape2" maxlength="50">
                    </div>
                    <label for="generoField" class="col-md-3 form-label">Genero</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="generoField" name="ape2" maxlength="50">
                    </div>
                    <label for="fecha_nacimientoField" class="col-md-3 form-label">Fecha nacimiento</label>
                    <div class="col-md-9">
                      <input id="fecha_nacimientoField" type="date" name="fecha" value="2017-06-01">
                    </div>
                    <label for="relacion_1Field" class="col-md-3 form-label">Parentesco</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="relacion_1Field" name="relacion_1" maxlength="50">
                    </div>
                    <label for="otro_1Field" class="col-md-3 form-label">Otro</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="otro_1Field" name="otro_1" maxlength="50">
                    </div>
                    <label for="tipo_identificacion_1Field" class="col-md-9 form-label">Tipo de identificación</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="tipo_identificacion_1Field" name="numiden" maxlength="25">
                    </div>
                    <label for="numero_identificacion_1Field" class="col-md-9 form-label">Numero identificación</label>
                    <div class="col-md-9">
                      <input type="text" class="form-control" id="numero_identificacion_1Field" name="cedula" maxlength="25">
                    </div>                    
                  </div>

                  <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">Oswaldo</div>
                  <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">Herrera</div>
                  <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">Mogrovejo</div>
                </div>
              </div>
            </div>            
            <div class="mb-3 row">
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


  <?php include("../template/pie.php"); ?>