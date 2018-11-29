<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="info" value="${param.id }" scope="session"/>
    <script src="script/jquery.min.js"></script>
    <script src="script/user_nav.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_nav.css">

  <!--user navigation-->
        <div class="user_nav">
          <div class="menu">
            <ul>
                <li><a id="my_info" class="menulink" href="">내 정보</a></li>
                <li><a id="my_contents" class="menulink" href="">게시글</a></li>
                <li><a class="menulink" href="">menu</a></li>
                <li><a class="menulink" href="">menu</a></li>
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
