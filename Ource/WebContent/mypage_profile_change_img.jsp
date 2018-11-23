<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="script/jquery.min.js"></script>
    <script src="script/get_img.js"></script>
    <link rel="stylesheet" type="text/css" href="css/user_profile.css">
 <div id="header">
          <div id="user_profile">
            <button class="replace">배경 이미지 변경</button>
            <form enctype="multipart/form-data" action="mypage_change_img.jsp" method="get">
            <input type="file" id="user_profile_background_img_search" name="user_profile_background_img_search" accept="image/*" class="upload change_img">
            <br>
            <br>
            <br>
            <br>
              <img id="user_profile_img" name="user_profile_img" src="images/default_user_profile_img.png" alt="프로필 이미지">
              <br><button class="replace">프로필 이미지 변경</button>
              <input type="file" id="user_profile_img_search" name="user_profile_img_search" accept="image/*" class="upload change_img"/>
              <input type="submit" title="수정" id="user_profile_update_set" class="replace" value="수정 완료"/>
            </form>
          </div>
        </div> 