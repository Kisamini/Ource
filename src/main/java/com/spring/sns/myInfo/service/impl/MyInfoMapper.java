package com.spring.sns.myInfo.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.sns.cmmn.CamelMap;
import com.spring.sns.myInfo.service.UserVO;

@Repository
public interface MyInfoMapper {

	UserVO selectMyInfoUserInfo(String userid) throws Exception;

	List<CamelMap> selectMyInfoTypeList() throws Exception;

	List<Map<String, Object>> selectUserDetailList(int userNumber) throws Exception;

}
