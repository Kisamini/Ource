<!--비밀번호 찾을 때 아이디 확인하기. 미완성  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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
  
  
<c:if test="${!empty memberVO}">

	<script>
	$("#aa").text("아이디확인에 성공하였습니다.");
	$("#myModal").modal("show");
	$("#btnClose").click(function(){
		location.href="idSearch2.do"   
	});
	</script>
</c:if>

<c:if test="${empty memberVO.userid}">

	<script>
	$("#aa").text("존재하지 않는 아이디입니다.");
	$("#myModal").modal("show");
	$("#btnClose").click(function(){
		location.href="idSearch2.do"   
	});
	</script>
</c:if>