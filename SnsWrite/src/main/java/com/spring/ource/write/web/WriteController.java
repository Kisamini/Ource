package com.spring.ource.write.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ource.comm.JSONUtil;
import com.spring.ource.write.service.WriteService;

@Controller
public class WriteController {
	@Resource
	WriteService writeService; 
	
	//글작성 페이지
	@RequestMapping("write.do")
	public String write(HttpServletRequest request, ModelMap model) {
		String userid = (String)request.getSession().getAttribute("userid");  //아이디 세션으로 받아오기
		model.addAttribute("profile", writeService.getProfile(userid));  //로그인한 사용자의 아이디와 프로필사진 불러오기
		return "write/write";
	} 
	
	//사진올리기
	@ResponseBody
	@RequestMapping(value = "fileUpload.do", produces = "application/json;charset=utf8")
	public String fileUpload(MultipartHttpServletRequest mrequest,
			@RequestParam Map<String, Object> map) {
		int seq = writeService.fileUpload(mrequest, map);
		
		return JSONUtil.OneStringToJson(String.valueOf(seq));
	}
	
	//글 올리기
	@ResponseBody
	@RequestMapping(value = "contentsUpload.do", produces = "application/json;charset=utf8")
	public String fileUpload(HttpServletRequest request, @RequestBody String param) {
		Map<String, Object> map = JSONUtil.JsonToMap(param);
		String userid = (String)request.getSession().getAttribute("userid"); 
		map.put("userId", userid);
		int seq = writeService.contentsUpload(map);
		
		return JSONUtil.OneStringToJson(String.valueOf(seq));
	}
	

}

