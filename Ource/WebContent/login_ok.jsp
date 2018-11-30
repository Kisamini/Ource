<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="${param.userid}"/>
<c:set var="passwd" value="${param.userpasswd }" />
<c:if test="${(id eq 'test1' )and(passwd eq 'test1')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test2' )and(passwd eq 'test2')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test3' )and(passwd eq 'test3')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test4' )and(passwd eq 'test4')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test5' )and(passwd eq 'test5')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test6' )and(passwd eq 'test6')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test7' )and(passwd eq 'test7')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>
<c:if test="${(id eq 'test8' )and(passwd eq 'test8')}">
	<c:set var="sessionId" value="${id }" scope="session" />
	<script>location.href="mypage_main.jsp?id=${id}";</script>
</c:if>