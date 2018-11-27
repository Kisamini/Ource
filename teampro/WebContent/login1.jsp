<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewprot" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<link rel="stylesheet" href="css/min.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<title>[Ource]우리들의 목소리</title>
	<script>
	$(function(){
		$("#btnLogin").bind("click", function(){
			$(".loginform").attr("action", "login.jsp");
		});
	});
   </script>
   <style type="text/css">
     .a{margin-left:auto; margin-right:auto;}
     #btnLogin{background-color:#ABC3DB; height:45px; width:500px}
     .form-control{margin-right:12px;}
   </style>
	</head>
	<body>
		<div class="container">
		
	
		<form method="post" class="loginform">
			<table class="a" style="text-align:center; width:500px; heigh:1000px">
			<thead>
				<tr style="height: 110px;">
					<th colspan="3" id="logo"> <img src="./image/logo.jpg" class="img-fluid" style="width: 280px; height: 200px;" align="center"/> </th>
				</tr>
				<br/><br/><br/><br/>
				<tr style="height: 70px;">
					<th colspan="3" id="banner"> <h4> Ource에 오신 것을 환영합니다.</h4> </th>
				</tr>
			</thead>
			<tbody>
				<tr><td colspan="3" style="background-color:#F4F4F4"><br/><br/></td></tr>
				<tr>
					<td style="width:160px;height:50px;background-color:#F4F4F4"><h5> 아이디</h5></td>
					<td style="background-color:#F4F4F4"><input class="form-control" type="text" name="userID" maxLength="20" placeholder="아이디를 입력하세요."></td>
				</tr>
				<tr>
					<td style="width:160px;height:50px;background-color:#F4F4F4"; align="center"><h5> 비밀번호</h5></td>
					<td colspan="2" style="background-color:#F4F4F4"; align="left"><input class="form-control" type="text" name="userPW" maxLength="20" placeholder="비밀번호를 입력하세요."></td></tr>
				<tr><td colspan="3" style="background-color:#F4F4F4"><br/></td></tr>
					
			    <tr>
					<td style="text-align: right" colspan="3"> 
					<input id="btnLogin" type="submit" value="로그인"/>
				</tr>
				
			</tbody>
			</table>
		</form>
		</div>

	</body>

</html>