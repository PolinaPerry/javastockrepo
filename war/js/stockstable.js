    
    var ids = [];
    $("input.checkbox:checked").each(function() {
        ids.push($(this).val());
    });

    window.onload = function () {
      
		var stockDataLabels = ["Portfolio","Company","Symbol"];
		var urlStockSymbol = '${param.stocksymbol}';
		var stockFilter = "${param.filter}";
		var getStockDataAPI = "/stock/symbol";
		  
		  $.getJSON( getStockDataAPI, {
		    symbol: urlStockSymbol
		  })
		    .done(function( stockData ) {
		        
		        var arr = $.map(stockData, function(el) { return el; });

		        stockDataTable = [];
		        
				for (var i=0; i<arr.length; i++) {
					
					var stocksTableLine = [];
					var isSelected=arr[i].isSelected;
					var checkBoxChecked = "";
					if (isSelected) {
						checkBoxChecked = " checked ";
					}
					stocksTableLine.push('<input type="checkbox" id="someCheckbox" '+checkBoxChecked+' name="someCheckbox" />');
					stocksTableLine.push(arr[i].company);
					stocksTableLine.push('<a href=\"/stock.jsp?stocksymbol='+arr[i].id+'\">'+arr[i].id+'</a>');
					
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
