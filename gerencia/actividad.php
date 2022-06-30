<?php include("../administrador/template/cabecera.php"); 

include("../administrador/config/connection.php");

?>
<style type="text/css">
  .btnAdd {
    text-align: right;
    width: 83%;
    margin-bottom: 20px;
  }
</style>

<h1 class="display-8">MAESTRO DE ACTIVIDADES</h1> 

<div class="btnAdd">
  <a href="#!" data-id="" data-bs-toggle="modal" data-bs-target="#addUserModal" class="btn btn-success btn-sm">Add User</a>
</div>

<div class="col-lg-12">
  <table id="tablaUsuarios" class="table table-striped table-bordered table-condensed small" style="width:100%">
    <!--table id="tablaUsuarios" class="table table-striped table-bordered table-condensed w-auto small nowrap" style="width:100%"-->
    <thead class="text-center">
      <tr>
        <th>Codigo</th>
        <th>Nombre&nbsp;de&nbsp;la&nbsp;Actividad</th>
        <th>Fecha&nbsp;de&nbsp;realización</th>
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
        'url': 'actividad_fetch_data.php',
        'type': 'post',
      },
      "aoColumnDefs": [{
        "bSortable": false,
        "aTargets": [3]
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
      var nom_actividad = $('#nom_actividadField').val();
      var fecha_actividad = $('#fecha_actividadField').val();      

      var trid = $('#trid').val();
      var id = $('#id').val();           
/*      if (region_beneficiario != '' && otra_region != '' && se_instalara_en_esta_region != '' && en_que_provincia != '' && transit_settle != '' && en_que_otro_caso_1 != '' && en_que_distrito != ''  && en_que_otro_caso_2 != '' && en_que_otro_caso_3 != '' && primer_nombre != '' && segundo_nombre != '' && primer_apellido != '' && segundo_apellido != '' && genero != '' && fecha_nacimiento != '' && tiene_carne_extranjeria != '' && numero_cedula != '' && fecha_caducidad_cedula != '' && tipo_identificacion != '' && numero_identificacion != '' && fecha_caducidad_identificacion != '' && documentos_fisico_original ) {
  */
  $.ajax({
    url: "actividad_update_user.php",
    type: "post",
    data: {
      nom_actividad: nom_actividad,
      fecha_actividad: fecha_actividad,
      id: id
    },
    success: function(data) {
      var json = JSON.parse(data);
      var status = json.status;
      if (status == 'true') {
        table = $('#tablaUsuarios').DataTable();
        var button = '<td><a href="javascript:void();" data-id="' + id + '" class="btn btn-info btn-sm editbtn">Edit</a> </td>';
        var row = table.row("[id='" + trid + "']");

        row.row("[id='" + trid + "']").data([id, nom_actividad, fecha_actividad, button]);
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
        url: "actividad_get_single.php",
        data: {
          id: id
        },
        type: 'post',
        success: function(data) {
          var json = JSON.parse(data);
          $('#nombreField').val(json.nombre);
          $('#fechaField').val(json.nombre);

          $('#id').val(id);
          $('#trid').val(trid);
          //console.log("La Respuesta esta_de_acuerdoField es :" + json.esta_de_acuerdo);

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
          <h5 class="modal-title" id="exampleModalLabel">ACTUALIZAR ACTIVIDADES</h5>
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="updateUser">
            <input type="hidden" name="id" id="id" value="">
            <input type="hidden" name="trid" id="trid" value="">
            
            <div class="mb-3 row">
              <label for="nom_actividadField" class="col-md-3 form-label">Nombre Actividad</label>
              <div class="col-md-9">
                <input type="text" class="form-control" id="nom_actividadField" name="name">
              </div>
            </div>
            <div class="mb-3 row">
              <label for="fecha_actividadField" class="col-md-4 form-label">Fecha realización</label>
              <div class="col-md-8">
                <input id="fecha_actividadField" type="date" name="fecha" value="2017-06-01">
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


  <?php include("../administrador/template/pie.php"); ?>