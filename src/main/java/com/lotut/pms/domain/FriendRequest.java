package com.lotut.pms.domain;

public class FriendRequest {
	private long id;
	private User fromUser;
	private User toUser;
	private FriendRequestProcessStatus processStatus;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	public FriendRequestProcessStatus getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(FriendRequestProcessStatus processStatus) {
		this.processStatus = processStatus;
	}
}
