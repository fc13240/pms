package com.lotut.pms.domain;

public class ShareInventor {
	private User shareBy;
	private User shareTo;
	private CommonInventor inventor;
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
	public CommonInventor getInventor() {
		return inventor;
	}
	public void setInventor(CommonInventor inventor) {
		this.inventor = inventor;
	}
	
}
