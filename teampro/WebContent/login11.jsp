<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.MemberVO,com.example.libs.SelectController"%>
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
	<script type="text/javascript">
	  $(document).ready(function(){
		  $('#btnLogin').click(function(){
				$.ajax({
					type: 'POST',
					url: './userRegister',
					data: {userID : $('#userID').val(),
						   userPW : $('#userPW').val(),
						   
					success: function(loginResult) {
						$('#checkBody').html("");
						$('#checkType').removeAttr("class");
						if(registerResult == 1){
							$('#checkBody').html('${param.userID}님! 환영합니다.');
							$('#checkType').attr('class', 'modal-content panel-succsess');
						}//if
						else if(registerResult == 0){
							$('#checkBody').html('비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해 주세요.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -1){
							$('#checkBody').html('존재하지 않는 아이디입니다.\n확인 후 다시 입력해 주세요.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						$('#checkModal').modal("show");
					},
					
					error: function(a, b, c){
						console.log(a);
						console.log(b);
						console.log(c);
					}
				}); //ajax
			}); //buttonOnClick
			
			
		}); //ready
	</script>
		
	<title>[Ource]우리들의 목소리</title>
<!-- 	<script>
	$(function(){
		$("#btnLogin").bind("click", function(){
			$(".loginform").attr("action", "login.jsp");
		});
	});
   </script> -->
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
					<td><input class="form-control" type="text" name="userID" maxLength="20" placeholder="아이디를 입력하세요."></td>
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center"><h5> 비밀번호</h5></td>
					<td colspan="2"><input class="form-control" type="text" name="userPW" maxLength="20" placeholder="비밀번호를 입력하세요."></td>				</tr>
				
				
					
			
					 <td style="text-align: right" colspan="3"> 
					<input class="btn btn-primary pull-right" id="btnLogin" type="submit" value="로그인"/> 
					
					<!-- <td style="width: 110px;">
						<button id="btnLogin" class="btn btn:primary" type="button" disabled="disabled"> 가입하기 </button> 
					</td> -->
				</tr>
				
			</tbody>
			</table>
			
			<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id="checkType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true"> &times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal=title"> 
								확인 메세지 
							</h4>
						</div>
						
						<div class="modal-body" id="checkBody">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal"> 확인 </button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		</form>
		</div>

	</body>

</html>