package com.ource.sns.mypage.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ource.sns.mypage.service.MypageService;
@Controller
public class TestController {
	@Resource
	private MypageService mypageService;
	
	@RequestMapping(value = "/test.do")
	public String mypageMain(ModelMap model,String id,HttpServletRequest req) {
		model.addAttribute("mypageProfile",mypageService.getImg(id));
		model.addAttribute("mypageFollower",mypageService.getFollower(id));
		model.addAttribute("mypageFollowing",mypageService.getFollowing(id));
		model.addAttribute("mypageFollowerCount",mypageService.getFollowerCount(id));
		model.addAttribute("mypageFollowingCount",mypageService.getFollowingCount(id));
		
		System.out.println(model.get("mypageFollowing"));
		
		return "test";
	
	}
}
