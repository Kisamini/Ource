<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>[ource]게시글 작성</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"	href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="vendor/noui/nouislider.min.css">
<link href="https://fonts.googleapis.com/css?family=Arimo|Karla|Nanum+Pen+Script|PT+Sans+Narrow" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/write.css">
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/animsition/js/animsition.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<script src="vendor/countdowntime/countdowntime.js"></script>
<script src="vendor/noui/nouislider.min.js"></script>
<script src="js/dropzone.js"></script>
<script src="js/main.js"></script>
</head>
<body>
	<!--모달  -->
	<div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-body">
	          <p id="aa">Some text in the modal.</p>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnClose">Close</button>
	        </div>
	      </div>
	    </div>
	  </div>

	<!--글작성하기 화면  -->
	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form" action="fileUpload.do" method="post" enctype="multipart/form-data">
				<span class="contact100-form-title"> 글 작성하기 </span>
				
				<!--프로필사진, 아이디, 공유설정 div  -->
				<div id="profileDiv">
					<div id="profilebox">
						<!--프로필사진  -->
						<div class="wrap-profile bg1"><img id="proImg" src="upload/${profile.USER_ID}/${profile.PROFILE_IMG}"/></div>
						<!--아이디 -->
						<div class="wrap-id">${profile.USER_ID}</div>
					</div>
					<!--공유설정  -->
				   <div class="wrap-share input100-select bg1">
						<select class="js-select2" name="share">
							<option value="공개">공개</option>
							<option value="나만보기">나만 보기</option>
						</select>
					 <div class="dropDownSelect2"></div>
					</div> 
					</div>
					
				 <!--사진 올리기 div  --> 	
				 <div class="dropzone" id="my-awesome-dropzone">
					<div class="dz-default dz-message file_up pointer">
				      <div class="dz-message text-center alert alert-danger">
                        <h3 id="shareText"><strong>사진선택 (최대 10장)</strong></h3> 
                      </div> 
					</div>
                 </div>  
                           
                 <!--글 작성 div  -->      
                 <div class="wrap-input100 validate-input bg0 rs1-alert-validate" data-validate="Please Type Your Message">
					<span class="label-input100">Message</span>
					<textarea class="input100" name="message" placeholder="Your message here..."></textarea>
				</div>
                        
				<!--공유하기 버튼 div  -->
				<div class="container-contact100-form-btn">
					<button type="button" class="contact100-form-btn">
						<span> 공유하기 <i class="fa fa-long-arrow-right m-l-7" 	aria-hidden="true"></i></span>
					</button>
				</div>
			
			</form>
		</div>
	</div>

    <!--참고 : 이미지는 폼 밑으로 빠져나오게 됨. 그래서  폼에 담아서 넘겨줘야 한다. -->
    
    <!--사용자가 저장한 프로필사진을  프로필사진 칸에 맞게 변경  -->
	<script>
	$(window).on("load", function(){
		var img = $("#proImg")[0];
		var imgWidth = img.width;
		var imgHeight = img.height;
		var rate = 0;
		if((imgWidth < 60 && imgHeight < 60) ||(imgWidth > 60 && imgHeight > 60)){
			rate = imgWidth < imgHeight ? 60/imgWidth : 60/imgHeight;
		}else if(imgWidth > 60 && imgHeight <60){
			rate = 60/imgHeight;
		}else{
			rate = 60/imgWidth;
		}
		imgWidth = img.width = rate * imgWidth;
		imgHeight = img.height = rate * imgHeight;
	    
	    if(imgWidth > imgHeight){
	    	$(img).css("margin-left", -((imgWidth-60)/2));
	    }else{
	    	$(img).css("margin-top", -((imgHeight-60)/2));
	    }
	})
	</script>
	
	<!--공유타입  -->
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});

			$(".js-select2").each(function() {
				$(this).on('select2:close', function(e) {
					if ($(this).val() == "Please chooses") {
						$('.js-show-service').slideUp();
					} else {
						$('.js-show-service').slideUp();
						$('.js-show-service').slideDown();
					}
				});
			});
		})
	</script> 


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>
	
 <script>
	Dropzone.options.myAwesomeDropzone={
			autoProcessQueue : false,
		    url: "fileUpload.do", // 드롭다운 시 업로드 되는 URL
		    maxFilesize: 300, // 드롭다운 시 파일 크기
		    paramName: "userfile", // input file="user_file"
		    maxThumbnailFilesize: 1, // 섬네일 사이즈 인데 안보여 줄거니까 1정도
		    /* previewsContainer: ".dropzone-previews", // 섬네일 보여주는 Container class */
		    maxFiles: 10,
		    addRemoveLinks : true,
		    acceptedFiles: ".jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF",
		    init: function() {
		    
		      var dropzone = this;
		      var contentsNum;
		      var imgSeq = [];
		      this.on("addedfile", function(file){
		    	  var $file_up = $(".file_up");
				  var $dz_image = $(".dz-image");
				  var dz_image_length = $dz_image.length;
				  var maxImgSize = 10;
				  
				  if(dz_image_length > maxImgSize) {
						
						var $file_up = $(".file_up");
						
						this.removeFile(file);
						$file_up.hide();
						return;
					}
				  
				  if(dz_image_length >= maxImgSize) {
						
						$file_up.hide();
					} else {
						
						$file_up.show();
					}
		      })
		      this.on('success', function(file, json) {
		          // 파일이 서버에 업로드가 완료 되었 을때
		          var res = JSON.parse(json);
		 
		          if(res){
		        	  imgSeq.push(res);
		        	  if(imgSeq.length == $(".dz-preview").length){
		        		  $.ajax({
				    		  url : "contentsUpload.do",
				    		  dataType : "json",
				    		  data : JSON.stringify({"postsContents" : $("[name=message]").val(),
				    			      "shareType" : $("[name=share] option:selected").val(),
				    			      "imgSeq" : imgSeq}),
				    		  type : "POST",
				    		  contentType : "application/json",
				    		  success : function(data){
				    			  contentsNum = data;
				    			  $("#aa").text("게시글 작성이 완료되었습니다.");
								  $("#myModal").modal("show");	
								  
								  $("#myModal").on('hide.bs.modal', function(e){

									  location.href = "mypage.do"   //게시글 올리고나서 이동할 페이지 이름(임의로 저장함)
										e.stopImmediatePropagation();
									});
				    		  },
				    		  error : function(){
				    		  }
				    	  })
		        	  }
		          } else {
		              // 만약에 OK 가 아니라면???
		              $("#file-dropzone").show();
		              $(".upload-progress").hide();
		              alert(res.msg);
		          }
		          console.log(json);
		      });

		       
		      this.on('drop', function(file) {
		          // 파일이 드롭되면Upload Progress 나와줘야 된다.
		          $("#file-dropzone").hide();
		          $(".upload-progress").show();
		      });
		      
		      $(".contact100-form-btn").click(function(){
		    	  if($(".dz-preview").length == 0){
		    		  $("#aa").text("사진을 한 장 이상 선택해주세요.");
					  $("#myModal").modal("show");	 
					  return;
		    	  }
		    	  dropzone.processQueue();
				})
		    }
		  }
	</script>

</body>
</html>
