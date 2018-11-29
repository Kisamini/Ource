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
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "profile">
            select profile_img, background_img from user_profile_img where id=?
            <sql:param>${param.id }</sql:param>
         </sql:query>
</c:catch>
<c:if test="${not(empty error)}">
<p style="color:red;font-size:2em;">Error : ${error}</p>
</c:if>
<c:forEach items="${profile.rows}" var="rs">

    <script src="script/jquery.min.js"></script>
    <script src="script/user_nav.js"></script>
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
              <button class="follower">팔로워 ${follower}</button>
			<!-- 정보 수정은 자신만 할수있음으로 세션아이디와 파라미터 아이디가 다르면 없음 --> 
            <c:if test="${param.id ne sessionScope.sessionId }">
  				<input type="button" value="팔로우 하기" id="user_do_follow" class="follow" title="팔로우 하기" />
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
