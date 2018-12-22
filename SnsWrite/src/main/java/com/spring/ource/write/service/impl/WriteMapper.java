package com.spring.ource.write.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.ource.write.service.WriteVO;

@Repository
public interface WriteMapper {

	void fileUpload(WriteVO writeVO);                //사진 올리기

	void contentsUpload(Map<String, Object> map); 	 //글 올리기

	void updateFileImg(Map<String, Object> map);     //이 사진은 이 게시글의 사진이다.

	Map<String, Object> getProfile(String userid);   //프로필 불러오기

}
