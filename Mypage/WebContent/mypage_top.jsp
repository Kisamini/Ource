<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/top_nav.css">
 <!--top menu-->
         <div class="top_nav">
            <div class="go_home">
              &nbsp;&nbsp;&nbsp;&nbsp;<a href="index.html"><img title="Goto Home" src="images/logo_background_transparent.png" alt="홈으로.."></a>
            </div> 
              <div class="top_search">
                <span class="icon"><i class="fa fa-search"></i></span>
                <input type="search" id="search" placeholder="Search..." />
              </div>
            <div class="top_logout">
               ${username} 님 <a href="logout.jsp">Sign out</a>
            </div>
        </div>
<!--top menu end-->