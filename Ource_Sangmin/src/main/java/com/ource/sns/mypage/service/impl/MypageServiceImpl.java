package com.ource.sns.mypage.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ource.sns.mypage.service.MypageService;
import com.ource.sns.mypage.service.MypageVO;
@Service
public class MypageServiceImpl implements MypageService{
	@Resource
	private MypageMapper mypageMapper;
	@Override
	public MypageVO selectTop(String param) {
		
		return mypageMapper.selectTop(param);
	}
	@Override
	public MypageVO getImg(String id) {
		
		return mypageMapper.getImg(id);
	}
	@Override
	public int getFollowingCount(String id) {
		
		return mypageMapper.getFollowingCount(id);
	}
	@Override
	public int getFollowerCount(String id) {
		return mypageMapper.getFollowerCount(id);
	}
	@Override
	public List<MypageVO> getFollower(String id) {
		return mypageMapper.getFollower(id);
	}
	@Override
	public List<MypageVO> getFollowing(String id) {
		return mypageMapper.getFollowing(id);
	}
	@Override
	public void toFollow(Map<String, Object> paramMap) {
		mypageMapper.toFollow(paramMap);
	}
	@Override
	public void toUnfollow(Map<String, Object> paramMap) {
		mypageMapper.toUnfollow(paramMap);
		
	}
	@Override
	public void updateImg(MultipartHttpServletRequest mreq, HttpServletRequest req) {
		MultipartFile profileFile = mreq.getFile("user_profile_img_search");
		MultipartFile backgroudFile = mreq.getFile("user_profile_background_img_search");
		String root = req.getSession().getServletContext().getRealPath("/")+"\\upload\\"+
					req.getSession().getAttribute("sessionId");
		Object sessionId = req.getSession().getAttribute("sessionId");
		saveFile(profileFile,root,"profile_img",sessionId);
		saveFile(backgroudFile,root,"background_img",sessionId);
		
	}
	private void saveFile(MultipartFile file,String root,String key,Object sessionId) {
		SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		long currentTime = System.currentTimeMillis();
		File mfile = new File(root);
		String filename = simDf.format(new Date(currentTime))+file.getOriginalFilename();
		if(!mfile.exists()) {
			mfile.mkdirs();
		}
		if(file.isEmpty()) {
			return;
		}
		
		File saveFile = new File(root+"\\"+filename);
		try {
			file.transferTo(saveFile);
			Map<String,Object> map = new HashMap<>();
			map.put("sessionId", sessionId);
			map.put("value", filename);
			map.put("col", key);
			mypageMapper.updateImg(map);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
