<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="sessionId" value="one" scope="session" />
<c:url value="test1.jsp" var="testpro" />
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
<c:import url="${testpro}" />
</body> 
</html>