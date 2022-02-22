<?php include("../administrador/config/connection.php");

$output= array();
$sql = "SELECT * FROM vista_integrante";

$totalQuery = mysqli_query($con,$sql);
$total_all_rows = mysqli_num_rows($totalQuery);

$columns = array(
	0 => 'id_beneficiario',
	1 => 'nombre_beneficiario',
	2 => 'numero_cedula',
	3 => 'nombre_1a',
	4 => 'nombre_1b',
	5 => 'apellido_1a',
	6 => 'apellido_1b',
	7 => 'genero_1',
	8 => 'fecha_nacimiento_1',
	9 => 'relacion_1',
	10 => 'otro_1',
	11 => 'tipo_identificacion_1',
	12 => 'numero_identificacion_1',
);

if(isset($_POST['search']['value']))
{
	$search_value = $_POST['search']['value'];
	$sql .= " WHERE nombre_beneficiario like '%".$search_value."%'";
	$sql .= " OR numero_cedula like '%".$search_value."%'";
}

if(isset($_POST['order']))
{
	$column_name = $_POST['order'][0]['column'];
	$order = $_POST['order'][0]['dir'];
	$sql .= " ORDER BY ".$columns[$column_name]." ".$order."";
}
else
{
	$sql .= " ORDER BY id_beneficiario asc";
}

if($_POST['length'] != -1)
{
	$start = $_POST['start'];
	$length = $_POST['length'];
	$sql .= " LIMIT  ".$start.", ".$length;
}	

$query = mysqli_query($con,$sql);
$count_rows = mysqli_num_rows($query);
$data = array();
while($row = mysqli_fetch_assoc($query))
{
	$sub_array = array();
	$sub_array[] = $row['id_beneficiario'];
	$sub_array[] = $row['nombre_beneficiario'];
	$sub_array[] = $row['numero_cedula'];
	$sub_array[] = $row['nombre_1a'];
	$sub_array[] = $row['nombre_1b'];
	$sub_array[] = $row['apellido_1a'];
	$sub_array[] = $row['apellido_1b'];
	$sub_array[] = $row['genero_1'];
	$sub_array[] = $row['fecha_nacimiento_1'];
	$sub_array[] = $row['relacion_1'];
	$sub_array[] = $row['otro_1'];
	$sub_array[] = $row['tipo_identificacion_1'];	
	$sub_array[] = $row['numero_identificacion_1'];
	$sub_array[] = '<a href="javascript:void();" data-id="'.$row['id_beneficiario'].'" class="btn btn-info btn-sm editbtn" >Edit</a>';
	$data[] = $sub_array;
}

$output = array(
	'draw'=> intval($_POST['draw']),
	'recordsTotal' =>$count_rows ,
	'recordsFiltered'=> $total_all_rows,
	'data'=>$data,
);
echo  json_encode($output);
