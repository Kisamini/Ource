package com.spring.ource.login.service;

public class MemberVO {

	private String userid, passwd, name, answer, birth;
	
	public MemberVO() {} //for java bean
	
	public MemberVO(String userid, String passwd, String birth, String name, String answer) {
		this.userid = userid;
		this.passwd = passwd;
		this.birth = birth;
		this.name = name;
		this.answer = answer;
	}  //for 필수용
	
	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", answer=" + answer
				+ ", birth=" + birth + "]";
	}

	
	
	
}
