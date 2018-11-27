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
            <sql:param>test1</sql:param>
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
	            <img title="프로필 사진" id="user_profile_img" src="<c:url value='upload/${rs.profile_img}'/>" alt="프로필 사진" draggable="false">
	            </c:if>
              <br>
              <button title="정보 수정" id="user_profile_update" name="user_profile_update" class="replace">프로필 사진 변경</button>
        	</div>
        </div>
          <c:if test="${rs.background_img eq '0'}">
    <script>
    document.querySelector('#header').style.backgroundColor = "#FFF";
    </script>
    </c:if>
    <c:if test="${rs.background_img ne '0'}">
    <script>
    document.querySelector('#header').style.backgroundImage = "url('<c:url value="upload/${rs.background_img}"/>')" ;
    </script>
    </c:if>
        <!--user profile end-->
        </c:forEach>
