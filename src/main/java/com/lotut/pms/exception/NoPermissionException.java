package com.lotut.pms.exception;

public class NoPermissionException extends ApplicationException {
	private static final long serialVersionUID = 2613412645662573003L;

	public NoPermissionException() {
		super();
	}

	public NoPermissionException(String message) {
		super(message);
	}
}
