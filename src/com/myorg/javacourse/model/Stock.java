package com.myorg.javacourse.model;

import java.util.Date;

/*
 * This class defines the data structure of a stock
 */
public class Stock { 
	private String symbol;
	private float ask;
	private float bid;
	private Date date;
	private int recommendation;
	private int stockQuantity;
	
	public static final int BUY= 0;
	public static final int SELL = 1;
	public static final int REMOVE = 2;
	public static final int HOLD = 3;
	
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
	/*
	 * Returns an HTML representation of a current stock
	 */
	public String getHtmlDescription(){
		return  "<b>Symbol</b> = " + getSymbol() + ", <b>Ask</b> = " + getAsk() + ", <b>Bid</b> = " + getBid() +
	            ", <b>Date</b> = " + getDate().getMonth() + "/" + getDate().getDate() + "/" +(1900 + getDate().getYear())+"<br>";
	}

	
	
	
	
	
}
