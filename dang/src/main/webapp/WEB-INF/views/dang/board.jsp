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
		width:650px;
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

</style>

<script>
	$(function(){		
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
		
		//댓글창 토글
		$(".toggle-btn").click(function(){
			var thisTag = $(this).parent().next();
			thisTag.toggle();

			var style = thisTag.attr("style");
			if(style=="display: block;"){ //댓글div 열림
				
				var boardNo = $(this).data("no");
				//댓글출력
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_reply/list/"+boardNo,
					method:"get",
					data:boardNo,
					success:function(resp){
						console.log(resp);
						
						for(var i=0; i<resp.length; i++){
							<!-- 댓글 목록 -->	
							replyRepeat(resp[i], thisTag);
						}
						
						<!-- 3개 이상일 경우 더보기 보이게 처리 -->
						if(resp.length>=3){
							var more = $("<div>").attr("class","row mt-3 re-more-view");
							var ptag = $("<p>").attr("class","text-center").attr("data-no",resp[0].boardNo).text("+ 더보기");
							more.append(ptag);
							thisTag.append(more);
						}
						
						<!-- 댓글 입력창 -->	
						inputReply(thisTag);
					}
				});			
			}else{ //댓글div 닫힘
				thisTag.empty();
			}
		});
		
		
		//댓글 목록
		function replyRepeat(resp, thisTag){
			//본인 비교 위해 데이터 준비
			var memberNo = $("[name=memberNo]").val();
			var replyBox = thisTag;
			var hr = $("<hr>");
			replyBox.append(hr);
			
			var replyContent = $("<div>").attr("class","reply-content d-flex");
			
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
			var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
			col3.append(i);
			
			replyContent.append(col1).append(col8).append(col3);
			replyBox.append(replyContent);
		}
			
		//댓글 입력
		function inputReply(thisTag){	
			var replyBox = thisTag;
			var inputReply = $("<div>").attr("class","row input-reply mt-3");
			var col10 =  $("<div>").attr("class","col-10");
			var input1 = $("<input>").attr("class","input form-control ms-2").attr("type","text").attr("placeholder","댓글을 달아주세요");
			col10.append(input1);
			
			var col2 =  $("<div>").attr("class","col-2");
			var button1 = $("<button>").attr("class","btn btn-primary me-2").attr("type","button").text("전송");
			col2.append(button1);
			inputReply.append(col10).append(col2);
			replyBox.append(inputReply);
		}

		
	});
</script>

<div class = "container-fluid mt-3">

	<div class = "col-10 offset-1">
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
							<option>선택</option>
							<option value="memberNo">작성자</option>
							<option value="boardContent">내용</option>
						</select>
						<input type="text" class="input form-control inbl w-auto ms-1" size="40" name="keyword">
						<i class="fa-solid fa-magnifying-glass cursor-pointer" style=" margin-left:-30px; color:#a2c1f6;"></i>
				    </div>
				    <!-- 검색바 끝 -->
				    
				    <!-- #카테고리 시작 -->
				    <div class="category-group text-center mt-4">
						<a class="btn gray category-css rounded-pill me-1 category" data-value="정모후기">#정모후기</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="공지사항">#공지사항</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="가입인사">#가입인사</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="자유글">#자유글</a>
						<a class="btn gray category-css rounded-pill me-1 category btn-blue">#전체</a>
				    </div>
				    <!-- #카테고리 끝 -->

				    <!-- 게시글 시작 -->
				    <div class="board-group text-center mt-4">
				    
				    	<c:forEach var="vo" items="${boardList}">
				    		<!-- 게시글 박스 시작 -->
							<div class="board-box shadow-sm mb-3">
								<div class="first-line d-flex">
									<div class="col-1">
										<c:choose>
											<c:when test="${vo.attachmentNo!=null}">
												<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" class="img-fluid">
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
										<i class="fa-solid fa-ellipsis-vertical me-3"></i>
									</div>
								</div>
								
								<div class="second-line ms-3 me-3 mt-3 mb-4 d-flex" style="height:72px;">
									<div class="col-10 text-start">
										<span class="content-font">${vo.boardContent}</span>
									</div>
									<div class="col-2 middle-items">
										<c:if test="${vo.allImg!=null}">
											<!-- 비동기로 사진 불러오기 스와이퍼 태그에 파일번호 data-no숨기기 -->
											<img src="#" class="img-fluid " data-no="${vo.boardNo}">
										</c:if>
									</div>
								</div>
								<hr>
								
								<div class="third-line d-flex ms-3 me-3">
									<div class="col-2 middle-items cursor-pointer toggle-btn" data-no="${vo.boardNo}">
										<i class="fa-regular fa-message mt-1 me-2"></i>
										<span class="me-1">댓글</span>
										<c:if test="${vo.replyCnt!=0}">
											<span class="blue" style="font-weight:bolder;">${vo.replyCnt}</span>
										</c:if>
									</div>
									<div class="col-3 middle-items cursor-pointer like-btn">
										<span class="me-2">좋아요</span>
										<i class="fa-regular fa-heart blue me-1"></i>
										<i class="fa-solid fa-heart blue me-1 full-heart"></i>
										<c:if test="${vo.boardLike!=0}">
											<span class="blue" style="font-weight:bolder;" data-like="${vo.boardNo}">${vo.boardLike}</span>
										</c:if>
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
		</div>
	</div>
</div>