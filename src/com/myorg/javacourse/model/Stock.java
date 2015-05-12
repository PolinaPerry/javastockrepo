package com.myorg.javacourse.model;

import java.util.Date;

import com.myorg.javacourse.model.Portfolio.ALGO_RECOMMENDATION;

/*
 * This class defines the data structure of a stock
 */
public class Stock { 
	private String symbol;
	private float ask;
	private float bid;
	private Date date;
	private ALGO_RECOMMENDATION recommendation;
	private int stockQuantity;
	
	
	public Stock(String symbol, float ask, float bid, Date date){
        this.symbol = symbol;
        this.ask = ask;
        this.bid = bid;
        this.date = date;
    }
	
	public Stock(Stock stock) {
		this(stock.getSymbol(),(stock.getAsk()), (stock.getBid()),(stock.getDate()));
	}
	
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public float getAsk() {
		return ask;
	}
	public void setAsk(float ask) {
		this.ask = ask;
	}
	public float getBid() {
		return bid;
	}
	public void setBid(float bid) {
		this.bid = bid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
	public ALGO_RECOMMENDATION getRecommendation() {
		return recommendation;
	}

	public void setRecommendation(ALGO_RECOMMENDATION recommendation) {
		this.recommendation = recommendation;
	}

	public int getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	/*
	 * Returns an HTML representation of a current stock
	 */
	public String getHtmlDescription(){
		return  "<b>Symbol</b> = " + getSymbol() + ", <b>Ask</b> = " + getAsk() + ", <b>Bid</b> = " + getBid() + ", <b>Amount</b> = " + getStockQuantity() + 
	            ", <b>Date</b> = " + getDate().getMonth() + "/" + getDate().getDate() + "/" +(1900 + getDate().getYear())+"<br>";
	}

	
	
	
	
	
}
