package com.spring.sns.myInfo;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.sns.cmmn.CamelMap;
import com.spring.sns.myInfo.service.MyInfoService;
import com.spring.sns.myInfo.service.UserVO;

@Controller
public class MyInfoController {

	@Resource
	private MyInfoService myInfoService;

	private Logger log = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "myinfo.do")
	public String myinfo(String userid, ModelMap model) {
		UserVO userVO = null;
		
		List<CamelMap> userInfoTypeList = null;
		
		try {
			userVO = myInfoService.selectMyInfoUserInfo(userid);
			
			userVO.setUserInfoDetail(myInfoService.selectUserDetailList(userVO.getUserNumber()));
			
			userInfoTypeList = myInfoService.selectMyInfoTypeList(); 
			model.addAttribute("myinfo", 			userVO);
			model.addAttribute("userInfoTypeList", 	userInfoTypeList);
		} catch (Exception e) {
			log.debug(e.getMessage());
			
			return "redirect:main.do";	
		}
		
		return "myinfo/myinfo";
	}
	
	@RequestMapping(value = "home.do")
	public String home() {
		return "home";
	}
}
