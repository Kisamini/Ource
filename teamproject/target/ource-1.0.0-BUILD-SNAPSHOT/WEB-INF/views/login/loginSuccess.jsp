<!--로그인 성공화면  -->

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
	$("#aa").text("${memberVO.name}님! 환영합니다.");
	$("#myModal").modal("show");
	$('#btnClose').focus();
	$("#btnClose").click(function(){
		location.href = "page.jsp";    
	});
	
	</script>
</c:if>
<c:if test="${empty memberVO.name}">
	<script>
	    $("#aa").text("아이디 혹은 비밀번호가 잘못되었습니다.\n확인 후 다시 입력해 주세요.");
	    $("#myModal").modal("show");
	    $('#btnClose').focus();
	    $("#btnClose").click(function(){
			location.href = "login.do";
		});
		
	</script>
</c:if>

 