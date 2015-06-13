package com.myorg.javacourse.exception;

public class StockAlredyExistsExceotion extends Exception {
	
	@Override
	public String getMessage() {
		return "stock already exists in portfolio";
	}
}
