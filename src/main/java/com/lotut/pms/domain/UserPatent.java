package com.lotut.pms.domain;

public class UserPatent {
	private long id;
	private int useId;
	private long patentId;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getUseId() {
		return useId;
	}

	public void setUseId(int useId) {
		this.useId = useId;
	}

	public long getPatentId() {
		return patentId;
	}

	public void setPatentId(long patentId) {
		this.patentId = patentId;
	}
}
