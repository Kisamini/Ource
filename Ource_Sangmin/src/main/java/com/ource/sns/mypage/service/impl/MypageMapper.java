package com.ource.sns.mypage.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ource.sns.mypage.service.MypageVO;

@Repository
public interface MypageMapper {

	MypageVO selectTop(String param);

	MypageVO getImg(String id);

	int getFollowingCount(String id);

	int getFollowerCount(String id);

	List<MypageVO> getFollower(String id);

	List<MypageVO> getFollowing(String id);

	void toFollow(Map<String, Object> paramMap);

	void toUnfollow(Map<String, Object> paramMap);

	void updateImg(Map<String, Object> map);

}
