<%@page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/boot.scss">
	
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<button id="myBtn" type="button" data-toggle="modal" data-target="#myModal">Open Modal</button>

<div class="modal fade" id="showModal" tabindex="-1" role="dialog" aria-labelledby="showModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="showModalTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <ul class="follow_list">
      	<li>테스트중</li>
      </ul>
      </div>
    </div>
  </div>
</div>

<%
	String root = request.getSession().getServletContext().getRealPath("/");

	File file = new File(root + "\\test");
	
	System.out.println(file.getAbsolutePath());
	System.out.println(file.mkdirs());
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script>
$(document).ready(function(){
    $("#myBtn").click(function(){
        $("#showModal").modal();
    });
});

</script>
</body>
</html>
