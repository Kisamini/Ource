package com.spring.ource.write.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.ibatis.builder.annotation.MapperAnnotationBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ource.write.service.WriteService;
import com.spring.ource.write.service.WriteVO;

@Service
public class WriteServiceImpl implements WriteService {

	@Resource
	WriteMapper writeMapper;
	
	//파일올리기
	@Override
	public int fileUpload(MultipartHttpServletRequest mrequest, Map<String, Object> map) {
		Iterator<String> fileNames = mrequest.getFileNames();
		List<byte[]> list = new ArrayList<>();
		while (fileNames.hasNext()) {
			String filename = (String) fileNames.next();
			
			List<MultipartFile> fileList = mrequest.getFiles(filename);
			
			for (MultipartFile mf : fileList) {
				try {
					list.add(mf.getBytes());
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		WriteVO writeVO = new WriteVO();
		writeVO.setPostsImgs(list);
		
		writeMapper.fileUpload(writeVO);
		return writeVO.getSeq();
	}
	
	//글 올리기
	@Override
	public int contentsUpload(Map<String, Object> map) {
		writeMapper.contentsUpload(map);
		writeMapper.updateFileImg(map);
		
		return (int)map.get("seq");
	}
	
	//프로필 가져오기
	@Override
	public Map<String, Object> getProfile(String userid) {
		return writeMapper.getProfile(userid);
	}

}
