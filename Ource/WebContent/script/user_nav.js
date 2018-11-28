$(function(){
        // 프로필 수정
      $("#user_profile_update").bind('click',function(){
        $("#goto_img_change").submit();
      });
      // 프로필 수정 끝
      //user_nav menu event
      $("#my_info").bind('click',function(evt){
        evt.preventDefault();
        var $iframe1 = $('<iframe src="mypage_user_info.jsp" frameborder="0" width="100%" height="450" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>');
        $('#contents').empty();
        $('#contents').append($iframe1);
      });
      $('#my_contents').bind('click',function(evt){
        evt.preventDefault();
        var $iframe2 = $('<iframe src="mypage_contents.jsp" frameborder="0" width="100%" height="450" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>');
        $('#contents').empty();
        $('#contents').append($iframe2);
      });      
      //user_nav menu event end
});