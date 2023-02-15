<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="신고" name="title"/>
</jsp:include>

<style>
	 .title-siren{
    	width:27px;
    	height:27px;
    }
	hr{
		margin:0;
		color:#C3C3C3;
	}
	.accordion-body{
		padding-left:0;
	}
	.accordion-button:not(.collapsed){
		color:#212529;
		background-color:#fff;
	}
	.li-font{
		font-size:14px;
		color:#929294;
	}
	.accordion-button.typing::after{
		background:none;
	}
	.typing-area{
		border: 1px solid rgba(0,0,0,.125);
		resize:none;
		font-size:15px;
		padding:10px;
	}
	.preview-box>img{
		width:100px;
		height:100px;
		border:1px solid rgba(0,0,0,.125);
		overflow:hidden;
		object-fit: cover;
		padding: 1px;
	}
	.form-check-input:checked {
		background-color: #F94888;
    	border-color: #F94888;
    }


</style>


<hr>
<div class = "container-fluid mt-5">
	<div class = "col-4 offset-4">
		<div class = "row">
			<div class="col justify-content-center middle-items">
				<img src="${pageContext.request.contextPath}/images/siren.png" class="title-siren me-1">
				<h3 style="margin:0;">신고하기</h3>
			</div>
		</div>

		<form class="report-form" action="/dang/report/${memberInfo.memberNick}" method="post">
		<div class = "row mt-4">
			<div class="col middle-items">
				<h5 style="margin:0;">신고대상</h5>
				<span class="ms-4" style="font-size:16px;">${memberInfo.memberNick}</span>
			</div>
		</div>
		
		<div class = "row mt-4 accordions-wrap">
			<div class="col middle-items mb-2">
				<h5 style="margin:0;">사유선택</h5>
				<i class="fa-solid fa-asterisk pink ms-1"></i>
			</div>
			
			<!-- 아코디언 시작 -->
			<div class="accordion" id="accordionExample">
			
				<div class="accordion-item form-check">	
					<div class="accordion-button collapsed cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
						<input class="form-check-input cursor-pointer me-2" type="radio" name="reportContent" id="optionsRadios1" value="스팸홍보/도배글입니다.">
						<label class="form-check-label cursor-pointer" for="optionsRadios1">
				        	스팸홍보/도배글입니다.
				        </label>
					</div>
					
					<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<ul>
								<li class="li-font">사행성 오락이나 도박을 홍보하거나 권장하는 내용 등의 부적절한 스팸 홍보 행위</li>
								<li class="li-font">동일하거나 유사한 내용 반복 게시</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item form-check">	
					<div class="accordion-button collapsed cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						<input class="form-check-input cursor-pointer me-2" type="radio" name="reportContent" id="optionsRadios2" value="음란물입니다.">
						<label class="form-check-label cursor-pointer" for="optionsRadios2">
				        	음란물입니다.
				        </label>
					</div>
					
					<div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<ul>
								<li class="li-font">성적 수치심을 일으키는 내용</li>
								<li class="li-font">아동이나 청소년을 성 대상화한 표현</li>
								<li class="li-font">과도하거나 의도적인 신체 노출</li>
								<li class="li-font">음란한 행위와 관련된 부적절한 내용</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item form-check">	
					<div class="accordion-button collapsed cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						<input class="form-check-input cursor-pointer me-2" type="radio" name="reportContent" id="optionsRadios3" value="청소년에게 유해한 내용입니다.">
						<label class="form-check-label cursor-pointer" for="optionsRadios3">
				        	청소년에게 유해한 내용입니다.
				        </label>
					</div>
					
					<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<ul>
								<li class="li-font">가출/왕따/학교폭력/자살 등 청소년에게 부정적인 영향을 조성하는 내용</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item form-check">	
					<div class="accordion-button collapsed cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
						<input class="form-check-input cursor-pointer me-2" type="radio" name="reportContent" id="optionsRadios4" value="욕설/생명경시/혐오/차별적 표현입니다.">
						<label class="form-check-label cursor-pointer" for="optionsRadios4">
				        	욕설/생명경시/혐오/차별적 표현입니다.
				        </label>
					</div>
					
					<div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<ul>
								<li class="li-font">직·간접적인 욕설을 사용하여 타인에게 모욕감을 주는 내용</li>
								<li class="li-font">생명을 경시여기거나 비하하는 내용</li>
								<li class="li-font">계층/지역/종교/성별 등을 혐오하거나 비하하는 표현</li>
								<li class="li-font">신체/외모/취향 등을 경멸하는 표현</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item form-check">	
					<div class="accordion-button collapsed cursor-pointer" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
						<input class="form-check-input cursor-pointer me-2" type="radio" name="reportContent" id="optionsRadios5" value="개인정보 노출 게시물입니다.">
						<label class="form-check-label cursor-pointer" for="optionsRadios5">
				        	개인정보 노출 게시물입니다.
				        </label>
					</div>
					
					<div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample" style="">
						<div class="accordion-body">
							<ul>
								<li class="li-font">법적으로 중요한 타인의 개인정보를 게재</li>
								<li class="li-font">당사자 동의 없는 특정 개인을 인지할 수 있는 정보</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="accordion-item form-check mb-4">	
					<div class="accordion-button collapsed cursor-pointer typing">
						<input class="form-check-input cursor-pointer me-2" type="radio" 
							name="reportContent" id="optionsRadios6" value="1">
						<label class="form-check-label cursor-pointer" for="optionsRadios6">
				        	직접 입력
				        </label>
					</div>
				</div>
				
				<div class="typing-wrap mb-3" style="display:none;">
					<div class="mb-2 middle-items">
						<h5 style="margin:0;">직접 입력</h5>
						<span style="font-size:13px;" class="pink ms-2">* 100자 이내로 입력해주세요</span>
					</div>
					<div class="typing-box">
						<textarea class="typing-area rounded-3 w-100 form-control" maxlength="100" rows="5"></textarea>
					</div>
				</div>
			</div>		
		</div>
		<!-- 아코디언 끝 -->
		
		<div class="report-file-wrap">
			<div class="select-file">
				<p class="pink mt-1 mb-1" style="font-size:13px;">* 화면 첨부를 해주시면 관리자의 신고 승인 판단에 도움이 됩니다. </p>
	            <input type="file"  class="form-control file-btn" accept=".jpg, .png, .gif" multiple>
			</div>
			<div class="preview-file mt-1">
				<div class="preview-box inbl me-1">
					<input type="hidden" name="attachmentNo" value="">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" 
							class="files rounded-3">
				</div>
				<div class="preview-box inbl me-1">
					<input type="hidden" name="attachmentNo" value="">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" 
							class="files rounded-3">
				</div>
				<div class="preview-box inbl me-1">
					<input type="hidden" name="attachmentNo" value="">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" 
							class="files rounded-3">
				</div>
			</div>
		</div>
		
		<!-- form data -->
		<input type="hidden" name="reportUserNo" value="${reportUserNo}">
		<input type="hidden" name="userNo" value="${memberInfo.userNo}">
		<input type="hidden" name="dangNo" value="${memberInfo.dangNo}">
		<input type="hidden" name="memberNick" value="${memberInfo.memberNick}">
		
		<div class="btn-box text-center mt-5 mb-5">
			<button type="submit" class="btn btn-primary w-25">신고하기</button>
			<button type="button" class="btn btn-pink report-cancel w-25">취소</button>
		</div>

		</form>	
	</div>
</div>

<script>
	$(function(){
		//직접 입력 클릭시 div 보이게 처리
		$("#optionsRadios6").click(function(){
			$("input[type=radio][name=reportContent]").prop("checked",false);
			$(".typing-wrap").show();
			$(".typing-area").val("");
		});
		$(".typing").click(function(){
			$("input[type=radio][name=reportContent]").prop("checked",false);
			$("#optionsRadios6").prop("checked",true);
			$(".typing-wrap").show();
			$(".typing-area").val("");
		});
		
		//라디오버튼 체크 설정/해제
		$("input[type=radio][name=reportContent]").click(function(){
			$("#optionsRadios6").prop("checked",false);
			$(".typing-wrap").hide();
			$("#optionsRadios6").val(1);
		});

		// textarea blur 이벤트
		var reportContent=false;
		$(".typing-area").blur(function(){
			var textarea = $(this).val();
			console.log(textarea);
			$(".typing-area").removeClass("is-invalid");
			if(textarea==""){
				$(".typing-area").addClass("is-invalid");
				reportContent=false;
			}else{
				$("[name=reportContent]:checked").val(textarea);
				reportContent=true;
			}
		});
		
		//파일 선택
		$(".file-btn").change(function(){
			var value = $(this).val(); //파일위치+파일명
			console.log(value);
			console.log(this.files); //파일 배열
			
			//기존파일 검사
			var originFiles = arrayFiles();
			console.log(originFiles);
			console.log(originFiles.length);
			var filesLenght = originFiles.length + this.files.length;

			if(filesLenght>3){
				alert('파일은 3개까지 업로드 가능합니다!');
				$(this).val("");
				return;
			}
			
			if(this.files.length>0){ //파일 있음
				var formData = new FormData();

				for(var i=0; i<this.files.length; i++){
					formData.append("attachment", this.files[i]);
				}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/upload_multiple",
					method:"post",
					data:formData,
					processData:false, 
                    contentType:false,
                    async:false,
                    success:function(resp){
                    	console.log("등록성공!");
                    	console.log(resp);
                    	
                    	for(var i=0; i<resp.url.length; i++){
                    		//console.log(resp.url[i]);
                    		var check = resp.url[i].lastIndexOf("/"); //경로에서 /위치 찾기
                        	var attachmentNo = resp.url[i].substr(check+1); //attachmentNo 꺼내기
                        	
                        	var imgTag = $(".files");
                        	//비어있는 숫자 세기
                        	var cnt=0;
                        	for(var j=0; j<imgTag.length; j++){
                        		var nocheck = imgTag.eq(j).data("no");
                        		if(nocheck==undefined) cnt++;
                        	}
                        	console.log("cnt = "+cnt);
                        	//빈박스 시작은 k =(원래크기-빈박스)
                        	var k = imgTag.length-cnt;
							console.log(k);
                   			imgTag.eq(k).attr("src",resp.url[i]) //이미지 넣기
           					.attr("data-no",attachmentNo); //data-no 첨부파일 번호 넣기
                    	}
			        }
				});
			}
		});
		
		//신고취소버튼 누를 경우 첨부파일 삭제
		$(".report-cancel").click(function(){
			var findtag = $(".files");
			for(var i=0; i<findtag.length; i++){
        		var attachmentNo = findtag.eq(i).data("no");
        		console.log(attachmentNo);
        		if(attachmentNo!=undefined){
        			boardDeleteAttachmentNo(attachmentNo);
        			 findtag.eq(i).attr("data","")
        			 		.attr("src","${pageContext.request.contextPath}/images/img-dang-profile-default.png");
        		}
			}
			history.go(-1);
		});
		
		//전송
		$(".report-form").submit(function(e){
			e.preventDefault();
			
			//체크항목 검사
			var value = $("[name=reportContent]:checked").val();
			console.log(value);
			
			if(value==1){
				//직접 입력 textarea 확인
				$(".typing-area").blur();
			}else if(value==undefined){
				reportContent=false;
			}else{
				reportContent=true;
			}
			console.log(reportContent);
			
			//파일 검사
			var fileList = $(".files");
			for(var i=0; i<fileList.length; i++){
				var attachmentNo = fileList.eq(i).data("no");
				if(attachmentNo!=undefined){
					fileList.eq(i).prev().val(attachmentNo);
				}
			}
			
			//최종 submit
			if(reportContent) this.submit();
			
			
		});

		//취소, 돌아가기 시 첨부파일 삭제
		function boardDeleteAttachmentNo(attachmentNo){
       		$.ajax({
   				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
   				method:"delete",
   				data:attachmentNo,
   				async:false,
   				success:function(resp){
   					console.log("신고 파일 삭제 성공!");
   				}
   			});
		}
		
		//기존파일 검사(첨부파일 번호 배열반환)
		function arrayFiles(){
			var originFiles = $(".files");
			var arr = [];
			for(var i=0; i<originFiles.length; i++){
				var no = originFiles.eq(i).data("no");
				if(no!=undefined){
					arr.push(no);
				}
			}
			return arr;
		}
	
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>