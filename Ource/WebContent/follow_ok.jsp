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
<c:catch var="error">
	 <sql:update dataSource = "${conn}" var = "follow">
            insert into user_follow values(USER_FOLLOW_AUTO_INC.nextval,?,?,sysdate)
            <sql:param>${sessionScope.sessionId }</sql:param>
            <sql:param>${param.id }</sql:param>
         </sql:update>
</c:catch>
<c:if test="${not(empty error)}">
	<script>alert('앙대여');history.back();</script>
</c:if>