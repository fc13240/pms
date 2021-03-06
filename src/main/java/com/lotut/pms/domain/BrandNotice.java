package com.lotut.pms.domain;

import java.sql.Date;
import java.util.List;

public class BrandNotice {
	private String noticeSequence;
	private String noticeId;
	private String dispatchSequence;
	private Integer timeLimt;
	private int remainDays;
	private Date dispatchDate;
	private BrandManagement brand;
	private String name;
	private String noticeCode;
	private String zipBid;
	private String dmhFlag;
	private String archiveNo;
	private String zipfileName;
	private NoticeProcessStatus processStatus;
	private User processUser;
	private BrandNoticeType noticeType;
	private NoticePaperApplyType paperApplyType;
	private Long noticeViewStatus;
	private int starTargetMonitorStatus;
	private BrandLegalStatus brandLegalStatus;
	private List<User> shareUsers;
	
	

	public BrandLegalStatus getBrandLegalStatus() {
		return brandLegalStatus;
	}

	public void setBrandLegalStatus(BrandLegalStatus brandLegalStatus) {
		this.brandLegalStatus = brandLegalStatus;
	}

	public List<User> getShareUsers() {
		return shareUsers;
	}

	public void setShareUsers(List<User> shareUsers) {
		this.shareUsers = shareUsers;
	}

	public int getStarTargetMonitorStatus() {
		return starTargetMonitorStatus;
	}

	public void setStarTargetMonitorStatus(int starTargetMonitorStatus) {
		this.starTargetMonitorStatus = starTargetMonitorStatus;
	}

	public Long getNoticeViewStatus() {
		return noticeViewStatus;
	}

	public void setNoticeViewStatus(Long noticeViewStatus) {
		this.noticeViewStatus = noticeViewStatus;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getDispatchSequence() {
		return dispatchSequence;
	}

	public void setDispatchSequence(String dispatchSequence) {
		this.dispatchSequence = dispatchSequence;
	}

	public int getRemainDays() {
		return remainDays;
	}

	public void setRemainDays(int remainDays) {
		this.remainDays = remainDays;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(String noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getZipBid() {
		return zipBid;
	}

	public void setZipBid(String zipBid) {
		this.zipBid = zipBid;
	}

	public String getDmhFlag() {
		return dmhFlag;
	}

	public void setDmhFlag(String dmhFlag) {
		this.dmhFlag = dmhFlag;
	}

	public String getArchiveNo() {
		return archiveNo;
	}

	public void setArchiveNo(String archiveNo) {
		this.archiveNo = archiveNo;
	}

	public String getZipfileName() {
		return zipfileName;
	}

	public void setZipfileName(String zipfileName) {
		this.zipfileName = zipfileName;
	}

	public NoticeProcessStatus getProcessStatus() {
		return processStatus;
	}

	public void setProcessStatus(NoticeProcessStatus processStatus) {
		this.processStatus = processStatus;
	}

	public User getProcessUser() {
		return processUser;
	}

	public void setProcessUser(User processUser) {
		this.processUser = processUser;
	}

	public BrandNoticeType getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(BrandNoticeType noticeType) {
		this.noticeType = noticeType;
	}

	public NoticePaperApplyType getPaperApplyType() {
		return paperApplyType;
	}

	public void setPaperApplyType(NoticePaperApplyType paperApplyType) {
		this.paperApplyType = paperApplyType;
	}

	public BrandManagement getBrand() {
		return brand;
	}

	public void setBrand(BrandManagement brand) {
		this.brand = brand;
	}

	public Date getDispatchDate() {
		return dispatchDate;
	}

	public void setDispatchDate(Date dispatchDate) {
		this.dispatchDate = dispatchDate;
	}

	public String getNoticeSequence() {
		return noticeSequence;
	}

	public void setNoticeSequence(String noticeSequence) {
		this.noticeSequence = noticeSequence;
	}

	public Integer getTimeLimt() {
		return timeLimt;
	}

	public void setTimeLimt(Integer timeLimt) {
		this.timeLimt = timeLimt;
	}
	
	public String getRemainDaysDescription(){
		String remainDaysDescription="";
		if(this.getRemainDays()== -1){
			remainDaysDescription="已超期";
		}else{
			remainDaysDescription="期限"+":"+this.getRemainDays()+"天";
		}
		return remainDaysDescription;
		
	}

}
