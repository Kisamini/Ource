package com.spring.ource.login.service;

public interface LoginService {

	MemberVO userLogin(MemberVO memberVO);

	MemberVO selectUser(MemberVO memberVO);
	
	MemberVO selectUser2(MemberVO memberVO);

	int userSearch(MemberVO memberVO);
	
	MemberVO searchId(MemberVO memberVO);

	MemberVO searchPw(MemberVO memberVO);

	

}
