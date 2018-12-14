<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css/idSearch1.css">
	<link rel="stylesheet" type="text/css" href="css/idSearch.css">
	<link rel="stylesheet" href="css/min.css">
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR" rel="stylesheet">
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/main1.js"></script>
	
	<title>[ource]아이디/비밀번호 찾기</title>
	<script>
	$(function(){
	/* 아이디 찾기 */
	$("#btnIdSearch").bind("click", function(){
		/*  $(".contact100-form").attr("action", "idSearchSuccess.do");
		$('#btnIdSearch').blur();  */
		
		$.ajax({
			url : "idsearchok.do",
			type : "POST",
			data : {name : $("#InputName").val(), 
				    birth :  $("#InputBirth").val()},
			dataType : "json",
			success : function(data){
				if(data.memberVO == null){
					$("#aa").text("입력하신 이름 또는 생년월일이 일치하지 않습니다.\n확인 후 다시 입력해 주세요.");
					$("#myModal").modal("show");
					$('#btnClose').focus();
				}else{
					$("#aa").text("회원님의 아이디는 " + data.memberVO.userid + "입니다.");
					$("#myModal").modal("show");
					$('#btnClose').focus();
				}
			},
			error : function(a, b, c){
				console.log(a + b + c);
			}
		})
	
	});

	/* 아이디 확인 */
	$("#btnIdCheck").bind("click", function(){

		$.ajax({
			url : "idCheckOk.do",
			type : "POST",
			data : {userid : $("#InputId").val()},
			dataType : "json",
			success : function(data){
				if(data.memberVO == null){
					$("#aa").text("없는 아이디입니다.");
					$("#myModal").modal("show");
					$('#btnClose').focus();
				}else{
					$("#idCheckTest").text("아이디 확인에 성공하였습니다.");
					$("#searchpw").removeClass("hidden");
					$("#userquest").val("힌트 :  " + data.memberVO.quest);
					$("#InputId").prop("readonly", true);
				}
			},
			error : function(a, b, c){
				console.log(a + b + c);
			}
		})
	});
	
	/* 비밀번호 찾기 */
	$("#btnSearchPW").bind("click", function(){

		$.ajax({
			url : "pwCheckOk.do",
			type : "POST",
			data : {answer : $("#answer").val(), 
				    userid :  $("#InputId").val()},
			dataType : "json",
			success : function(data){
				if(data.memberVO == null){
					$("#aa").text("틀린 답입니다.");
					$("#myModal").modal("show");
					$('#btnClose').focus();
				}else{
					$("#aa").text("비밀번호는 " + data.memberVO.passwd + "입니다.");
					$("#myModal").modal("show");
					$('#btnClose').focus();
				}
			},
			error : function(a, b, c){
				console.log(a + b + c);
			}
		})
	});


	});
	</script>
</head>
<body>

<!--모달  -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
          <p id="aa">Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnClose">Close</button>
        </div>
      </div>
    </div>
  </div>
  
   <div class="logo_div"><a href="login.do"><img src="./images/logo_small.png"/></a></div> 
   
  <!--아이디찾기  -->
	<div class="container-contact100">
		<div class="wrap-contact100">
				<span class="contact100-form-title">
					아이디 찾기
				</span>

				<div class="wrap-input100 validate-input" data-validate="Please enter your name">
					<input class="input100" type="text" id="InputName" name="name" placeholder="이름을 입력하세요.">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Please enter your email: e@a.x">
					<input class="input100" type="text" name="birth" id="InputBirth" placeholder="생년월일을 입력하세요(EX : 19980607)">
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn"  style="margin-bottom:100px">
					<button class="contact100-form-btn" id="btnIdSearch">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							Find Your ID
						</span>
					</button>
				</div>
				</div>
			
			<!--비밀번호 찾기  -->
			<div class="wrap-contact101">
				<span class="contact100-form-title">
					비밀번호 찾기
				</span>

				<div class="wrap-input100 validate-input" data-validate="Please enter your name">
					<input class="input100" type="text" name="userid" id="InputId" placeholder="아이디를 입력하세요.">
					<span class="focus-input100"></span>
				</div>
				<div id=searchId align="center">
        		 <button type="button" class="btn btn-success" id="btnIdCheck">Check Your ID</button>
        		</div>
					
				<div id="searchpw" class="hidden">
                <div id="idCheckTest" align="left"> 아이디 확인에 성공하였습니다.</div>
                <div id="idCheckTest1" align="left"> 다음 힌트에 대한 답을 적으세요.</div>
				<div class="wrap-input100 validate-input">
					<input class="input100" type="text" id="userquest" name="quest" readonly="readonly">
					<span ></span>
				</div>

				<div class="wrap-input100 validate-input" >
					<input class="input100" type="text" id="answer" name="answer" placeholder="답">
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn" id="btnSearchPW">
						<span>
							<i class="fa fa-paper-plane-o m-r-6" aria-hidden="true"></i>
							Find Your Password
						</span>
					</button>
				</div>
				</div>
				</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script> 

</body>
</html>
    