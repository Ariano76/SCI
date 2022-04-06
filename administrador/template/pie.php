		</div>
	</div>

<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!--script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>

	<script>
		let myChart;

		function CargarDatosGraficoBar(){
			$.ajax({
				url:'controlador_grafico.php',
				type:'POST'
			}).done(function(resp){
				var titulo = [];
				var cantidad = [];
				var data = JSON.parse(resp);
				for (var i = 0; i < data.length; i++) {
					titulo.push(data[i]['region']);
					cantidad.push(data[i]['total']);
				}
				pintarGrafico(titulo,cantidad,'x','# de beneficiarios por regiones','myChartV')
			})
		}

		function CargarDatosGraficoBarHorizontal(){
			$.ajax({
				url:'controlador_grafico.php',
				type:'POST'
			}).done(function(resp){
				var titulo = [];
				var cantidad = [];
				var data = JSON.parse(resp);
				for (var i = 0; i < data.length; i++) {
					titulo.push(data[i]['region']);
					cantidad.push(data[i]['total']);
				}
				pintarGrafico(titulo,cantidad,'y','# de beneficiarios por regiones Horizontal','myChartH')
			})
		}		
		
		function pintarGrafico(titulo,cantidad,tipoAxis,encabezado,id){
			const ctx = document.getElementById(id);
			if (myChart) {
        		myChart.destroy();
    		}			
			myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: titulo,
					datasets: [{
						axis: tipoAxis,
						label: encabezado,
						data: cantidad,
						backgroundColor: [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
						],
						borderColor: [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
						],
						borderWidth: 1
					}]
				},
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
	</script>


</body>
</html>