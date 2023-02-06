<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="참여일정 조회" name="title"/>
</jsp:include>

<style>

/*     * {
        border: 1px gray dotted;
    } */
    
    hr {
	  height: 40px;
	  background-color: blue;
	  width: 100%;
	}
	
	.btn-schedule-search {
	  background-color:#76BEFF;
	  color:white;
	  font-size: 18px;
	}
	
	.select-search-subject, .select-dang-name, .select-dang-search-period{
	  border: 1px #76BEFF solid;
	  color: 454545;
	  font-size: 18px;
	}
	
	.schedule-search{
	  border: 1px #76BEFF solid;
	  color: 454545;
	  font-size: 18px;
	}
	
	.select-schedule-history-title{
	  color: 454545;
	  font-size: 30px;		
	}
	
	.schedule-dang-name, .schedule-dang-join-date, .schedule-dang-schedule-name, .schedule-dang-place, .schedule-dang-money{
	  color: 454545;
	  font-size: 22px;
	}
	
		/* ul 태그 CSS 초기화 */
	ul {
	    list-style: none;
	    margin:0px; 
	    padding:0px;
	}
	
	.ul-dang-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-dang-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-dang-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}


	
</style>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3">
			<div class = "row">
                <div class = "col-10 offset-1 py-3 d-flex justify-content-center align-items-center">
                    <strong class = "Title col-8 offset-2 d-flex justify-content-center align-items-center select-schedule-history-title ">참여일정 조회</strong> 
                              <select class = "col-2 py-1 mx-2 d-flex justify-content-center align-items-center  select-dang-name">
                                <option value = "" class = "select-dang-name-option">선택</option>
                                <option value = "" class = "">목욕댕모임</option>
                                <option value = "" class = "">산책댕모임</option>
                            </select>
                </div>
            </div>
			<div class = "row">
				<div class = "offset-1 col-10">
					<div class = "row list-search-title-menu">			

					 	<div class= "col-3">
					 	 	<span class="schedule-dang-name">댕모임명</span>
					 	</div>					
					 	<div class= "col-2">
					 	 	<span class="schedule-dang-join-date">일정 날짜</span>
					 	</div>
					 	<div class= "col-2">
					 	 	<span class="schedule-dang-schedule-name">일정 제목</span>
					 	</div>
					 	<div class= "col-3">
					 		<span class="schedule-dang-place">장소명</span>
					 	</div>
					 	<div class= "col-2">
					 		<span class="schedule-dang-money">참여 회비</span>
					 	</div>		 				 						 						 	
					</div>
					
					<div class="row list-content">
					<hr><br>
					 	<c:forEach var="joinHistory" items="${scheduleHistory}">
					 	<div class= "col-3 search-result-dang-name">
					 	 	<span>${joinHistory.dangName}</span>
					 	</div>
					 	<div class= "col-2 search-result-dang-join">					 	
					 	 <span>${joinHistory.scheduleStart}</span> 
					 	</div>
					 	<div class= "col-2 search-result-dang-title">
					 	 	<span>${joinHistory.scheduleTitle}</span>
					 	</div>
					 	<div class= "col-3 search-result-dang-place">
					 		<span>${joinHistory.placeName}</span>
					 	</div>
					 	<div class= "col-2 search-result-dang-money">
					 		<span>${joinHistory.scheduleMoney}</span>
					 	</div>
				 </c:forEach>

					
					</div>
					
					<hr><br>
					
				</div>
			</div>
			<div class = "row mt-5">
				<div class = "col-8 offset-2 mt-3 mb-3 d-flex justify-content-center align-items-center">
						      <select class = "col-2 py-1 mx-2 align-items-center select-search-subject">
                                <option value = "" class = "">선택</option>
                                <option value = "" class = "">모임명</option>
                                <option value = "" class = "">일정명</option>
                            </select>                       
                            <input class="col-8 py-1 mx-2 schedule-search" placeholder="검색어를 입력하세요" >
                            <button class="col-2 py-1 mx-2 btn btn-schedule-search">검색</button>
				</div>
			</div>
		
		            <div class = "row">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-dang-list-page-navigator">
						<c:choose>
						<c:when test = "${dangUserJoinRequestDto.isFirst()}">
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${dangUserJoinRequestDto.blockFirst()}'">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<c:choose>
						<c:when test = "${dangUserJoinRequestDto.hasPrev()}">
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${dangUserJoinRequestDto.blockPrev()}'">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<c:choose> <%-- 조회 결과가 하나도 없을 때 --%>
						<c:when test = "${dangUserJoinRequestDto.total == 0}">
						<li class = "ul-dang-list-page-item ul-dang-list-page-item-selected d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=1'">
							<span>1</span>
						</li>
						</c:when>
						<c:otherwise> <%-- 조회 결과가 하나라도 있을 때 --%>
						<c:forEach var = "i" begin = "${dangUserJoinRequestDto.blockStart()}" end = "${dangUserJoinRequestDto.blockEnd()}" step = "1">
							<c:choose>
							<c:when test = "${i == 1}">
							<li class = "ul-dang-list-page-item ul-dang-list-page-item-selected d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${i}'">
								<span>${i}</span>
							</li>
							</c:when>
							<c:otherwise>
							<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${i}'">
								<span>${i}</span>
							</li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
						<c:choose>
						<c:when test = "${dangUserJoinRequestDto.hasNext()}">
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${dangUserJoinRequestDto.blockNext()}'">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<c:choose>
						<c:when test = "${dangUserJoinRequestDto.isLast()}">
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-dang-list-page-item d-flex justify-content-center align-items-center" onClick = "location.href='list_mydang?p=${dangUserJoinRequestDto.blockLast()}'">
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		// 마이페이지 메뉴 색 변경
		$(".img-select-user-schedule").attr("src", "${pageContext.request.contextPath}/images/mypage-join-meeting-pink.png");
	
		
	});

</script>