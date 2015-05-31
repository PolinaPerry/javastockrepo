
var CURRENCY_SYMBOL = "$";

function setMenuActiveItem(menuItem) {
	
	var menuItemsList = ["menuhome", "menustocklist","menueditportfolio", "menuabout","menuindex"];
	
	for (var i=0; i<menuItemsList.length; i++) {
		//console.log("->"+menuItem+"=?="+menuItemsList[i]+"<-");
		if (menuItem!=menuItemsList[i]) {
			$('#'+menuItem).removeClass('active');
			break;
		}
	}
	
	for (var i=0; i<menuItemsList.length; i++) {
		//console.log("->"+menuItem+"=?="+menuItemsList[i]+"<-");
		if (menuItem==menuItemsList[i]) {
			//console.log("fit");
			$('#'+menuItem).addClass('active');
			break;
		} 
	}	
}

/**
 * Number.prototype.format(n, x)
 * 
 * @param integer n: length of decimal
 * @param integer x: length of sections
 */
Number.prototype.format = function(n, x) {
    var re = '\\d(?=(\\d{' + (x || 3) + '})+' + (n > 0 ? '\\.' : '$') + ')';
    return this.toFixed(Math.max(0, ~~n)).replace(new RegExp(re, 'g'), '$&,');
};
//1234..format();           // "1,234"
//12345..format(2);         // "12,345.00"
//123456.7.format(3, 2);    // "12,34,56.700"
//123456.789.format(2, 4);  // "12,3456.79"

Number.prototype.formatCurrency = function(n, x) {
    return CURRENCY_SYMBOL+this.format(n,x);
}