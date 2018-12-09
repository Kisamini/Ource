<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver"
	url="jdbc:oracle:thin:@52.79.235.41:1521:xe" user="ksm"
	password="ource" var="conn" />
	
	
<!-- 프로필 사진 확인 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="isUserHasProfilePic">
		            SELECT profile_img
		            FROM user_profile_img
		            WHERE id = ?
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>

<!-- 팔로워 구하기 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="userFollower">
		            SELECT count(mem_id) as mem_id
		            FROM user_follow
		            WHERE target_mem_id = ?
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>


<!--  팔로잉 구하기 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="userFollowing">
		            SELECT count(mem_id) as mem_id
		            FROM user_follow
		            WHERE mem_id = ?
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>

<!--  유저 아이디 가져오기 -->
<c:catch var="error">
	<sql:query dataSource="${conn}" var="userID">
		            SELECT id
		            FROM user_profile
		            WHERE id = ?
		            <sql:param>
		            	${sessionScope.sessionId}
		            </sql:param>
	</sql:query>
</c:catch>

<link rel='stylesheet' type="text/css" href="css_main/userProfile.css">

<div id='userProfilePicture'>
<c:forEach var="data" items="${isUserHasProfilePic.rows}">
				<c:if test="${data.profile_img eq '0'}">
						<img src="Image/user.png" id="userProfileIcon"/>
				</c:if>
				<c:if test="${data.profile_img ne '0'}">
				</c:if>
</c:forEach>
</div>

<div id="userFolOutput">
	<c:forEach var="data" items="${userID.rows}">
							<h1> ${data.id} </h1>
	</c:forEach>
	<c:forEach var="data" items="${userFollowing.rows}">
							<h5> 팔로잉 ${data.mem_id} </h5>
	</c:forEach>
	<c:forEach var="data" items="${userFollower.rows}">
							<h5> 팔로워 ${data.mem_id} </h5>
	</c:forEach>
</div>

<div id="voiceControlPanel">
</div>
