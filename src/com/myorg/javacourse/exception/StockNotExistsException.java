package com.myorg.javacourse.exception;

public class StockNotExistsException extends Exception {
	
	@Override
	public String getMessage() {
		return "stock not exists";
	}

}
