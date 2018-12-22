package com.spring.ource.write.service;

import java.util.List;

public class WriteVO {
	String profileImg; 		    //프로필사진
	String userId;     		    //아이디	
	String postsContents;       //게시글의 글
	String postsTime;           //글 작성시간
	String shareType;           //공유타입
	List<byte[]> postsImgs;     //게시글의 사진
	int seq;
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostsContents() {
		return postsContents;
	}
	public void setPostsContents(String postsContents) {
		this.postsContents = postsContents;
	}
	public String getPostsTime() {
		return postsTime;
	}
	public void setPostsTime(String postsTime) {
		this.postsTime = postsTime;
	}
	public String getShareType() {
		return shareType;
	}
	public void setShareType(String shareType) {
		this.shareType = shareType;
	}
	public List<byte[]> getPostsImgs() {
		return postsImgs;
	}
	public void setPostsImgs(List<byte[]> postsImgs) {
		this.postsImgs = postsImgs;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	@Override
	public String toString() {
		return "WriteVO [profileImg=" + profileImg + ", userId=" + userId + ", postsContents=" + postsContents
				+ ", postsTime=" + postsTime + ", shareType=" + shareType + ", postsImgs=" + postsImgs + ", seq=" + seq
				+ "]";
	}
	
	
	
	
}
