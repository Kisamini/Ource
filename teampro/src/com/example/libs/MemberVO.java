package com.example.libs;

public class MemberVO {

	private String email, passwd;
	
	public MemberVO() {} //for java bean
	
	public MemberVO(String email, String passwd) {
		this.email = email;
		this.passwd = passwd;
	}  //for 필수용
	
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
