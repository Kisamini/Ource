<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewprot" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/registerPageStyle.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
			$('#btnIdCheck').click(function(){
				$.ajax({
					type: 'POST',
					url: './userSelect',
					data: {userID : $('#userID').val()},
					
					success: function(checkResult) {
						$('#checkBody').html("");
						$('#checkType').removeAttr("class");
						if(checkResult == 1){
							$('#checkBody').html('사용할 수 있는 아이디입니다.');
							$('#checkType').attr('class', 'modal-content panel-succsess');
							$('#btnRegister').removeAttr("disabled");
						}//if
						else if(checkResult == 0){
							$('#checkBody').html('이미 사용중인 아이디 입니다.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else
						else if(checkResult == -1){
							$('#checkBody').html('아이디를 입력 해 주세요.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(checkResult == -2){
							$('#checkBody').html('아이디에는 한글 혹은 특수문자를 포함 시킬 수 없습니다.');
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
			
			
			$('#btnRegister').click(function(){
				$.ajax({
					type: 'POST',
					url: './userRegister',
					data: {userID : $('#userID').val(),
						   userPW1 : $('#userPW1').val(),
						   userPW2 : $('#userPW2').val(),
						   userName : $('#userName').val(),
						   userAge : $('#userAge').val(),
						   userGender : $('#userGender').val()},
						   
					success: function(registerResult) {
						$('#checkBody').html("");
						$('#checkType').removeAttr("class");
						if(registerResult == 1){
							$('#checkBody').html('회원가입 완료');
							$('#checkType').attr('class', 'modal-content panel-succsess');
						}//if
						else if(registerResult == 0){
							$('#checkBody').html('알 수 없는 이유로 가입에 실패.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -1){
							$('#checkBody').html('비밀번호가 서로 일치하지 않습니다.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -2){
							$('#checkBody').html('모든 정보를 입력 해 주세요.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -3){
							$('#checkBody').html('비밀번호는 8자리 이상으로 입력 해 주세요.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -4){
							$('#checkBody').html('이름은 한글 자음이나 모음, 특수문자를 포함 할 수 없습니다.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}//else if
						else if(registerResult == -5){
							$('#checkBody').html('생년월일을 정확히 입력 해 주십시오.');
							$('#checkType').attr('class', 'modal-content panel-warning');
						}
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
	
	
	<title>아워스 회원가입 페이지</title>
	</head>
	
	
	
	
	
	
	
	
	
	
	<body>
		<div class="container">
		
	
			<table class="table table-hover" style="text-align: center;" id="registerTable">
			<thead>
				<tr style="height: 110px;">
					<th colspan="3" id="logo"> 
						<img src="./Image/ource_logo3.png" class="img-fluid" style="width: 380px; height: 270px;" align="center"/> 
					</th>
				</tr>
				<tr>
					<th colspan="3" id="banner"> <h4> 회원 가입 </h4> </th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td style="width: 160px;">
						<h5> 아이디</h5>
					</td>
					<td>
						<input id="userID" class="form-control" type="text" name="userID" maxLength="20" placeholder="아이디를 입력 해 주세요.">
					</td>
<!-- 아이디 중복 검사 버튼 ----------------------------------------------------------------------------------------------------------------------------------- -->
					<td style="width: 110px;">
						<button id="btnIdCheck" class="btn btn:primary" type="button"> 중복체크 </button>
					</td>
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center">
						<h5> 비밀번호</h5>
					</td>
					<td colspan="2">
						<input class="form-control" type="password" id="userPW1" maxLength="20" placeholder="비밀번호는 8자 이상, 20자 이하 입니다.">
					</td>				
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center">
						<h5> 비밀번호 확인</h5>
					</td>
					<td colspan="2">
						<input class="form-control" type="password" id="userPW2" maxLength="20" placeholder="비밀번호 재 입력">
					</td>				
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center">
						<h5> 이름</h5>
					</td>
					<td colspan="2">
						<input class="form-control" type="text" id="userName" maxLength="20" placeholder="이름은 최대 20자까지 가능합니다.">
					</td>				
				</tr>
				
				<tr>
					<td style="width: 160px;" align="center">
						<h5> 생년월일</h5>
					</td>
					<td colspan="2">
						<input class="form-control" type="text" id="userAge" maxLength="8" placeholder="생년월일을 입력 해 주세요. (ex:19921020)">
					</td>				
				</tr>
					
				<tr>
					<td colspan="3">
						<div class="form-group" style="text-align: center; margin: 0 auto;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" id="userGender" autocomplete="off" value="남자" checked> 남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" id="userGender" autocomplete="off" value="여자"> 여자
								</label>
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
<!-- 회원 가입 버튼---- ----------------------------------------------------------------------------------------------------------------------------------- -->
					<td colspan="3" id="bottomTable">
						<button id="btnRegister" class="btn btn:primary" type="button" disabled="disabled"> 가입하기 </button> 
					</td>
				</tr>
				
			</tbody>
			</table>
		</div>
		
		
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
		
		
	</body>


</html>