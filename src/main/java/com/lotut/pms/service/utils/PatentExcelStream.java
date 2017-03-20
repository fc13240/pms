package com.lotut.pms.service.utils;

import java.io.InputStream;

public class PatentExcelStream {
	private final InputStream is;
	private final long length;
	
	PatentExcelStream(InputStream is, long length) {
		this.is = is;
		this.length = length;
	}
	
	public InputStream getInputStream() {
		return is;
	}
	
	public long getLength() {
		return length;
	}

}
