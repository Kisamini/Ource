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
            select a.username, b.profile_img from user_profile a, user_profile_img b where a.id = b.id and a.id = ?
            <sql:param>${sessionScope.sessionId }</sql:param>
         </sql:query>
</c:catch>
<c:if test="${not(empty error)}">
<p style="color:red;font-size:2em;">Error : ${error}</p>
</c:if>
  <script src="script/user_top.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/top_nav.css">
 <!--top menu-->
        <div class="top_nav">
            <div class="go_home">
              &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.html"><img title="Goto Home" src="images/ource_logo3.png" alt="홈으로.." draggable="false"></a>
            </div> 
              <div class="top_search">
                <span class="icon"><i class="fa fa-search"></i></span>
                <input type="search" id="search" placeholder="Search..." />
              </div>
              <div class="top_goto_mypage">
              <c:forEach items="${profile.rows}" var="my">
                <c:if test="${my.profile_img eq '0'}">
                <a href="#"><img src="images/default_user_profile_img.png" draggable="false">${my.username}</a>
                <div class="top_dropdown">
                  <a href="mypage_main.jsp?id=${sessionScope.sessionId }">마이 페이지</a>
                  <a href="">내 정보</a>
                  <a href="logout.jsp">로그아웃</a>
                </div>
                </c:if>
                <c:if test="${my.profile_img ne '0'}">
                <a href="#"><img src="<c:url value='upload/${sessionScope.sessionId}/${my.profile_img}'/>" draggable="false">${my.username}</a>
                <div class="top_dropdown">
                  <a href="mypage_main.jsp?id=${sessionScope.sessionId }">마이 페이지</a>
                  <a href="">내 정보</a>
                  <a href="logout.jsp">로그아웃</a>
                </div>
                </c:if>
                </c:forEach>
              </div>
            <div class="top_items">
               <a href=""><i class="fas fa-bell fa-2x"></i></a>&nbsp;&nbsp;&nbsp;
               <a href=""><i class="fas fa-user fa-2x"></i></a>&nbsp;&nbsp;&nbsp;
               <a href=""><i class="fas fa-comments fa-2x"></i></a>
            </div>

        </div> 
<!--top menu end--> 