package com.spring.ource.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.ource.login.service.LoginService;
import com.spring.ource.login.service.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper;
	
	//로그인
	@Override
	public int userLogin(MemberVO memberVO) {
		return loginMapper.userLogin(memberVO);
	}
	
	//로그인 성공. 아이디찾기 성공.  아이디확인(비번 찾을때)
	@Override
	public MemberVO selectUser(MemberVO memberVO) {
		return loginMapper.selectUser(memberVO);
	}

	@Override
	public int userSearch(MemberVO memberVO) {
		return loginMapper.userSearch(memberVO);
	}
	
	//아아디찾기
	@Override
	public int searchId(MemberVO memberVO) {
		return loginMapper.searchId(memberVO);
	}

	@Override
	public MemberVO selectUser2(MemberVO memberVO) {
		return loginMapper.selectUser2(memberVO);
	}
	
}
