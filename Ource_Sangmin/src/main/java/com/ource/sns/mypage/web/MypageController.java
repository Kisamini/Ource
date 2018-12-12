package com.ource.sns.mypage.web;

import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ource.sns.mypage.service.MypageService;
import com.ource.sns.mypage.service.MypageVO;

@Controller
public class MypageController {
	@Resource
	private MypageService mypageService;
	
	@ModelAttribute("mypageTop")
	public MypageVO mypageFilter(HttpServletRequest req) {
		String sessionId = (String)req.getSession().getAttribute("sessionId");
		System.out.println("세션아이디: "+sessionId);
		MypageVO mypageVO = null;
		
		if(sessionId!=null&&!sessionId.equals("")) {
			mypageVO = mypageService.selectTop(sessionId);
		}
		
		return mypageVO;
	}
	
	@RequestMapping(value = "/mypage.do")
	public String mypageMain(ModelMap model,String id,HttpServletRequest req) {
		model.addAttribute("mypageProfile",mypageService.getImg(id));
		model.addAttribute("mypageFollower",mypageService.getFollower(id));
		model.addAttribute("mypageFollowing",mypageService.getFollowing(id));
		model.addAttribute("mypageFollowerCount",mypageService.getFollowerCount(id));
		model.addAttribute("mypageFollowingCount",mypageService.getFollowingCount(id));

		System.out.println(model.get("mypageTop"));
		
		return "mypage_main";
	
	}
	@RequestMapping(value = "/mypageChangeImg.do")
	public String mypageChangeIme(Model model,String id,HttpServletRequest req) {
		model.addAttribute("mypageProfile",mypageService.getImg(id));
		model.addAttribute("mypageFollower",mypageService.getFollower(id));
		model.addAttribute("mypageFollowing",mypageService.getFollowing(id));
		model.addAttribute("mypageFollowerCount",mypageService.getFollowerCount(id));
		model.addAttribute("mypageFollowingCount",mypageService.getFollowingCount(id));
		return "mypage_profile_update";
	}
	@RequestMapping(value = "/mypageUpdateImg.do")
	public String mypageUpdateIme(MultipartHttpServletRequest mreq,HttpServletRequest req ) {
		mypageService.updateImg(mreq,req);
		String id = (String)req.getSession().getAttribute("sessionId");
		return "redirect:mypage.do?id="+id;
	}
	@RequestMapping(value = "/follow.do")
	public void followOk(@RequestParam Map<String,Object> paramMap,HttpServletRequest req,HttpServletResponse res) {
		paramMap.put("sessionId", req.getSession().getAttribute("sessionId"));
		mypageService.toFollow(paramMap);
		
		try {
			res.getWriter().write("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/unfollow.do")
	public void unfollowOk(@RequestParam Map<String,Object> paramMap,HttpServletRequest req,HttpServletResponse res) {
		paramMap.put("sessionId", req.getSession().getAttribute("sessionId"));
		mypageService.toUnfollow(paramMap);
		
		try {
			res.getWriter().write("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "/contents.do")
	public String myContents() {

		return "mypage_contents";
	}
	@RequestMapping(value = "/basicInfo.do")
	public String myBasicInfo() {

		return "mypage_user_info";
	}
	@RequestMapping(value = "/")
	public String login() {

		return "login";
	}
	@RequestMapping(value = "/login_ok.do")
	public String loginOK() {
		return "login_ok";
	}
	@RequestMapping(value = "/logout.do")
	public String logout() {
		return "logout";
	}
}

