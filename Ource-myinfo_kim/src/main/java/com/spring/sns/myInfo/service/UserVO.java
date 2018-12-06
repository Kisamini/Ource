package com.spring.sns.myInfo.service;

import java.util.List;
import java.util.Map;

public class UserVO {
	private int userNumber, userBirth;
	private String userId, userPw, userName, userGender;

	private List<Map<String, Object>> userInfoDetail;
	
	public UserVO() {}
	
	public UserVO(int userNumber, int userBirth, String userId, String userPw, String userName, String userGender) {
      super();
      this.userNumber = userNumber;
      this.userBirth = userBirth;
      this.userId = userId;
      this.userPw = userPw;
      this.userName = userName;
      this.userGender = userGender;
   }

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public int getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(int userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public List<Map<String, Object>> getUserInfoDetail() {
		return userInfoDetail;
	}

	public void setUserInfoDetail(List<Map<String, Object>> userInfoDetail) {
		this.userInfoDetail = userInfoDetail;
	}
	
}
