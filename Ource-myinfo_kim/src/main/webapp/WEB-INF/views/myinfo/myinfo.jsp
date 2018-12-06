<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<link rel="stylesheet" href="css/myinfo/myinfo.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보</title>

</head>
<body>
	<div id="contents">
		<ul class="profile_menu">
			<li><a href="#" class="pageMove nonPageMove">프로필 보기</a></li>
			<li><a href="#" id="myinfoUpdate" class="pageMove">프로필 수정</a></li>
		</ul>
		<article>
			<div class="myinfo profile" data-user-number="<c:out value="${myinfo.userNumber}"/>">
				<span class="columnName"><img src="images/default_profile.jpg"></span>
				<span class="profileValue"><c:out value="${myinfo.userId}"/></span>
			</div>
			<div class="myinfo">
				<span class="columnName">이름</span>
				<span class="profileValue"><c:out value="${myinfo.userName}"/></span>
			</div>
			<div class="myinfo">
				<span class="columnName">성별</span>
				<span class="profileValue">
					<c:if test="${myinfo.userGender eq 'M'}">남성</c:if>
					<c:if test="${myinfo.userGender eq 'F'}">여성</c:if>
				</span>	
			</div>
			<div class="myinfo">
				<span class="columnName">생년월일</span>
				<span class="profileValue"><c:out value="${myinfo.userBirth}"/></span>
				
			</div>
			
			<div class="myinfoLine"></div>
			
			<c:forEach items="${userInfoTypeList}" var="infoType">
				<div class="myinfoDetailTemplate">
					<p><c:out value="${infoType.typeName}"/></p>
					<div class="myinfoCon" data-type-num="<c:out value='${infoType.typeNum}'/>" data-type-name="<c:out value='${infoType.typeName}'/>">
						<!-- <div class="myinfoDetailClick"><i class="fas fa-plus"></i></div> -->
						<%-- <div class="myinfoTypeName"><c:out value="${infoType.typeName}"/><span>추가</span></div> --%>
					</div>
				</div>
				
				 <c:set var="count" value="1"/>
							
				<c:forEach items="${myinfo.userInfoDetail}" var="userDetail">
					<c:if test="${userDetail.uinfoType eq infoType.typeNum}">
						<div class="userinfoDetail" data-uinfo-num="<c:out value='${userDetail.uinfoNum}'/>">
							<p><c:out value="${userDetail.uinfoName}"/></p>
							<div class="detailBtnCon">
								<!-- <button class="detailUploadBtn">수정</button>
								<button class="detailDeleteBtn">삭제</button> -->
							</div>
						</div>
						
						<c:set var="count">${count + 1}</c:set>
					</c:if>
				</c:forEach>
			</c:forEach>
		</article>
	</div> 
	
	<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="showModalTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="showModalTitle">내정보 페이지</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <ul class="follow_list">
	      	<li class="model-contents"></li>
	      </ul>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="js/myinfo/jquery_1.12.4_min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/myinfo/myinfo.js"></script>
	<script>
		$(function(){
			$('#myinfoUpdate').click(function(){
					location.href="myinfoUpdate.do?userid=${param.userid}";
			});
		});
	</script>
</body>
</html>