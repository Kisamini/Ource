<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Ource] 우리들의 목소리</title>
<script src="js/jquery.min.js"></script>
<script>
	$(function(){
		$("#btnLogin").bind("click", function(){
			$(".form-horizontal").attr("action", "login.jsp");
		});
		$("#btnJoin").bind("click", function(){
			$(".form-horizontal").attr("action", "register.jsp");
		});
	});
</script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font.css" />
    <style type="text/css">
       .container{
           color:black;
           font-family : 'Hanna';
           weight:500px;
           height:500px;
       }
       .container1{
                   text-align:center;
       }
       .container{
         font-family : 'Hanna';
       }
       .lead{
          text-align :right;
       }
       .a{
        margin-left:auto;
    margin-right:auto;
       }
       #btnLogin{
         font-family : 'Hanna';
       }
       #btnRegister{
       font-family : 'Hanna';
       }
       </style>
</head>
<body>
    <div class ="container" style="text-align:center;">
    <table class="a">
    <td><img src="./image/logo_background_transparent.png"></td>
    </table>
    <p class="lead">우리들의 목소리가 모이는 곳 </p>
       <p class="lead">당신의 목소리도 함께하세요</p>
    </div>
    <div class="container1">
    <a class="btn btn-warning btn-lg" id="btnLogin" href="login.html" role="button">로그인</a>
     <a class="btn btn-danger btn-lg" id="btnRegister" href="register.html" role="button">회원가입</a>
     </div>
</body>
</html>