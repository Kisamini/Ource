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
           height:420px;
       }
       .container1{
                   text-align:center;
       }
       .container{
         font-family : 'Hanna';
         text-align:center;
       }
       .lead{
        margin-left:auto;
    margin-right:auto;
          text-align :center;
           font-family : 'Hanna';
       }
       .a{
        margin-left:auto;
    margin-right:auto;
        weight: 300px;
       height: 300px;
       }
       #btnLogin{
         font-family : 'Hanna';
       }
       #btnRegister{
       font-family : 'Hanna';
       }
       .container3{
          margin-top:300px;
       }
       
       </style>
</head>
<body>
    <div class = "total">
    <div class ="container">
    <br><br><br><br>
    <table class="a">
    <td><img src="./image/logo_background_white.png" margin-top:auto;></td>
    </table>
    </div>
    <br><br><br>
    <div class="container1">
    <a class="btn btn-warning btn-lg" id="btnLogin" href="login.html" role="button" weight="200px";>로그인</a>
     <a class="btn btn-danger btn-lg" id="btnRegister" href="register.html" role="button">회원가입</a>
     </div>    
     <div class="container3"><br><br>
      <p class="lead">들을 수 있는 신개념 SNS,시작해볼까요? </p>
     </div>
     </div>
</body>
</html>