package com.ource.sns.mypage.service;

public class MypageVO {
	private String userName;
	private String profileImg;
	private String backgroundImg;
	private String memId;
	private String targetMemId;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBackgroundImg() {
		return backgroundImg;
	}
	public void setBackgroundImg(String backgroundImg) {
		this.backgroundImg = backgroundImg;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getTargetMemId() {
		return targetMemId;
	}
	public void setTargetMemId(String targetMemId) {
		this.targetMemId = targetMemId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

}
