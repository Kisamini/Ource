<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/top_navigation_bar.css">
 
 
 
 
 
 
        <div class="top_nav">
            <div class="go_home">
              <a href="index.html">
              	<img src="images/ource_logo3_resized.png" alt="홈으로.." draggable="false" id="logoHome" title="메인으로"/>
              </a>
            </div> 
              <div class="top_search">
                <span class="icon"><i class="fa fa-search"></i></span>
                <input type="search" id="search" placeholder="Search..." />
              </div>
              
              <div class="top_goto_mypage"> 
                <c:if test="${mypageTop.profileImg eq '0'}">
                <a id="dropDownHref2" href="mypage.do?id=${sessionScope.sessionId}"><img src="images/default_user_profile_img.png" draggable="false" title="마이페이지로">${mypageTop.userName}</a>
                </c:if> 
                <c:if test="${mypageTop.profileImg ne '0'}">
                <a href="mypage.do?id=${sessionScope.sessionId}"><img src="<c:url value='upload/${sessionScope.sessionId}/${mypageTop.profileImg}'/>" draggable="false" title="마이페이지로">${mypageTop.userName}</a>
                </c:if>
                <div class="top_dropdown">
                  <a id="dropDownHref" href="mypage.do?id=${sessionScope.sessionId }" title="마이페이지로">마이 페이지</a>
                  <a id="dropDownHref" href="" title="내정보 보기">내 정보</a>
                  <a id="dropDownHref" href="logout.do" title="로그아웃">로그아웃</a>
                </div>
              </div>
              
            <div class="top_items">
               <a href=""><i class="fas fa-bell fa-2x"></i></a>&nbsp;&nbsp;&nbsp;
               <a href=""><i class="fas fa-user fa-2x"></i></a>&nbsp;&nbsp;&nbsp;
               <a href=""><i class="fas fa-comments fa-2x"></i></a>
            </div>

        </div> 