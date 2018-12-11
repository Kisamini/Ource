<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.SelectController" />
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

<% String userId = sc.userIdSelect(request.getParameter("userName"), Integer.parseInt(request.getParameter("userBirth")));%> 

<% if(userId != null){ %>

	<script>
	$("#aa").text("회원님의 아이디는 ${userid} 입니다.");
	$("#myModal").modal("show");
	$("#btnClose").click(function(){
		location.href = "login.jsp";
	});
	</script>
<%} %>

<% if(userId == null){ %>
	<script>
	    $("#aa").text("입력하신 이름 또는 생년월일이 올바르지 않습니다.\n확인 후 다시 입력해 주세요.");
	    $("#myModal").modal("show");
	    $("#btnClose").click(function(){
			location.href = "search.jsp";
		});		
	</script>
<%} %>
