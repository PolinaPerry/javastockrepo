package com.myorg.javacourse.exception;

public class PortfolioFullException extends Exception {
	
	@Override
	public String getMessage() {
		return "no more room in portfolio";
	}
}
