<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 게시판" name="title"/>
</jsp:include>

<style>
	.board-box{
		border:1px solid #E7E7E7;
		height:auto;
		margin:0 auto;
		padding:20px;
	}
	.nick-font{
		font-weight:bolder;
		font-size:20px;
	}
	.re-nick-font{
		font-weight:bolder;
		font-size:16px;
	}
	.date-font{
		font-size:13px;
		color:#6F6F6F;
	}
	.re-date-font{
		font-size:11px;
		color:#6F6F6F;
	}
	.fa-ellipsis-vertical{
		font-size:25px;
	}
	.content-font{
		font-size:15px;
	}
	.re-content-font{
		font-size:13px;
	}
	.full-heart{
		display:none;
		color:#F94888;
	}
	.content-div1{
		background-color:#DEEFFF;
		padding:7px;
		border-radius: 0.3rem;
	}
	.content-div2{
		background-color:#EBEBEB;
		padding:7px;
		border-radius: 0.3rem;
	}
	.re-more-view{
		font-size:14px;
	}
	.reply-box{
		display:none;
	}
	.btn-blue{
		border:1px solid #fff;
		background-color:#76BEFF;
		color:#fff;
	}
	.category-css:hover {
	  	color: #495057;
	 	background-color: #DEEFFF;
	  	border-color: #DEEFFF;
	}
	.dropdown-menu{
		width: 50%;
		min-width: 4rem;
		
	}
	.dropdown-item{
		font-size: 0.8rem;
	}
	.dropdown-item:hover{
		background-color:#EBEBEB;
		color:#495057;
	}
	.content-font{
		white-space:pre-wrap;
		word-wrap: break-word;
		word-break: break-word;
	}
	#carouselExampleControls{
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	.carousel-item>img{
		max-width:500px;
		max-height:500px;
	}
	.carousel{
		width:80%;
	}
	.carousel-item{
	    transform: translate(, -65%);
	    margin-left:30%;
	}
	.carousel-close-btn {
	  display: inline-block;
	  width: 2rem;
	  height: 2rem;
	  background-repeat: no-repeat;
	  color:#f5f5f5;
	  background: rgba(0, 0, 0, 0.8);
	  transform: translate(100%, 100%);
	}
	
	.top-btn-div{
		position: fixed;
		cursor: pointer;
		top:88%;
		left:94%;
		color:#76BEFF;
		display:none;
	}
	.search-input{
		border-right : none;
		border-top-right-radius:0;
		border-bottom-right-radius:0;
	}
	.fa-magnifying-glass{
		color:#a2c1f6;
	}
	.search-btn{
		border : 1px solid #ced4da;
		border-left : none;
		background-color : white;
		padding: 0.375rem 0.75rem;
		border-top-right-radius:0.25rem;
		border-bottom-right-radius:0.25rem;
	}
	.form-control:focus{
		border-color: #ced4da;
		box-shadow: none;
	}
	.form-select:focus {
		border-color: #ced4da;
		box-shadow: none;
	}
	.attach-cnt{
		font-size:18px;
		font-weight:bolder;
		position:absolute;
		top: 50%;
	    left: 50%;
	    transform: translate( -50%, -50% );
	}
	.b-profile-info{
		width:50px;
		height:50px;
	}

</style>

<div class = "container-fluid mt-3 mb-5 body-wrapper">

	<div class = "col-8 offset-2 body-content">
		<div class = "row">
		
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<div class = "col-6">
				<div class = "col">
					<!-- 검색바 시작 -->
					<div class="search-group text-center mt-3 d-flex">
						<select class="form-select flex-fill me-1" style="width:20%;" name="type">
							<option value="">선택</option>
							<option value="member_nick">작성자</option>
							<option value="board_content">내용</option>
						</select>
						<div class="d-flex" style="width:70%;">
							<input type="text" class="input form-control search-input ms-1 flex-fill" name="keyword">
							<button class="search-btn">
								<i class="fa-solid fa-magnifying-glass cursor-pointer "></i>
							</button>
				    	</div>
				    </div>
				    <!-- 검색바 끝 -->
				    
				    <!-- #카테고리 시작 -->
				    <div class="category-group text-center mt-4">
						<a class="btn gray category-css rounded-pill me-1 b-category" data-value="정모후기">#정모후기</a>
						<a class="btn gray category-css rounded-pill me-1 b-category" data-value="공지사항">#공지사항</a>
						<a class="btn gray category-css rounded-pill me-1 b-category" data-value="가입인사">#가입인사</a>
						<a class="btn gray category-css rounded-pill me-1 b-category" data-value="자유글">#자유글</a>
						<a class="btn gray category-css rounded-pill me-1 b-category btn-blue" data-value="">#전체</a>
				    </div>
				    <!-- #카테고리 끝 -->
				    
				    <!-- 게시글 작성버튼 시작 -->
				  	<div class="border rounded-3 mt-4 text-center shadow gray">
						<button class="board-write cursor-pointer w-100 p-2 btn btn-primary"  data-bs-toggle="modal" data-bs-target="#boardModal" 
										data-bs-whatever="@mdo">게시글 작성</button>
					</div>
				    <!-- 게시글 작성버튼 끝 -->

				    <!-- 게시글 시작 -->
				    <div class="board-group text-center mt-4" data-scrollcheck="">
				    
				    	<c:if test="${boardList.size()==0}">
				    		<div class="col zero-boardList middle-items justify-content-center">
				    			<img src="${pageContext.request.contextPath}/images/clipboard.png" width="30" height="30">
				    			<span class="zero-boardList-font content-font">등록된 게시글이 없습니다</span>
				    		</div>
				    	</c:if>
				    
				    	<c:forEach var="vo" items="${boardList}">
				    		<!-- 게시글 박스 시작 -->
							<div class="board-box shadow-sm mb-3" data-scrollbno="${vo.boardNo}" data-mno="${vo.memberNo}">
								<div class="first-line d-flex">
									<div class="col-1 b-profile-info cursor-pointer">
										<c:choose>
											<c:when test="${vo.attachmentNo==null}">
												<img src="${pageContext.request.contextPath}/images/basic-profile.png" 
														class="img-fluid img-circle" style="width:50px; height:50px;">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}"
														 class="img-fluid img-circle" style="width:50px; height:50px;">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-7 middle-items ms-3">
										<span class="nick-font">${vo.memberNick}</span>
										<c:if test="${vo.memberOwner=='Y'}">
											<img src="${pageContext.request.contextPath}/images/crown.png" class="ms-1" width="25" height="25">
										</c:if>
									</div>
									<div class="col-4 justify-content-end middle-items">
										<span class="date-font me-4">
											<fmt:formatDate value="${vo.boardWriteDate}" pattern="yyyy.MM.dd"/>
										</span>
										<c:if test="${vo.memberNo==profile.memberNo}">
											<div class="dropdown inbl w-auto">
												<span data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
													<i class="fa-solid fa-ellipsis-vertical me-3"></i>
												</span>
												<div class="dropdown-menu" data-bno="${vo.boardNo}" data-mno="${vo.memberNo}">
													<span class="dropdown-item edit-drop cursor-pointer" data-bs-toggle="modal" data-bs-target="#boardEditModal" data-bs-whatever="@mdo">수정</span>
													<span class="dropdown-item delete-drop cursor-pointer">삭제</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								
								<div class="second-line ms-3 me-3 mt-3 mb-4 d-flex" >
									<div class="col-9 text-start me-1 truncate-check">
										<span class="content-font new-text-truncate cursor-pointer">${vo.boardContent}</span>
									</div>
									<div class="col-3 middle-items bimg-find justify-content-center" data-no="${vo.boardNo}" style="position:relative;">
										<c:if test="${vo.boardAttachmentCnt!=null}">
											<!-- 비동기로 사진 불러오기-->
											<img src="#" class="img-fluid img-check cursor-pointer" style="width:100px; height:100px;">
											<c:choose>
												<c:when test="${vo.boardAttachmentCnt-1==0}">
													<span></span>
												</c:when>
												<c:otherwise>
													<span class="blue attach-cnt cursor-pointer">+ ${vo.boardAttachmentCnt-1}</span>
												</c:otherwise>
											</c:choose>
										</c:if>
									</div>
								</div>
								<hr>
								
								<div class="third-line d-flex ms-3 me-3">
									<div class="col-3 middle-items cursor-pointer toggle-btn" data-no="${vo.boardNo}">
										<i class="fa-regular fa-message mt-1 me-2"></i>
										<span class="me-2">댓글</span>
										<c:if test="${vo.replyCnt!=0}">
											<span class="blue replycnt" style="font-weight:bolder;">${vo.replyCnt}</span>
										</c:if>
									</div>
									<div class="col-3 middle-items cursor-pointer like-btn">
										<span class="me-2">좋아요</span>
										<i class="fa-regular fa-heart pink me-1 empty-heart"></i>
										<i class="fa-solid fa-heart me-1 full-heart"></i>
										<c:choose>
											<c:when test="${vo.boardLike!=0}">
												<span class="pink islike" style="font-weight:bolder;" data-like="${vo.boardNo}">${vo.boardLike}</span>
											</c:when>
											<c:otherwise>
												<span class="pink islike" style="font-weight:bolder;"></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-6 justify-content-end middle-items">
										<span>${vo.boardCategory}</span>
									</div>
								</div>
								
								<!-- 댓글 박스 시작 -->
								<div class="reply-box">
									<!-- 비동기 처리 -->	
								</div>
								<!-- 댓글 박스 끝 -->
								
							</div>
							<!-- 게시글 박스 끝 -->
					    	</c:forEach>
					    	
				    </div>
				    <!-- 게시글 끝 -->
					<input type="hidden" name="memberNo" value="${profile.memberNo}">
				</div>
			</div>
			
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
			
			<!-- 게시판 글작성 모달 시작-->					
			<div class="modal fade" id="boardModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">게시글 작성</h5>
						</div>
						<form class="form-tag board-form">
						<div class="modal-body">
							
							<div class="mb-3 text-start">
								<label for="write-category" class="col-form-label ms-2 me-1">카테고리</label><i class="fa-solid fa-asterisk text-danger"></i>
								<div>
									<select class="form-select form-select-sm inbl w-auto" aria-label=".form-select-sm example" name="boardCategory" id="write-category">
									  <option value="">선택</option>
									  <option value="자유글">자유글</option>
									  <option value="가입인사">가입인사</option>
									  <option value="정모후기">정모후기</option>
									  <c:if test="${profile.memberOwner=='Y'}">
									  	<option value="공지사항">공지사항</option>
									  </c:if>
									</select>
								</div>
							</div>
							
							<div class="mb-3 text-start">
								<label for="message-text" class="col-form-label ms-2 me-1">내용</label>
								<span class="length-font">( </span>
								<span class="b-length length-font">0</span>
								<span class="length-font">/ 1000 )</span>
								<textarea name="boardContent" id="write-content" class="form-control b-contentbox" rows="7" style="resize:none;"></textarea>
							</div>
							
							<div class="mb-3 text-start mt-2">
								<div>
									<input class="form-control"  id="write-select-file" type="file" accept=".jpg, .png, .gif" multiple>
							    </div>
							    <div class="mt-2" id="write-file-wrap">
									<!-- 비동기화 출력 -->
							    </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary b-write-cancel" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary b-write-btn">작성</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 게시판 글작성 모달 끝-->

			<!-- 게시판 글수정 모달 시작-->					
			<div class="modal fade" id="boardEditModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">게시글 수정</h5>
						</div>
						<form class="form-tag board-edit-form">
						<div class="modal-body">
							
							<div class="mb-3 text-start">
								<label for="edit-category" class="col-form-label ms-2 me-1">카테고리</label><i class="fa-solid fa-asterisk text-danger"></i>
								<div>
									<select class="form-select form-select-sm inbl w-auto" aria-label=".form-select-sm example" name="boardCategory" id="edit-category">
									  <option value="">선택</option>
									  <option value="자유글">자유글</option>
									  <option value="가입인사">가입인사</option>
									  <option value="정모후기">정모후기</option>
									  <c:if test="${profile.memberOwner=='Y'}">
									  	<option value="공지사항">공지사항</option>
									  </c:if>
									</select>
								</div>
							</div>
							
							<div class="mb-3 text-start">
								<label for="message-text" class="col-form-label ms-2 me-1">내용</label>
								<span class="length-font">( </span>
								<span class="be-length length-font">0</span>
								<span class="length-font">/ 1000 )</span>
								<textarea name="boardContent" id="edit-content" class="form-control b-contentbox" rows="7" style="resize:none;"></textarea>
							</div>
							
							<div class="mb-3 text-start mt-2">
								<div>
									<input class="form-control" id="edit-select-file" type="file" accept=".jpg, .png, .gif" multiple>
							    </div>
							    <div class="mt-2" id="edit-file-wrap">
									<!-- 비동기화 출력 -->
							    </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary b-edit-cancel" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary b-edit-btn">수정</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 게시판 글수정 모달 끝-->
		</div>
		
		<!-- 위로 올라가기 버튼 -->
		<div class="top-btn-div text-end">
			<i class="fa-solid fa-circle-up fa-3x"></i>
		</div>
		
		<!-- 사진 확대 시작-->
		<div class="zoomin">
			<button class="carousel-close-btn">X</button>
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner zoomin-img">
					<!-- 비동기화 캐러셀 출력 -->
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
				</button>
			</div>
		</div>
		<!-- 사진 확대 끝 -->
		
		<!-- 삭제 모달 시작 -->
		<div class="modal" id="deleteModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header" style="height:20px;">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body middle-items">
						<i class="fa-solid fa-circle-exclamation pink fa-2x me-2"></i>
						<span>정말 삭제하시겠습니까?</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary modal-delete-btn">확인</button>
						<button type="button" class="btn btn-secondary delete-cancel-btn" data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제 모달 끝 -->
			
	</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</div>

<script>
	$(function(){
		
		//truncate(); //말줌일표
		printImg(); //게시글 사진 출력
		originLike() //내가 누른 좋아요 출력

		//boardEditReady(); //게시글 수정 첫 화면 기본셋팅
		//editSubmitCheck(); //수정폼 전송 전 항목 체크
		boardDelete(); //게시글 삭제

		replyToggle(); //댓글 토글
		likeHeart(); //좋아요 버튼 이벤트
		
		//카테고리 색상변경
		$(".b-category").click(function(){
			var category = $(".b-category");	
			category.removeClass("btn-blue");
			$(this).addClass("btn-blue");
		});
		
		//엔터키 이벤트
		$("[name=keyword]").on("keyup",function(key){
			var inputText = $("[name=keyword]").val();
			var selectType = $("[name=type]").val();
	        if(inputText!="" && selectType!="" && key.keyCode==13) {
	        	$(".search-btn").click();
	        }
	    });
		
		//게시글 이미지 확대
		$(document).on("click",".bimg-find",function(){
			var boardNo = $(this).data("no");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
				method:"get",
				success:function(resp){
					console.log(resp);
					
					$(".carousel-inner").empty(); //캐러셀 태그 비우기
					for(var i=0; i<resp.length; i++){
						var url = "${pageContext.request.contextPath}/rest_attachment/download/"+resp[i].attachmentNo
						zoomTagCreate(url); //슬라이더 사진 넣기&태그생성
					}
					
					$(".carousel-item").eq(0).attr("class","carousel-item active");
					$(".zoomin").show();

					//이미지 확대창 클릭 시 닫기
					$(".carousel-close-btn").click(function (e) {
						$(".zoomin").hide();
					});
				}
			});
		});
		
		//말줄임표 토글
		$(document).on("click",".truncate-check",function(){
			var checkTag = $(this).children();
			var judge = checkTag.hasClass("new-text-truncate");
			if(judge){
				checkTag.removeClass("new-text-truncate");
			}else{
				checkTag.addClass("new-text-truncate");
			}
		});
		
		//검색조회
		$(document).on("click", ".search-btn", function(e){
			$(".board-group").attr("data-scrollcheck","");
			var dangNo = $("[name=dangNo]").val();
			var type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val();
			var category = $("a.btn-blue").data("value");
			
			if(type==""||keyword=="") return; //입력값 없으면 클릭 막기
			
			SearchData={
					dangNo:dangNo,
					type:type,
					keyword:keyword,
					category:category
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/input_search",
				method:"get",
				data:SearchData,
				success:function(resp){
					console.log(resp);
					$(".board-group").empty();//출력 div 비우기
					
					if(resp.length<5){
						$(".board-group").attr("data-scrollcheck",1);
					}
					
					if(resp.length==0){
						zeroBoardList();
						$(".not-result").text("일치하는 검색 결과가 없습니다");
					}else{
						for(var i=0; i<resp.length; i++){
							boardList(resp[i]);
						}
					}
					//truncate(); //말줌일표
					printImg(); //게시글 사진 출력
					originLike() //내가 누른 좋아요 출력
					
				}
			});
		});
		
		//카테고리 검색조회
		$(document).on("click", ".b-category", function(){
			$(".board-group").attr("data-scrollcheck","");
			var dangNo = $("[name=dangNo]").val();
			var type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val();
			var category = $("a.btn-blue").data("value");
			
			SearchData={
					dangNo:dangNo,
					type:type,
					keyword:keyword,
					category:category
			}
			
			$(".board-group").empty();//출력 div 비우기
				//카테고리 조회
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/input_search",
					method:"get",
					data:SearchData,
					success:function(resp){
						
						if(resp.length<5){
							$(".board-group").attr("data-scrollcheck",1);
						}
						
						if(resp.length==0){
							zeroBoardList();
						}else{
							for(var i=0; i<resp.length; i++){
								boardList(resp[i]);
							}
						}
						//truncate(); //말줌일표
						printImg(); //게시글 사진 출력
						originLike() //내가 누른 좋아요 출력
						$("[name=type]").val("");
						$("[name=keyword]").val("");
		
					}
				});
		});
		
		$(document).on("click",".board-write",function(){
			$("#write-file-wrap").empty();
			$("#write-category").val("");
			$(".b-length").text(0);
			$("#write-content").val("");
			$("#write-select-file").val("");
			
			
		});
		
		//입력 항목 상태 판정
		bCheck={
				boardContent : false, 
				boardCategory : false,
				allValid:function(){
					return this.boardContent && this.boardCategory;
				}
		};
		
		//카테고리 선택 검사
		$("#write-category").on("change",function(){
			var value = $(this).val();
			console.log(value);
			if(value==""){
				bCheck.boardCategory=false;
			}else{
				bCheck.boardCategory=true;
			}
		});
		
		//입력창 글자수 확인(최대 1000자)
		$("#write-content").on("input",function(){
			var length = $(this).val().length; //글자수
			var value = $(this).val(); //입력내용
			//글자수 표시
			$(".b-length").text(length);
			console.log(value);
			$(this).removeClass("is-invalid");
			if(length==0){
				$(".b-length").css("color","#495057");
				bCheck.boardContent=true;
			}else if(length>1000){
				$(this).val(value.substring(0,1000));	
				$(".b-length").css("color","red").text(1000);
				bCheck.boardContent=false;
				$(this).addClass("is-invalid");
			}else if(length>0){
				$(".b-length").css("color","#495057");
				bCheck.boardContent=true;
			}
		});
		
		//파일 선택
		$("#write-select-file").change(function(e){
			var value = $(this).val(); //파일위치+파일명
			console.log(value);
			console.log(this.files); //파일 배열

			if(this.files.length>5){
				alert('파일은 5개까지 업로드 가능합니다!');
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
                    	
                    	var fileDiv = $("#write-file-wrap");
                    	for(var i=0; i<resp.url.length; i++){
                    		console.log(resp.url[i]);
                    		var check = resp.url[i].lastIndexOf("/"); //경로에서 /위치 찾기
                        	var attachmentNo = resp.url[i].substr(check+1); //attachmentNo 꺼내기
                        	
                    		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
                    		var img = $("<img>").attr("src",resp.url[i]).attr("class","img-fluid files file1")
                    						.attr("style","width:70px; height:70px;").attr("data-no",attachmentNo);
                    		var x = $("<p>").text("x").attr("class","text-center x-btn cursor-pointer").attr("style","margin-top:-5px;");
    						div.append(img).append(x);
							fileDiv.append(div);
                    	}

            			$(".x-btn").click(function(){
            				var attachmentNo = $(this).prev().data("no");

            				var div = $(this).parent().remove();
            				console.log(attachmentNo);

            				$.ajax({
            					url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
            					method:"delete",
            					data:attachmentNo,
            					async:false,
            					success:function(resp){
            						var cnt = $("#write-file-wrap").children();
                    				console.log(cnt.length);
                    				if(cnt.length==0){
                    					$("#write-select-file").val("");
                    				}
            					}
            				});
            			});
			        }
				});
			}
		});
		
		
		
		//모달 취소버튼 누를 경우 첨부파일 삭제
		$(".b-write-cancel").click(function(){
			boardDeleteAttachmentNo();
		});

		//폼 전송 이벤트
		$(".board-form").submit(function(e){
			e.preventDefault();
			//이벤트 강제실행
			$("#write-category").change();

			var judge = $("#write-content").val();
			if(judge.length==0) return; //입력값 없으면
			
			if(bCheck.allValid()){
				//boardNo 시퀀스 미리 받기
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/find_no",
					method:"get",
					async:false,
					success:function(resp){
						console.log("글번호 = "+resp);
						
						//비동기화 데이터 준비
						var boardNo = resp;
						var memberNo = $("[name=memberNo]").val();
						var dangNo = $("[name=dangNo]").val();
						var memberNick = $("[name=memberNick]").val();
						var boardContent = $("#write-content").val();
						var boardCategory = $("#write-category").val();
						
						boardData = {
							boardNo:boardNo,
							memberNo:memberNo,
							dangNo:dangNo,
							memberNick:memberNick,
							boardContent:boardContent,
							boardCategory:boardCategory
						}
						
						//게시글 DB등록
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/insert",
							method:"post",
							async:false,
							data:JSON.stringify(boardData),
							contentType:"application/json",
							success:function(resp){
								//게시글 이미지 DB 등록
								var findtag = $(".files");
					        	var attachmentNo;
					        	if(findtag.length!=0){
					        		for(var i=0; i<findtag.length; i++){
						        		attachmentNo = findtag.eq(i).attr("data-no");
						        		
						        		data = {
						        				boardNo:boardNo,
						        				attachmentNo:attachmentNo
						        		}
						        		
						        		$.ajax({
						    				url:"${pageContext.request.contextPath}/rest_board/img_insert/",
						    				method:"post",
						    				data:JSON.stringify(data),
						    				async:false,
											contentType:"application/json",
						    				success:function(resp){
						    					console.log("저장성공!");
						    				}
						    			});
						        	}
					        	}
					        	
								//게시물 출력
								$(".board-group").empty();
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_board/list_all/"+dangNo,
									method:"get",
									data:dangNo,
									async:false,
									success:function(resp){
										console.log(resp);
										for(var i=0; i<resp.length; i++){
											boardList(resp[i]);
										}
										printImg();
									}
								});
								
					        	//하루 게시글 수 확인 후 회원 활동점수 +1 증가(하루 최대 5점까지 가능)
								var boardWriteDate = moment(new Date).format('YYYY-MM-DD');
					
								cntCheckData = {
									dangNo:dangNo,
									memberNo:memberNo,
									boardWriteDate:boardWriteDate
								}
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_board/day_write",
									method:"get",
									data:cntCheckData,
									async:false,
									contentType:"application/json",
									success:function(resp){
										console.log("하루 작성 게시글 수 = "+resp);
										
										if(resp<=5){ //게시글 작성 수 5개 이하일 경우에만 점수 증가 가능!
											scorePlusData={
					                    			memberScore:1,
					                    			memberNo:memberNo
					                    	}
					                    	$.ajax({
					                    		url:"${pageContext.request.contextPath}/rest_member/score_plus",
					                    		method:"patch",
					                    		data:JSON.stringify(scorePlusData),
					                    		contentType: 'application/json',
					                    		async:false,
					                    		success:function(resp){
					                    			//사이드 프로필 메뉴 작성글+1, 활동점수+1
					                    			var writeCntTag = $("#boardModal").parent().children().children()
			    																	.find(".fa-pen-to-square").next().next();
					                    			var writeCnt = parseInt(writeCntTag.text());
													writeCntTag.text(writeCnt+1);
													
													var scoreTag = $(".profile-box").children().find(".memberScore")
					                    			var scoreValue = parseInt(scoreTag.text());
					                    			scoreTag.text(scoreValue+1);
					                    		}
					                    	});
										}
									}
								});
								$("#boardModal").modal('hide');
							}
						});
					}
				});
			}
		});
		
		
		//게시글 수정 첫 화면 기본셋팅
		$(document).on("click", ".edit-drop", function(){
			$("#boardEditModal").modal("show");
			$(".b-edit-btn").attr("data-no","");
			//원본데이터 출력준비
			var boardContent = $(this).parents(".first-line").next().children().find(".content-font").text();
			var boardCategory = $(this).parents(".first-line").next().next().next().children(".col-6").children().text();
			var boardNo = $(this).parent().data("bno");
			var contentLength = boardContent.length;

			//원본데이터 출력
			$("#edit-category").val(boardCategory).prop("selected", true);
			$("#edit-content").val(boardContent);
			$(".b-edit-btn").attr("data-no",boardNo);
			$(".be-length").text(contentLength);
			$("#edit-select-file").val("");
			$("#edit-file-wrap").empty();
	
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
				method:"get",
				async:false,
				success:function(resp){
					console.log(resp);
					
					var fileDiv = $("#edit-file-wrap");
	               	for(var i=0; i<resp.length; i++){
	                   	var url = "${pageContext.request.contextPath}/rest_attachment/download/"+resp[i].attachmentNo;
	               		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
	               		var img = $("<img>").attr("src",url).attr("class","img-fluid file1")
	               						.attr("style","width:70px; height:70px;").attr("data-no",resp[i].attachmentNo);
	               		var x = $("<p>").text("x").attr("class","text-center x-btn cursor-pointer").attr("style","margin-top:-5px;");
						div.append(img).append(x);
						fileDiv.append(div);
	               	}
	               	//수정 전 첨부파일 삭제
	               	$(".x-btn").click(function(){
                		$(this).parent().hide();
        			});
				}
			});
		});
		
		
		//수정 입력 항목 상태 판정
		eCheck={
				boardContent : true, 
				boardCategory : false,
				allValid:function(){
					return this.boardContent && this.boardCategory;
				}
		};
		
		//수정 카테고리 선택 검사
		$("#edit-category").on("change",function(){
			var value = $(this).val();
			if(value==""){
				eCheck.boardCategory=false;
			}else{
				eCheck.boardCategory=true;
			}
		});
		
		//수정 입력창 글자수 확인(최대 1000자)
		$("#edit-content").on("input",function(){
			var length = $(this).val().length; //글자수
			var value = $(this).val(); //입력내용
			//글자수 표시
			$(".be-length").text(length);
			console.log(value);
			$(this).removeClass("is-invalid");
			if(length==0){
				$(".be-length").css("color","#495057");
				eCheck.boardContent=true;
			}else if(length>1000){
				$(this).val(value.substring(0,1001));	
				$(".be-length").css("color","red").text(1000);
				eCheck.boardContent=false;
				$(this).addClass("is-invalid");
			}else if(length>0){
				$(".be-length").css("color","#495057");
				eCheck.boardContent=true;
			}
		});
		
		//수정 파일 선택
		$("#edit-select-file").on("change",function(e){
			var value = $(this).val(); //파일위치+파일명
			console.log(this.files); //파일 배열
			
			//기존파일 검사
			var e_originFiles = $(".file1");
			console.log(e_originFiles);
			console.log(e_originFiles.length);
			var e_filesLenght = e_originFiles.length + this.files.length;
			

			if(e_filesLenght>5){
				alert('파일은 5개까지 업로드 가능합니다!');
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
                    	//console.log(resp); //url반환
                    	
                    	var fileDiv = $("#edit-file-wrap");
                    	for(var i=0; i<resp.url.length; i++){
                    		//console.log(resp.url[i]);
                    		var check = resp.url[i].lastIndexOf("/"); //경로에서 /위치 찾기
                        	var attachmentNo = resp.url[i].substr(check+1); //attachmentNo 꺼내기
                        	
                    		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
                    		var img = $("<img>").attr("src",resp.url[i]).attr("class","img-fluid files file1")
                    						.attr("style","width:70px; height:70px;").attr("data-no",attachmentNo);
                    		var x = $("<p>").text("x").attr("class","text-center x-btn cursor-pointer").attr("style","margin-top:-5px;");
    						div.append(img).append(x);
							fileDiv.append(div);
                    	}
                    	
                    	$(".x-btn").click(function(){
                    		var thistag = $(this);
                    		xBtn(thistag);
            			});

			        }
				});
			}
		});
		
		//수정 폼 전송
		$(".board-edit-form").submit(function(e){
			e.preventDefault();
			
			//강제실행
			$("#edit-category").change();
			
			if(eCheck.allValid()){
				//수정 데이터 준비
				var boardNo = $(this).children().find(".b-edit-btn").attr("data-no");
				var boardContent = $("#edit-content").val();
				var boardCategory = $("#edit-category option:selected").val();
				console.log("수정할 게시글번호 = "+boardNo);
						
				editBoardData = {
					boardNo:boardNo,
					boardContent:boardContent,
					boardCategory:boardCategory
				}
						
				//게시글 DB등록
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/edit_board",
					method:"patch",
					async:false,
					data:JSON.stringify(editBoardData),
					contentType:"application/json",
					success:function(resp){
						//게시글 이미지 DB 등록
						var findtag = $(".files");
						console.log(findtag);
						console.log(findtag.length);
			        	if(findtag.length!=0){
			        		for(var i=0; i<findtag.length; i++){
			        			var attachmentNo = findtag.eq(i).attr("data-no");
				        		console.log(attachmentNo);
				        		data = {
				        				boardNo:boardNo,
				        				attachmentNo:attachmentNo
				        		}
				        		
				        		$.ajax({
				    				url:"${pageContext.request.contextPath}/rest_board/img_insert",
				    				method:"post",
				    				data:JSON.stringify(data),
				    				async:false,
									contentType:"application/json",
				    				success:function(resp){
				    					console.log("이미지 저장성공!");
				    				}
				    			});
				        	}
			        	}
			        	
			        	//숨겼던 원본파일 삭제
			        	var originFiles = $('.file-div:hidden');
			        	console.log(originFiles);
			        	if(originFiles.length!=0){
			        		for(var i=0 ;i<originFiles.length; i++){
				        		var fileAttachmentNo = originFiles.eq(i).children().data("no");
				        		$.ajax({
				    				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+fileAttachmentNo,
				    				method:"delete",
				    				data:fileAttachmentNo,
				    				async:false,
				    				success:function(resp){
				    					console.log("숨긴파일 삭제 성공!");
				    				}
				    			});
				        	}
			        	}
			        	
			        	//원본게시글에 수정내용 찍어주기
    					var selectTag = $(".bimg-find[data-no="+boardNo+"]");
    					var contentTag = selectTag.prev().children();
    					var categoryTag = selectTag.parent().next().next().children('.col-6').children();
    					contentTag.text(boardContent);
    					categoryTag.text(boardCategory);
    					
    					selectTag.empty(); //비동기 태그 비움

						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
							method:"get",
							async:false,
							success:function(resp){
								if(resp.length>0){
									var img = $("<img>")
	   								.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp[0].attachmentNo)
	   								.attr("class","img-fluid img-check cursor-pointer").attr("style","width:100px; height:100px;");
									var span = $("<span>").attr("class","blue attach-cnt cursor-pointer");
									selectTag.prepend(img).append(span);
									
									if(resp.length>1){
										img.attr("style","filter: brightness(50%); width:100px; height:100px;");
										var calcul = resp.length-1;
										if(calcul==0 || calcul<0){
											span.text("");
										}else if(calcul>0){
											var text = "+"+calcul;
											console.log(text);
											span.text(text);
										}
									}
								}
							}
						});
			        	
						$("#boardEditModal").modal('hide');
					}
				});
			}
		});
		
		
		//취소, 돌아가기 시 첨부파일 삭제
		function boardDeleteAttachmentNo(){
			var findtag = $(".files");
        	var attachmentNo;
        	for(var i=0; i<findtag.length; i++){
        		attachmentNo = findtag.eq(i).attr("data-no");
        		
        		$.ajax({
    				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
    				method:"delete",
    				data:attachmentNo,
    				async:false,
    				success:function(resp){
    				}
    			});
        	}
		}
		

		//수정폼 전송 전 항목 체크
		//function editSubmitCheck(){
			
		//}

		//수정폼 전송 이벤트
		//function boardEditFormSubmit(){
			
		//}
		
		//게시글 목록 없을 경우 출력
		function zeroBoardList(){
			var boardGroup = $(".board-group");
			var div = $("<div>").attr("class","col zero-boardList middle-items justify-content-center");
			var img = $("<img>").attr("src","${pageContext.request.contextPath}/images/clipboard.png")
							.attr("style","width:30px; height:30px;");
			var span = $("<span>").attr("class","content-font not-result").text("등록된 게시글이 없습니다");
			div.append(img).append(span);
			boardGroup.append(div);
		}

		//게시글 목록 출력
		function boardList(resp){
			var nowMemberNo = $("[name=memberNo]").val();
			var boardGroup = $(".board-group"); //큰 외부 틀(여기에 넣어야함)
			var boardBox = $("<div>").attr("class","board-box shadow-sm mb-3")
									.attr("data-scrollbno",resp.boardNo).attr("data-mno",resp.memberNo);
			
			//첫번째줄
			var firstLine = $("<div>").attr("class","first-line d-flex");
			var fir_col1 = $("<div>").attr("class","col-1 b-profile-info cursor-pointer");
			var fir_img = $("<img>").attr("class","img-fluid img-circle");
			if(resp.attachmentNo==null){
				fir_img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}else{
				fir_img.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo)
						.attr("style","width:50px; height:50px;");
			}
			fir_col1.append(fir_img);
			
			var fir_col7 = $("<div>").attr("class","col-7 middle-items ms-3");
			var nick_span = $("<span>").attr("class","nick-font").text(resp.memberNick);
			fir_col7.append(nick_span);
			if(resp.memberOwner=='Y'){
				var owner_img = $("<img>").attr("style","width:25px; height:25px;").attr("class","ms-1")
							.attr("src","${pageContext.request.contextPath}/images/crown.png");
				fir_col7.append(owner_img);
			}

			var fir_col4 = $("<div>").attr("class","col-4 justify-content-end middle-items");
			var date = moment(resp.boardWriteDate).format("YYYY.MM.DD");
			var date_span = $("<span>").attr("class","date-font me-4").text(date);
			fir_col4.append(date_span);
			if(resp.memberNo==nowMemberNo){
				var dropdown = $("<div>").attr("class","dropdown inbl w-auto");
				var drop_span = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");
				var drop_i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				drop_span.append(drop_i);
				var dropmenu = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo)
											.attr("data-mno",resp.memberNo);
				var edit_span = $("<span>").attr("class","dropdown-item edit-drop cursor-pointer")
									.attr("data-bs-toggle","modal").attr("data-bs-target","#boardEditModal")
									.attr("data-bs-whatever","@mdo").text("수정");
				var delete_span = $("<span>").attr("class","dropdown-item delete-drop cursor-pointer").text("삭제");
				dropmenu.append(edit_span).append(delete_span);
				dropdown.append(drop_span).append(dropmenu);
				fir_col4.append(dropdown);
			}
			firstLine.append(fir_col1).append(fir_col7).append(fir_col4);
			
			//두번째 줄
			var secondLine = $("<div>").attr("class","second-line ms-3 me-3 mt-3 mb-4 d-flex");
			var se_col9 = $("<div>").attr("class","col-9 text-start me-1 cursor-pointer truncate-check");
			var se_span = $("<span>").attr("class","content-font new-text-truncate cursor-pointer")
										.text(resp.boardContent);
			se_col9.append(se_span);
			var se_col3 = $("<div>").attr("class","col-3 middle-items bimg-find justify-content-center")
									.attr("data-no",resp.boardNo).attr("style","position:relative;");
			if(resp.boardAttachmentCnt!=null){
				var se_img = $("<img>").attr("src","#").attr("class","img-fluid img-check cursor-pointer")
										.attr("style","width:100px; height:100px;");
				var text = resp.boardAttachmentCnt-1;
				if(text==0){
					text="";
				} else{
					text="+"+text;
				}
				var se_span = $("<span>").attr("class","blue attach-cnt cursor-pointer").text(text);
				se_col3.append(se_img).append(se_span);
			}
			secondLine.append(se_col9).append(se_col3);
			var hr = $("<hr>");
			
			//세번째 줄
			var thirdLine = $("<div>").attr("class","third-line d-flex ms-3 me-3");
			var th_col3_1 = $("<div>").attr("class","col-3 middle-items cursor-pointer toggle-btn").attr("data-no",resp.boardNo);
			var message_i = $("<i>").attr("class","fa-regular fa-message mt-1 me-2");
			var th_span = $("<span>").attr("class","me-2").text("댓글");
			th_col3_1.append(message_i).append(th_span);
			if(resp.replyCnt!=0){
				var cnt_span = $("<span>").attr("class","blue replycnt").attr("style","font-weight:bolder;").text(resp.replyCnt);
				th_col3_1.append(cnt_span);
			}

			var th_col3 = $("<div>").attr("class","col-3 middle-items cursor-pointer like-btn");
			var like_span = $("<span>").attr("class","me-2").text("좋아요");
			var empty_i = $("<i>").attr("class","fa-regular fa-heart pink me-1 empty-heart");
			var full_i = $("<i>").attr("class","fa-solid fa-heart me-1 full-heart");
			var islike_span = $("<span>").attr("class","pink islike").attr("style","font-weight:bolder;");
			if(resp.boardLike!=0){
				islike_span.attr("data-like",resp.boardNo).text(resp.boardLike);
			}
			th_col3.append(like_span).append(empty_i).append(full_i).append(islike_span);
			
			var th_col6 = $("<div>").attr("class","col-6 justify-content-end middle-items");
			var category_span = $("<span>").text(resp.boardCategory);
			th_col6.append(category_span);
			thirdLine.append(th_col3_1).append(th_col3).append(th_col6);
			
			var replyDiv = $("<div>").attr("class","reply-box");
			
			boardBox.append(firstLine).append(secondLine).append(hr).append(thirdLine).append(replyDiv);
			boardGroup.append(boardBox);
		}

		//게시글 삭제	
		function boardDelete(){
			$(document).on("click", ".delete-drop", function(){
				var findTag = $(this).parents(".dropdown").prev().text();
				var trim = jQuery.trim(findTag);
				var writeDate = trim.substring(0,10); //작성 날짜
				var now = moment(new Date).format("YYYY.MM.DD"); //현재 날짜
				var boardNo = $(this).parent().data("bno"); //글번호
				var memberNo = $("[name=memberNo]").val();
				var memberScore = 1;
				var boardBox = $(this).parents(".board-box"); //해당글 부모 board-box

				$(".modal-delete-btn").removeClass("board-delete-now reply-delete-now");
				$(".modal-delete-btn").addClass("board-delete-now");
				$("#deleteModal").modal("show");
				
				//확인버튼에 지우는 클래스 포함되어 있을 경우 삭제 실행
				var judge = $(".modal-delete-btn").hasClass("board-delete-now");
				if(judge){
					//삭제 확인 버튼 누를 경우
					$(".board-delete-now").click(function(){
						boardDeleteAttachmentAll(boardNo); //첨부파일 삭제
						$(this).parents(".board-box").remove(); //출력된 태그 비동기로 삭제
						//댓글 조회 후 삭제
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_reply/replyno_list/"+boardNo,
							method:"get",
							async:false,
							success:function(resp){

								//댓글 삭제 & 사이드 프로필 메뉴 댓글수량만큼 마이너스
								if(resp.length>0){
									
									for(var i=0; i<resp.length; i++){
										$.ajax({
											url:"${pageContext.request.contextPath}/rest_reply/delete/"+resp[i],
											method:"delete",
											async:false,
											success:function(resp){}
										});	
									}
									
									var replyCntTag = $(".profile-box").children().find(".fa-comment-dots").next().next();
									var replyCnt = parseInt(replyCntTag.text());
									replyCntTag.text(replyCnt-(resp.length));
								}
								
							}
						});
						
						//삭제 ajax 실행
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/delete/"+boardNo,
							method:"delete",
							async:false,
							success:function(resp){
								$(".modal-delete-btn").removeClass("board-delete-now");
								$("#deleteModal").modal("hide");
								boardBox.remove(); //출력된 게시글 지우기
								var writeCntTag = $(".profile-box").children().find(".fa-pen-to-square").next().next();
								var writeCnt = parseInt(writeCntTag.text());
								writeCntTag.text(writeCnt-1); //사이드 프로필 메뉴 작성글-1
							}
						});
					});
					
					//삭제 취소버튼 누를 경우
					$(".delete-cancel-btn").click(function(){
						$(".modal-delete-btn").removeClass("board-delete-now");
					});
					
				}
				
			});
		}
		
		//수정 전 게시글 내 첨부파일 삭제
		function xBtn(thistag){
			var attachmentNo = thistag.prev().data("no");
			var div = thistag.parent().remove();
			console.log(attachmentNo);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
				method:"delete",
				data:attachmentNo,
				async:false,
				success:function(resp){
					var cnt = $("#edit-file-wrap").children();
    				console.log(cnt.length);
    				if(cnt.length==0){
    					$("#edit-select-file").val("");
    				}
				}
			});
		}
		
		//게시글 삭제 시 첨부파일 삭제
		function boardDeleteAttachmentAll(boardNo){
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
				method:"get",
				async:false,
				success:function(resp){
					for(var i=0; i<resp.length; i++){
						var attachmentNo = resp[i].attachmentNo;
		        		$.ajax({
		    				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
		    				method:"delete",
		    				data:attachmentNo,
		    				async:false,
		    				success:function(resp){
		    				}
		    			});
		        	}
				}
			});
		}

		function replyToggle(){
			//댓글창 토글
			$(document).on("click", ".toggle-btn", function(){
				var thisTag = $(this).parent().next(); //reply-box
				$(".reply-box").not(thisTag).attr("style","display:none;"); //지정 태그 이외 동일한 클래스명 안보이게 처리
				$(".reply-box").empty(); //비동기화 출력 위해 생성했던 태그 비우기
				thisTag.toggle();

				var style = thisTag.attr("style");
				if(style=="display: block;"){ //댓글div 열림상태
					var boardNo = $(this).data("no");
				
					var hr = $("<hr>");
					thisTag.append(hr);
					
					//목록 출력
					replyList(thisTag,boardNo);
				}
			});
		}
		
		//댓글출력
		function replyList(thisTag,boardNo){
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_reply/list/"+boardNo,
				method:"get",
				data:boardNo,
				success:function(resp){
					
					for(var i=0; i<resp.length; i++){
						<!-- 댓글 목록 -->	
						replyRepeat(resp[i], thisTag);
					}
					
					<!-- 5개 이상일 경우 더보기 보이게 처리 -->
					if(resp.length>=5){
						var more = $("<div>").attr("class","row mt-3 re-more-view-div");
						var ptag = $("<p>").attr("class","text-center re-more-view cursor-pointer")
										.attr("data-bno",resp[0].boardNo).attr("data-rno",resp[resp.length-1]
										.replyNo).text("+ 더보기");
						more.append(ptag);
						thisTag.append(more);
					}
					
					<!--더보기 버튼 -->
					$(".re-more-view").click(function(){
						var thisTag = $(this);
						var replyBox = $(this).parents(".reply-box");
						var boardNo = $(this).data("bno");
						var replyNo = $(this).data("rno");
						
						if(replyNo==0) return; //데이터 없을경우 비동기화 실행 중지
						
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_reply/list/"+boardNo+"/"+replyNo,
							method:"get",
							success:function(resp){
								console.log(resp);
								if(resp.length<5){
									thisTag.attr("data-rno",0);
		            			}else{
		            				thisTag.attr("data-rno",resp[resp.length-1].replyNo); //다음 비동기화 위한 replyNo 설정
		            			}
								
								thisTag.parent().next().remove();//입력태그 지움
								thisTag.parent().remove();//더보기 지움
								
								for(var i=0; i<resp.length; i++){
									replyRepeat(resp[i], replyBox); //댓글출력
								}
								inputReply(replyBox) //입력태그 생성

							}
						});
					});
					inputReply(thisTag); //입력태그 생성
					//deleteReply(); //댓글삭제
					editSubmitReply(); //댓글수정
				}
			});
		}

		//댓글 목록
		function replyRepeat(resp, thisTag){
			//본인 비교 위해 데이터 준비
			var memberNo = $("[name=memberNo]").val();
			var replyBox = thisTag;
			
			var replyContent = $("<div>").attr("class","reply-content d-flex mb-2").attr("data-reply",resp.replyNo);
			
			var col1 = $("<div>").attr("class","col-1 middle-items");
			var img = $("<img>").attr("class","img-fluid img-circle r-profile-info cursor-pointer").attr("data-mno",resp.memberNo);
			if(resp.attachmentNo!=null){
				img = img.attr("style","width:50px; height:50px;")
						.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			}else{
				img = img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}
			col1.append(img);
			
			var col8 = $("<div>").attr("class","col-8 middle-items ms-3");
			var contentDiv = $("<div>");
			if(memberNo!=resp.memberNo){
				contentDiv.attr("class","col content-div2");
			}else{
				contentDiv.attr("class","col content-div1");
			}
			var p = $("<p>").attr("class","middle-items");
			var nick_span = $("<span>").attr("class","re-nick-font").text(resp.memberNick);
			var date_span = $("<span>").attr("class","re-date-font ms-2").text(resp.replyWriteDate);
			p.append(nick_span).append(date_span);
			var content_p = $("<p>").attr("class","re-content-font middle-items text-start").text(resp.replyContent);
			contentDiv.append(p).append(content_p);
			col8.append(contentDiv);
			
			var col3 = $("<div>").attr("class","col-3 justify-content-end middle-items");
			if(memberNo==resp.memberNo){
				var div = $("<div>").attr("class","dropdown inbl w-auto");
				var span  = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");	
				var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span.append(i);
				
				var menu_div = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo).attr("data-mno",memberNo);
				var edit_span =  $("<span>").attr("class","dropdown-item reply-edit cursor-pointer").text("수정");	
				var delete_span =  $("<span>").attr("class","dropdown-item reply-delete cursor-pointer").text("삭제");	
				menu_div.append(edit_span).append(delete_span);
				
				div.append(span).append(menu_div);
				col3.append(div);
			}
			replyContent.append(col1).append(col8).append(col3);
			replyBox.append(replyContent);

		}
		
		//댓글 등록 추가
		function newReply(resp, replyBox){
			//본인 비교 위해 데이터 준비
			var memberNo = $("[name=memberNo]").val();
		
			var replyContent = $("<div>").attr("class","reply-content d-flex mb-2").attr("data-reply",resp.replyNo);
			
			var col1 = $("<div>").attr("class","col-1 middle-items");
			var img = $("<img>").attr("class","img-fluid img-circle r-profile-info cursor-pointer").attr("data-mno",resp.memberNo);
			if(resp.attachmentNo!=null){
				img = img.attr("style","width:50px; height:50px;")
						.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			}else{
				img = img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}
			col1.append(img);
			
			var col8 = $("<div>").attr("class","col-8 middle-items ms-3");
			var contentDiv = $("<div>");
			if(memberNo!=resp.memberNo){
				contentDiv.attr("class","col content-div2");
			}else{
				contentDiv.attr("class","col content-div1");
			}
			var p = $("<p>").attr("class","middle-items");
			var nick_span = $("<span>").attr("class","re-nick-font").text(resp.memberNick);
			var date_span = $("<span>").attr("class","re-date-font ms-2").text(resp.replyWriteDate);
			p.append(nick_span).append(date_span);
			var content_p = $("<p>").attr("class","re-content-font middle-items text-start").text(resp.replyContent);
			contentDiv.append(p).append(content_p);
			col8.append(contentDiv);
			
			var col3 = $("<div>").attr("class","col-3 justify-content-end middle-items");
			if(memberNo==resp.memberNo){
				var div = $("<div>").attr("class","dropdown inbl w-auto");
				var span  = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");	
				var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span.append(i);
				
				var menu_div = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo).attr("data-mno",memberNo);
				var edit_span =  $("<span>").attr("class","dropdown-item reply-edit cursor-pointer").text("수정");	
				var delete_span =  $("<span>").attr("class","dropdown-item reply-delete cursor-pointer").text("삭제");	
				menu_div.append(edit_span).append(delete_span);
				
				div.append(span).append(menu_div);
				col3.append(div);
			}
			replyContent.append(col1).append(col8).append(col3);
			replyBox.prepend(replyContent);
		}
			
		//댓글 입력 태그 생성
		function inputReply(thisTag){	
			var replyBox = thisTag;
			var form = $("<form>").attr("class","input-reply-form");
			var inputReply = $("<div>").attr("class","row input-reply mt-3");
			var col10 =  $("<div>").attr("class","col-10");
			var input = $("<input>").attr("class","input form-control ms-2 reply-input").attr("type","text").attr("placeholder","댓글을 달아주세요");
			col10.append(input);
			
			var col2 =  $("<div>").attr("class","col-2");
			var write_button = $("<button>").attr("class","btn btn-primary me-2 reply-write")
								.attr("type","submit").text("전송");
			col2.append(write_button);
			inputReply.append(col10).append(col2);
			form.append(inputReply);
			replyBox.append(form);
			$(".reply-write").attr("disabled",true);
			
			contentInput(); //댓글 입력
			submitReply(); //댓글 전송 이벤트
		}
		
		//댓글 입력
		function contentInput(){
			$(".reply-input").on("input",function(){
				var value = $(this).val();
				console.log(value.length);
				$(this).removeClass("is-invalid");
				if(value.length==0){
					$(".reply-write").attr("disabled",true);
				}else if(value.length>100){
					$(".reply-write").attr("disabled",true);
					$(this).addClass("is-invalid");
					$(this).val(value.substring(0,101));
				}else if(value.length>0){
					$(".reply-write").attr("disabled",false);
				}
			});
		}
		
		//댓글 전송
		function submitReply(){
			$(".input-reply-form").submit(function(e){
				e.preventDefault();

				var inputCheck = $(".reply-input").val();
				var replyBox = $(this).parent(); //reply-box

				if(inputCheck.length!=0){
					//댓글 DB저장 데이터 준비
					var boardNo = $(this).parents(".reply-box").siblings('.third-line').children().data("no");
					console.log(boardNo);
					var memberNo = $("[name=memberNo]").val();
					var memberNick = $("[name=memberNick]").val();
					var replyContent = inputCheck;
					
					$.ajax({ //댓글번호 미리 생성
						url:"${pageContext.request.contextPath}/rest_reply/sequence/",
						method:"get",
						success:function(resp){
							var replyNo = resp;
							console.log(replyNo);
							
							replyData = {
									replyNo:replyNo,
									boardNo:boardNo,
									memberNo:memberNo,
									memberNick:memberNick,
									replyContent:replyContent							
							}
							
							$.ajax({
								url:"${pageContext.request.contextPath}/rest_reply/insert",
								method:"post",
								data:JSON.stringify(replyData),
								contentType:"application/json",
								async:false,
								success:function(resp){
									
									$.ajax({
										url:"${pageContext.request.contextPath}/rest_reply/list_one/"+replyNo,
										method:"get",
										async:false,
										success:function(resp){
											replyBox.children("hr").remove(); //hr태그 지움											
											newReply(resp, replyBox); //새로운 태그 생성
											replyBox.prepend($("<hr>")); //hr태그 재생성
											replyBox.children().find(".reply-input").val(""); //input 입력창 공백처리
											replyBox.children().find(".reply-write").attr("disabled",true); //전송 버튼 비활성화
											
											//댓글 숫자 증가
											var findnum = replyBox.prev().children().children('.replycnt');
											var num = findnum.text();
											console.log(num);
											if(num==""){
												num = parseInt(0);
											}else{
												num = parseInt(num);
											}
											findnum.text(num+1);
											
											//사이드 프로필 메뉴 댓글 수량 증가
											var replyCntTag = $(".profile-box").children().find(".fa-comment-dots").next().next();
											var replyCnt = parseInt(replyCntTag.text());
											replyCntTag.text(replyCnt+1);
										}
									});
								}
							});
						}
					});
				}
			});
		}
		
		//댓글 수정 태그 생성
		function editReply(thisTag){	
			var replyBox = thisTag;
			var form = $("<form>").attr("class","edit-reply-form");
			var inputReply = $("<div>").attr("class","row input-reply mt-3");
			var col9 =  $("<div>").attr("class","col-9").attr("style","padding-right:0;");
			var reply_input = $("<input>").attr("class","input form-control reply-input").attr("type","text").attr("placeholder","수정할 내용을 입력해주세요");
			col9.append(reply_input);
			
			var col3 =  $("<div>").attr("class","col-3").attr("style","padding-left:0; padding-right:0;");
			var write_button = $("<button>").attr("class","btn btn-pink reply-write cursor-pointer")
								.attr("type","submit").text("수정");
			var cancel_button = $("<button>").attr("class","btn btn-secondary edit-cancel ms-1 cursor-pointer")
								.attr("type","button").text("취소");
			col3.append(write_button).append(cancel_button);
			inputReply.append(col9).append(col3);
			form.append(inputReply);
			replyBox.append(form);
			$(".reply-write").attr("disabled",true);
			
			contentInput(); //댓글 입력

		}
		
		//수정중 스피너
		function editSpinner(replyEdit){
			var div = $("<div>").attr("class","spinner-border spinner-border-sm me-4")
						.attr("role","status").attr("style","color:pink;");
			var span = $("<span>").attr("visually-hidden");
			div.append(span);
			var edit_span = $("<span>").attr("class","edit-ing me-1").text("수정중")
					.attr("style","color:#F94888; font-weight:bolder; font-size:15px;");
			replyEdit.parents(".col-3").prepend(div).prepend(edit_span);
		}
		
		//댓글 수정 폼
		function editSubmitReply(){
			$(document).on("click", ".reply-edit", function(){
				var changeTagDiv = $(this).parent().parent().parent().prev().children().children(".re-content-font");
				var replyNo = $(this).parents(".reply-content").data("reply");
				var replyBox = $(this).parents(".reply-box");
				replyBox.children('.edit-reply-form').remove(); //edit-reply-form 수정폼 지우기
				replyBox.children('.input-reply-form').remove(); //input-reply-form 입력폼 지우기
				editReply(replyBox); //수정폼 생성
				
				$(".edit-ing").remove(); //수정중 문구 태그 전체 지우기
				$(".spinner-border").remove(); //스피너 태그 전체 지우기
				editSpinner($(this)); //this태그에만 수정중, 스피너 생성
				
				//수정 취소
				$(".edit-cancel").click(function(){
					var deleteSpinner = $(this).parents(".reply-box").children(".reply-content[data-reply="+replyNo+"]");
					deleteSpinner.children(".col-3").children(".edit-ing").remove();
					deleteSpinner.children(".col-3").children(".spinner-border").remove();
					replyBox.children('.edit-reply-form').remove(); //edit-reply-form 수정폼 지우기
					inputReply(replyBox); //입력폼 생성
				});
				
				//수정 폼 이벤트
				$(".edit-reply-form").submit(function(e){
					e.preventDefault();
					var replyContent = replyBox.children('.edit-reply-form').children().find(".reply-input").val(); //수정 입력내용
					//replyContent = encodeURIComponent(replyContent); //특수문자까지 전송가능하도록 처리
					var boardNo = replyBox.prev().children().data("no");
					
					if(replyContent.length!=0){
						
						replyEditData = {
								replyNo:replyNo,
								replyContent:replyContent							
						}
						
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_reply/update/"+replyContent+"/"+replyNo,
							method:"patch",
							data:JSON.stringify(replyEditData),
							contentType:"application/json",
							success:function(resp){
								console.log("댓글 수정성공!");
								//1.수정중문구, 2.스피너 제거, 3.수정폼 제거, 4.입력창 재생성 5.수정태그만 변경 
								$(".edit-ing").remove(); //1
								$(".spinner-border").remove(); //2
								replyBox.children('.edit-reply-form').remove(); //3
								
								inputReply(replyBox); //4
								changeTagDiv.text(replyContent); //5
								
							}
						});
					}
				});					
			});
		}

		//댓글 삭제
		//function deleteReply(){
			$(document).on("click", ".reply-delete", function(){
				var replyNo = $(this).parents(".reply-content").data("reply");
				var thisTag = $(this).parents(".reply-box");
				var replyContent = $(this).parents(".reply-content");
				
				$(".modal-delete-btn").removeClass("board-delete-now reply-delete-now");
				$(".modal-delete-btn").addClass("reply-delete-now");
				$("#deleteModal").modal("show");
				
				//확인버튼에 지우는 클래스 포함되어 있을 경우 삭제 실행
				var judge = $(".modal-delete-btn").hasClass("reply-delete-now");
				if(judge){
					//삭제 확인 버튼 누를 경우
					$(".reply-delete-now").click(function(){
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_reply/delete/"+replyNo,
							method:"delete",
							async:false,
							success:function(resp){

								if(resp==true){
									$(".modal-delete-btn").removeClass("reply-delete-now");
									$("#deleteModal").modal("hide");
									
									replyContent.remove();
									
									//댓글 숫자 감소
									var findnum = thisTag.prev().children().find('.replycnt');
									var num = findnum.text();
									if(num==""){
										findnum.text("");
									}else{
										num = parseInt(num);
										findnum.text(num-1);
									}
									
									//사이드 프로필 메뉴 댓글 수량 감소
									var replyCntTag = $(".profile-box").children().find(".fa-comment-dots").next().next();
									var replyCnt = parseInt(replyCntTag.text());
									replyCntTag.text(replyCnt-1);
								}
							}
						});
					});
					
					//삭제 취소버튼 누를 경우
					$(".delete-cancel-btn").click(function(){
						$(".modal-delete-btn").removeClass("reply-delete-now");
					});
				}

			});
		//}
		
		//파일번호 있는 게시글 확인 후 출력
		function printImg(){
			var check = $(".bimg-find").children("img");

			if(check!=0){ //첨부파일 게시글이 있을때만 실행!
				for(var i=0; i<check.length; i++){
					var boardNo = check.eq(i).parent().data("no");
					var thistag = check.eq(i);

					$.ajax({
						url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
						method:"get",
						async:false,
						success:function(resp){
							thistag.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp[0].attachmentNo);
							
							//나중에 혹시 모르지만 스와이퍼를 위해 data-attach로 첨부파일 번호 넣어둠!
							if(resp.length>1){
								thistag.attr("style","filter: brightness(50%); width:100px; height:100px;");				
								for(var i=0; i<resp.length; i++){
									thistag.attr("data-attach"+i,resp[i].attachmentNo);
								}
							}
						}
					});
				}
			}
		}
		
		//좋아요 버튼 이벤트
		function likeHeart(){
			$(document).on("click", ".like-btn",function(){
				var thistag = $(this);
				var type = thistag.children('.islike').data("type");
				if(type==undefined||type==null){
					type=1;
				}else{
					type=2;
				}
				
				var memberNo = $("[name=memberNo]").val();
				var boardNo = $(this).prev().data("no");
				
				data = {
						memberNo:memberNo,
						boardNo:boardNo
				}
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/update_like/"+boardNo+"/"+type,
					method:"patch",
					contentType:"application/json",
					success:function(resp){
						var number = thistag.children('.islike').text();
						if(type==1){
							thistag.children('.full-heart').show();
							thistag.children('.empty-heart').hide();
							if(number==""){
								number = 0;
							}else{
								number = parseInt(thistag.children('.islike').text());
							}
							thistag.children('.islike').text(number+1);
							thistag.children('.islike').data("type",1);
							
							//좋아요 테이블 DB 등록
							$.ajax({
								url:"${pageContext.request.contextPath}/rest_board/like_insert",
								method:"post",
								async:false,
								data:JSON.stringify(data),
								contentType:"application/json",
								success:function(resp){

								}
							});
						}else{
							thistag.children('.full-heart').hide();
							thistag.children('.empty-heart').show();
							
							var number = parseInt(thistag.children('.islike').text());
							var checknumber = number-1<=0;
							if(checknumber){
								thistag.children('.islike').text("");
							}else{
								thistag.children('.islike').text(number-1);
							}
							thistag.children('.islike').data("type",null);

							//좋아요 테이블 DB 삭제
							$.ajax({
								url:"${pageContext.request.contextPath}/rest_board/delete_like",
								method:"delete",
								data:JSON.stringify(data),
								async:false,
								contentType:"application/json",
								success:function(resp){								
								}
							});						
						}
					}
				});			
			});
		}
		
		//기존 좋아요 목록 출력
		function originLike(){
			var memberNo = $("[name=memberNo]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/fint_like/"+memberNo,
				method:"get",
				data:memberNo,
				success:function(resp){
					for(var i=0; i<resp.length; i++){
						var tag = $(".islike[data-like="+resp[i].boardNo+"]");
						tag.attr("data-type",1);
						tag.siblings('.full-heart').show();
						tag.siblings('.empty-heart').hide();
					}
				}
			});
		}
		
		//이미지 슬라이더
		function zoomTagCreate(url){
			var tag = $(".carousel-inner");
			var div = $("<div>").attr("class","carousel-item");
			var img = $("<img>").attr("src",url).attr("class","d-block w-100");
			div.append(img);
			tag.append(div);
		}
		
		//말줄임표 표시
		function truncate(){
			var outerHeight = 75;
			var contentSet = $(".truncate-check");
			
			contentSet.removeClass("new-text-truncate cursor-pointer");
			for(var i=0; i<contentSet.length; i++){
				var height = contentSet.eq(i).children().outerHeight();
				if(height>=outerHeight){
					contentSet.eq(i).addClass("new-text-truncate cursor-pointer");
				}
			}
		}

		//무한스크롤
		$(document).on("scroll",function(){
			var totalHeight = document.documentElement.scrollHeight; //스크롤 전체높이
			var scrollHeight = document.documentElement.scrollTop; //스크롤 현재 높이
			var clientHeight = document.documentElement.clientHeight; //사용자가 보는 높이
			
			//상단으로 이동버튼 표시
			if(scrollHeight>150){
				$(".top-btn-div").show();
			}else{
				$(".top-btn-div").hide();
			}
			
			var calcul = (totalHeight - scrollHeight)-clientHeight;

			var type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val();
			var dangNo = $("[name=dangNo]").val();
			var category = $("a.btn-blue").data("value");
			var boardNo = $(".board-box").last().data("scrollbno"); //마지막 게시글 번호
			var checkno = $(".board-group").attr("data-scrollcheck"); //비동기 제어 번호
			
			if(checkno==1) return; //데이터 없을경우 비동기화 실행 중지
			
			if(calcul<=10){

				moreData={
						type:type,
						keyword:keyword,
						dangNo:dangNo,
						category:category,
						boardNo:boardNo
				}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/more_view",
					method:"get",
					data:moreData,
					async:false,
					success:function(resp){
						for(var i=0; i<resp.length; i++){
							boardList(resp[i]); //게시글 출력
						}
						
						if(resp.length<5 || resp.length==0){
							$(".board-group").attr("data-scrollcheck",1);
						}
						
						//truncate(); //말줌일표
						printImg(); //게시글 사진 출력
						originLike() //내가 누른 좋아요 출력
					}
				});
			}	
		});
		
		//상단으로 이동
		$(".fa-circle-up").click(function(){
			$("html").scrollTop(0);
		});
		
	});
</script>

