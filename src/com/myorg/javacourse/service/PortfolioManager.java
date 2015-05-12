package com.myorg.javacourse.service;

import java.util.Date;

import com.myorg.javacourse.model.Portfolio;
import com.myorg.javacourse.model.Stock;
/*
 * This class is a service that manages portfolios
 */
public class PortfolioManager { 
	/*
	 * This method creates a new portfolio, sets it's data and returns it
	 */
	public Portfolio getPortfolio() {
		Portfolio portfolio = new Portfolio();
		portfolio.title = "Ex 7 portfolio";
		portfolio.setBalance(10000);
		
		Date date = new Date();

		
		Stock stock1 = new Stock ("PIH",(float)10.0,(float)8.5,date);
		Stock stock2 = new Stock ("AAL",(float)30.0,(float)25.5,date);
		Stock stock3 = new Stock ("CAAS",(float)20.0,(float)15.5,date);
		
		portfolio.buyStock(stock1, 20);
		portfolio.buyStock(stock2, 30);
		portfolio.buyStock(stock3, 40);
		
		portfolio.sellStock("AAL", -1);
		portfolio.removeStock(stock3);
		
		return portfolio;
	}

}
