 $(function(){
 /* <!--프로필 이미지 가져오는 스크립트-->*/

    var file1 = document.querySelector('#user_profile_img_search');
	file1.onchange = function () { 
    var fileList1 = file1.files ;
    var reader1 = new FileReader();
    reader1.readAsDataURL(fileList1 [0]);
    reader1.onload = function  () {
        document.querySelector('#user_profile_img').src = reader1.result ;
    }; 
}; 

   /*<!--프로필 이미지 가져오는 스크립트 끝-->
   
	<!--배경 이미지 가져오는 스크립트-->*/

    var file2 = document.querySelector('#user_profile_background_img_search');
	file2.onchange = function () { 
    var fileList2 = file2.files ;
    var reader2 = new FileReader();
    reader2.readAsDataURL(fileList2 [0]);
    reader2.onload = function  () {
        document.querySelector('#header').style.backgroundImage = 'url('+reader2.result+')' ;
    }; 
}; 
    // --배경 이미지 가져오는 스크립트 끝--
});