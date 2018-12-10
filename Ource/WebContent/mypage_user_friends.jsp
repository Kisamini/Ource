<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ource" 
					password="ourvoice"
					var="conn"/>

<!-- 자신의 친구 -->
<c:if test="${param.id eq sessionScope.sessionId }">
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "names">
            select a.user_id, a.user_name, b.profile_img from users a, user_profile_img b where a.user_id = b.user_id and a.user_id != ?
            <sql:param>${param.id}</sql:param>
         </sql:query>
</c:catch>
</c:if>
<!-- 자신의 친구 -->

<!-- 친구의 친구 -->
<c:if test="${param.id ne sessionScope.sessionId }">
<!-- 친구의 친구가져오는 sql문 -->
</c:if>
<!-- 친구의 친구 -->

<c:if test="${not(empty error)}">
<p style="color:red;font-size:2em;">Error : ${error}</p>
</c:if>
<link rel="stylesheet" type="text/css" href="css/user_friends.css">
<!--user friends-->
        <div class="user_friends">
        	<div class="user_friends_border">
          <ul>
          	<c:forEach items="${names.rows}" var="friends">
          	<c:if test="${friends['profile_img'] eq '0'}" >
            	<li><a href="mypage_main.jsp?id=${friends.user_id}"><img id="user_friends_img" src="images/default_user_profile_img.png" alt="친구 이미지" draggable="false">${friends.user_name}</a></li>
            </c:if>
            <c:if test="${friends['profile_img'] ne '0'}" >
            	<li><a href="mypage_main.jsp?id=${friends.user_id}"><img id="user_friends_img" draggable="false" src="<c:url value='upload/${id}/${friends.profile_img}'/>" alt="친구 이미지">${friends.user_name}</a></li>
            </c:if>
            </c:forEach>
          </ul>
          </div>
        </div>
<!--user friends end-->        


