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
	

</style>

<div class = "container-fluid mt-3">

	<div class = "col-8 offset-2">
		<div class = "row">
		
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<div class = "col-6">
				<div class = "col">
					<!-- 검색바 시작 -->
					<div class="search-group text-center mt-3">
						<select class="form-select inbl w-auto me-1" name="type">
							<option value="">선택</option>
							<option value="member_nick">작성자</option>
							<option value="board_content">내용</option>
						</select>
						<input type="text" class="input form-control inbl w-auto ms-1" size="40" name="keyword">
						<i class="fa-solid fa-magnifying-glass cursor-pointer search-btn" style=" margin-left:-30px; color:#a2c1f6;"></i>
				    </div>
				    <!-- 검색바 끝 -->
				    
				    <!-- #카테고리 시작 -->
				    <div class="category-group text-center mt-4">
						<a class="btn gray category-css rounded-pill me-1 category" data-value="정모후기">#정모후기</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="공지사항">#공지사항</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="가입인사">#가입인사</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="자유글">#자유글</a>
						<a class="btn gray category-css rounded-pill me-1 category btn-blue" data-value="">#전체</a>
				    </div>
				    <!-- #카테고리 끝 -->

				    <!-- 게시글 시작 -->
				    <div class="board-group text-center mt-4">
				    
				    	<c:if test="${boardList.size()==0}">
				    		<div class="col zero-boardList">
				    			<i class="fa-regular fa-clipboard-list"></i>
				    			<span class="zero-boardList-font">등록된 게시글이 없습니다</span>
				    		</div>
				    	</c:if>
				    
				    	<c:forEach var="vo" items="${boardList}">
				    		<!-- 게시글 박스 시작 -->
							<div class="board-box shadow-sm mb-3">
								<div class="first-line d-flex">
									<div class="col-1">
										<c:choose>
											<c:when test="${vo.attachmentNo==null}">
												<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid img-circle">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" class="img-fluid img-circle" style="width:50px; height:50px;">
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
											<fmt:formatDate value="${vo.boardWriteDate}" pattern="yyyy.MM.dd a h:mm"/>
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
										<span class="content-font">${vo.boardContent}</span>
									</div>
									<div class="col-3 middle-items bimg-find" data-no="${vo.boardNo}">
										<c:if test="${vo.boardAttachmentCnt!=null}">
											<!-- 비동기로 사진 불러오기-->
											<img src="#" class="img-fluid img-check cursor-zoomin">
											<c:choose>
											<c:when test="${vo.boardAttachmentCnt-1==0}">
												<span style="font-size:13px;"></span>
											</c:when>
											<c:otherwise>
												+<span style="font-size:13px;">${vo.boardAttachmentCnt-1}</span>
											</c:otherwise>
										</c:choose>
										</c:if>
									</div>
								</div>
								<hr>
								
								<div class="third-line d-flex ms-3 me-3">
									<div class="col-2 middle-items cursor-pointer toggle-btn" data-no="${vo.boardNo}">
										<i class="fa-regular fa-message mt-1 me-2"></i>
										<span class="me-1">댓글</span>
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
									<div class="col-7 justify-content-end middle-items">
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

				</div>
			</div>
			
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
			
			<input type="hidden" name="memberNo" value="${profile.memberNo}">

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
							<button type="button" class="btn btn-secondary write-cancel" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary edit-btn">수정</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 게시판 글수정 모달 끝-->
			
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
					<div class="modal-header">
						<h5 class="modal-title"></h5>
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
</div>

<script>
	$(function(){
		
		truncate(); //말줌일표
		printImg(); //게시글 사진 출력
		originLike() //내가 누른 좋아요 출력

		boardEditReady(); //게시글 수정 첫 화면 기본셋팅
		editSubmitCheck(); //수정폼 전송 전 항목 체크
		boardEditFormSubmit(); //게시글 수정폼 전송
		boardDelete(); //게시글 삭제

		replyToggle(); //댓글 토글
		likeHeart(); //좋아요 버튼 이벤트
		
		//카테고리 색상변경
		$(".category").click(function(){
			var category = $(".category");	
			category.removeClass("btn-blue");
			$(this).addClass("btn-blue");
		});
		
		//엔터키 이벤트
		$("[name=keyword]").on("keyup",function(key){
			var inputText = $("[name=keyword]").val();
	        if(inputText!=undefined && key.keyCode==13) {            
		        //검색조회 비동기 필요
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
			var check = $(this).hasClass("text-truncate2");
			if(check){
				$(this).removeClass("text-truncate2");
			}else{
				$(this).addClass("text-truncate2");
			}
		});
		
		//검색조회
		$(document).on("click", ".search-btn", function(e){	
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
					
					if(resp.length==0){
						zeroBoardList();
						$(".not-result").text("일치하는 검색 결과가 없습니다");
					}else{
						for(var i=0; i<resp.length; i++){
							boardList(resp[i]);
						}
					}
					truncate(); //말줌일표
					printImg(); //게시글 사진 출력
					originLike() //내가 누른 좋아요 출력
					
					$("[name=type]").val("");
					$("[name=keyword]").val("");
				}
			});
		});
		
		//카테고리 검색조회
		$(document).on("click", ".category", function(){
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
						
						if(resp.length==0){
							zeroBoardList();
						}else{
							for(var i=0; i<resp.length; i++){
								boardList(resp[i]);
							}
						}
						truncate(); //말줌일표
						printImg(); //게시글 사진 출력
						originLike() //내가 누른 좋아요 출력
						$("[name=type]").val("");
						$("[name=keyword]").val("");
					}
				});
		});
		
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
			var boardBox = $("<div>").attr("class","board-box shadow-sm mb-3");
			
			//첫번째줄
			var firstLine = $("<div>").attr("class","first-line d-flex");
			var col1 = $("<div>").attr("class","col-1");
			var img1 = $("<img>").attr("class","img-fluid img-circle");
			if(resp.attachmentNo==null){
				img1.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}else{
				img1.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo)
						.attr("style","width:50px; height:50px;");
			}
			col1.append(img1);
			
			var col7 = $("<div>").attr("class","col-7 middle-items ms-3");
			var span1 = $("<span>").attr("class","nick-font").text(resp.memberNick);
			col7.append(span1);
			if(resp.memberOwner=='Y'){
				var img2 = $("<img>").attr("style","width:50px; height:50px;").attr("class","ms-1")
							.attr("src","${pageContext.request.contextPath}/images/crown.png");
				col7.append(img2);
			}

			var col4 = $("<div>").attr("class","col-4 justify-content-end middle-items");
			var date = moment(resp.boardWriteDate).format("YYYY.MM.DD");
			var span2 = $("<span>").attr("class","date-font me-4").text(date);
			col4.append(span2);
			if(resp.memberNo==nowMemberNo){
				var dropdown = $("<div>").attr("class","dropdown inbl w-auto");
				var span3 = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");
				var i1 = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span3.append(i1);
				var dropmenu = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo)
											.attr("data-mno",resp.memberNo);
				var span4 = $("<span>").attr("class","dropdown-item edit-drop cursor-pointer")
									.attr("data-bs-toggle","modal").attr("data-bs-target","#boardEditModal")
									.attr("data-bs-whatever","@mdo").text("수정");
				var span5 = $("<span>").attr("class","dropdown-item delete-drop cursor-pointer").text("삭제");
				dropmenu.append(span4).append(span5);
				dropdown.append(span3).append(dropmenu);
				col4.append(dropdown);
			}
			firstLine.append(col1).append(col7).append(col4);
			
			//두번째 줄
			var secondLine = $("<div>").attr("class","second-line ms-3 me-3 mt-3 mb-4 d-flex");
			var se_col9 = $("<div>").attr("class","col-9 text-start me-1 cursor-pointer truncate-check");
			var se_span1 = $("<span>").attr("class","content-font")
										.text(resp.boardContent);
			se_col9.append(se_span1);
			var se_col3 = $("<div>").attr("class","col-3 middle-items bimg-find").attr("data-no",resp.boardNo);
			if(resp.boardAttachmentCnt!=null){
				var se_img1 = $("<img>").attr("src","#").attr("class","img-fluid img-check");
				var text = resp.boardAttachmentCnt-1;
				if(text==0){
					text="";
				} else{
					text="+"+text;
				}
				var se_span2 = $("<span>").attr("style","font-size:13px;").text(text);
				se_col3.append(se_img1).append(se_span2);
			}
			secondLine.append(se_col9).append(se_col3);
			var hr = $("<hr>");
			
			//세번째 줄
			var thirdLine = $("<div>").attr("class","third-line d-flex ms-3 me-3");
			var th_col2 = $("<div>").attr("class","col-2 middle-items cursor-pointer toggle-btn").attr("data-no",resp.boardNo);
			var th_i1 = $("<i>").attr("class","fa-regular fa-message mt-1 me-2");
			var th_span1 = $("<span>").attr("class","me-1").text("댓글");
			th_col2.append(th_i1).append(th_span1);
			if(resp.replyCnt!=0){
				var th_span2 = $("<span>").attr("class","blue replycnt").attr("style","font-weight:bolder;").text(resp.replyCnt);
				th_col2.append(th_span2);
			}

			var th_col3 = $("<div>").attr("class","col-3 middle-items cursor-pointer like-btn");
			var th_span3 = $("<span>").attr("class","me-2").text("좋아요");
			var th_i2 = $("<i>").attr("class","fa-regular fa-heart pink me-1 empty-heart");
			var th_i3 = $("<i>").attr("class","fa-solid fa-heart me-1 full-heart");
			var th_span4 = $("<span>").attr("class","pink islike").attr("style","font-weight:bolder;");
			if(resp.boardLike!=0){
				th_span4.attr("data-like",resp.boardNo).text(resp.boardLike);
			}
			th_col3.append(th_span3).append(th_i2).append(th_i3).append(th_span4);
			
			var th_col7 = $("<div>").attr("class","col-7 justify-content-end middle-items");
			var th_span5 = $("<span>").text(resp.boardCategory);
			th_col7.append(th_span5);
			thirdLine.append(th_col2).append(th_col3).append(th_col7);
			
			var replyDiv = $("<div>").attr("class","reply-box");
			
			boardBox.append(firstLine).append(secondLine).append(hr).append(thirdLine).append(replyDiv);
			boardGroup.append(boardBox);
		}
		
		//게시글 수정 첫 화면 기본셋팅
		function boardEditReady(){
			$(document).on("click", ".edit-drop", function(){
				$("#boardEditModal").modal("show");
				//원본데이터 출력준비
				var boardContent = $(this).parents(".first-line").next().children().find(".content-font").text();
				var boardCategory = $(this).parents(".first-line").next().next().next().children(".col-7").children().text();
				var boardNo = $(this).parent().data("bno");
				//원본데이터 출력
				$("#edit-category").val(boardCategory).prop("selected", true);
				$("#edit-content").val(boardContent);
				$(".edit-btn").attr("data-no",boardNo);
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
	                		var thistag = $(this);
	                		xBtn(thistag);
	        			});
					}
				});
			});
		}
		
		//수정폼 전송 전 항목 체크
		function editSubmitCheck(){
			//입력 항목 상태 판정
			eCheck={
					boardContent : true, 
					boardCategory : false,
					allValid:function(){
						return this.boardContent && this.boardCategory;
					}
			};
			
			//카테고리 선택 검사
			$("#edit-category").on("change",function(){
				var value = $(this).val();
				if(value==""){
					eCheck.boardCategory=false;
				}else{
					eCheck.boardCategory=true;
				}
			});
			
			//입력창 글자수 확인(최대 1000자)
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
			
			//파일 선택
			$("#edit-select-file").on("change",function(e){
				var value = $(this).val(); //파일위치+파일명
				console.log(this.files); //파일 배열
				if(this.files.length>0){ //파일 있음
					var formData = new FormData();
				
					for(var i=0; i<this.files.length; i++){
						formData.append("attachment", this.files[i]);
					}
					
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_attachment/upload2",
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
		}
		
		

		//수정폼 전송 이벤트
		function boardEditFormSubmit(){
			$(".board-edit-form").submit(function(e){
				e.preventDefault();
				
				//강제실행
				$("#edit-category").change();
				
				if(eCheck.allValid()){
					//수정 데이터 준비
					var boardNo = $(this).children(".modal-footer").children(".edit-btn").data("no");
					var boardContent = $("#edit-content").val();
					var boardCategory = $("#edit-category").val();
							
					editBoardData = {
						boardNo:boardNo,
						boardContent:boardContent,
						boardCategory:boardCategory
					}
							
					//게시글 DB등록
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_board/edit_board",
						method:"patch",
						data:JSON.stringify(editBoardData),
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
					    					console.log("이미지 저장성공!");
					    				}
					    			});
					        	}
				        	}
				        	
				        	//원본게시글에 수정내용 찍어주기
	    					var selectTag = $(".bimg-find[data-no="+boardNo+"]");
	    					var contentTag = selectTag.prev().children();
	    					var categoryTag = selectTag.parent().next().next().children('.col-7').children();
	    					contentTag.text(boardContent);
	    					categoryTag.text(boardCategory);
	    					
	    					selectTag.children("img").remove(); //img태그 지움

							$.ajax({
								url:"${pageContext.request.contextPath}/rest_board/find_img/"+boardNo,
								method:"get",
								async:false,
								success:function(resp){
									if(resp.length>0){
										var img = $("<img>")
		   								.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp[0].attachmentNo)
		   								.attr("class","img-fluid img-check");
										selectTag.prepend(img);
										
										if(resp.length>1){
											var spanNum = selectTag.children("span").text();
											var calcul = resp.length-1;
											if(calcul==0 || calcul<0){
												selectTag.children("span").text("");
											}else if(calcul>0){
												selectTag.children("span").text(calcul);
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
		}

		//게시글 삭제	
		function boardDelete(){
			$(document).on("click", ".delete-drop", function(){
				//작성자와 삭제실행자 일치여부 확인
				//(닉네임 변경 가능성 있으므로 member_no로 확인)
				var writer = $(this).parent().data("mno"); //작성자
				var boardNo = $(this).parent().data("bno"); //글번호
				var memberNo = $("[name=memberNo]").val(); //실행자
				var boardBox = $(this).parents(".board-box"); //해당글 부모 board-box

				if(writer!=memberNo){
					alert('작성자가 일치하지 않습니다! 삭제불가능!');
				}else{
					$(".modal-delete-btn").removeClass("board-delete-now reply-delete-now");
					$(".modal-delete-btn").addClass("board-delete-now");
					$("#deleteModal").modal("show");
					
					//확인버튼에 지우는 클래스 포함되어 있을 경우 삭제 실행
					var judge = $(".modal-delete-btn").hasClass("board-delete-now");
					if(judge){
						//삭제 확인 버튼 누를 경우
						$(".board-delete-now").click(function(){
							boardDeleteAttachmentAll(boardNo);
							$(this).parents(".board-box").remove();
							//삭제 ajax 실행
							$.ajax({
								url:"${pageContext.request.contextPath}/rest_board/delete/"+boardNo,
								method:"delete",
								async:false,
								success:function(resp){
									$(".modal-delete-btn").removeClass("board-delete-now");
									$("#deleteModal").modal("hide");
									boardBox.remove(); //출력된 게시글 지우기
								}
							});
						});
						
						//삭제 취소버튼 누를 경우
						$(".delete-cancel-btn").click(function(){
							$(".modal-delete-btn").removeClass("board-delete-now");
						});
						
					}
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
					deleteReply(); //댓글삭제
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
			var img = $("<img>");
			if(resp.attachmentNo!=null){
				img = img.attr("class","img-fluid img-circle").attr("style","width:50px; height:50px;")
						.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			}else{
				img = img.attr("class","img-fluid img-circle").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}
			col1.append(img);
			
			var col8 = $("<div>").attr("class","col-8 middle-items ms-3");
			var contentDiv = $("<div>");
			if(memberNo!=resp.memberNo){
				contentDiv.attr("class","col content-div2");
			}else{
				contentDiv.attr("class","col content-div1");
			}
			var p1 = $("<p>").attr("class","middle-items");
			var span1 = $("<span>").attr("class","re-nick-font").text(resp.memberNick);
			var span2 = $("<span>").attr("class","re-date-font ms-2").text(resp.replyWriteDate);
			p1.append(span1).append(span2);
			var p2 = $("<p>").attr("class","re-content-font middle-items text-start").text(resp.replyContent);
			contentDiv.append(p1).append(p2);
			col8.append(contentDiv);
			
			var col3 = $("<div>").attr("class","col-3 justify-content-end middle-items");
			if(memberNo==resp.memberNo){
				var div1 = $("<div>").attr("class","dropdown inbl w-auto");
				var span1  = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");	
				var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span1.append(i);
				
				var div2 = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo).attr("data-mno",memberNo);
				var span2 =  $("<span>").attr("class","dropdown-item reply-edit cursor-pointer").text("수정");	
				var span3 =  $("<span>").attr("class","dropdown-item reply-delete cursor-pointer").text("삭제");	
				div2.append(span2).append(span3);
				
				div1.append(span1).append(div2);
				col3.append(div1);
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
			var img = $("<img>");
			if(resp.attachmentNo!=null){
				img = img.attr("class","img-fluid img-circle").attr("style","width:50px; height:50px;")
						.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			}else{
				img = img.attr("class","img-fluid img-circle").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}
			col1.append(img);
			
			var col8 = $("<div>").attr("class","col-8 middle-items ms-3");
			var contentDiv = $("<div>");
			if(memberNo!=resp.memberNo){
				contentDiv.attr("class","col content-div2");
			}else{
				contentDiv.attr("class","col content-div1");
			}
			var p1 = $("<p>").attr("class","middle-items");
			var span1 = $("<span>").attr("class","re-nick-font").text(resp.memberNick);
			var span2 = $("<span>").attr("class","re-date-font ms-2").text(resp.replyWriteDate);
			p1.append(span1).append(span2);
			var p2 = $("<p>").attr("class","re-content-font middle-items text-start").text(resp.replyContent);
			contentDiv.append(p1).append(p2);
			col8.append(contentDiv);
			
			var col3 = $("<div>").attr("class","col-3 justify-content-end middle-items");
			if(memberNo==resp.memberNo){
				var div1 = $("<div>").attr("class","dropdown inbl w-auto");
				var span1  = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");	
				var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span1.append(i);
				
				var div2 = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo).attr("data-mno",memberNo);
				var span2 =  $("<span>").attr("class","dropdown-item reply-edit cursor-pointer").text("수정");	
				var span3 =  $("<span>").attr("class","dropdown-item reply-delete cursor-pointer").text("삭제");	
				div2.append(span2).append(span3);
				
				div1.append(span1).append(div2);
				col3.append(div1);
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
			var input1 = $("<input>").attr("class","input form-control ms-2 reply-input").attr("type","text").attr("placeholder","댓글을 달아주세요");
			col10.append(input1);
			
			var col2 =  $("<div>").attr("class","col-2");
			var button1 = $("<button>").attr("class","btn btn-primary me-2 reply-write")
								.attr("type","submit").text("전송");
			col2.append(button1);
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
									console.log("댓글 등록성공!");
									
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
			var input1 = $("<input>").attr("class","input form-control reply-input").attr("type","text").attr("placeholder","수정할 내용을 입력해주세요");
			col9.append(input1);
			
			var col3 =  $("<div>").attr("class","col-3").attr("style","padding-left:0; padding-right:0;");
			var button1 = $("<button>").attr("class","btn btn-pink reply-write cursor-pointer")
								.attr("type","submit").text("수정");
			var button2 = $("<button>").attr("class","btn btn-secondary edit-cancel ms-1 cursor-pointer")
								.attr("type","button").text("취소");
			col3.append(button1).append(button2);
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
			var span1 = $("<span>").attr("visually-hidden");
			div.append(span1);
			var span2 = $("<span>").attr("class","edit-ing me-1").text("수정중")
					.attr("style","color:#F94888; font-weight:bolder; font-size:15px;");
			replyEdit.parents(".col-3").prepend(div).prepend(span2);
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
		function deleteReply(){
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
								$(".modal-delete-btn").removeClass("reply-delete-now");
								$("#deleteModal").modal("hide");
								
								replyContent.remove();

								//댓글 숫자 감소
								var findnum = thisTag.prev().children().children('.replycnt');
								var num = findnum.text();
								if(num==""){
									findnum.text(0);
								}else{
									num = parseInt(num);
									findnum.text(num-1);
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
		}
		
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
			
			contentSet.removeClass("text-truncate2 cursor-pointer");
			for(var i=0; i<contentSet.length; i++){
				var height = contentSet.eq(i).children().outerHeight();
				if(height>=outerHeight){
					contentSet.eq(i).addClass("text-truncate2 cursor-pointer");
				}
			}
		}
		
	});
</script>