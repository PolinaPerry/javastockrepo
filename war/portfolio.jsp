	<%@include file="includes/header.jsp" %>
	<script>  setMenuActiveItem('menuindex'); </script>
  	<script type="text/javascript" src="/chart/canvasjs.min.js"></script>

    <script type="text/javascript">
    
      window.onload = function () {
      
		var getPortfolioDataAPI = "/portfolio";

		$.getJSON( getPortfolioDataAPI, function( jsonData ) {
			//console.log(data);
			portfolioTitle = jsonData.title;
			if (portfolioTitle!='' && portfolioTitle!=undefined) {
				portfolioTitle = " ("+portfolioTitle+")"; 
			}
			$('#portfolioTitleId').html(portfolioTitle);
			
			var portfolioTotalStatusArray = $.map(jsonData.totalStatus, function(el) { return el; });
			var isPortfolioTotalHistoryExists = portfolioTotalStatusArray.length > 0;
			//console.log(portfolioTotalStatusArray[0]);
			
			var stockStatusListArray = $.map(jsonData.stockStatusList, function(el) { return el; });
			var isPortfolioStocksExists = stockStatusListArray.length > 0;
			//console.log(stockStatusListArray[0]);
		        
	        ////////////////////////////////////////////////////////////////
		    // Portfolio Total History CHART  
		    ////////////////////////////////////////////////////////////////

		    if (isPortfolioTotalHistoryExists) {
		  		var portfolioValueGraphLabels = ["Day","Portfolio Total (USD)"];
				var portfolioValueHistory = portfolioTotalStatusArray;//[];
				//var demoPortfolioHistorySize = portfolioTotalStatusArray.length; //10;
	       
		        var portfolioValueGraph = [];
		        
				for (var i=0; i<portfolioValueHistory.length; i++) {
					
					var date = moment(portfolioValueHistory[i].date);
					var year = date.format("YYYY");
					var month = date.format("MM");
					var day = date.format("DD");
					portfolioValueGraph.push({ x: new Date(year,month,day), y: portfolioValueHistory[i].value });
				}
				
				var chart2 = new CanvasJS.Chart("portfolioStatusChart",
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
								name: portfolioValueGraphLabels[1],
								markerType: "square", color: "#F08080",
								dataPoints: portfolioValueGraph 
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
				}); // end of chart2
						
				chart2.render();
		    } else {
		    	$('#portfolioMessage').html("No portfolio history yet. Edit portfolio <a href='portfolioedit.jsp'>here</a>.");
		    	$('#portfolioStatusChart').height(0);
		    }			
		    ////////////////////////////////////////////////////////////////
		    // PORTFOLIO STOCKS TABLE  
		    ////////////////////////////////////////////////////////////////
			var portfolioActionTableLabels = ["Symbol","Total","Algotrader Recommendation"];
			var portfolioActionTableValues = [];
			var portfolioActionTable = [];
			var portfolioHistorySize = stockStatusListArray.length;
			console.log("portfolioHistorySize="+portfolioHistorySize);

		    if (isPortfolioStocksExists) {
			
				for (var x=0; x < portfolioHistorySize; x++) {
		        	var symbol = stockStatusListArray[x].symbol; 
		        	var total = stockStatusListArray[x].stockQuantity *stockStatusListArray[x].bid;  
		        	total = total.formatCurrency(2);
					var action = stockStatusListArray[x].recommendation;
					
					var portfolioActionTableRecord = [symbol,total,action];
					
					portfolioActionTable.push(portfolioActionTableRecord);	
				}
			    
			    $('#portfolioActionsTable').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="portfolioActionsTableContent"></table>' );
			 
			    $('#portfolioActionsTableContent').dataTable( {
			        "data": portfolioActionTable,
			        "columns": [
			            { "title": portfolioActionTableLabels[0] },
			            { "title": portfolioActionTableLabels[1] },
			            { "title": portfolioActionTableLabels[2] }
					 ]
			    } );
		    } else {
		    	$('#portfolioActionsTable').html("No stocks in portfolio. Edit portfolio <a href='portfolioedit.jsp'>here</a>.");
		    }
		 });
      }
  	</script>
  	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		  		<h2>Portfolio Status <span id="portfolioTitleId"></span></h2>
		  </div>
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		  <div id="portfolioMessage"></div>
		  <div id="portfolioStatusChart" style="height: 300px; width: 100%;">	</div>
		  </div>
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		  		<h2>Portfolio Actions</h2>
		  </div>
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="row">
		<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		<div class="col-xs-10 col-sm-10 col-md-8 col-lg-6" id="portfolioActionsTable"></div>
		<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
	<div class="divider"></div>

</body>
</html>




