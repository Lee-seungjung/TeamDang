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
	
	.history-search-btn{
	 background-color:#76BEFF;
	  color:white;
	  font-size: 18px;
	}
	
	.btn-schedule-search {
	  background-color:#76BEFF;
	  color:white;
	  font-size: 18px;
	}
	
	.cnt-title{
		font-size:20px;
		font-weight:600;
		color:#404040;
	}
	.cnt-num{
		font-size:22px;
		font-weight:900;
		cursor: pointer;
	}
	.select-color{
		background-color:#D6DEFF;
	}
	
	.select-search-subject, .select-dang-name, .select-dang-search-period{
	  border: 1px #76BEFF solid;
	  color: 454545;
	  font-size: 18px;
	}
	
	.history-search{
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
	
	.ul-history-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-history-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-history-list-page-item-selected {
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
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "select-schedule-history-title mb-3">참여일정 조회</strong> 
<!--                               <select class = "col-2 py-1 mx-2 d-flex justify-content-center align-items-center">
                                <option value = "" class = "select-dang-name-option">선택</option>
                                <option value = "" class = "">목욕댕모임</option>                           
                            </select> -->
                </div>
            </div>
            
			<div class = "row">
			
				<table class="table text-center ">
					<thead>
						<tr class="table">
							<th scope="col" style="width:15%;">댕모임명</th>
							<th scope="col" style="width:20%;">일정 날짜</th>
							<th scope="col" style="width:25%;">일정 제목</th>
							<th scope="col" style="width:25%;">장소명</th>
							<th scope="col" style="width:10%;">참여 회비</th>
						</tr>
					</thead>
					<tbody class="history-data-body">
						<c:choose>
							<c:when test="${scheduleHistory==null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">참여일정이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="joinHistory" items="${scheduleHistory}">
									<tr class="table align-middle">
										<td class="list-dangName" >${joinHistory.dangName}</td>
										<td class="list-scheduleStart" >${joinHistory.scheduleStart}</td>
										<td class="list-scheduleTitle" >${joinHistory.scheduleTitle}</td>
										<td class="list-placeName" >${joinHistory.placeName}</td>
										<td class="list-scheduleMoney" >${joinHistory.scheduleMoney}</td>
									</tr> 
								</c:forEach>	       
							</c:otherwise>
						</c:choose>
		
					</tbody>
				</table>
				
			</div>
			
			
			<div class = "row mt-2">
				<div class = "col-8 offset-2 mt-3 mb-3 d-flex justify-content-center align-items-center">
					<select class = "history-form-select col-2 py-1 mx-2 align-items-center" name="type">
					    <option value = "" >선택</option>
					    <option value = "dang_name">댕모임명</option>
					    <option value = "schedule_title">일정명</option>
					</select>                       
	                <input class="col-8 py-1 mx-2 history-search-input" placeholder="검색어를 입력하세요" name="keyword">
	                <button class="col-2 py-1 mx-2 btn history-search-btn ">검색</button>
				</div>
			</div>
			
			<!-- pagination 시작 -->
			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-history-list-page-navigator">
						<li class = "ul-history-list-page-item ul-history-list-page-item-first d-flex justify-content-center align-items-center" data-pagefirst = "1">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${historyListRequestDto.blockPrev() != 0}">
						<li class = "ul-history-list-page-item ul-history-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${historyListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-history-list-page-item ul-history-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						

						<c:forEach var = "i" begin = "${historyListRequestDto.blockStart()}" end = "${historyListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-history-list-page-item ul-history-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>

						<c:choose>
						<c:when test = "${historyListRequestDto.blockNext() >= historyListRequestDto.blockLast()}">
						<li class = "ul-history-list-page-item ul-history-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${historyListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-history-list-page-item ul-history-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${historyListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<li class = "ul-history-list-page-item ul-history-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${historyListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>  
			<!-- pagination 끝 -->			

		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		// 마이페이지 메뉴 색 변경
		$(".img-select-user-schedule").attr("src", "${pageContext.request.contextPath}/images/mypage-join-meeting-pink.png");
		
		var p = 1;
		var type;
		var keyword;
			
		//검색 버튼 클릭 이벤트
		$(document).on("click",".history-search-btn", function(){
			
			if($(".history-form-select").val() == "" || $(".history-search-input").val() == "") {
				console.log("안돼");
				return;
			}
			
			p = 1;
			
			type = $(".history-form-select").val();
			
			keyword = $(".history-search-input").val();

			//데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			formData.append("type", type);
			formData.append("keyword", keyword);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					
					if(resp.scheduleHistory.length == null){
						var body = $(".history-data-body");
						var tr = $("<tr>").attr("class","align-middle");
						var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
										.text("참여일정이 존재하지 않습니다.");
						tr.append(td);
					}else{
						$(".history-data-body").empty();
						for(var i=0; i<resp.scheduleHistory.length; i++){
							scheduleHistory(resp.scheduleHistory[i]);
						}
						// 초기화
						$(".ul-history-list-page-item-unit").remove();
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							scheduleHistoryPagination(i);
						}
					}
				}
			});
		})
		
		// 페이지 이동
		$(document).on("click", ".ul-history-list-page-item-unit", function(){
			p = $(this).children().text();
			console.log(p);
			 
			var formData = new FormData();
			formData.append("p", p);
			 
			if(type != null && keyword != null) {
				formData.append("type", type);
				formData.append("keyword", keyword);
			}
			 
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					
					$(".history-data-body").empty();
					for(var i=0; i<resp.scheduleHistory.length; i++){
						scheduleHistory(resp.scheduleHistory[i]);
					}
					// 초기화
					$(".ul-history-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						scheduleHistoryPagination(i);
					}
				}
			});
		});
		
		//다음 페이지 버튼
		$(document).on("click", ".ul-history-list-page-item-next",function(){
			p = $(this).attr("data-pagenext");
			console.log(p);
			// 데이터 전송 객체
			var formData = new FormData();
			/* formData.append("keyword", historySearchInput); */
			formData.append("p", p);
			
			//검색어랑 검색 타입이 있으면
			if(type != null || keyword != null ){
				formData.append("type", type);
				formData.append("keyword", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					
					$(".history-data-body").empty();
					for(var i=0; i<resp.scheduleHistory.length; i++){
						scheduleHistory(resp.scheduleHistory[i]);
					}
					// 초기화
					$(".ul-history-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						scheduleHistoryPagination(i);
					}
				}
			});	
		});
		
		
		// 이전 페이지 버튼
		$(document).on("click",".ul-history-list-page-item-prev", function(){
			p = $(this).attr("data-pageprev");
			console.log(p);
			// 데이터 전송 객체
			var formData = new FormData();
			/* formData.append("keyword", historySearchInput); */
			formData.append("p", p);
			//검색어랑 검색 타입이 있으면
			if(type != null || keyword != null ){
				formData.append("type", type);
				formData.append("keyword", keyword);
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".history-data-body").empty();
					for(var i = 0 ; i < resp.scheduleHistory.length ; i++){
						scheduleHistory(resp.scheduleHistory[i]);
					}
					// 초기화
					$(".ul-history-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						scheduleHistoryPagination(i);
					}						
				}
			})
		});
		
		//맨 뒤로 가기 버튼
		$(document).on("click", ".ul-history-list-page-item-last", function(){
			// 마지막 페이지 번호
			p = $(this).attr("data-pagelast");
			// 데이터 전송 객체
			var formData = new FormData()
			/* formData.append("keyword", historySearchInput); */
			formData.append("p", p);
			//검색어랑 검색 타입이 있으면
			if(type != null || keyword != null ){
				formData.append("type", type);
				formData.append("keyword", keyword);
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".history-data-body").empty();
					for(var i = 0 ; i < resp.scheduleHistory.length ; i++){
						scheduleHistory(resp.scheduleHistory[i]);
					}
					// 초기화
					$(".ul-history-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						scheduleHistoryPagination(i);
					}						
				}
			})			
		});
		
		
		// 맨 앞으로 가기 버튼
		$(document).on("click", ".ul-history-list-page-item-first", function(){
			// 페이지를 1페이지로
			p = 1;
			// 데이터 전송 객체
			var formData = new FormData();
			/* formData.append("keyword", historySearchInput); */
			formData.append("p", p);	
			//검색어랑 검색 타입이 있으면
			if(type != null || keyword != null ){
				formData.append("type", type);
				formData.append("keyword", keyword);
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/schedule_history",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-history-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-history-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-history-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-history-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".history-data-body").empty();
					for(var i = 0 ; i < resp.scheduleHistory.length ; i++){
						scheduleHistory(resp.scheduleHistory[i]);
					}
					// 초기화
					$(".ul-history-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						scheduleHistoryPagination(i);
					}						
				}
			})					
		});
			
		//참여일정 목록 비동기 불러오기
		function scheduleHistory(resp){
			var body = $(".history-data-body");
			
			var tr = $("<tr>").attr("class","align-middle");
			var td_dangName = $("<td>").text(resp.dangName);
			var td_scheduleStart = $("<td>").text(resp.scheduleStart);
			var td_scheduleTitle = $("<td>").text(resp.scheduleTitle);
			var td_placeName = $("<td>").text(resp.placeName);
			var td_scheduleMoney = $("<td>").text(resp.scheduleMoney);
	
			tr.append(td_dangName).append(td_scheduleStart).append(td_scheduleTitle).append(td_placeName).append(td_scheduleMoney);
			body.append(tr);
		}
			
		//참여일정 목록 페이징
		function scheduleHistoryPagination(resp){
			$(".ul-history-list-page-item-next")
				.before(
					$("<li>").attr("class", "ul-history-list-page-item ul-history-list-page-item-unit d-flex justify-content-center align-items-center")
						.append(
							$("<span>").text(resp)	
						)
				)
		}
	});

</script>