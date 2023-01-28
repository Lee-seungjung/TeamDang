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
		border:1px solid #fff;
		overflow:hidden;
		object-fit: cover;
	}
	.form-check-input:checked {
		background-color: #F94888;
    	border-color: #F94888;
    }
</style>

<script>
	$(function(){
		//직접 입력 클릭시 div 보이게 처리
		$("#optionsRadios6").click(function(){
			$("input[type=radio][name=reportContent]").prop("checked",false);
			$(".typing-wrap").show();
		});
		$(".typing").click(function(){
			$("input[type=radio][name=reportContent]").prop("checked",false);
			$("#optionsRadios6").prop("checked",true);
			$(".typing-wrap").show();
		});
		
		//라디오버튼 체크 설정/해제
		$("input[type=radio][name=reportContent]").click(function(){
			$("#optionsRadios6").prop("checked",false);
			$(".typing-wrap").hide();
		});
		$("#optionsRadios6").click(function(){
			$("input[type=radio][name=reportContent]").prop("checked",false);
		});
		
		//여기
		//입력 항목 상태 판정
		var reportContent= false;
		console.log($("[name=reportContent]"));
		$("[name=reportContent]").on("change",function(){
			console.log("입력항목 실행중!");
			var value = $(this).val();
			console.log(value);
			/* if(value==""){
				bCheck.boardCategory=false;
			}else{
				bCheck.boardCategory=true;
			} */
		});

		
		$(".report-form").submit(function(e){
			e.preventDefault();
			
			console.log($("[name=reportContent]:checked").val());
		});
		
	});
</script>
<hr>
<div class = "container-fluid mt-5">
	<div class = "col-4 offset-4">
		<div class = "row">
			<div class="col justify-content-center middle-items">
				<img src="${pageContext.request.contextPath}/images/siren.png" class="title-siren me-1">
				<h3 style="margin:0;">신고하기</h3>
			</div>
		</div>
		
		<form class="report-form">
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
						<input class="form-check-input cursor-pointer me-2" name="reportContent" 
									type="radio" id="optionsRadios6" value="1">
						<label class="form-check-label cursor-pointer" for="optionsRadios6">
				        	직접 입력
				        </label>
					</div>
				</div>
				
				<div class="typing-wrap mb-2" style="display:none;">
					<div class="mb-2 middle-items">
						<h5 style="margin:0;">직접 입력</h5>
						<span style="font-size:13px;" class="pink ms-2">* 100자 이내로 입력해주세요</span>
					</div>
					<div class="typing-box">
						<textarea class="typing-area rounded-3 w-100" maxlength="100" rows="5"></textarea>
					</div>
				</div>
			</div>		
		</div>
		<!-- 아코디언 끝 -->
		
		<div class="report-file-wrap">
			<div class="select-file">
	            <input type="file"  class="form-control" accept=".jpg, .png, .gif">
			</div>
			<div class="preview-file mt-1">
				<div class="preview-box inbl">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" class="rounded-3 me-1">
					<p class="x-btn pink text-center cursor-pointer">X</p>
				</div>
				<div class="preview-box inbl">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" class="rounded-3 me-1">
					<p class="x-btn pink text-center cursor-pointer">X</p>
				</div>
				<div class="preview-box inbl">
					<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" class="rounded-3 me-1">
					<p class="x-btn pink text-center cursor-pointer">X</p>
				</div>
			</div>
		</div>
		
		<div class="btn-box text-center mt-5 mb-5">
			<button type="submit" class="btn btn-primary w-25">신고하기</button>
			<button type="button" class="btn btn-pink report-cancel w-25">취소</button>
		</div>
		
		<input type="hidden" name="userNo" value="${memberInfo.userNo}">
		<input type="hidden" name="dangNo" value="${memberInfo.dangNo}">
		<input type="hidden" name="memberNick" value="${memberInfo.memberNick}">
		</form>	
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>