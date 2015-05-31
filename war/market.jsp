	<%@include file="includes/header.jsp" %>
	<script>  setMenuActiveItem('menustocklist'); </script>

    <script type="text/javascript">
    
    var ids = [];
    $("input.checkbox:checked").each(function() {
        ids.push($(this).val());
    });

    window.onload = function () {
      
		var stockDataLabels = ["Add to portfolio","Company","Symbol"];
		var urlStockSymbol = '${param.stocksymbol}';
		var stockFilter = '${param.filter}';
		var getStockDataAPI = "/market";
		  
		  $.getJSON( getStockDataAPI, {
		    symbol: urlStockSymbol
		  })
		    .done(function( stockData ) {
		        
		        var arr = $.map(stockData, function(el) { return el; });

		        stockDataTable = [];
		        
				for (var i=0; i<arr.length; i++) {
					
					var stocksTableLine = [];
					
					var addStockButton = '<form action="portfolio/edit" id="addStockForm" method="POST">'
						+'<input type="hidden" name="operation" value="add">' 
						+'<input type="hidden" name="symbol" value="'+arr[i].symbol+'">' 
						+'<input type="submit" value="Add to portfolio" id="addStockButtonId" />' 
						+'</form>';					
					stocksTableLine.push(addStockButton);
					stocksTableLine.push(arr[i].company);
					stocksTableLine.push('<a href=\"/stock.jsp?stocksymbol='+arr[i].symbol+'\">'+arr[i].symbol+'</a>');
					
					stockDataTable.push(stocksTableLine);	
				}
				
			    ////////////////////////////////////////////////////////////////
			    // TABLE  
			    ////////////////////////////////////////////////////////////////

			    $('#stockDataTable').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="stockDataTableContent"></table>' );
			 
			    var tableData = {
				        "data": stockDataTable,
				        "columns": [ {"title": stockDataLabels[0]} , {"title": stockDataLabels[1]} , {"title": stockDataLabels[2]}]
				    };
			    
			    var table = $('#stockDataTableContent').DataTable(tableData);   
			    table.search(stockFilter).draw();
			    
		 });
      }
  	</script>
  	
	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6"><h2>Stocks list</h2></div> 
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>

	<div class="row">
		  <div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
		  <div class="col-xs-10 col-sm-10 col-md-8 col-lg-6" id="stockDataTable">
		</div>
		<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	</div>
	
</body>
</html>




