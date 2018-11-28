<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="${param.userid}"/>
<c:set var="passwd" value="${param.userpasswd }" />
<c:if test="${(id eq 'test1' )and(passwd eq 'test1')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id ne 'test1' )or(passwd ne 'test1')}">
	<script>history.back();</script>
</c:if>