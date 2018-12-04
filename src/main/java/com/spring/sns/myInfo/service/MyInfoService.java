package com.spring.sns.myInfo.service;

import java.util.List;
import java.util.Map;

import com.spring.sns.cmmn.CamelMap;

public interface MyInfoService {

	UserVO selectMyInfoUserInfo(String userid) throws Exception;

	List<CamelMap> selectMyInfoTypeList() throws Exception;

	List<Map<String, Object>> selectUserDetailList(int userNumber) throws Exception;

	int insertMyinfoDetail(Map<String, Object> paramMap) throws Exception;

	int deleteMyinfoDetail(Map<String, Object> paramMap) throws Exception;

	int updateMyinfoDetail(Map<String, Object> paramMap) throws Exception;

}
