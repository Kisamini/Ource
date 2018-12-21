package com.spring.board.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.board.service.BoardService;
import com.spring.ourvoice.cmmn.JsonUtil;

import oracle.sql.BLOB;

@Controller
public class BoardController {

	@Resource
	private BoardService boardService;
	
	@RequestMapping(value = "board.do") 
	public String board(HttpServletRequest request, ModelMap model) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		
		boardService.select(map);
		
		model.addAttribute("map", map);
		
		// 나중에 삭제하기
		request.getSession().setAttribute("userid", "one");
		
		return "detail";
	}
	
	@RequestMapping(value = "upload.do")
	public String upload(MultipartHttpServletRequest mRequest) {
		boardService.upload(mRequest);
		
		return "redirect:board.do";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "imageView/{fileId}")
	public ResponseEntity<byte[]> getByteImg(@PathVariable String fileId) throws SQLException {
		Map<String, Object> map = new HashMap<>();
		
		map.put("fileId", fileId);
		
		boardService.selectPostsInfo(map);
		
		BLOB blob = (BLOB) ((Map)((ArrayList<Object>) map.get("result")).get(0)).get("postsImg"); 
		
		byte[] imageBytes = blob.getBytes(1, (int) blob.length());
		
		final HttpHeaders headers = new HttpHeaders();
		
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(imageBytes, headers, HttpStatus.OK);
	}
	
	@RequestMapping(value = "postDetail.do", method = RequestMethod.POST)
	public void postDetail(@RequestParam Map<String, Object> resultMap, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		resultMap.put("userid", request.getSession().getAttribute("userid"));
		resultMap.put("rowCount", 10);
		
		boardService.selectBoardDetailInfo(resultMap);
		boardService.selectCommentList(resultMap);
		boardService.selectCommentTotal(resultMap);
		
		System.out.println(resultMap);
		
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(JsonUtil.MapToJson(resultMap));
	}
}
