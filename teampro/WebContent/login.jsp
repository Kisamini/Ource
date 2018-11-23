<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.MemberVO"%>
<jsp:useBean id="sc" class="com.example.libs.SelectController" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="flag" value="${sc.loginMember(param.inputEmail3, param.inputPassword3)}" />
<c:set var="member" value="${sc.selectMember(param.inputEmail3)}" />

<c:if test="${flag eq 1}">
<%
	session.setAttribute("email", request.getParameter("inputEmail3"));
	MemberVO member = sc.selectMember(request.getParameter("inputEmail3"));
    //session.setAttribute("passwd", member.getPasswd());
%>
	<script>
		alert("${param.inputEmail3}님! 환영합니다.");
		//location.href = "index.html";
		
	</script>
</c:if>
<c:if test="${flag eq -1}">
	<script>
		alert("입력하신 계정은 존재하지 않습니다.\n확인 후 다시 입력해 주세요.");
		history.back();
	</script>
</c:if>
<c:if test="${flag eq 0}">
	<script>
		alert("비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해 주세요.");
		history.back(); 
		/* exception.printstacktrace(response.getWriter()); */
	</script>
</c:if>