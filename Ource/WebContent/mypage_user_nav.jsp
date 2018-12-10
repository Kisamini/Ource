<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<c:set var="getId" value="${param.id }" scope="session"/>
<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ource" 
					password="ourvoice"
					var="conn"/>
    <script src="script/user_nav.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_nav.css">
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "friends">
            select a.user_id, a.user_name, b.profile_img from users a, user_profile_img b where a.user_id = b.id and a.user_id != ?
            <sql:param>${param.id}</sql:param>
         </sql:query>
</c:catch>
  <!--user navigation-->
        <div class="user_nav">
          <div class="menu">
            <ul>
                <li><a id="my_info" class="menu_active menulink" href="">내 정보</a></li>
                <li><a id="my_contents" class="menulink" href="">게시글</a></li>
            </ul>
          </div>
          <!--user menu end-->
          <!--user contents-->
          <div class="contents" id="contents">
			<iframe src="mypage_user_info.jsp" frameborder="0" width="100%" height="450" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>
          </div>
          <!--user contents end-->
        </div>
        <!--user navigation end-->
