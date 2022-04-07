		</div>
	</div>

<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!--script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script-->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

	<script>

		let myChart;


		CargarDatosGraficoBar();
		CargarDatosGraficoBarHorizontal();
		CargarDatosGraficoPie();

		function CargarDatosGraficoBar(){
			$.ajax({
				url:'controlador_grafico.php',
				type:'POST'
			}).done(function(resp){
				var titulo = [];
				var cantidad = [];
				var colores = [];
				var data = JSON.parse(resp);
				for (var i = 0; i < data.length; i++) {
					titulo.push(data[i]['region']);
					cantidad.push(data[i]['total']);
					colores.push(colorRGB());
				}
				pintarGrafico('bar',titulo,cantidad,colores,'x','# de beneficiarios por regiones','myChartV')
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
				pintarGrafico('bar',titulo,cantidad,0,'y','# de beneficiarios por regiones Horizontal','myChartH')
			})
		}		


		var myoption = {
            tooltips: {
                enabled: true
            },
            hover: {
                animationDuration: 1
            },
            animation: {
            duration: 1,
            onComplete: function () {
                var chartInstance = this.chart,
                    ctx = chartInstance.ctx;
                    ctx.textAlign = 'center';
                    ctx.fillStyle = "rgba(0, 0, 0, 1)";
                    ctx.textBaseline = 'bottom';
                    // Loop through each data in the datasets
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];
                            ctx.fillText(data, bar._model.x, bar._model.y - 5);
                        });
                    });
                }
            }
        };



		function CargarDatosGraficoPie(){
			$.ajax({
				url:'controlador_grafico.php',
				type:'POST'
			}).done(function(resp){
				var titulo = [];
				var cantidad = [];
				var colores = [];
				var data = JSON.parse(resp);
				for (var i = 0; i < data.length; i++) {
					titulo.push(data[i]['region']);
					cantidad.push(data[i]['total']);
					colores.push(colorRGB());
				}
				//pintarGrafico('pie',titulo,cantidad,colores,'x','# de beneficiarios por regiones','myChartPie')
				const ctx = document.getElementById('myChartPie');
				myChart = new Chart(ctx, {
					type: 'pie',
					data: {
						labels: titulo,
						datasets: [{
							label: 'Grafico Pie',
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
							]
						}]
					},
					plugins: [ChartDataLabels]
					/*ticks: {
						callback: function(value, index, values) {
							return '$' + value.toLocaleString();
						}
					}*/
				});
			})
		}

		function pintarGrafico(tipo,titulo,cantidad,colores,tipoAxis,encabezado,id){
			const ctx = document.getElementById(id);
			/* El bloque if solo se utilizara si queremos pintar varios graficos en la misma pagina. antes de dibujar un nuevo grafico, se valida si existe previamente, si es asi se elimina y se dibija el nuevo grafico.*/

			/*if (myChart) {
        		myChart.destroy();
        	}*/
        	myChart = new Chart(ctx, {
        		type: tipo,
        		data: {
        			labels: titulo,
        			datasets: [
        			{
        				axis: tipoAxis,
        				label: 'Hombre',
        				data: cantidad,
        				backgroundColor: ['rgba(54, 162, 235, 0.2)'],
        				borderColor: ['rgba(54, 162, 235, 1)'],
        				/*backgroundColor: [
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
        				],*/
        				borderWidth: 1,
        				stack: 'Stack 0',
        			},
        			{
        				axis: tipoAxis,
        				label: 'Mujer',
        				data: cantidad,
        				backgroundColor: ['rgba(255, 99, 132, 0.2)'],
        				borderColor: ['rgba(255, 99, 132, 1)'],
        				/*backgroundColor: [
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
        				],*/
        				borderWidth: 1,
        				stack: 'Stack 1',
        			},
        			{
        				axis: tipoAxis,
        				label: 'Mujer',
        				data: cantidad,
        				backgroundColor: ['rgba(75, 192, 192, 0.2)'],
        				borderColor: ['rgba(75, 192, 192, 1)'],
        				/*backgroundColor: [
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
        				],*/
        				borderWidth: 1,
        				stack: 'Stack 2'
        			}
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


</body>
</html>