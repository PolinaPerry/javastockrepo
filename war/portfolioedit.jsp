
<%@include file="includes/header.jsp"%>
<script>  setMenuActiveItem('menueditportfolio'); </script>

<script type="text/javascript">

    
    window.onload = function () {

   		var stockDataLabels = ["Symbol","Algo Rec.","Ask","Bid", "Quantity", "Total(bid)", "Action"];
		var getStockDataAPI = "/portfolio/edit";
		
	  	$.getJSON( getStockDataAPI, function(jsonData) {
			//console.log(jsonData); 
			
			var errorMessageIn = '${param.error}';
			if (errorMessageIn!='') {
				$('#errormessagetextid').html(errorMessageIn);
				$("#errormessagediv").removeClass('hide');
			}
			
			var portfolioTitle = jsonData.title;
			if (portfolioTitle!='' && portfolioTitle!=undefined) {
				portfolioTitle = " ("+portfolioTitle+")";
			}
			$('#portfolioTitleId').html(portfolioTitle);

			var portfolioBalance = jsonData.balance.formatCurrency(2);
			$('#portfolioBalanceId').html(portfolioBalance);
				
	  		var stockStatusListArray = $.map(jsonData.stockStatusList, function(el) { return el; });
			var isPortfolioStocksExists = stockStatusListArray.length > 0;

			//console.log("0:"+stockStatusListArray[0]);
			//console.log("Length"+stockStatusListArray.length);

			if (isPortfolioStocksExists) {
				stockDataTable = [];
		        
		        //mock stock size
		        var PORTFOLIO_SIZE = stockStatusListArray.length;
				try {
					for (var i=0; i<PORTFOLIO_SIZE; i++) {
					//for (var i=0; i<stockStatusListArray.length; i++) {
						
						var stocksTableLine = [];
	
						var stockTotal = parseFloat(stockStatusListArray[i].bid) * parseFloat(stockStatusListArray[i].stockQuantity);
						stockTotal = stockTotal.formatCurrency(2);
						var symbol = stockStatusListArray[i].symbol;
						stocksTableLine.push('<a href=\"/stock.jsp?symbol='+symbol+'\">'+symbol+'</a>');
						stocksTableLine.push(stockStatusListArray[i].recommendation);
						stocksTableLine.push(stockStatusListArray[i].ask.formatCurrency(2));
						stocksTableLine.push(stockStatusListArray[i].bid.formatCurrency(2));
						stocksTableLine.push(stockStatusListArray[i].stockQuantity.format(0));
						stocksTableLine.push(stockTotal);
						stocksTableLine.push(
								'<form action="portfolio/edit" method="post"><input type="text" name="quantityforaction" placeholder=" stocks number">'
								+'<input type="hidden" name="symbol" value="'+symbol+'">'
								+'<button type="submit" name="operation" value="BUY">Buy</button>'
								+'<button type="submit" name="operation" value="SELL">Sell</button>'
								+'<button type="submit" name="operation" value="REMOVE">Remove</button></form>');
						
						stockDataTable.push(stocksTableLine);
					}
				} catch(e) {
					console.log("Exception in portfolioedit.jsp: "+e)
				}
				
			    ////////////////////////////////////////////////////////////////
			    // TABLE  
			    ////////////////////////////////////////////////////////////////

			    $('#stockDataTable').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="stockDataTableContent"></table>' );
			 
			    $('#stockDataTableContent').dataTable( {
			        "data": stockDataTable,
			        "columns": [
			            { "title": stockDataLabels[0] }, { "title": stockDataLabels[1] }, { "title": stockDataLabels[2] },
			            { "title": stockDataLabels[3] }, { "title": stockDataLabels[4] }, { "title": stockDataLabels[5] },
			            { "title": stockDataLabels[6] }
					 ]
			    } );   
			} else {
		    	$('#stockDataTable').html("No stocks in portfolio.");
			}
		 });
      }
  	</script>

<div class="row">
	<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	<div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
		<h2>
			Edit portfolio <span id="portfolioTitleId"></span>
		</h2>
	</div>
	<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
</div>

<div class="row">
	<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
	<div class="col-xs-10 col-sm-10 col-md-8 col-lg-6">
	
		<div class="alert alert-danger hide" id="errormessagediv" role="alert">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only" >Error: </span> <span id="errormessagetextid">jjj</span>
		</div>
	
		<p>
		<h3>Set portfolio title</h3>
		<form action="portfolio/edit" method="POST">
			<input type="text" name="title" placeholder=" New portfolio title">
			<input type="submit" value="Rename" />
		</form>
		</p>
		<hr>
		<p>
		<h3>Set portfolio balance</h3>
		Current balance is: <span id="portfolioBalanceId"></span>
		<form action="portfolio/edit" method="POST">
			<input type="text" name="balance" placeholder=" Add to balance">
			<input type="submit" value="Update balance" />
		</form>
		</p>
		<hr>
		<p>
		<h3>Add stock</h3>
		<form action="portfolio/edit" id="addStockForm" method="POST">
			<input type="text" name="symbol" placeholder=" New symbol"> 
			<input type="hidden" name="operation" value="add"> 
			<input type="submit" value="Add to portfolio" id="addStockButtonId" /> 
			<br>Stocks list is <a href="market.jsp">here</a>. (e.g.: aby, wrld, aal, zion, znga)
		</form>
		</p>
		<hr>
		<div class="col-xs-10 col-sm-10 col-md-8 col-lg-6" id="stockDataTable"></div>
	</div>
	<div class="col-xs-1 col-sm-1 col-md-2 col-lg-3"></div>
</div>

</body>
</html>
