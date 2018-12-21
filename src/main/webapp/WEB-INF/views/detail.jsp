<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/detail/detail.css">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<style>
	body {padding-top:50px;}
	.postsWrapper {display:inline-block;border:1px solid #111;margin-bottom: 30px;}
</style>
</head>
<body>
<div id="contents">
	<c:forEach items="${map.resultList}" var="resultList">
		<div class="postsWrapper" data-posts-num="${resultList.postsNum}">
			<p><c:out value="${resultList.postsNum}"/></p>
			<p><c:out value="${resultList.postsUserId}"/></p>
			<p><img src="imageView/<c:out value='${resultList.postsNum}'/>"></p>
			<p><c:out value="${resultList.postsTime}"/></p>
		</div>
		<br>
	</c:forEach>
</div>
<form action="upload.do" method="post" enctype="multipart/form-data">
	<input type="file" name="file" multiple="multiple">
	<input type="submit" value="전송하기"> 
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/dateUtil.js"></script>
<script>
	var comment = {
		getComment : function(data) {
			var commentElement 	= "",
				postInfo 		= data.detail[0],
				comments 		= data.comments,
				result			= null;
			
			commentElement += "<div class='postContentBox'>";
			commentElement += "<div class='postTopBox'>";
			commentElement += "<div class='profileBox'>";
			commentElement += "<img src='upload/" + postInfo.postsUserId + "/" + postInfo.profileImg + "'>";
			commentElement += "<div class='userinfoBox'>";
			commentElement += "<p class=''>" + postInfo.postsUserId + "</p>"; // 글작성 아이디
			commentElement += "<p class=''>" + dateUtil(new Date(postInfo.postsTime).getTime()) + " 전</p>"; // 글작성 시간
			commentElement += "</div>";	// class = userinfoBox 종료
			commentElement += "</div>";	// class = profileBox 종료
			commentElement += "<div class='contentBox'>" + postInfo.postsContents + "</div>";	// class = contentBox 종료
			commentElement += "<div class='likeBox'>";
			commentElement += "<div class='likeDiv " + postInfo.postLike + "'><div><i class='fas fa-heart'></i><i class='far fa-heart'></i><span>좋아요</span></div>"; // class = likeDiv 종료
			commentElement += "<div class='commentTempDiv'><i class='far fa-comment-alt'></i><span>댓글 달기<span></div>"; // class = commentTempDiv 종료
			commentElement += "<div class='commentTotalDiv'>댓글<span class='commentTotal'>" + data.commentTotal + "</span>개";
			commentElement += "</div>"; // class = commentTotalDiv 종료
			commentElement += "</div>"; // class = likeDiv 종료
			commentElement += "</div>"; // class = likeBox 종료
			commentElement += "<div class='commentViewBox'>";
			
			comments.forEach(function(comment) {
				commentElement += "<div class='commentViewList'>";				
				commentElement += "<div class='commentViewProfile'>";				
				commentElement += "<img src='upload/" + comment.commentsUserId + "/" + comment.profileImg + "'>";
				commentElement += "</div>"; // class = commentViewProfile 종료		
				commentElement += "<div class='commentViewContent'><div><span>" + comment.commentsUserId + "</span><span>" + comment.commentsContents + "<span></div>";
				commentElement += "<div><span class='commentLike " + comment.likeTotal + "'>좋아요</span><span class='commentReple'>답글 달기</span><span>" + dateUtil(new Date(comment.commentsTime).getTime()) + " 전</span></div>";
				commentElement += "</div>"; // class = commentViewContent 종료
				commentElement += "</div>"; // class = commentViewList 종료
			});
			
			commentElement += "</div>"; // class = commentViewBox 종료
			commentElement += "</div>"; // class = postTopBox 종료
			commentElement += "<div class='commentBox'>";
			commentElement += "<div class='commentProfileBox'>";
			commentElement += "<img src='images/default_profile.jpg'>";
			commentElement += "</div>"; // class = commentProfileBox 종료
			commentElement += "<div class='commentWriteBox'>";
			commentElement += "<textarea></textarea>";
			commentElement += "</div>"; // class = commentWriteBox 종료
			commentElement += "</div>"; // class = commentBox 종료
			commentElement += "</div>"; // class = postContentBox 종료

			return $(commentElement);
		},
	}

	var detail = {
		imageView : function(data, post) {
			var width 	= post.width(),
				height 	= post.height(),
				top		= post.offset().top,
				left	= post.offset().left,
				div		= $("<div class='detail'>"),
				cover	= $("<div class='cover'>")
				box		= $("<div class='detailBox'>"),
				con		= $("<div class='detailCon'>"),
				img		= $("<img>"),
				post	= data.detail[0],
				reader	= new FileReader;
			
			div.css({
				width 	: width,
				height 	: height,
				top 	: top,
				left	: left
			}).append(cover).append(box);
			
			box.append(con);
			box.append(comment.getComment(data, $(window).height() - 60));
			con.append(img);
			
			img.attr("src", "imageView/" + post.postsNum);
			
			$("#contents").css({
				"position"	 	: "fixed",
				"margin-top"	:  - $(window).scrollTop() + 8
			})
			
			img.load(function(e) {
				var $img 			= $(e.target),
					imgWidth 		= $img.width(),
					imgHeight 		= $img.height(),
					conWidth 		= imgWidth,
					conHeight		= imgHeight,
					defaultWidth 	= 660,
					defaultHeight 	= 520,
					windowWidth		= $(window).width() - 400,
					windowHeight	= $(window).height() - 60,
					rate			= 0;
				
				if (imgWidth > windowWidth || imgHeight > windowHeight) {
					
					if (imgWidth > windowWidth && imgHeight < windowHeight) {
						$img.width(windowWidth);
					}
					
					if (imgWidth < windowWidth && imgHeight > windowHeight) {
						$img.height(windowHeight);
					}
					
					if (imgWidth > windowWidth && imgHeight > windowHeight) {
						
						if ((imgWidth / windowWidth) > (imgHeight / windowHeight)) {
							rate = imgWidth / windowWidth;
						} else {
							rate = imgHeight / windowHeight;
						}
						
						$img.css({
							width : imgWidth / rate,
							height : imgHeight / rate
						});
					}
				}
				
				conWidth  = $img.width();
				conHeight = $img.height();
				
				if (conWidth < defaultWidth) {
					conWidth = defaultWidth;
					
					$img.css("margin-left", (defaultWidth - imgWidth) / 2);
				}
				
				if (conHeight < defaultHeight) {
					conHeight = defaultHeight;
					
					$img.css("margin-top", (defaultHeight - imgHeight) / 2);
				}
				
				con.css({
					width 	: conWidth,
					height 	: conHeight
				})
				
				if (box.find(".postTopBox").height() > conHeight - 100) {
					box.find(".postTopBox").css({
						"height" 		: conHeight - 100,
						"overflow-x" 	: "scroll"
					});
				}
				
				box.css("margin-top", ($(window).height() - conHeight) / 2);
				
				setTimeout(function() {
					div.css({
						top		: 0,
						left	: 0,
						opacity : 1,
						width	: "100%",
						height	: "100%"
					});
					
					setTimeout(function() {
						box.css("opacity", 1);
					}, 500);
				});
			});
			
			$("body").append(div);
		}	
	}

	$(function() {
		var page = 1;
		
		$(document).on("click", ".postsWrapper", function() {
			var $this 	= $(this),
				data	= {};
			
			data.postNum 	= $this.data("postsNum");
			data.page 		= 1;
			
			$.ajax({
				url 		: "postDetail.do",
				type 		: "post",
				data 		: data,
				dataType 	: "json",
				success 	: function(data) {
					detail.imageView(data, $this);
				}
			});
		});
		
		$(document).on("click", ".cover", function() {
			var $detail = $(".detail");
			
			$detail.css({
				opacity:0
			});
			
			setTimeout(function() {
				var scroll = Math.abs($("#contents").css("margin-top").replace("px", ""));
				
				$detail.remove();
				
				$("#contents").css({
					"margin-top" 	: "inherit",
					"position"		: "static"
				});
				
				$(window).scrollTop(scroll + 8);
			}, 800);
		});
	});
</script>
</body>
</html>