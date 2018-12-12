package com.ource.sns.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface MypageService {
	MypageVO selectTop(String param);

	MypageVO getImg(String id);

	int getFollowingCount(String id);

	int getFollowerCount(String id);

	List<MypageVO> getFollower(String id);

	List<MypageVO> getFollowing(String id);

	void toFollow(Map<String, Object> paramMap);

	void toUnfollow(Map<String, Object> paramMap);

	void updateImg(MultipartHttpServletRequest mreq, HttpServletRequest req);
}
