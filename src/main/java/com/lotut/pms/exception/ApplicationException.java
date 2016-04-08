package com.lotut.pms.exception;

public class ApplicationException extends RuntimeException {
	private static final long serialVersionUID = 6459625783108598233L;

	public ApplicationException() {
		super();
	}

	public ApplicationException(String message, Throwable cause) {
		super(message, cause);
	}

	public ApplicationException(String message) {
		super(message);
	}

	public ApplicationException(Throwable cause) {
		super(cause);
	}
}
