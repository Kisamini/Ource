package com.spring.sns.myInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.sns.cmmn.CamelMap;
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

	@Override
	public List<CamelMap> selectMyInfoTypeList() throws Exception {
		return myInfoMapper.selectMyInfoTypeList();
	}

	@Override
	public List<Map<String, Object>> selectUserDetailList(int userNumber) throws Exception {
		return myInfoMapper.selectUserDetailList(userNumber);
	}

	@Override
	public int insertMyinfoDetail(Map<String, Object> paramMap) throws Exception {
		return myInfoMapper.insertMyinfoDetail(paramMap);
	}

	@Override
	public int deleteMyinfoDetail(Map<String, Object> paramMap) throws Exception {
		return myInfoMapper.deleteMyinfoDetail(paramMap);
	}

	@Override
	public int updateMyinfoDetail(Map<String, Object> paramMap) throws Exception {
		return myInfoMapper.updateMyinfoDetail(paramMap);
	}
}
