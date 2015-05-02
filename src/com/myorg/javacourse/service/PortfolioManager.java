package com.myorg.javacourse.service;

import java.util.Date;

import com.myorg.javacourse.Stock;
import com.myorg.javacourse.model.Portfolio;

public class PortfolioManager {
	public Portfolio getPortfolio() {
		Portfolio portfolio = new Portfolio();
		portfolio.title = "Polina's portfolio";
		
		Date date1 = new Date();
		Date date2 = new Date();
		Date date3 = new Date();

		Stock stock1 = new Stock ("PIH",(float)13.1,(float)12.4,date1);
		Stock stock2 = new Stock ("AAL",(float)5.78,(float)5.5,date2);
		Stock stock3 = new Stock ("CAAS",(float)32.2,(float)31.5,date3);
		
		portfolio.addStock(stock1);
		portfolio.addStock(stock2);
		portfolio.addStock(stock3);
		
		return portfolio;
	}

}
