<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:forEach items="${mypageFollower}" var="isFollower">
<c:out value="${isFollower}"/>
<c:if test="${isFollower.memId eq sessionScope.sessionId}">
	<c:set var="yesfollower" value="${isFollower.memId}" scope="session" />
</c:if>
</c:forEach>
    <script src="script/user_profile.js"></script>
  	<link rel="stylesheet" type="text/css" href="css/user_profile.css">
   <!--user profile-->
        <div id="header">
        	<div class="user_profile"><br><br><br>
        		<c:if test="${mypageProfile.profileImg eq '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="images/default_user_profile_img.png" alt="프로필 사진" draggable="false">
	            </c:if>
	            <c:if test="${mypageProfile.profileImg ne '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="<c:url value='upload/${param.id}/${mypageProfile.profileImg}'/>" alt="프로필 사진" draggable="false">
	            </c:if>
              <br>
              <!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 같으면 추가 -->
              <c:if test="${param.id eq sessionScope.sessionId }">
  				<button title="프로필 이미지 수정" id="user_profile_update" name="user_profile_update" class="replace">프로필 사진 변경</button>
				</c:if>
				 <button id="follower_btn" class="follower" data-toggle="modal" data-target="#showModal" title="팔로워 명수">팔로워  ${mypageFollowerCount}</button>
				 <button id="following_btn" class="following" data-toggle="modal" data-target="#showModal" title="팔로잉 명수">팔로잉  ${mypageFollowingCount}</button>
			<!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 다르면 없음 --> 
            <c:if test="${param.id ne sessionScope.sessionId }">
            	<!-- 팔로우 전 -->
	           		<c:if test="${sessionScope.yesfollower ne sessionScope.sessionId}">
			  			<input type="button" value="팔로우 하기" id="user_do_follow" class="follow" title="팔로우 하기">
		  			</c:if>
            	<!-- 팔로우 후 -->
	            	<c:if test="${sessionScope.yesfollower eq sessionScope.sessionId}">
				  			<input type="button" value="팔로우 취소" id="user_donot_follow" class="unfollow" title="언 팔로우 하기" />
				  			<c:set var="yesfollower" value="" scope="session" />
	            	</c:if>
			</c:if>
        	</div>
        </div>
          <c:if test="${mypageProfile.backgroundImg eq '0'}">
    <script>
    document.querySelector('#header').style.backgroundColor = "#f2f2f2";
    </script>
    </c:if>
    <c:if test="${mypageProfile.backgroundImg ne '0'}">
    <script>
    document.querySelector('#header').style.backgroundImage = "url('<c:url value="upload/${param.id}/${mypageProfile.backgroundImg}"/>')" ;
    </script>
    </c:if>
        <!--user profile end-->

        <form id="goto_img_change" action="mypageChangeImg.do"><input type="hidden" name="id" id="paramID" value="${param.id}"/></form>
        



	<!-- 버튼 클릭시 팔로워 하고있는 사람의 정보를 modal로 보여줌 -->
	        <!-- Modal -->
<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="showModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="showModalTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <ul class="follow_list">
      <!-- follower list -->
		<c:if test="${mypageFollowerCount > 0}">
			<c:forEach items="${mypageFollower}" var="followerList">
	      		<c:if test="${followerList.profileImg eq '0'}">
			      <li class="follower_li"><a href="mypage.do?id=${followerList.memId}">
			      <img class="user_follower_img" draggable="false" src="images/default_user_profile_img.png" alt="친구 이미지">
			      ${followerList.userName}</a>
			      </li>
			 	</c:if>
			 	<c:if test="${followerList.profileImg ne '0'}">
			      <li class="follower_li"><a href="mypage.do?id=${followerList.memId}">
			      <img class="user_follower_img" draggable="false" src="<c:url value='upload/${followerList.memId}/${followerList.profileImg}'/>" alt="친구 이미지">
			      ${followerList.userName}</a>
			      </li>
			 	</c:if>
			 </c:forEach>
		</c:if>
		<!-- following list -->
		<c:if test="${mypageFollowingCount > 0}">
				<c:forEach items="${mypageFollowing}" var="followingList">
				<c:if test="${followingList.profileImg eq '0'}">
					<li class="following_li"><a href="mypage.do?id=${followingList.targetMemId}">
				      <img class="user_following_img" draggable="false" src="images/default_user_profile_img.png" alt="친구 이미지">
				      ${followingList.userName}</a>
				      </li>
				</c:if>
				<c:if test="${followingList.profileImg ne '0'}">
					<li class="following_li"><a href="mypage.do?id=${followingList.targetMemId}">
			      	<img class="user_following_img" draggable="false" src="<c:url value='upload/${followingList.targetMemId}/${followingList.profileImg}'/>" alt="친구 이미지">
			      	${followingList.userName}</a>
			      	</li>
			      </c:if>
			     </c:forEach>
		</c:if>
      	</ul>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
