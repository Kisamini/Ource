$(function(){
   
      //user_nav menu event
      $("#my_info").bind('click',function(evt){
        evt.preventDefault();
        var $iframe1 = $('<iframe src="basicInfo.do" frameborder="0" width="100%" height="450" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>');
        $('#contents').empty();
        $('#contents').append($iframe1);
      });
      $('#my_contents').bind('click',function(evt){
        evt.preventDefault();
        var $iframe2 = $('<iframe src="contents.do" frameborder="0" width="100%" marginwidth="0" marginheight="0"  scrolling="yes"></iframe>');
        $('#contents').empty();
        $('#contents').append($iframe2);
      });      
      //user_nav menu event end
      
      //navigation click css
      $('.menulink').bind('click',function(evt){
      evt.preventDefault();
      $('.menulink').removeClass('menu_active');
      $(evt.target).addClass('menu_active');
    });
      //navigation click css
      
});