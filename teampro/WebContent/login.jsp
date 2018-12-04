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

<c:set var="flag" value="${sc.loginUser(param.userID, param.userPW)}" />
<c:set var="member" value="${sc.selectUser(param.userID)}" />

<c:if test="${flag eq 1}">
<%
	session.setAttribute("userid", request.getParameter("userID"));
	MemberVO member = sc.selectUser(request.getParameter("userID"));
%>
	<script>
	$("#aa").text("${param.userID}님! 환영합니다.");
	$("#myModal").modal("show");
	$("#btnClose").click(function(){
		location.href = "page.jsp";    //로그인하고 나서 페이지.임의로 만듦
	});
	</script>
</c:if>
<c:if test="${flag eq -1}">
	<script>
	    $("#aa").text("입력하신 계정은 존재하지 않습니다.\n확인 후 다시 입력해 주세요.");
	    $("#myModal").modal("show");
	    $("#btnClose").click(function(){
			location.href = "login1.jsp";
		});
		
	</script>
</c:if>
<c:if test="${flag eq 0}">
	<script>
	$("#aa").text("비밀번호가 일치하지 않습니다.\n확인 후 다시 입력해 주세요.");
	$("#myModal").modal("show");
	$("#btnClose").click(function(){
		location.href = "login1.jsp";
	});
		
	</script>
</c:if>
 