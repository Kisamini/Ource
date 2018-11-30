<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="script/jquery.min.js"></script>
<script src="script/user_info.js"></script>
<link rel="stylesheet" type="text/css" href="css/user_info.css">
  <div class="user_info">
  <div>
      <label for="inputName">이름</label>
      <input type="text" class="input" id="inputName" readonly>
    </div>
    <div>
      <label for="inputAge">나이</label>
      <input type="text" class="input" id="inputAge" readonly="readonly">
    </div>
    <div>
      <label for="inputGender">성별</label>
      <input type="text" class="input" id="inputGender" readonly="readonly">
    </div>
    <div>
      <label for="inputAddress">주소</label>
      <input type="text" class="input" id="inputAddress" readonly="readonly">
    </div>
    <div>
      <label for="inputPhone">핸드폰</label>
      <input type="text" class="input" id="inputPhone" readonly="readonly">
    </div>
    <div class="user_info_more_btn">
    <a href=""><img src="images/more1.png" title="더보기" draggable="false"/></a>
    </div>
  </div>