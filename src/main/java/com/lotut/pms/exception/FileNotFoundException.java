package com.lotut.pms.exception;

public class FileNotFoundException extends ApplicationException {
	private static final long serialVersionUID = 6006769030995383874L;

	public FileNotFoundException() {
		super();
	}

	public FileNotFoundException(String message) {
		super(message);
	}
}
