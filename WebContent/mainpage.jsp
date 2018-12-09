<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="top_navigation_bar.jsp" var="menu_bar" />
<c:url value="friendList.jsp" var="friendList_bar" />
<c:url value="myProfile.jsp" var="miniProfile_bar" />





<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewprot" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css_main/top_navigation_bar.css">
	<link rel="stylesheet" href="css_main/mainPageStyle.css">
	<link rel="stylesheet" href="css_shared/fontFamily.css">
<title>Insert title here</title>
</head>
<body>

<c:set var="sessionId" value="test1" scope="session"/>



<c:if test="${sessionScope.sessionId == null}">
	<script type="text/javascript">
		$(document).ready(function(){
			
			console.log("nosession");
			$('#alertBody').html('로그인 후 이용 해 주세요.');
			$('#alertType').attr('class', 'modal-content panel-warning');
			$('#alertModal').modal("show");
			
		});//document-ready
	</script>
</c:if>



<script type="text/javascript">
	$(document).ready(function(){
		
		var btnFol = "<button type='button' class='btn btn-primary' data-dismiss='modal'> 팔로우 하기</button>"
		var btnUnfol = "<button type='button' class='btn btn-primary' data-dismiss='modal'> 언팔로우 하기</button>"
		var btnBlock = "<button type='button' class='btn btn-primary' data-dismiss='modal'> 차단 하기 </button>"
		var btnBisit = "<button type='button' class='btn btn-primary' data-dismiss='modal'> 페이지 방문 </button>"
		var btnNothing = "<button type='button' class='btn btn-primary' data-dismiss='modal'> 아무것도 안하기 </button>"
	
		$('.followingItem').click(function(evt){
			evt.preventDefault();
			console.log($(this).text().trim());
			$('#modal_Fol_title').html($(this).text().trim() +'님과 무엇 을 할까요?');
			$('#modal_Fol_footer').html(btnUnfol + btnBlock + btnBisit + btnNothing);
			$('#modal_Fol').modal("show");
		});
		
		$('.followerItem').click(function(evt){
			evt.preventDefault();
			console.log($(this).text().trim());
			$('#modal_Fol_title').html($(this).text().trim() +'님과 무엇 을 할까요?');
			$('#modal_Fol_footer').html(btnFol + btnBlock + btnBisit + btnNothing);
			$('#modal_Fol').modal("show");
		});
	});//document-ready
</script>






<c:import url="${menu_bar}" />


<div id="mainPageContainer" class="container">
	  <div id='col-1' class="col-lg-2">
	  	<c:import url="${miniProfile_bar}"/>
	  </div>
	  <div class="col-lg-8">
	  	<div id="postSection_row_1">
	  	</div>
	  	<div id="postSection_row_2">
	  	</div>
	  </div>
	  <div class="col-lg-2">
	  	<div id="frirendSection_row_1">
	  		<c:import url="${friendList_bar}"/>
	  	</div>
	  </div>
</div>




<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="vertical-alignment-helper">
				<div class="modal-dialog vertical-align-center">
					<div id="alertType" class="modal-content panel-info">
						<div class="modal-header panel-heading">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true"> &times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 id="modalH4" class="modal=title"> 
								확인 메세지 
								
							</h4>
						</div>
						
						<div class="modal-body" id="alertBody">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="alertButton"> 확인 </button>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
</body>
</html>