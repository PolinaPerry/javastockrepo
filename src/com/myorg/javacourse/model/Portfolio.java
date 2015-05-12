package com.myorg.javacourse.model;

/**
 *  This class defines the data structure of a portfolio
 */
public class Portfolio { 
	public String title;
	private float balance;
	public static final int MAX_PORTFOLIO_SIZE = 5;
	Stock[] stocks;
	private int portfolioSize;
	
	public enum ALGO_RECOMMENDATION {
		BUY, SELL, REMOVE, HOLD
	}
		
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
	public boolean removeStock(Stock stock) { 
		boolean result = false;
		int stockIndex = getStockIndex(stock);
		if (stockIndex == -1) {
			System.out.println("stock does not exist!");
		}
		
		else {
			sellStock(stocks[stockIndex].getSymbol(),-1);
			stocks[stockIndex] = stocks[portfolioSize-1];
			stocks[portfolioSize-1] = null;
			portfolioSize--;
			result = true;
		}
		
		return result;
	}
	
	/*
	 * Adds stock to the portfolio
	 */
	public boolean addStock(Stock stock) { 
		boolean result = false;
		
		if (getStockIndex(stock) != -1) {
			System.out.println("stock already exists in portfolio");
		}
		
		else if(portfolioSize >= MAX_PORTFOLIO_SIZE) {
			System.out.println("no more room in portfolio");
		}
		else {
			stock.setStockQuantity(0);
			stocks[portfolioSize] = stock;
			portfolioSize++;
			result = true;
		}
		return result;
	}
	
	/*
	 * the method gets a stock an returns its index, -1 if it does not exist
	 */
	public int getStockIndex(Stock stock) {
		int result = -1;
		for (int i=0 ; i< portfolioSize; i++){
			if ( stocks[i].getSymbol().equals(stock.getSymbol())) {
				result = i;
				break;
			}
		}
		return result;
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
	 * update balance according to a given amount
	 */
	public void updateBalance(float amount) {
		if (amount > balance) {
			System.out.println("not enough money");
		}
		else {
			balance+= amount;
		}
	}
	
	/*
	 * sell stocks, -1 indicates all the amount
	 */
	public boolean sellStock(String symbol, int quantity) {
		boolean result =false;
		for (int i = 0; i < portfolioSize; i++){
			if ( stocks[i].getSymbol().equals(symbol)) {
				Stock stock = stocks[i];
				if (quantity == -1) {
					quantity = stock.getStockQuantity();
				}
				if (stock.getStockQuantity() >= quantity) {
					updateBalance(quantity*stock.getBid());
					stock.setStockQuantity(stock.getStockQuantity() - quantity);
					result = true;
				}
				else {
					System.out.println("Not enough stocks to sell");
				}
			}
		}
		
		return result;
	}
	
	/*
	 * buys stock at a given amount
	 * if quantity is -1, buy maximum possible 
	 */
	public boolean buyStock(Stock stock, int quantity) {
		boolean result = false;
		Stock stockRef;
		int stockIndex  = getStockIndex(stock);
		if (quantity == -1) {
			quantity = (int)(balance / stock.getAsk());
		}
		
		if (balance < quantity*stock.getAsk()) {
			System.out.println("Not enough money");
		}
		else {
			if (stockIndex == -1) {
				addStock(stock);
				stockIndex = getStockIndex(stock);
			}
			stockRef = stocks[stockIndex];
			updateBalance((-1)*(quantity * stock.getAsk()));
			stockRef.setStockQuantity(stockRef.getStockQuantity() + quantity);
			result = true;
		}

		return result;
		
	}
	/*
	 * get sum of all stocks value
	 */
	public float getStocksValue(){
		float result = 0;
		for (int i = 0 ; i < portfolioSize; i++) {
			Stock stock = stocks[i];
			result += stock.getBid() * stock.getStockQuantity();
		}
		return result;
	}
	
	public float getBalance() {
		return balance;
	}
	
	public void setBalance(float amount) {
		balance = amount;
	}
	/*
	 * get sum of all stocks and balance
	 */
	public float getPortfolioValue(){
		return getBalance() + getStocksValue();
	}
	/*
	 * Returns an HTML representation of a current portfolio
	 */
	public String getHtmlString() { 
		String result = "";
		result += "<h1>" + this.title + "</h1>";
		result += "<h2>Total portfolio value:" + getPortfolioValue() + ", Total stocks value:" + getStocksValue() + ", Balance:" + getBalance() + "</h2>";
		for (int i = 0; i < portfolioSize; i++) {
			result += stocks[i].getHtmlDescription() + "<br>";
		}
		return result;
	}
}
