package com.myorg.javacourse.exception;

public class BalanceException extends Exception {
	
	@Override
	public String getMessage() {
		return "not enough money";
	}
}
