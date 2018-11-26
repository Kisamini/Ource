<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewprot" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<title>[아워스]입니다</title>
	<script>
	$(function(){
		$("#btnLogin").bind("click", function(){
			$(".loginform").attr("action", "login.jsp");
			//location.href = "login.jsp";
		});
		$("#btnJoin").bind("click", function(){
			$(".loginform").attr("action", "register.jsp");
			//location.href = "register.jsp";
		});
	});
   </script>
	</head>
	<body>
		<div class="container">
		
	
		<form method="post" class="loginform">
			<table class="table table-hover" style="text-align: center;">
			<thead>
				<tr style="height: 110px;">
					<th colspan="3" id="logo"> <img src="./image/logo_background_transparent.png" class="img-fluid" style="width: 280px; height: 200px;" align="center"/> </th>
				</tr>
				<tr>
					<th colspan="3" id="banner"> <h4> Ource에 오신 것을 환영합니다.</h4> </th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td style="width: 160px;"><h5> 아이디</h5></td>
					<td><input class="form-control" type="text" name="userID" maxLength="20"></td>
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center"><h5> 비밀번호</h5></td>
					<td colspan="2"><input class="form-control" type="text" name="userPW" maxLength="20"></td>				</tr>
				
				
					
			
					<td style="text-align: right" colspan="3"> 
					<input class="btn btn-primary pull-right" id="btnLogin" type="submit" value="로그인"/>
					 <input class="btn btn-primary pull-right" id="btnJoin"  type="submit" value="회원가입"/> </td>
				</tr>
				
			</tbody>
			</table>
		</form>
		</div>
		
		<%
			String messageContent = null;
			String messageType = null;
			if(session.getAttribute("messageContent") != null) {
				messageContent = (String) session.getAttribute("messageContent");
			}
			if(session.getAttribute("messageType") != null) {}
		%>
		
		
		
	</body>

</html>