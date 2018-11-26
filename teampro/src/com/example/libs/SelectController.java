package com.example.libs;

import java.sql.SQLException;

public class SelectController {
	public int loginUser(String userid, String passwd) {
		int flag = -1;
		try {
			flag = MemberDAO.loginUser(userid, passwd);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return flag;
	}
	
	
	public MemberVO selectUser(String userid) {
		MemberVO member = null;
		try {
			member = MemberDAO.selectUser(userid);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return member;
	}

}
