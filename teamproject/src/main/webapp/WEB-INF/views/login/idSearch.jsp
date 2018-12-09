<!--아이디, 비밀번호 찾기 첫화면. 아이디 찾기만 완성  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
$("#btnIdSearch").bind("click", function(){
	$(".idsearchform").attr("action", "idSearchSuccess.do");
});

$("#btnGoToLogin").bind("click", function(){
	$(".idsearchform").attr("action", "login.do");
});

$("#btnGoToLogin1").bind("click", function(){
	$(".idsearchform").attr("action", "login.do");
});
});
</script>

<%-- <c:if test="${!empty memberVO.userid}"> --%>
<script>
$(function(){
	$("#btnIdCheck").bind("click", function(){
		
			 $(".idCheckok").style.visibility = 'none';
		 
	})

});
</script>
<%-- </c:if> --%>

</head>
<body>
	 <div class="logo_div"><img src="./image/logo_small.png"/></div>
	  
	  <div class="container" align="center">
	  <form method="post" class="idsearchform">
   <h2>아이디/비밀번호 찾기</h2>
   
   <ul id="myTab" class="nav nav-tabs" role="tablist">
     <li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">아이디 찾기</a></li>
     <li role="presentation" class=""><a data-target="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="false">비밀번호 찾기</a></li>
   </ul>
   
   <!--아이디 찾기  -->
   <div id="myTabContent" class="tab-content">
     <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
        <label for="exampleInputEmail1" id="IdLabel">이름</label>
        <input type="text" class="form-control" id="InputName" name="name" placeholder="이름을 입력하세요"/>
        <label for="exampleInputEmail1" id="IdLabel">생년월일</label>
        <input type="text" class="form-control" id="InputBirth" name="birth" placeholder="생년월일을 입력하세요(ex: 19880105)"/>
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success" id="btnGoToLogin">로그인화면으로 이동</button>
         <button type="submit" class="btn btn-success" id="btnIdSearch">아이디 찾기</button>
        </div>
     </div>
     
     
     <!--비밀번호 찾기  -->
     <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
       <label for="exampleInputEmail1" id="PwLabel">아이디</label>
        <input type="text" class="form-control" id="InputId" placeholder="아이디를 입력하세요"/>
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success" id="btnIdCheck">아이디 확인</button>
        </div>
        <div class="idCheckok">
         <div id="idCheckTest" align="left"> 아이디 확인에 성공하였습니다.</div>
         <div>
        <label for="exampleInputEmail1" id="PwLabel">다음 질문에 답하세요.</label>
         <input type="text" class="form-control" id="exampleInputEmail1"/>
        <label for="exampleInputEmail1" id="PwLabel">답</label>
         <input type="text" class="form-control" id="exampleInputEmail1"/>
         </div>
        <div align="right">
         <button type="submit" class="btn btn-success" id="btnGoToLogin1">로그인화면으로 이동</button>
        </div>
        </div>
     </div>
     
   </div>
   </form>
</div>
</body>
</html>