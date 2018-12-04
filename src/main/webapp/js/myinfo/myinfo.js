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
			
			// 수정버튼 눌렀을 때
			$("#contents").on("click", ".detailUploadBtn", this.myinfoUpdate);
			
			// delete버튼 눌렀을 때
			$("#contents").on("click", ".detailDeleteBtn", this.myinfoDelete);
			
			// detail 수정완료 눌렀을 때
			$("#contents").on("click", ".detailUpdateSubmitBtn", this.detailUpdateSubmit);
			
			// 수정 취소를 눌렀을 때
			$("#contents").on("click", ".detailUpdateCancelBtn", this.myinfoUpdateCancelFn);
		},
		
		myinfoDetailAdd : function(e) {
			var $p			= $(this).prev(),
				$myinfo		= null,
				fragment	= document.createDocumentFragment();
				div 		= document.createElement("div"),
				children	= "",
				typeName	= null;
			
			if ($p.closest(".myinfoDetailTemplate").nextUntil(".myinfoDetailTemplate").length >= 5) {
				modal.alert("상세정보는 5개를 초과할 수 없습니다.");
				
				return;
			} else {
				$myinfo		= $(this).detach();
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
				div.dataset.num 	= $myinfo.data("typeNum");
				
				fragment.appendChild(div);
				
				$p.after(fragment);
				$p.data("myinfo", $myinfo);
			}	
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
				$detailUploadBox 	= $this.closest("#detailUploadBox");
			
			myinfo.objectChange($detailUploadBox);
		},
		
		objectChange : function(removeObject) {
			var prev = removeObject.prev();
			
			removeObject.remove();
			prev.after(prev.data("myinfo"));
		},
		
		myinfoSubmit : function(e) {
			var $this 				= $(this),
				$detailUploadBox 	= $this.closest("#detailUploadBox"),
				$p					= $detailUploadBox.prev(),
				$input				= $detailUploadBox.find("[name=uinfoName]"),
				data				= {};
			
			if ($this.hasClass("active")) {
				data.type 		= "insert";
				data.uinfoName 	= $input.val();
				data.uinfoType 	= $detailUploadBox.data("num");
				data.userNumber = $(".myinfo").data("userNumber"); 
				
				$.ajax({
					url 		: "myinfoDetailUpdate.do",
					type 		: "post",
					data 		: JSON.stringify(data),
					contentType : "application/json",
					dataType 	: "json",
					success 	: function(data) {
						
						if (data.result === "SUCCESS") {
							modal.alert(modal.message.insert);
							
							myinfo.objectChange($detailUploadBox);
							myinfo.insertMyinfo($p.closest(".myinfoDetailTemplate"), $input.val(), data.uinfoNum);
						} else {
							modal.alert(modal.message.error);
						}
					},
					error		: function() {
						modal.alert(modal.message.error);
					}
				});
			} else {
				modal.alert($detailUploadBox.data("name") + " 을/를 입력 해 주세요.");
			}
		},
		
		insertMyinfo : function(target, content, uinfoNum) {
			var frament = document.createDocumentFragment(),
				div		= document.createElement("div"),
				string	= "";
			
			string += "<p>" + content + "</p>";
			string += "<div class='detailBtnCon'>";
			string += "<button class='detailUploadBtn'>수정</button>";
			string += "<button class='detailDeleteBtn'>삭제</button>";
			string += "</div>";
			
			div.setAttribute("class", "userinfoDetail");
			div.innerHTML = string;
			div.dataset.uinfoNum = uinfoNum;
			
			frament.appendChild(div);
			
			target.after(frament);
		},
		
		myinfoUpdate : function(e) {
			var $this 		= $(this),
				$parent 	= $this.closest(".userinfoDetail"),
				$prev 		= null,
				fragment	= document.createDocumentFragment(),
				div			= document.createElement("div"),
				string		= "";
			
			Array.prototype.forEach.call($(".userinfoDetailUpdate"), myinfo.myinfoUpdateCancel);
			
			$prev 	= $parent.prev(),
			$parent = $parent.detach();
			
			string += "<input type='text' name='' value='" + $parent.children("p").text() + "'>";
			string += "<div class='detailBtnCon'>";
			string += "<button class='detailUpdateSubmitBtn'>수정완료</button><button class='detailUpdateCancelBtn'>취소</button>";
			string += "</div>";
			
			div.setAttribute("class", "userinfoDetailUpdate");
			div.innerHTML = string;
			div.dataset.uinfoNum = $parent.data("uinfoNum");
			
			fragment.appendChild(div);

			$prev.after(fragment);
			$prev.data("update", $parent);
		},
		
		detailUpdateSubmit : function(e) {
			var $this 	= $(this),
				$parent = $this.closest(".userinfoDetailUpdate"),
				$input 	= $parent.find("input"),
				data	= {};
			
			if ($input.val() === "") {
				modal.alert("값을 입력 해 주세요.");
			} else {
				data.type 		= "update";
				data.uinfoName 	= $input.val();
				data.uinfoNum 	= $parent.data("uinfoNum");
				data.userNumber = $(".myinfo").data("userNumber"); 
				
				$.ajax({
					url 		: "myinfoDetailUpdate.do",
					type 		: "post",
					data 		: JSON.stringify(data),
					contentType : "application/json",
					dataType 	: "json",
					success 	: function(data) {
						
						if (data.result === "SUCCESS") {
							$parent.prev().data("update").find("p").text($input.val());
							
							myinfo.myinfoUpdateCancel($parent);
							
							modal.alert(modal.message.insert);
						} else {
							modal.alert(modal.message.error);
						}
					},
					error		: function() {
						modal.alert(modal.message.error);
					}
				});
			}
		},
		
		myinfoUpdateCancelFn : function(e) {
			myinfo.myinfoUpdateCancel($(this).closest(".userinfoDetailUpdate"));
		},
		
		myinfoUpdateCancel : function(target) {
			var prev = $(target).prev();
			
			target.remove();
			
			prev.after(prev.data("update"));
		},
		
		myinfoDelete : function(e) {
			var $this 			= $(this),
				$userinfoDetail = $this.closest(".userinfoDetail");
				data 			= {};
			
			data.type 		= "delete";
			data.uinfoNum 	= $userinfoDetail.data("uinfoNum"); 
			data.userNumber = $(".myinfo").data("userNumber"); 
			
			$.ajax({
				url 		: "myinfoDetailUpdate.do",
				type 		: "post",
				data 		: JSON.stringify(data),
				contentType : "application/json",
				dataType 	: "json",
				success 	: function(data) {
					
					if (data.result === "SUCCESS") {
						modal.alert(modal.message["delete"]);
						
						$userinfoDetail.remove();
					} else {
						modal.alert(modal.message.error);
					}
				},
				error		: function() {
					modal.alert(modal.message.error);
				}
			});
		}
	};
	
	var modal = {
		message : {},	
			
		alert 	: function() {
			var message = Array.prototype.slice.call(arguments);
			
			$(".model-contents").text(message.join(" "));
			$("#showModal").modal("show");
		}	
	}
	
	modal.message.insert 	= "저장되었습니다.";
	modal.message["delete"] = "삭제 되었습니다.";
	modal.message.error 	= "문제가 발생하였습니다. 잠시 후 다시 이용해 주시기 바랍니다.";
	
	$(function() {
		myinfo.init();
		myinfo.myinfoDetailAddEvent();
	});
})();