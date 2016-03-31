package com.lotut.pms.domain;

public class SharePatent {
	private User shareBy;
	private User shareTo;
	private Patent patent;

	public User getShareBy() {
		return shareBy;
	}

	public void setShareBy(User shareBy) {
		this.shareBy = shareBy;
	}

	public User getShareTo() {
		return shareTo;
	}

	public void setShareTo(User shareTo) {
		this.shareTo = shareTo;
	}

	public Patent getPatent() {
		return patent;
	}

	public void setPatent(Patent patent) {
		this.patent = patent;
	}
}
