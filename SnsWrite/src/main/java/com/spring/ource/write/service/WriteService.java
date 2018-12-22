package com.spring.ource.write.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface WriteService {

	int fileUpload(MultipartHttpServletRequest mrequest, Map<String, Object> map);  //사진 올리기

	int contentsUpload(Map<String, Object> map);  //글 올리기

	Map<String, Object> getProfile(String userid);  //프로필 불러오기

}
