package com.spring.ource.login.service.impl;

import org.springframework.stereotype.Repository;

import com.spring.ource.login.service.MemberVO;

@Repository
public interface LoginMapper {

	MemberVO userLogin(MemberVO memberVO);

	MemberVO selectUser(MemberVO memberVO);
	
	MemberVO selectUser2(MemberVO memberVO);

	int userSearch(MemberVO memberVO);
	
	MemberVO searchId(MemberVO memberVO);

	MemberVO searchPw(MemberVO memberVO);
	
}
