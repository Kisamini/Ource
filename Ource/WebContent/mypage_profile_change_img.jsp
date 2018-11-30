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
            <sql:param>${sessionScope.sessionId}</sql:param>
         </sql:query>
</c:catch>
<c:forEach items="${profile.rows}" var="rs">
    <script src="script/get_img.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_profile.css">
 <div id="header">
          <div class="user_profile">
            <button class="replace">배경 이미지 변경</button>
            <form enctype="multipart/form-data" action="mypage_change_img.jsp?id=${sessionScope.sessionId}" method="post">
            <input type="file" id="user_profile_background_img_search" name="user_profile_background_img_search" accept="image/*" class="upload change_img">
            <br>
            <br>
            <br>
            <c:if test="${rs.profile_img eq '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="images/default_user_profile_img.png" alt="프로필 사진" draggable="false">
	            </c:if>
	            <c:if test="${rs.profile_img ne '0'}">
	            <img title="프로필 사진" id="user_profile_img" src="<c:url value='upload/${sessionScope.sessionId}/${rs.profile_img}'/>" alt="프로필 사진" draggable="false">
	            </c:if>
              <br><button class="replace">프로필 이미지 변경</button>
              <input type="file" id="user_profile_img_search" name="user_profile_img_search" accept="image/*" class="upload change_img"/>
              <input type="submit" title="수정" id="user_profile_update_set" class="replace" value="수정 완료"/>
            </form>
          </div>
        </div> 
    <c:if test="${rs.background_img eq '0'}">
    <script>
    document.querySelector('#header').style.backgroundColor = '#f2f2f2';
    </script>
    </c:if>
    <c:if test="${rs.background_img ne '0'}">
    <script>
    document.querySelector('#header').style.backgroundImage ="url('<c:url value="upload/${sessionScope.sessionId}/${rs.background_img}"/>')" ;
    </script>
    </c:if>
        </c:forEach>
