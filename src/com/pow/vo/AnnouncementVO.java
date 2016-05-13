package com.pow.vo;

import java.util.Date;
import java.util.List;

public class AnnouncementVO {

	private String id;
	private String title;
	private String logoPath;
 	private String companyName;
 	private int cooperationType;
 	private Date signUpStartTime;
 	private Date signUpEndTime;
 	private Date activityStartTime;
 	private Date activityEndTime;
 	private String activityLocation;
 	private int needPersonNum;
 	private int needPersonSex;
 	private String content;
 	private String activityBackground;
 	private int top;
 	private int hide;
 	private int status;
 	private int signUpNum;
 	private Date updateTime;
 	private Date createTime;
 	
 	private List<WorksVO> workses;
 	private List<RoleVO> roles;
 	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLogoPath() {
		return logoPath;
	}
	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getCooperationType() {
		return cooperationType;
	}
	public void setCooperationType(int cooperationType) {
		this.cooperationType = cooperationType;
	}
	public String getActivityLocation() {
		return activityLocation;
	}
	public void setActivityLocation(String activityLocation) {
		this.activityLocation = activityLocation;
	}
	public int getNeedPersonNum() {
		return needPersonNum;
	}
	public void setNeedPersonNum(int needPersonNum) {
		this.needPersonNum = needPersonNum;
	}
	public int getNeedPersonSex() {
		return needPersonSex;
	}
	public void setNeedPersonSex(int needPersonSex) {
		this.needPersonSex = needPersonSex;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getActivityBackground() {
		return activityBackground;
	}
	public void setActivityBackground(String activityBackground) {
		this.activityBackground = activityBackground;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
	}
	public int getHide() {
		return hide;
	}
	public void setHide(int hide) {
		this.hide = hide;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<WorksVO> getWorkses() {
		return workses;
	}
	public void setWorkses(List<WorksVO> workses) {
		this.workses = workses;
	}
	public List<RoleVO> getRoles() {
		return roles;
	}
	public void setRoles(List<RoleVO> roles) {
		this.roles = roles;
	}
	public Date getSignUpStartTime() {
		return signUpStartTime;
	}
	public void setSignUpStartTime(Date signUpStartTime) {
		this.signUpStartTime = signUpStartTime;
	}
	public Date getSignUpEndTime() {
		return signUpEndTime;
	}
	public void setSignUpEndTime(Date signUpEndTime) {
		this.signUpEndTime = signUpEndTime;
	}
	public Date getActivityStartTime() {
		return activityStartTime;
	}
	public void setActivityStartTime(Date activityStartTime) {
		this.activityStartTime = activityStartTime;
	}
	public Date getActivityEndTime() {
		return activityEndTime;
	}
	public void setActivityEndTime(Date activityEndTime) {
		this.activityEndTime = activityEndTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getSignUpNum() {
		return signUpNum;
	}
	public void setSignUpNum(int signUpNum) {
		this.signUpNum = signUpNum;
	}
 	
}
