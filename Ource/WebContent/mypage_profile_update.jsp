<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="mypage_top.jsp" var="top_nav" />
<c:url value="mypage_profile_change_img.jsp" var="profile_change_img" />
<c:url value="mypage_user_nav.jsp" var="user_nav" />
<c:url value="mypage_user_friends.jsp" var="user_friends" />
<!DOCTYPE html>
<html> 
<head>
<meta content="text/html; charset=euc-kr">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="script/jquery.min.js"></script>
<script src="script/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>마이 페이지</title>
</head>
<body>
<c:import url="${top_nav}" />
<c:import url="${profile_change_img}" />
<c:import url="${user_nav}" />
<c:import url="${user_friends}" />
</body>
</html>