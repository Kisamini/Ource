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
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link href="https://fonts.googleapis.com/css?family=Arimo|Karla|Nanum+Pen+Script|PT+Sans+Narrow" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://rawgit.com/enyo/dropzone/master/dist/dropzone.css">
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


	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form dropzone"
				id="my-awesome-dropzone" action="test">
				<span class="contact100-form-title"> 글 작성하기 </span>

				<div id="profileDiv">
					<div id="profilebox">
						<!--프로필사진  -->
						<div class="wrap-profile bg1"></div>
						<!--아이디 -->
						<div class="wrap-id">wofwjeife</div>
					</div>
					<!--공유설정  -->
					<div class="wrap-share input100-select bg1">
						<select class="js-select2" name="service">
							<option>공개</option>
							<option>나만 보기</option>
						</select>
						<div class="dropDownSelect2"></div>
					</div>
				</div>

				<!-- <div class="wrap-input100 validate-input bg1"
					data-validate="Please Type Your Name">
					<span class="label-input100 label-input101">
					<input type="file" id="fileUpload" name="file" size="50" />
					 </span>
				</div> -->
				<div class="wrap-input100 validate-input bg1">
					<form action="/upload" class="dropzone" drop-zone="" id="file-dropzone">
                         
                            <div class="dz-message text-center alert alert-danger">
                                <h3><strong>사진선택</strong></h3>
                            </div>
                         
                          </form>
				</div>
				<div class="wrap-input100 validate-input bg0 rs1-alert-validate"
					data-validate="Please Type Your Message">
					<span class="label-input100">Message</span>
					<textarea class="input100" name="message"
						placeholder="Your message here..."></textarea>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						<span> 공유하기 <i class="fa fa-long-arrow-right m-l-7"
							aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>
		</div>
	</div>




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
		Dropzone.options.myAwesomeDropzone = {
			autoProcessQueue : false
		}
	</script>
	<script>
		/* var myDropzone = new Dropzone("div#dzUpload",
				{ url : "C:\fileprac",
				  addRemoveLinks : true,
				  maxFiles: 3,
				  success: function(file, response){
					  var imgName = response.serFileNm;
					  var oriName = response.orgFileNm;
					  if(imgName != ''){
						  var adClass = imgName.replace('.', "");
						  file.previewElement.classList.add("dz-success");
						  file.previewElement.classList.add(adClass);
						  var html = '<input type="hidden" name="serverFileNm" value="' + imgName='">';
						  html += '<input type="hidden" name="oriFileNm" value="' + oriName+'">';
						  $("." + addClass).append(html);
					  }
				  }, error :function(file,response){
					  file.previewElement.classList.add("dz-maxsize-error");
					  alert("파일은 최대 5개까지만 업로드 가능합니다.");
					  $(".dz-maxsize-error").empty();
				  }
			
				}); */
				
				/* $.getScript('http://cdnjs.cloudflare.com/ajax/libs/dropzone/3.8.4/dropzone.min.js',function(){
					  // instantiate the uploader
					  $('#file-dropzone').dropzone({
					    url: "optImg.php", // 드롭다운 시 업로드 되는 URL
					    maxFilesize: 300, // 드롭다운 시 파일 크기
					    paramName: "userfile", // input file="user_file"
					    maxThumbnailFilesize: 1, // 섬네일 사이즈 인데 안보여 줄거니까 1정도
					    previewsContainer: ".dropzone-previews", // 섬네일 보여주는 Container class
					    init: function() {
					      this.on('success', function(file, json) {
					          // 파일이 서버에 업로드가 완료 되었 을때
					          var res = JSON.parse(json);
					 
					          if(res.msg=='OK'){
					              //만약에 response message 가 OK 라면
					              $("#origin-size").empty().append(res.origin_size);
					              $("#resize-size").empty().append(res.size);
					              $(".upload-progress").hide();
					              $(".resize-image").show();
					              $(".image-preview").show();
					              $("#preview-img").attr("src",res.path);
					              $("#image-down").attr("filename",res.path);
					          } else {
					              // 만약에 OK 가 아니라면???
					              $("#file-dropzone").show();
					              $(".upload-progress").hide();
					              alert(res.msg);
					          }
					          console.log(json);
					      });
					       
					      this.on('addedfile', function(file) {
					          $("#file-dropzone").hide();
					          $(".upload-progress").show();
					      });
					       
					      this.on('drop', function(file) {
					          // 파일이 드롭되면Upload Progress 나와줘야 된다.
					          $("#file-dropzone").hide();
					          $(".upload-progress").show();
					      });
					    }
					  });
					}); */
					
		
					$.getScript('http://cdnjs.cloudflare.com/ajax/libs/dropzone/3.8.4/dropzone.min.js',function(){
						  // instantiate the uploader
						  $('#file-dropzone').dropzone({
						    url: "optImg.php", // 드롭다운 시 업로드 되는 URL
						    maxFilesize: 300, // 드롭다운 시 파일 크기
						    paramName: "userfile", // input file="user_file"
						    maxThumbnailFilesize: 1, // 섬네일 사이즈 인데 안보여 줄거니까 1정도
						    previewsContainer: ".dropzone-previews", // 섬네일 보여주는 Container class
						    init: function() {
						      this.on('success', function(file, json) {
						          // 파일이 서버에 업로드가 완료 되었 을때
						          var res = JSON.parse(json);
						 
						          if(res.msg=='OK'){
						              //만약에 response message 가 OK 라면
						              $("#origin-size").empty().append(res.origin_size);
						              $("#resize-size").empty().append(res.size);
						              $(".upload-progress").hide();
						              $(".resize-image").show();
						              $(".image-preview").show();
						              $("#preview-img").attr("src",res.path);
						              $("#image-down").attr("filename",res.path);
						          } else {
						              // 만약에 OK 가 아니라면???
						              $("#file-dropzone").show();
						              $(".upload-progress").hide();
						              alert(res.msg);
						          }
						          console.log(json);
						      });
						       
						      this.on('addedfile', function(file) {
						          $("#file-dropzone").hide();
						          $(".upload-progress").show();
						      });
						       
						      this.on('drop', function(file) {
						          // 파일이 드롭되면Upload Progress 나와줘야 된다.
						          $("#file-dropzone").hide();
						          $(".upload-progress").show();
						      });
						    }
						  });
						});
	</script>

</body>
</html>
