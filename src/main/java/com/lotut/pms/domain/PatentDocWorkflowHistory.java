package com.lotut.pms.domain;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.lotut.pms.constants.PatentDocWorkflowAction;

public class PatentDocWorkflowHistory {
	private long historyId;
	private long patentDocId;
	private String userName;
	private User owner;
	private PatentDocWorkflowAction patentDocWorkflowAction;
	@DateTimeFormat(iso = ISO.DATE_TIME, pattern = "yyyy-MM-dd")
	private Timestamp actionTime;
	private List<User> shareUsers;

	public List<User> getShareUsers() {
		return shareUsers;
	}
	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}
	public long getPatentDocId() {
		return patentDocId;
	}
	public void setPatentDocId(long patentDocId) {
		this.patentDocId = patentDocId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	public PatentDocWorkflowAction getAction() {
		return patentDocWorkflowAction;
	}
	public void setAction(PatentDocWorkflowAction patentDocWorkflowAction) {
		this.patentDocWorkflowAction = patentDocWorkflowAction;
	}
	public Timestamp getActionTime() {
		return actionTime;
	}
	public void setActionTime(Timestamp actionTime) {
		this.actionTime = actionTime;
	}
	public long getHistoryId() {
		return historyId;
	}
	public void setHistoryId(long historyId) {
		this.historyId = historyId;
	}
	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}
	public String getShareUsersAsString() {
		if (this.shareUsers != null) {
			return String.join(";", this.shareUsers.stream().map(User::getUsername).collect(Collectors.toList()));
		}
		
		return "";
	}
	
	
	
}
