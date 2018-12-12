$(function(){
  var followingLi = $('.following_li').remove();
  var followerLi = $('.follower_li').remove();
  var paramID = $('#paramID').val();
  $("#showModalTitle").css("text-align","center");
        // 프로필 수정
      $("#user_profile_update").bind('click',function(){
        $("#goto_img_change").submit();
      });
      // 프로필 수정 끝
      //follow 할때
      $("#user_do_follow").bind('click',function(){
         $.ajax({   
            type : "POST",
            url : "follow.do",
            data : {id : paramID},
            error : function(err){
                console.log(err);
            },
            success : function(data){
                location.reload();
            }  
        });
      });
      //follow 할때 끝
      //unfollow 할때
      $("#user_donot_follow").bind('click',function(){
         $.ajax({             
            type : "POST",
            url : "unfollow.do",
            data : {id : paramID},
            error : function(err){
                console.log(err);
            },
            success : function(data){
                location.reload();
            }         
        });
      });
      //unfollow 할때 끝

      $("#follower_btn").bind('click',function(){
        $(".follow_list").html(followerLi);
        $("#showModalTitle").html("팔로워");
        $('#showModal').modal('show');
      });

      $("#following_btn").bind('click',function(){
        $(".follow_list").html(followingLi);
        $("#showModalTitle").html("팔로잉");
        $('#showModal').modal('show');
      });
});