package com.myorg.javacourse.model;

import com.myorg.javacourse.Stock;

public class Portfolio {
	public String title;
	public static final int MAX_PORTFOLIO_SIZE = 5;
	Stock[] stocks;
	private int portfolioSize;
	
	public Portfolio(){
		stocks = new Stock[MAX_PORTFOLIO_SIZE];
		portfolioSize = 0;
		
	}
	
	public void addStock(Stock stock) {
		stocks[portfolioSize] = stock;
		portfolioSize++;
	}
	
	public Stock[] getStocks() {
		return stocks;
	}
	public String getHtmlString() {
		String result = "";
		result += "<h1>" + this.title + "</h1>";
		for (int i = 0; i < portfolioSize; i++) {
			result += stocks[i].getHtmlDescription() + "<br>";
		}
		return result;
	}
}
