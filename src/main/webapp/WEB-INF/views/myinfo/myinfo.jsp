<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/myinfo/myinfo.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보</title>
</head>
<body>
	<div id="contents">
		<ul class="profile_menu">
			<li><a href="#" class="pageMove nonPageMove">프로필 보기</a></li>
			<li><a href="#" id="myinfoUpdate" class="pageMove">프로필 수정</a></li>
		</ul>
		<article>
			<div class="myinfo profile">
				<span class="columnName"><img src="images/default_profile.jpg"></span>
				<span class="profileValue"><c:out value="${myinfo.userId}"/></span>
			</div>
			<div class="myinfo">
				<span class="columnName">이름</span>
				<span class="profileValue"><c:out value="${myinfo.userName}"/></span>
			</div>
			<div class="myinfo">
				<span class="columnName">성별</span>
				<span class="profileValue">
					<c:if test="${myinfo.userGender eq 'M'}">
						남성
					</c:if>
					<c:if test="${myinfo.userGender eq 'F'}">
						여성
					</c:if>
				</span>	
			</div>
			<div class="myinfo">
				<span class="columnName">생년월일</span>
				<span class="profileValue"><c:out value="${myinfo.userBirth}"/></span>
			</div>
		</article>
	</div>
</body>
</html>