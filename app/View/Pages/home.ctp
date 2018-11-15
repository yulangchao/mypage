<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/classic/cubeslider.css" />

		<div class="container slider">
			<div id="cs-slider">
				<img src="website/vue.png" title="Social platform with Vue2"/>
				<img src="website/warehouse.png" title="Warehouse with Angular4"/>
				<img src="website/course.png" title="Online Medical Course with PHP"/>
				<img src="website/taxi.png" title="Taxi Service with PHP"/>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/cubeslider-min.js"></script>
		<script type="text/javascript">
				
				$('#cs-slider').cubeslider({
					cubesNum: 		{rows:5, cols:5},
					orientation:	'v',
					spreadPixel		:0,
					cubeSync		:100,
					animationSpeed:400,
					random:true
				});
				$('document').ready(function(){
					setTimeout(function(){
					$('.cs-nav-play').click();
					},1000);
				});
		</script>
		<style>


		</style>
