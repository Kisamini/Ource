package com.spring.ource.login.web;

import java.math.BigDecimal;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ource.login.service.LoginService;
import com.spring.ource.login.service.MemberVO;

@Controller
public class LoginController {
	
	@Resource
	private LoginService loginService;

	//로그인 첫화면
	@RequestMapping("login.do")
	public String login() {
		return "login/login";
	}
	
	//로그인 성공했을 때 모달 띄어지는 화면
	@RequestMapping("loginSuccess.do")
	public String loginSuccess(MemberVO memberVO, ModelMap model) {
		int flag = loginService.userLogin(memberVO);
		if(flag == 1) {
			memberVO = loginService.selectUser(memberVO);
			model.addAttribute("memberVO", memberVO);
		}
		return "login/loginSuccess";
		
	}
	
	//ajax방식. 아이디찾는 첫화면. 미완성
	@RequestMapping("search.do")
	public String search() {
		return "login/search";
	}
	
	//ajax방식. 아이디찾기 성공했을 때 화면. 미완성
	@RequestMapping("searchId.do")
	public void searchSuccess(MemberVO memberVO) {
		int flag = loginService.userSearch(memberVO);
		if(flag == 1) {
			memberVO = loginService.selectUser(memberVO);
		}
		
	}
	
	//아이디찾는 첫화면
	@RequestMapping("idSearch.do")
	public String idSearch() {
		return "login/idSearch";
	}
	
	//아이디찾는 첫화면2
	@RequestMapping("idSearch2.do")
	public String idSearch2() {
		return "login/idSearch2";
	}
	
	//아이디찾기 성공시 모달 띄어지는 화면
	@RequestMapping("idSearchSuccess.do")
	public String idSearchSuccess(MemberVO memberVO, ModelMap model) {
		int flag = loginService.searchId(memberVO);
		if(flag == 1) {
			memberVO = loginService.selectUser2(memberVO);
			model.addAttribute("memberVO", memberVO);
		}
		return "login/idSearchSuccess";
		
	}
	
	//아이디확인 성공(비번 찾을 때)
	@RequestMapping("idCheckOk.do")
	public String idCheckOk(MemberVO memberVO, ModelMap model) {
		memberVO = loginService.selectUser(memberVO);
		model.addAttribute("memberVO", memberVO);
		return "login/idCheckOk";
}
}
