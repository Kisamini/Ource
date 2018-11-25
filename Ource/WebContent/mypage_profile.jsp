<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
    request.setCharacterEncoding("UTF-8");
    // 파일 업로드된 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    String savePath = root + "upload";
%>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ksm" 
					password="ource"
					var="conn"/>
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "profile">
            select pro.id, pro.name, img.profile_img, img.background_img 
            from user_profile pro, user_profile_img img 
            where pro.id = img.id
         </sql:query>
</c:catch>
    <script src="script/jquery.min.js"></script>
    <script src="script/user_nav.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_profile.css">
    <c:if test="${profile.row.background_img eq 0}">
    <script>
    document.querySelector('#header').style.backgroundColor = '#999';
    </script>
    </c:if>
    <c:if test="${profile.row.background_img ne 0}">
    <script>
    document.querySelector('#header').style.backgroundImage = "url('<%=savePath %>/${profile.row.background_img}')" ;
    </script>
    </c:if>
   <!--user profile-->
        <div id="header">
        	<div id="user_profile">
            <br>
            <br>
        		<br>
        		<br>
        		<c:if test="${profile.row.profile_img eq 0}">
	            <img title="프로필 사진" id="user_profile_img" src="images/default_user_profile_img.png" alt="프로필 사진">
	            </c:if>
	            <c:if test="${profile.row.profile_img ne 0}">
	            <img title="프로필 사진" id="user_profile_img" src="<%=savePath %>/${profile.row.profile_img}" alt="프로필 사진">
	            </c:if>
              <br>
              <button title="정보 수정" id="user_profile_update" name="user_profile_update" class="replace">프로필 사진 변경</button>
        	</div>
        </div>
        <!--user profile end-->
