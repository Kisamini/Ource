<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ksm" 
					password="ource"
					var="conn"/>

<c:catch var="error1">
<!-- img file찾는 sql -->
	 <sql:query dataSource = "${conn}" var = "profile">
            select profile_img, background_img from user_profile_img where id=?
            <sql:param>${param.id }</sql:param>
         </sql:query>
<!-- img file찾는 sql -->

<!-- follower sql -->
	 <sql:query dataSource = "${conn}" var = "follower">
	 		select b.mem_id, a.username, c.profile_img
			from user_profile a, user_follow b, user_profile_img c
			where a.id = b.mem_id and b.mem_id = c.id and b.target_mem_id = ?
            <sql:param>${param.id }</sql:param>
         </sql:query>
<!-- follower sql -->
<!-- following sql -->
	 <sql:query dataSource = "${conn}" var = "following">
        	select b.target_mem_id, a.username, c.profile_img
			from user_profile a, user_follow b, user_profile_img c
			where a.id = b.target_mem_id and b.target_mem_id = c.id and b.mem_id = ?
            <sql:param>${param.id }</sql:param>
         </sql:query>
<!-- following sql -->
</c:catch>
<c:if test="${not(empty error1)}">
<p style="color:red;font-size:2em;">Error : ${error1}</p>
</c:if>
<c:forEach items="${profile.rows}" var="rs">
    <script src="script/user_profile.js"></script>
  	<link rel="stylesheet" type="text/css" href="css/user_profile.css">
   <!--user profile-->
        <div id="header">
        	<div class="user_profile">
            <br>
        		<br>
        		<br>
        		<c:if test="${rs.profile_img eq '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="images/default_user_profile_img.png" alt="프로필 사진" draggable="false">
	            </c:if>
	            <c:if test="${rs.profile_img ne '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="<c:url value='upload/${param.id}/${rs.profile_img}'/>" alt="프로필 사진" draggable="false">
	            </c:if>
              <br>
              <!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 같으면 추가 -->
              <c:if test="${param.id eq sessionScope.sessionId }">
  				<button title="프로필 이미지 수정" id="user_profile_update" name="user_profile_update" class="replace">프로필 사진 변경</button>
				</c:if>
				 <button id="follower_btn" class="follower" data-toggle="modal" data-target="#showModal">팔로워  ${follower.rowCount}</button>
				 <button id="following_btn" class="following" data-toggle="modal" data-target="#showModal" >팔로잉  ${following.rowCount}</button>
			<!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 다르면 없음 --> 
            <c:if test="${param.id ne sessionScope.sessionId }">
            
            	<!-- 팔로우 전 -->
	           		<c:if test="${follower.rowCount eq 0}">
			            <form action="follow_ok.jsp" method="post">
				            <input type="hidden" name="id" value="${param.id }"/>
				  			<input type="submit" value="팔로우 하기" id="user_do_follow" class="follow" title="팔로우 하기" />
			  			</form>
		  			</c:if>
            <!-- 팔로우 후 -->
	            	<c:if test="${follower.rowCount ne 0}">
		            	<form action="unfollow_ok.jsp" method="post">
				            <input type="hidden" name="id" value="${param.id }"/>
				  			<input type="submit" value="팔로우 취소" id="user_donot_follow" class="unfollow" title="언 팔로우 하기" />
			  			</form>
	            	</c:if>
			</c:if>
        	</div>
        </div>
          <c:if test="${rs.background_img eq '0'}">
    <script>
    document.querySelector('#header').style.backgroundColor = "#f2f2f2";
    </script>
    </c:if>
    <c:if test="${rs.background_img ne '0'}">
    <script>
    document.querySelector('#header').style.backgroundImage = "url('<c:url value="upload/${param.id}/${rs.background_img}"/>')" ;
    </script>
    </c:if>
        <!--user profile end-->
  </c:forEach>
        <form id="goto_img_change" action="mypage_profile_update.jsp"><input type="hidden" name="id" value="${param.id}"/></form>
        



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
      	<c:forEach items="${follower.rows}" var="show_follower_users">
      		<c:if test="${show_follower_users.profile_img eq '0'}">
		      <li class="follower_li"><a href="mypage_main.jsp?id=${show_follower_users.mem_id}">
		      <img class="user_follower_img" draggable="false" src="images/default_user_profile_img.png" alt="친구 이미지">
		      ${show_follower_users.username}</a>
		      </li>
		 	</c:if>
		 	<c:if test="${show_follower_users.profile_img ne '0'}">
		      <li class="follower_li"><a href="mypage_main.jsp?id=${show_follower_users.mem_id}">
		      <img class="user_follower_img" draggable="false" src="<c:url value='upload/${show_follower_users.mem_id}/${show_follower_users.profile_img}'/>" alt="친구 이미지">
		      ${show_follower_users.username}</a>
		      </li>
		 	</c:if>
	     </c:forEach>
	     <c:forEach items="${following.rows}" var="show_following_users">
			<!-- 버튼 클릭시 팔로잉 하고있는 사람의 정보를 modal로 보여줌 -->
			<c:if test="${show_following_users.profile_img eq '0'}">
				<li class="following_li"><a href="mypage_main.jsp?id=${show_following_users.target_mem_id}">
			      <img class="user_following_img" draggable="false" src="images/default_user_profile_img.png" alt="친구 이미지">
			      ${show_following_users.username}</a>
			      </li>
			</c:if>
			<c:if test="${show_following_users.profile_img ne '0'}">
				<li class="following_li"><a href="mypage_main.jsp?id=${show_following_users.target_mem_id}">
		      	<img class="user_following_img" draggable="false" src="<c:url value='upload/${show_following_users.target_mem_id}/${show_following_users.profile_img}'/>" alt="친구 이미지">
		      	${show_following_users.username}</a>
		      	</li>
		      </c:if>
		</c:forEach>
      </ul>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
