package com.spring.ource.login.service;

public interface LoginService {

	int userLogin(MemberVO memberVO);

	MemberVO selectUser(MemberVO memberVO);
	
	MemberVO selectUser2(MemberVO memberVO);

	int userSearch(MemberVO memberVO);
	
	int searchId(MemberVO memberVO);
	

}
