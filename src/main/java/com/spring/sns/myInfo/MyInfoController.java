package com.spring.sns.myInfo;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		try {
			userVO = myInfoService.selectMyInfoUserInfo(userid);
			
			model.addAttribute("myinfo", userVO);
		} catch (Exception e) {
			log.debug(e.getMessage());
		}
		
		return "myinfo/myinfo";
	}
	
	@RequestMapping(value = "home.do")
	public String home() {
		return "home";
	}
}
