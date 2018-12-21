package com.spring.board.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

	void upload(MultipartHttpServletRequest mRequest);

	void select(Map<String, Object> map);

	void selectPostsInfo(Map<String, Object> map);

	void selectBoardDetailInfo(Map<String, Object> resultMap);

	void selectCommentList(Map<String, Object> resultMap);

	void selectCommentTotal(Map<String, Object> resultMap);

}
