package com.spring.ource.login.service.impl;

import org.springframework.stereotype.Repository;

import com.spring.ource.login.service.MemberVO;

@Repository
public interface LoginMapper {

	int userLogin(MemberVO memberVO);

	MemberVO selectUser(MemberVO memberVO);
	
	MemberVO selectUser2(MemberVO memberVO);

	int userSearch(MemberVO memberVO);
	
	int searchId(MemberVO memberVO);

}
