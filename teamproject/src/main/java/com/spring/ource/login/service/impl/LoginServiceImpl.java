package com.spring.ource.login.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.ource.login.service.LoginService;
import com.spring.ource.login.service.MemberVO;

//해당 서비스에 맞는 데이터를 불러오기 위해 DAO 호출
@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper;
	
	//로그인
	@Override
	public MemberVO userLogin(MemberVO memberVO) {
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
	public MemberVO searchId(MemberVO memberVO) {
		return loginMapper.searchId(memberVO);
	}

	@Override
	public MemberVO selectUser2(MemberVO memberVO) {
		return loginMapper.selectUser2(memberVO);
	}
	
	//비밀번호 찾기
	@Override
	public MemberVO searchPw(MemberVO memberVO) {
		return loginMapper.searchPw(memberVO);
	}
	
}
