package com.spring.board.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.service.BoardService;
import com.spring.board.service.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource
	private BoardMapper boardMapper;

	@Override
	public void upload(MultipartHttpServletRequest mRequest) {
		List<MultipartFile> mFiles = mRequest.getFiles("file");
		
		BoardVO boardVO = new BoardVO();
		
		boardVO.setPostsUserId("one");
		try {
			List<byte[]> byteList = new ArrayList<>();
			
			for (MultipartFile multipartFile : mFiles) {
				byteList.add(multipartFile.getBytes());
			}
			
			boardVO.setImgs(byteList);
			
			boardMapper.upload(boardVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void select(Map<String, Object> map) {
		boardMapper.select(map);
	}

	@Override
	public void selectPostsInfo(Map<String, Object> map) {
		boardMapper.selectPostsInfo(map);
	}

	@Override
	public void selectBoardDetailInfo(Map<String, Object> resultMap) {
		boardMapper.selectBoardDetailInfo(resultMap);
	}

	@Override
	public void selectCommentList(Map<String, Object> resultMap) {
		boardMapper.selectCommentList(resultMap);
	}

	@Override
	public void selectCommentTotal(Map<String, Object> resultMap) {
		boardMapper.selectCommentTotal(resultMap);
	}
}
