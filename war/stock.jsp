	<%@include file="includes/header.jsp" %>
	<script>  setMenuActiveItem(''); </script>
  	<script type="text/javascript" src="/chart/canvasjs.min.js"></script>

    <script type="text/javascript">
    
      window.onload = function () {
      
		var stockDataLabels = ["Day","Ask","Bid"];
		var stockSymbol = '${param.symbol}';
		var getStockDataAPI = "/stock";

		$('#symbolId').html(stockSymbol);		
		
		$.getJSON( getStockDataAPI, function( stockData ) {
		
		    	if (stockData != "") {
			        var stockValuesArr = $.map(stockData.data, function(el) { return el; });
					
			        if(stockValuesArr.length > 0 ) {
				        stockDataTable = [];
				        
				        var dataPointsAsk = [];
						var dataPointsBid = [];
				        
						for (var i=0; i<stockValuesArr.length; i++) {
							
							var stocksTableLine = [];
							stocksTableLine.push(moment(stockValuesArr[i].day).format("MMM DD, YYYY"));
							stocksTableLine.push(stockValuesArr[i].ask);
							stocksTableLine.push(stockValuesArr[i].bid);
							
							stockDataTable.push(stocksTableLine);	
							
							var date = moment(stockValuesArr[i].day);
							var year = date.format("YYYY");
							var month = date.format("MM");
							var day = date.format("DD");
							dataPointsAsk.push({ x: new Date(year,month,day), y: stockValuesArr[i].ask });
							dataPointsBid.push({ x: new Date(year,month,day), y: stockValuesArr[i].bid });
						}
						
					    ////////////////////////////////////////////////////////////////
					    // TABLE  
					    ////////////////////////////////////////////////////////////////
		
					    $('#stockDataTable').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="stockDataTableContent"></table>' );
					 
					    $('#stockDataTableContent').dataTable( {
					        "data": stockDataTable,
					        "columns": [
					            { "title": stockDataLabels[0] },
					            { "title": stockDataLabels[1] },
					            { "title": stockDataLabels[2] }
							 ]
					    } );   
					    
					    ////////////////////////////////////////////////////////////////
					    // CHART  
					    ////////////////////////////////////////////////////////////////
		
						var chart2 = new CanvasJS.Chart("chartContainer2",
							{
						
								title:{
									text: "", //End of Day-trade values ",
									fontSize: 10 //30
								},
								axisX:{
						
									gridColor: "Silver",
									tickColor: "silver",
									valueFormatString: "DD/MMM"
						
								},                        
						        toolTip:{ shared:true },
								theme: "theme2",
								axisY: { gridColor: "Silver", tickColor: "silver" 	},
								legend:{ verticalAlign: "center", horizontalAlign: "right" },
								data: [
								{        
									type: "line", showInLegend: true,
									lineThickness: 2,
									name: stockDataLabels[1],
									markerType: "square", color: "#F08080",
									dataPoints: dataPointsAsk 
								},
								{        
									type: "line",  showInLegend: true,
									name: stockDataLabels[2],
									color: "#20B2AA", lineThickness: 2,
									dataPoints: dataPointsBid 
								}
								
								],
								  legend:{
								    cursor:"pointer",
								    itemclick:function(e){
								      if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
								      	e.dataSeries.visible = false;
								      }
								      else{
								        e.dataSeries.visible = true;
								      }
								      chart2.render();
								    }
								  }
								});
								
								chart2.render();
					    ////////////////////////////////////////////////////////////////
			        } 
			        
		        } else {
			    	$('#stockDataTable').html("No data for this stock.");		        	
					$('#chartContainer2').height(0);
		        }
		    });

      }
  	</script>
  	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		  		<h2>Chart of Stock Symbol: <span id="symbolId"></span></h2>
		  </div>
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		  		<div id="chartContainer2" style="height: 300px; width: 100%;">	</div>
		  </div>
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="divider"></div>
	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6" id="stockDataTable">
		</div>
		<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="divider"></div>

</body>
</html>




