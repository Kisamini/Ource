package com.example.libs;

public class MemberVO {

	private String userid, passwd;
	
	public MemberVO() {} //for java bean
	
	public MemberVO(String email, String passwd) {
		this.userid = userid;
		this.passwd = passwd;
	}  //for 필수용
	
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
	
}
