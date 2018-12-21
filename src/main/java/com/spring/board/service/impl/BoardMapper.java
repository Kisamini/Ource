package com.spring.board.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.spring.board.service.BoardVO;

@Repository
public interface BoardMapper {

	void upload(BoardVO boardVO);

	void select(Map<String, Object> map);

	void selectPostsInfo(Map<String, Object> map);

	void selectBoardDetailInfo(Map<String, Object> resultMap);

	void selectCommentList(Map<String, Object> resultMap);

	void selectCommentTotal(Map<String, Object> resultMap);
}
