package com.myorg.javacourse.model;

/**
 *  This class defines the data structure of a portfolio
 */
public class Portfolio { 
	public String title;
	public static final int MAX_PORTFOLIO_SIZE = 5;
	Stock[] stocks;
	private int portfolioSize;
		
/**
 * crates an instance of a portfolio
 */
	public Portfolio(){ 
		stocks = new Stock[MAX_PORTFOLIO_SIZE];
		portfolioSize = 0;
		
	}
	/*
	 *  Creates a copy of a given instance of the the class 'Portfolio'
	 */
	public Portfolio(Portfolio portfolio){ 
		this();
		this.title = portfolio.title;
		for (int i=0 ; i < portfolio.portfolioSize; i++)
		{
			this.addStock(new Stock(portfolio.stocks[i]));
		}
		
	}
	
	/*
	 * Removes stock from the portfolio
	 */
	public void removeStock(int index) { 
		if (index >= portfolioSize || index < 0) {
			//Index does not exist
			return;
		}
		
		for (int i = index; i < portfolioSize - 1; i++) {
			stocks[i] = stocks[i+i];
		}
		
		stocks[portfolioSize - 1] = null;
		portfolioSize--;
	}
	
	/*
	 * Adds stock to the portfolio
	 */
	public void addStock(Stock stock) { 
		stocks[portfolioSize] = stock;
		portfolioSize++;
	}
	
	/*
	 * Returns the last stock in the portfolio
	 */
	public Stock getLastStock() { 
		return stocks[portfolioSize-1];
	}
	
	public Stock[] getStocks() { 
		return stocks;
	}
	/*
	 * Returns an HTML representation of a current portfolio
	 */
	public String getHtmlString() { 
		String result = "";
		result += "<h1>" + this.title + "</h1>";
		for (int i = 0; i < portfolioSize; i++) {
			result += stocks[i].getHtmlDescription() + "<br>";
		}
		return result;
	}
}
