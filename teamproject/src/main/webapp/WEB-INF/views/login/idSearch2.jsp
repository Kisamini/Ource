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
	  body{background-image: url("./image/bg4.png")}
	  .container{background-image: url("./image/bg5.png")}
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
$("#btnIdCheck").bind("click", function(){
	$(".idsearchform").attr("action", "idCheckOk.do");
})

});
</script>


</head>
<body>
	 <div class="logo_div"><img src="./image/ource_logo3_resized.png"/></div>
	  
	  <div class="container" align="center">
	  <form method="post" class="idsearchform">
   <div align="right">
   <button type="submit" class="btn btn-success" id="btnGoToLogin">로그인화면으로 이동</button>
   </div>
  
     <!--아이디 찾기  -->
   <ul id="myTab" class="nav nav-tabs" role="tablist">
     <li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">아이디 찾기</a></li>
   </ul>
   
   <div id="myTabContent" class="tab-content">
     <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
        <label for="exampleInputEmail1" id="IdLabel">이름</label>
        <input type="text" class="form-control" id="InputName" name="name" placeholder="이름을 입력하세요"/>
        <label for="exampleInputEmail1" id="IdLabel">생년월일</label>
        <input type="text" class="form-control" id="InputBirth" name="birth" placeholder="생년월일을 입력하세요(ex: 19880105)"/>
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success" id="btnIdSearch">아이디 찾기</button>
        </div>
     </div>
     
     
        <!--비밀번호 찾기  -->
     <ul id="myTab1" class="nav nav-tabs" role="tablist">
     <li role="presentation" class="active"><a data-target="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">비밀번호 찾기</a></li>
    </ul>
  
      <div id="myTabContent1" class="tab-content">
     <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
       <label for="exampleInputEmail1" id="PwLabel">아이디</label>
        <input type="text" class="form-control" name="userid" id="InputId" placeholder="아이디를 입력하세요"/>
        <div id=searchId align="right">
         <button type="submit" class="btn btn-success" id="btnIdCheck">아이디 확인</button>
        </div>
        <div class="idCheckok">
         <div id="idCheckTest" align="left"> 아이디 확인에 성공하였습니다.</div>
         <div id="quest">
        <label for="exampleInputEmail1" id="PwLabel">다음 힌트에 대한 답을 적으세요.</label>
         <input type="text" class="form-control" id="quest" name="quest"/>
        <label for="exampleInputEmail1" id="PwLabel">답 :</label>
         <input type="text" class="form-control" id="answer" name="answer"/>
         </div>
        </div>
        <div id=searchPW align="right">
         <button type="submit" class="btn btn-success" id="btnSearchPW">비밀번호 찾기</button>
        </div>
     </div>
     </div>
     
   </div>
   </form>
</div>
</body>
</html>