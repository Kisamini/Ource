package com.spring.sns.myInfo.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.sns.myInfo.service.MyInfoService;
import com.spring.sns.myInfo.service.UserVO;

@Service
public class MyInfoServiceImpl implements MyInfoService {

	@Resource
	private MyInfoMapper myInfoMapper;

	@Override
	public UserVO selectMyInfoUserInfo(String userid) throws Exception {
		return myInfoMapper.selectMyInfoUserInfo(userid);
	}
}
