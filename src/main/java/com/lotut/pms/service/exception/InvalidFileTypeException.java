package com.lotut.pms.service.exception;

public class InvalidFileTypeException extends RuntimeException {
	private static final long serialVersionUID = -8511730537105437932L;

	public InvalidFileTypeException() {
		super();
	}
	
	public InvalidFileTypeException(String message) {
		super(message);
	}
}
