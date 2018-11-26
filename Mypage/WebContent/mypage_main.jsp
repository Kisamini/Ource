<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="mypage_top.jsp" var="top_nav" />
<c:url value="mypage_profile.jsp" var="profile" />
<c:url value="mypage_user_nav.jsp" var="user_nav" />
<c:url value="mypage_user_friends.jsp" var="user_friends" />
<!DOCTYPE html>
<html> 
<head>
<meta content="text/html; charset=euc-kr">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>마이 페이지</title>
</head>
<body>
<c:import url="${top_nav}" />
<c:import url="${profile}" />
<c:import url="${user_nav}" />
<c:import url="${user_friends}" />
</body> 
</html>