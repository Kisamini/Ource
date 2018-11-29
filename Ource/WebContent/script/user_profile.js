$(function(){
        // 프로필 수정
      $("#user_profile_update").bind('click',function(){
        $("#goto_img_change").submit();
      });
      // 프로필 수정 끝
      //follow 할때
      $("user_do_follow").bind('click',function(){
        location.herf="follow_ok.jsp";
      });
      //follow 할때 끝
      //unfollow 할때
      $("user_donot_follow").bind('click',function(){
        location.herf="unfollow_ok.jsp";
      });
      //unfollow 할때 끝
});