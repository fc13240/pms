package com.lotut.pms.domain;

public class ShareAppPerson {
	private User shareBy;
	private User shareTo;
	private CommonAppPerson appPerson;
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
	public CommonAppPerson getAppPerson() {
		return appPerson;
	}
	public void setAppPerson(CommonAppPerson appPerson) {
		this.appPerson = appPerson;
	}
	
}
