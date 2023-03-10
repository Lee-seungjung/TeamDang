<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="회원 관리" name="title"/>
</jsp:include>
<style>
	
	.number-box{
		background-color:#F1F4FF;
		padding:30px 40px;
		text-align:center;
		border-radius: 0.3rem;
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
	
	/* 페이지네이션 */
	ul {
	    list-style: none;
	    margin:0px; 
	    padding:0px;
	}
	
	.ul-puppy-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-puppy-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-puppy-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}
</style>
<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:30px; font-weight:bolder;">회원 관리</p>
			</div>
			
			<div class = "row mt-4">
				<div class = "col-4">
					<div class = "col number-box select-color user-number" onclick="location.href='${pageContext.request.contextPath}/admin/user_list'">
						<p class="mb-1 cnt-title">가입자 수</p>
						<p class="mt-1 cnt-num"  data-numberstate="가입자수">${userTotal}명</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col number-box puppy-number" onclick="location.href='${pageContext.request.contextPath}/admin/puppy_list'">
						<p class="mb-1 cnt-title">댕댕이 등록 수</p>
						<p class="mt-1 cnt-num" data-numberstate="댕등록수">${dangTotal}마리</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col number-box member-number" onclick="location.href='${pageContext.request.contextPath}/admin/member_list'">
						<p class="mb-1 cnt-title" >댕모임 멤버 수</p>
						<p class="mt-1 cnt-num" data-numberstate="댕모임멤버수">${dangMemberTotal}명</p>
					</div>
				</div>
			</div>
			
			
			<div class="row mt-5">
				<div class="col-6 offset-3 text-center search-wrap d-flex">
					<select class="puppy-form-select form-select flex-fill me-1" style="width:20%;" name="type">
						<option value="">선택</option>
						<option value="puppy_name">댕댕이 이름</option>
						<option value="user_id">댕주인 아이디</option>						
					</select>
					<div class="d-flex" style="width:70%;">
						<input type="text" class="input form-control puppy-search-input ms-1 flex-fill" name="keyword">
						<button class="btn btn-primary puppy-search-btn ms-1">
							<i class="fa-solid fa-magnifying-glass cursor-pointer"></i>
						</button>
			    	</div>
				</div>
			</div>

  			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-puppy-list-page-navigator">
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-first d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${puppyListRequestDto.blockPrev() != 0}">
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${puppyListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						
						<c:forEach var = "i" begin = "${puppyListRequestDto.blockStart()}" end = "${puppyListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>
						<c:choose>
						<c:when test = "${puppyListRequestDto.blockNext() >= puppyListRequestDto.blockLast()}">
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${puppyListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${puppyListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>

						<li class = "ul-puppy-list-page-item ul-puppy-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${puppyListRequestDto.blockLast()}" >
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>  
			
			<div class="row mt-5">
				<table class="table text-center ">
					<thead>
						<tr class="table">
							<th scope="col" style="width:15%;">댕댕이 번호</th>
							<th scope="col" style="width:20%;">댕댕이 이름</th>
							<th scope="col" style="width:25%;">나이</th>
							<th scope="col" style="width:15%;">댕주인 아이디</th>
							<th scope="col" >상세</th>
						</tr>
					</thead>
					<tbody class="puppy-data-body">
						<c:choose>
							<c:when test="${puppyListAdmin == null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">내역이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="puppyListAdmin" items="${puppyListAdmin}">
									<tr class="table align-middle">
										<td class="list-puppyNo">${puppyListAdmin.puppyNo}</td>
										<td class="list-puppyName" >${puppyListAdmin.puppyName}</td>
										<td class="list-puppyAge">${puppyListAdmin.puppyAge}</td>
										<td class="list-puppyGender">${puppyListAdmin.userId}</td>
										<td>
											<a class="btn btn-primary puppy-detail"  href="${pageContext.request.contextPath}/admin/puppy_detail?puppyNo=${puppyListAdmin.puppyNo}">상세</a>
										</td>
									</tr> 
								</c:forEach>	       
							</c:otherwise>
						</c:choose>
		
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	
	// 카테고리 색 변경
	$(".puppy-number").css("background-color", "#D6DEFF");
	
	//목록 조회 시 가입자수,댕등록수,댕모임멤버수 색상 변경
	var url = new URL(location.href);
	var numberState = url.searchParams.get("numberState");
	$(".number-box").removeClass("select-color");
	$(".cnt-num[data-numberState="+numberState+"]").parent().addClass("select-color");
	
	var p = 1;
	var numberState = "댕모임멤버수";
	var type;
	var keyword;
	
	//숫자 페이지 클릭 이벤트
	$(document).on("click", ".ul-puppy-list-page-item-unit", function(){
		console.log($(this).children().text());
		
		p = $(this).children().text();
		
		var formData = new FormData();
		formData.append("p", p);
		
		if(type != null && keyword != null) {
			formData.append("type", type);
			formData.append("keyword", keyword);
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				console.log(resp);
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				$(".puppy-data-body").empty();
				if(resp.puppyList.length == 0){
					var body = $(".puppy-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
					body.append(tr);
				}else{
					
					for(var i=0; i<resp.puppyList.length; i++){
						puppyList(resp.puppyList[i]);
					}
					// 초기화
					$(".ul-puppy-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						puppyListPagination(i);
					}
				}
			}	
		});
	});
	
	//검색 버튼 클릭 이벤트
	$(document).on("click",".puppy-search-btn", function(){
		
		var puppySelectBox = $(".puppy-form-select").val();
		console.log(puppySelectBox);
		
		var puppySearchInput = $(".puppy-search-input").val();
		console.log(puppySearchInput);	
		
		if(puppySelectBox == "" || puppySearchInput == "") {
			console.log("안돼");
			return;
		}		
		type = puppySelectBox;
		keyword = puppySearchInput;
		
		console.log("돼");
		//데이터 전송 객체
		var formData = new FormData();
		formData.append("p", 1);
		formData.append("numberState", numberState);
		formData.append("type", type);
		formData.append("keyword", keyword);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				$(".puppy-data-body").empty();
				
				if(resp.puppyList.length == 0){
					var body = $(".puppy-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
					body.append(tr);
				}else{					
					for(var i=0; i<resp.puppyList.length; i++){
						puppyList(resp.puppyList[i]);
					}
					// 초기화
					$(".ul-puppy-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						puppyListPagination(i);
					}
				}
			}
	
		});
		
	})
	
	//다음 페이지 버튼
	$(document).on("click", ".ul-puppy-list-page-item-next",function(){
		p = $(this).attr("data-pagenext");
		console.log(p);
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".puppy-form-select").val() != "" || $(".puppy-search-input").val() != "" ){
			formData.append("type", $(".puppy-form-select").val());
			formData.append("keyword", $(".puppy-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				$(".puppy-data-body").empty();
				for(var i=0; i<resp.puppyList.length; i++){
					puppyList(resp.puppyList[i]);
				}
				// 초기화
				$(".ul-puppy-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					puppyListPagination(i);
				}
				
			}
	
		});	
		
	});
	
	
	// 이전 페이지 버튼
	$(document).on("click",".ul-puppy-list-page-item-prev", function(){
		p = $(this).attr("data-pageprev");
		console.log(p);
		
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".puppy-form-select").val() != "" || $(".puppy-search-input").val() != "" ){
			formData.append("type", $(".puppy-form-select").val());
			formData.append("keyword", $(".puppy-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".puppy-data-body").empty();
				for(var i = 0 ; i < resp.puppyList.length ; i++){
					puppyList(resp.puppyList[i]);
				}
				// 초기화
				$(".ul-puppy-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					puppyListPagination(i);
				}						
			}
		})
	});
	
	//맨 뒤로 가기 버튼
	$(document).on("click", ".ul-puppy-list-page-item-last", function(){
		// 마지막 페이지 번호
		p = $(this).attr("data-pagelast");
		// 데이터 전송 객체
		var formData = new FormData()
		formData.append("p", p);	
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".puppy-form-select").val() != "" || $(".puppy-search-input").val() != "" ){
			formData.append("type", $(".puppy-form-select").val());
			formData.append("keyword", $(".puppy-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".puppy-data-body").empty();
				for(var i = 0 ; i < resp.puppyList.length ; i++){
					puppyList(resp.puppyList[i]);
				}
				// 초기화
				$(".ul-puppy-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					puppyListPagination(i);
				}						
			}
		})			
	});
	
	
	// 맨 앞으로 가기 버튼
	$(document).on("click", ".ul-puppy-list-page-item-first", function(){
		// 페이지를 1페이지로
		p = 1;
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);	
		formData.append("numberState", numberState);
		//검색어랑 검색 타입이 있으면
		if($(".puppy-form-select").val() != "" || $(".puppy-search-input").val() != "" ){
			formData.append("type", $(".puppy-form-select").val());
			formData.append("keyword", $(".puppy-search-input").val());
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/rest_admin/puppy_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".puppy-data-body").empty();
				for(var i = 0 ; i < resp.puppyList.length ; i++){
					puppyList(resp.puppyList[i]);
				}
				// 초기화
				$(".ul-puppy-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					puppyListPagination(i);
				}						
			}
		})					
	});
	
/*  	//카테고리 조회
	$(document).on("click", ".cnt-num", function(){
		$(".number-box").removeClass("select-color");
		$(this).parent().addClass("select-color");
		
		var type = $(".member-form-select").val("").prop("selected", true);
		var keyword = $(".member-search-input").val("");
		numberState = $(this).attr("data-numberstate");
		p = 1;
		console.log(numberState);
		
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		$(".puppy-data-body").empty();//출력 div 비우기
		//댕댕이 카운트 클릭 조회
		$.ajax({
			url:"${pageContext.request.contextPath}/rest_admin/puppy_list",
			method:"post",
			data : formData,
			contentType: false,
	        processData: false,
			success:function(resp){
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-puppy-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-puppy-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-puppy-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-puppy-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				if(resp.puppyList.length==0){
					var body = $(".puppy-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
				}else{
					for(var i=0; i<resp.puppyList.length; i++){
						puppyList(resp.puppyList[i]);
					}
					// 초기화
					$(".ul-puppy-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						puppyListPagination(i);
					}
				}
			}
		});
	});  */
	
	//댕댕이 목록 비동기 불러오기
	function puppyList(resp){
		var body = $(".puppy-data-body");
		
		var tr = $("<tr>").attr("class","align-middle");
		var td_puppyNo = $("<td>").text(resp.puppyNo);
		var td_puppyName = $("<td>").text(resp.puppyName);
		var td_puppyAge = $("<td>").text(resp.puppyAge);
		var td_userId = $("<td>").text(resp.userId);
		var td_detail = $("<td>");
		var a_btn = $("<a>").attr("class","btn btn-primary").text("상세")
		.attr("href","${pageContext.request.contextPath}/admin/puppy_detail?puppyNo="+resp.puppyNo);
		td_detail.append(a_btn);
		tr.append(td_puppyNo).append(td_puppyName).append(td_puppyAge).append(td_userId).append(td_detail);
		body.append(tr);
	}
		
	//댕댕이 목록 페이징
	function puppyListPagination(resp){
		$(".ul-puppy-list-page-item-next")
			.before(
				$("<li>").attr("class", "ul-puppy-list-page-item ul-puppy-list-page-item-unit d-flex justify-content-center align-items-center")
					.append(
						$("<span>").text(resp)	
					)
			)
	}
	
});
</script>