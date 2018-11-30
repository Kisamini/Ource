;(function() {
	"user strict"
	var myinfo = {
		$myinfoCon : $,
		
		init : function() {
			this.$myinfoCon = $(".myinfoCon");
		},
		
		/*
		 * 회원 추가 정보 입력 버튼 클릭 시에 html 변환
		 * */
		myinfoDetailAddEvent : function() {
			
			// 수정 버튼 눌렀을 때
			this.$myinfoCon.click(this.myinfoDetailAdd);
			
			// input 눌렀을 때
			$("#contents").on("keyup", "[name=uinfoName]", this.myinfoInputCheck);
			
			// 취소버튼 눌렀을 때
			$("#contents").on("click", "#detailCancelBtn", this.myinfoCancel);
			
			// submit버튼 눌렀을 때
			$("#contents").on("click", "#detailSubmitBtn", this.myinfoSubmit);
		},
		
		myinfoDetailAdd : function(e) {
			var $p			= $(this).prev(),
				$myinfo		= $(this).detach(),
				fragment	= document.createDocumentFragment();
				div 		= document.createElement("div"),
				children	= "",
				typeName	= $myinfo.data("typeName");
			
			children += "<div class='detailUploadContents'>";
			children += "<span class='columnName'>" + typeName + "</span>";
			children += "<span><input type='text' name='uinfoName'></span>";
			children += "</div>";
			children += "<div class='detailUploadBtnCon'>";
			children += "<button id='detailSubmitBtn'>변경사항저장</button>";
			children += "<button id='detailCancelBtn'>취소</button>";
			children += "</div>";
			
			div.innerHTML 		= children;
			div.id				= "detailUploadBox";
			div.dataset.name 	= typeName;
			
			fragment.appendChild(div);
			
			$p.after(fragment);
			$p.data("myinfo", $myinfo);
		},
		
		myinfoInputCheck : function(e) {
			var $this 				= $(this),
				$detailUploadBox 	= $this.closest("#detailUploadBox"),
				$submitBtn			= $detailUploadBox.find("#detailSubmitBtn");
			
			if ($this.val() === "") {
				$submitBtn.removeClass("active");
			} else {
				$submitBtn.addClass("active");
			}
		},
		
		myinfoCancel : function(e) {
			var $this 				= $(this),
				$detailUploadBox 	= $this.closest("#detailUploadBox"),
				$p					= $detailUploadBox.prev();
			
			$detailUploadBox.remove();
			$p.after($p.data("myinfo"));
		},
		
		myinfoSubmit : function(e) {
			var $this 				= $(this),
				$detailUploadBox 	= $this.closest("#detailUploadBox"),
				$p					= $detailUploadBox.prev(),
				$input				= $detailUploadBox.find("[name=uinfoName]");
			
			if ($this.hasClass("active")) {
				
			} else {
				$(".model-contents").text($detailUploadBox.data("name") + " 을/를 입력 해 주세요.");
				$("#showModal").modal("show");
			}
		}
	};
	
	$(function() {
		myinfo.init();
		myinfo.myinfoDetailAddEvent();
	});
})();