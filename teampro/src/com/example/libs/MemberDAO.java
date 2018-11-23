package com.example.libs;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {  
	//[계정찾기] -1:no account,  0:not equals password,  1:all success 
	public static int loginMember(String userid, String passwd)throws SQLException{
		PreparedStatement pstmt = null;
		
		if(ConnDatabase.conn == null){
			ConnDatabase.doConn();
			System.out.println("we got the connection");
		}
		
		/*Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_login(?, ?)}";
		CallableStatement cstmt = conn.prepareCall(sql);*/
		
		CallableStatement stmt = ConnDatabase.conn.prepareCall("call member_login(?, ?)");
		
		stmt.setString(1, userid);
		stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		stmt.executeUpdate();
		ResultSet rs = (ResultSet)stmt.getObject(2);
		int row = -1;
		if(!rs.next()) row = -1; //계정없음
		else {//일단 계정은 있다.
			if(passwd.trim().equals(rs.getString("passwd").trim())) {
				row = 1; //모두 일치
			}else row = 0; //비밀번호 불일치
		}
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		//DBClose.close(conn);
		return row;
	}
	
	
	
	//계정에 맞는 회원 이메일 불러오기 - 로그인 성공
	public static MemberVO selectMember(String email) throws SQLException{
        PreparedStatement pstmt = null;
		
		if(ConnDatabase.conn == null){
			ConnDatabase.doConn();
			System.out.println("we got the connection");
		}
		/*Connection conn = DBConnection.getConnection("member");
		String sql = "{ call member_select1(?, ?)}";
		CallableStatement cstmt = conn.prepareCall(sql);*/
		
		CallableStatement stmt = ConnDatabase.conn.prepareCall("call member_select(?, ?)");
		
		stmt.setString(1, email);
		stmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		stmt.executeUpdate();
		ResultSet rs = (ResultSet)stmt.getObject(2);
		rs.next();
		MemberVO member = new MemberVO( rs.getString("email"), rs.getString("passwd"));
				
	    
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		//DBClose.close(conn);
		return member;
	}
	
	
}
