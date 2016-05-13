

package com.pow.vo;

import java.util.Date;

public class SignUpVO {

	private String id;
	private String announcementId;
	private String coserId;
	private Date signUpTime;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnnouncementId() {
		return announcementId;
	}
	public void setAnnouncementId(String announcementId) {
		this.announcementId = announcementId;
	}
	public String getCoserId() {
		return coserId;
	}
	public void setCoserId(String coserId) {
		this.coserId = coserId;
	}
	public Date getSignUpTime() {
		return signUpTime;
	}
	public void setSignUpTime(Date signUpTime) {
		this.signUpTime = signUpTime;
	}
	
	
}

