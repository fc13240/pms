package com.lotut.pms.service.exception;

public class DateFormatException extends RuntimeException {
	private static final long serialVersionUID = 614734383729904742L;

	public DateFormatException() {
		super();
	}
	
	public DateFormatException(String message) {
		super(message);
	}
}
