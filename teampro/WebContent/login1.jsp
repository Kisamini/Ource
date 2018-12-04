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
	<style> 
	body{background-image: url("./image/bg2.png"); text-align:center}
	#aaa{margin-left: 290px; }
	
	.a{text-align:center}
	
	/* @media all and (max-width:1200px){
	 	   #aaa{margin-left:100px;}
	 	   .form-group{margin-left:100px}
	 	} */
	</style>
	
	<title>[Ource]우리들의 목소리</title>
    <script>
	$(function(){
		$("#btnLogin").bind("click", function(){
			$(".loginform").attr("action", "login.jsp");
		});
		
		$("#btnSearch").bind("click", function(){
			$(".loginform").attr("action", "search.jsp");
		}); 
	});
   </script>
	</head>
	<body>
	    <div id="banner_bg"><img src="./image/ource_logo3_resized.png" class="img-fluid"/></div>
		<div class="container">
	    	<form method="post" class="loginform">
			<table align="center">
			<thead>
				
			<tbody>
				<tr><td colspan="3" id="bbb" ><br/><br/></td></tr>
				<tr>
					<td style="width:160px;height:50px;color:white"><h4> ID</h4></td>
					<td><input class="form-control" type="text" name="userID" maxLength="20" placeholder="아이디를 입력하세요." /></td>
				</tr>
				<tr>
					<td style="width:160px;height:50px;color:white" align="center"><h4> Password</h4></td>
					<td colspan="2"  align="left"><input class="form-control" type="password" name="userPW" maxLength="20" placeholder="비밀번호를 입력하세요." /></td></tr>
				<tr><td colspan="3" ></td></tr>
					
			    <tr>
					<td style="text-align:right" colspan="3"> 
					<input type="submit" class="btn btn-info btn-lg" id="btnSearch" value="아이디/비밀번호 찾기"></input>
					<input type="submit" class="btn btn-info btn-lg" id="btnLogin" value="로그인"></input>
				</tr>
				
			</tbody>
			</table>
		</form>
		</div>
	</body>
<!-- <div id="div_bottom"></div> -->
</html>