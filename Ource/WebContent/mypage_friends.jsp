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

<!-- 자신의 친구 -->
<c:if test="${sessionScope.getId eq sessionScope.sessionId }">
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "names">
            select a.id, a.username, b.profile_img from user_profile a, user_profile_img b where a.id = b.id and a.id != ?
            <sql:param>${sessionScope.getId}</sql:param>
         </sql:query>
</c:catch>
</c:if>
<!-- 자신의 친구 -->

<!-- 친구의 친구 -->
<c:if test="${sessionScope.getId ne sessionScope.sessionId }">
<!-- 친구의 친구가져오는 sql문 -->
</c:if>
<!-- 친구의 친구 -->

<c:if test="${not(empty error)}">
<p style="color:red;font-size:2em;">Error : ${error}</p>
</c:if>
