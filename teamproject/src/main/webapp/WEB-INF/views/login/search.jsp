<!--아이디 & 비밀번호찾기 첫화면. ajax. 미완성  -->

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
	
	</style>
	<title>[ource]아이디/비밀번호 찾기</title>
	<script>
	  $(function(){
		  $("#SearchId").click(function(){
			  var data = {};
			  
			  data.name = $("[name=userName]").val();
			  data.birth = $("[birth=userBirth]").val();
			  $.ajax({
				  url : "searchId.do",
				  type : "POST",
				  data : data,
				  dataType : "JSON",
				  success : function(data){
					  
				  }
			  }) 
		  });
	  });
	</script>
</head>
	<body>
	  <div class="logo_div"><img src="./image/logo_small.png"/></div>
	  
	  <div class="container" align="center">
   <h2>아이디/비밀번호 찾기</h2>
   
   <ul id="myTab" class="nav nav-tabs" role="tablist">
     <li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">아이디 찾기</a></li>
     <li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">비밀번호 찾기</a></li>
   </ul>
   
   <div id="myTabContent" class="tab-content">
     <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
        <label for="exampleInputEmail1" id="IdLabel">이름</label>
        <input type="text" class="form-control" id="exampleInputEmail1" name="userName" placeholder="이름을 입력하세요">
        <label for="exampleInputEmail1" id="IdLabel">생년월일</label>
        <input type="text" class="form-control" id="exampleInputEmail1" name="userBirth" placeholder="생년월일을 입력하세요(ex: 19880105)">
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success" id="SearchId">아이디 찾기</button>
        </div>
     </div>
     
     <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
       <label for="exampleInputEmail1" id="PwLabel">아이디</label>
        <input type="text" class="form-control" id="exampleInputEmail1" placeholder="아이디를 입력하세요">
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success">아이디 확인</button>
        </div>
     </div>
     
   </div>
</div>

	
	</body>
</html>