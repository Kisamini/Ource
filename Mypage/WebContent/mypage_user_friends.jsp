<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ksm" 
					password="ource"
					var="conn"/>
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "names">
            select a.username, b.profile_img from user_profile a, user_profile_img b where a.id = b.id and a.id != ?
            <sql:param>test1</sql:param>
         </sql:query>
</c:catch>

<c:if test="${not(empty error)}">
<p style="color:red;font-size:2em;">Error : ${error}</p>
</c:if>
<link rel="stylesheet" type="text/css" href="css/user_friends.css">
<!--user friends-->
        <div class="user_friends">
          <ul>
          	<c:forEach items="${names.rows}" var="friends">
          	<c:if test="${friends['profile_img'] eq '0'}" >
            	<li><img id="user_friends_img" src="images/default_user_profile_img.png" alt="친구 이미지"><a href="#">${friends['username']}</a></li>
            </c:if>
            <c:if test="${friends['profile_img'] ne '0'}" >
            	<li><img id="user_friends_img" src="<c:url value='upload/${friends["profile_img"]}'/>" alt="친구 이미지"><a href="#">${friends['username']}</a></li>
            </c:if>
            </c:forEach>
          </ul>
        </div>
<!--user friends end-->        
