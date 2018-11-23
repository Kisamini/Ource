$(function(){
        // 프로필 수정
      $('#user_profile_update').bind('click',function(){
        location.href="mypage_profile_update.jsp";
      });
      // 프로필 수정 끝
      //user_nav menu event
      $('#my_info').bind('click',function(evt){
        evt.preventDefault();
        var $iframe = $('<iframe src="mypage_user_info.jsp" frameborder="0" width="100%" height="450" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>');
        $('#contents').empty();
        $('#contents').append($iframe);
      });
      //user_nav menu event end
});