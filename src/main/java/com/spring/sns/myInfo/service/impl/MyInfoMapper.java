package com.spring.sns.myInfo.service.impl;

import org.springframework.stereotype.Repository;

import com.spring.sns.myInfo.service.UserVO;

@Repository
public interface MyInfoMapper {

	UserVO selectMyInfoUserInfo(String userid) throws Exception;

}
