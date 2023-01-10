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

</style>

<script>
	$(function(){
		$(".toggle-btn").click(function(){
			var thisTag = $(this).parent().next();
			thisTag.toggle();
		});
		
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
						<input type="text" class="input form-control inbl w-auto ms-1" size="40">
						<i class="fa-solid fa-magnifying-glass cursor-pointer" style=" margin-left:-30px; color:#a2c1f6;"></i>
				    </div>
				    <!-- 검색바 끝 -->
				    
				    <!-- #카테고리 시작 -->
				    <div class="category-group text-center mt-4">
						<span class="me-1">#카테고리</span>
						<button type="button" class="btn btn-secondary rounded-pill me-1">#정모후기</button>
						<button type="button" class="btn btn-secondary rounded-pill me-1">#공지사항</button>
						<button type="button" class="btn btn-secondary rounded-pill me-1">#가입인사</button>
						<button type="button" class="btn btn-secondary rounded-pill me-1">#자유글</button>
						<button type="button" class="btn btn-secondary rounded-pill me-1">#전체</button>
				    </div>
				    <!-- #카테고리 끝 -->

				    <!-- 게시글 시작 -->
				    <div class="board-group text-center mt-4">
				    
				    	<c:forEach var="vo" items="${boardList}">
				    		<!-- 게시글 박스 시작 -->
							<div class="board-box shadow-sm mb-4">
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
										<c:if test="${vo.boardAttachmentNo!=null}">
											<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.boardAttachmentNo}" class="img-fluid">
										</c:if>
									</div>
								</div>
								<hr>
								
								<div class="third-line d-flex ms-3 me-3">
									<div class="col-2 middle-items cursor-pointer toggle-btn">
										<i class="fa-regular fa-message mt-1 me-2"></i>
										<span class="me-1">댓글</span>
										<span class="blue" style="font-weight:bolder;">${vo.replyCnt}</span>
									</div>
									<div class="col-3 middle-items cursor-pointer toggle-btn">
										<span class="me-2">좋아요</span>
										<i class="fa-regular fa-heart blue me-1"></i>
										<i class="fa-solid fa-heart blue me-1 full-heart"></i>
										<span class="blue" style="font-weight:bolder;">${vo.boardLike}</span>
									</div>
									<div class="col-7 justify-content-end middle-items">
										<span>카테고리</span>
									</div>
								</div>
								
								<!-- 댓글 박스 시작 -->
								<div class="reply-box">
									<hr>
									<div class="reply-content d-flex">
										<div class="col-1">
											<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid">
										</div> 
										<div class="col-8 middle-items ms-3">
											<div class="col content-div1">
												<p class="middle-items">
													<span class="re-nick-font ">닉네임</span>
													<span class="re-date-font ms-2">2023.01.10 오후 3:34</span>
												</p>
												<p class="re-content-font middle-items text-start">글이에요댓글이에요</p>
											</div>
										</div>
										<div class="col-3 justify-content-end middle-items">
											<i class="fa-solid fa-ellipsis-vertical me-3"></i>
										</div>
									</div>
									
									<div class="row mt-3 re-more-view">
										<p class="text-center">+ 더보기</p>
									</div>
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
		</div>
	</div>

</div>