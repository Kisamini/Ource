package com.spring.board.service;

import java.util.List;

public class BoardVO {
	private String postsUserId;
	private List<byte[]> imgs;
	
	public String getPostsUserId() {
		return postsUserId;
	}
	public void setPostsUserId(String postsUserId) {
		this.postsUserId = postsUserId;
	}
	public List<byte[]> getImgs() {
		return imgs;
	}
	public void setImgs(List<byte[]> imgs) {
		this.imgs = imgs;
	}
}
