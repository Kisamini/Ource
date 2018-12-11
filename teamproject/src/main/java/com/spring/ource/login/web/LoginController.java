package com.spring.ource.login.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ource.comm.JSONUtil;
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
	public void loginSuccess(MemberVO memberVO, HttpServletResponse response) throws IOException {
		memberVO = loginService.userLogin(memberVO);
		Map<String, Object> map = new HashMap<>();
		map.put("memberVO", memberVO);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONUtil.MapToJson(map));
}
	
	
	//아이디찾는 첫화면
	@RequestMapping("idSearch.do")
	public String idSearch() {
		return "login/idSearch";
	}
	
	
	//아이디찾기 성공
		@RequestMapping("idsearchok.do")
	public void idsearchok(MemberVO memberVO, HttpServletResponse response) throws IOException {
		memberVO = loginService.searchId(memberVO);
		Map<String, Object> map = new HashMap<>();
		map.put("memberVO", memberVO);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONUtil.MapToJson(map));
}
	
	
	//아이디확인 성공(비번 찾을 때)
	@RequestMapping("idCheckOk.do")
	public void idCheckOk(MemberVO memberVO, HttpServletResponse response) throws IOException {
		memberVO = loginService.selectUser(memberVO);
		Map<String, Object> map = new HashMap<>();
		map.put("memberVO", memberVO);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONUtil.MapToJson(map));
}
	//아이디 일치하면 힌트불러오기
	@RequestMapping("pwCheckOk.do")
	public void pwCheckOk(MemberVO memberVO, HttpServletResponse response) throws IOException {
		memberVO = loginService.searchPw(memberVO);
		Map<String, Object> map = new HashMap<>();
		map.put("memberVO", memberVO);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JSONUtil.MapToJson(map));
}
	
	
}
