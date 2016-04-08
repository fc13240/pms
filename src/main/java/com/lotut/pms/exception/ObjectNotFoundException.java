package com.lotut.pms.exception;

public class ObjectNotFoundException extends ApplicationException {
	private static final long serialVersionUID = 4526360813263596287L;

	public ObjectNotFoundException() {
		super();
	}

	public ObjectNotFoundException(String message) {
		super(message);
	}
}
