package com.example.libs;

import java.sql.SQLException;

public class SelectController {
	public int loginMember(String email, String passwd) {
		int flag = -1;
		try {
			flag = MemberDAO.loginMember(email, passwd);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return flag;
	}
	
	
	public MemberVO selectMember(String email) {
		MemberVO member = null;
		try {
			member = MemberDAO.selectMember(email);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return member;
	}

}
