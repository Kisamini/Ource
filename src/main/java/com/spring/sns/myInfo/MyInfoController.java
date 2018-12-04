package com.spring.sns.myInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.sns.cmmn.CamelMap;
import com.spring.sns.cmmn.JsonUtil;
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
	
	@ResponseBody
	@RequestMapping(value = "myinfoDetailUpdate.do", method = RequestMethod.POST)
	public String myinfoDetailUpdate(@RequestBody String param, HttpServletRequest request)  {
		Map<String, Object> resultMap 	= new HashMap<>(),
							paramMap 	= JsonUtil.JsonToMap(param);
		
		Integer userNumber				= (Integer) request.getSession().getAttribute("userNumber");
		
		if (userNumber == null) {
			System.out.println(paramMap);
			
			userNumber = (int) (Double.parseDouble(paramMap.get("userNumber").toString()));
		}
		
		try {
			int result = 0;
			
			if ("insert".equals(paramMap.get("type"))) {
				result = myInfoService.insertMyinfoDetail(paramMap);
				
				resultMap.put("uinfoNum", paramMap.get("uinfoNumber").toString());
			} else if ("update".equals(paramMap.get("type"))) {
				result = myInfoService.updateMyinfoDetail(paramMap);
			} else if ("delete".equals(paramMap.get("type"))) {
				result = myInfoService.deleteMyinfoDetail(paramMap);
			}
			
			if (result == 0) {
				throw new Exception();
			} else {
				resultMap.put("result", "SUCCESS");
			}
		} catch (Exception e) {
			resultMap.put("result", "ERROR");
		}
		
		return JsonUtil.MapToJson(resultMap);
	}
}
