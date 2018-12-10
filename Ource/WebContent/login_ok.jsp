<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="id" value="${param.userid}"/>
<c:set var="passwd" value="${param.userpasswd }" />
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ource" 
					password="ourvoice"
					var="conn"/>
<c:if test="${(id eq 'one' )and(passwd eq '12341234')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<c:catch var="error">
   		<sql:query dataSource = "${conn}" var = "profile">
            insert into user_profile_img(img_if,user_id) values(?,?)
            <sql:param>0</sql:param>
            <sql:param>${id}</sql:param>
        </sql:query>
	</c:catch>
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
