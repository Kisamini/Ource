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

<!-- follow sql -->
	 <sql:query dataSource = "${conn}" var = "follower">
            select mem_id from user_follow where target_mem_id=?
            <sql:param>${param.id }</sql:param>
         </sql:query>
<!-- follow sql -->
<!-- show following user sql -->
	<c:forEach items="${follower.rows }" var="follower_users">
         <sql:query dataSource = "${conn}" var = "show_follower_user">
            select a.id, a.username, b.profile_img from user_profile a, user_profile_img b where a.id = b.id and a.id = ?
            <sql:param>${follower_users.mem_id}</sql:param>
         </sql:query>
     </c:forEach>
<!-- show following user sql -->
<!-- following sql -->
	 <sql:query dataSource = "${conn}" var = "following">
            select target_mem_id from user_follow where mem_id=?
            <sql:param>${param.id }</sql:param>
         </sql:query>
<!-- following sql -->
<!-- show following user sql -->
	<c:forEach items="${following.rows }" var="following_users">
         <sql:query dataSource = "${conn}" var = "show_following_user">
            select a.id, a.username, b.profile_img from user_profile a, user_profile_img b where a.id = b.id and a.id = ?
            <sql:param>${following_users.target_mem_id}</sql:param>
         </sql:query>
     </c:forEach>
<!-- show following user sql -->
</c:catch>
<c:forEach items="${show_following_user.rows}" var="show_following_users">
	<!-- 버튼 클릭시 팔로잉 하고있는 사람의 정보를 modal로 보여줌 -->
</c:forEach>
<c:forEach items="${show_follower_user.rows}" var="show_follower_users">
	<!-- 버튼 클릭시 팔로워 하고있는 사람의 정보를 modal로 보여줌 -->
</c:forEach>
<c:if test="${not(empty error1)}">
<p style="color:red;font-size:2em;">Error : ${error1}</p>
</c:if>
<c:forEach items="${profile.rows}" var="rs">

    <script src="script/jquery.min.js"></script>
    <script src="script/user_profile.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_profile.css">
  
   <!--user profile-->
        <div id="header">
        	<div class="user_profile">
            <br>
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
				 <button class="follower">팔로워  ${follower.rowCount}</button>
				 <button class="following">팔로잉  ${following.rowCount}</button>
			<!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 다르면 없음 --> 
            <c:if test="${param.id ne sessionScope.sessionId }">
            
            	<!-- 팔로우 전 -->
	           		<c:if test="${follower.rowCount eq 0}">
			            <form action="follow_ok.jsp" method="post">
				            <input type="hidden" name="id" value="${param.id }"/>
				  			<input type="submit" value="팔로우 하기" id="user_do_follow" class="follow" title="팔로우 하기" />
			  			</form>
		  			</c:if>
		  		<c:forEach items="${follower.rows}" var="follow">
            <!-- 팔로우 후 -->
	            	<c:if test="${!empty follow.mem_id}">
		            	<form action="unfollow_ok.jsp" method="post">
				            <input type="hidden" name="id" value="${param.id }"/>
				  			<input type="submit" value="팔로우 취소" id="user_donot_follow" class="unfollow" title="언 팔로우 하기" />
			  			</form>
	            	</c:if>
		  		</c:forEach>
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
