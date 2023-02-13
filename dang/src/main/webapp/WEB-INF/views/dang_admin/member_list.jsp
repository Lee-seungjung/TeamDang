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
	
	.ul-member-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-member-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-member-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}
</style>
<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">회원관리 현황</p>
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
						<p class="mb-1 cnt-title">댕 등록 수</p>
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
					<select class="member-form-select form-select flex-fill me-1" style="width:20%;" name="type">
						<option value="">선택</option>
						<option value="dang_name">댕모임이름</option>
						<option value="member_nick">댕모임닉네임</option>
						<option value="user_id">회원아이디</option>
					</select>
					<div class="d-flex" style="width:70%;">
						<input type="text" class="input form-control member-search-input ms-1 flex-fill" name="keyword">
						<button class="btn btn-primary member-search-btn ms-1">
							<i class="fa-solid fa-magnifying-glass cursor-pointer"></i>
						</button>
			    	</div>
				</div>
			</div>
			
  			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-member-list-page-navigator">
						<li class = "ul-member-list-page-item ul-member-list-page-item-first d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${memberListRequestDto.blockPrev() != 0}">
						<li class = "ul-member-list-page-item ul-member-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${memberListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-member-list-page-item ul-member-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						
						<c:forEach var = "i" begin = "${memberListRequestDto.blockStart()}" end = "${memberListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-member-list-page-item ul-member-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>
						<c:choose>
						<c:when test = "${memberListRequestDto.blockNext() >= memberListRequestDto.blockLast()}">
						<li class = "ul-member-list-page-item ul-member-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${memberListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-member-list-page-item ul-member-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${memberListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>

						<li class = "ul-member-list-page-item ul-member-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${memberListRequestDto.blockNext()}" >
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>  
			
			<div class="row mt-5">
				<table class="table text-center ">
					<thead>
						<tr class="table">
							<th scope="col" style="width:10%;">모임 번호</th>
							<th scope="col" style="width:25%;">댕모임명</th>
							<th scope="col" style="width:25%;">댕모임닉네임(회원아이디)</th>
							<th scope="col" style="width:25%;">활동점수</th>
							<th scope="col" style="width:20%;">가입일자</th>
						</tr>
					</thead>
					<tbody class="member-data-body">
						<c:choose>
							<c:when test="${memberListAdmin == null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">내역이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="memberListAdmin" items="${memberListAdmin}">
									<tr class="table align-middle">
										<td class="list-dangNo" data-dno="">${memberListAdmin.dangNo}</td>
										<td class="list-dangName" data-dno="">${memberListAdmin.dangName}</td>
										<td class="list-memberNick-userId" data-dno="">${memberListAdmin.memberNick}(${memberListAdmin.userId})</td>
										<td class="list-memberGrade-memberScore" data-dno="">${memberListAdmin.memberGrade}(${memberListAdmin.memberScore})</td>
										<td class="list-memberJoindate" data-dno="">${memberListAdmin.memberJoindate}</td>
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
	$(".member-number").css("background-color", "#D6DEFF");
	
	//목록 조회 시 가입자수,댕등록수,댕모임멤버수 색상 변경
	var url = new URL(location.href);
	var numberState = url.searchParams.get("numberState");
	$(".number-box").removeClass("select-color");
	$(".cnt-num[data-numberState="+numberState+"]").parent().addClass("select-color");
	
	var p = 1;
	var numberState = "댕등록수";
	var type;
	var keyword;
	//숫자 페이지 클릭 이벤트
	$(document).on("click", ".ul-member-list-page-item-unit", function(){
		console.log($(this).children().text());
		
		p = $(this).children().text();
		
		var formData = new FormData();
		formData.append("p", p);
		
		if(type != null && keyword != null) {
			formData.append("type", type);
			formData.append("keyword", keyword);
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				console.log(resp);
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				$(".member-data-body").empty();
				if(resp.memberList.length == 0){
					var body = $(".member-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
					body.append(tr);
				}else{
					
					for(var i=0; i<resp.memberList.length; i++){
						memberList(resp.memberList[i]);
					}
					// 초기화
					$(".ul-member-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						memberListPagination(i);
					}
				}
			}	
		});
	});	
	
	//검색 버튼 클릭 이벤트
	$(document).on("click",".member-search-btn", function(){
		
		var memberSelectBox = $(".member-form-select").val();
		console.log(memberSelectBox);
		
		var memberSearchInput = $(".member-search-input").val();
		console.log(memberSearchInput);	
		
		if(memberSelectBox == "" || memberSearchInput == "") {
			console.log("안돼");
			return;
		}
		type = memberSelectBox;
		keyword = memberSearchInput;
		
		console.log("돼");
		//데이터 전송 객체
		var formData = new FormData();
		formData.append("p", 1);
		formData.append("numberState", numberState);
		formData.append("type", type);
		formData.append("keyword", keyword);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				$(".member-data-body").empty();
				
				if(resp.memberList.length == 0){
					var body = $(".member-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
					body.append(tr);					
				}else{
					for(var i=0; i<resp.memberList.length; i++){
						memberList(resp.memberList[i]);
					}
					// 초기화
					$(".ul-member-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						memberListPagination(i);
					}
				}
			}
	
		});
		
	})
	
	//다음 페이지 버튼
	$(document).on("click", ".ul-member-list-page-item-next",function(){
		p = $(this).attr("data-pagenext");
		console.log(p);
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".member-form-select").val() != "" || $(".member-search-input").val() != "" ){
			formData.append("type", $(".member-form-select").val());
			formData.append("keyword", $(".member-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				$(".member-data-body").empty();
				for(var i=0; i<resp.memberList.length; i++){
					memberList(resp.memberList[i]);
				}
				// 초기화
				$(".ul-member-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					memberListPagination(i);
				}
				
			}
	
		});	
		
	});
	
	
	// 이전 페이지 버튼
	$(document).on("click",".ul-member-list-page-item-prev", function(){
		p = $(this).attr("data-pageprev");
		console.log(p);
		
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".member-form-select").val() != "" || $(".member-search-input").val() != "" ){
			formData.append("type", $(".member-form-select").val());
			formData.append("keyword", $(".member-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".member-data-body").empty();
				for(var i = 0 ; i < resp.memberList.length ; i++){
					memberList(resp.memberList[i]);
				}
				// 초기화
				$(".ul-member-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					memberListPagination(i);
				}						
			}
		})
	});
	
	//맨 뒤로 가기 버튼
	$(document).on("click", ".ul-member-list-page-item-last", function(){
		// 마지막 페이지 번호
		p = $(this).attr("data-pagelast");
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);
		formData.append("numberState", numberState);
		
		//검색어랑 검색 타입이 있으면
		if($(".member-form-select").val() != "" || $(".member-search-input").val() != "" ){
			formData.append("type", $(".member-form-select").val());
			formData.append("keyword", $(".member-search-input").val());
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".member-data-body").empty();
				for(var i = 0 ; i < resp.memberList.length ; i++){
					memberList(resp.memberList[i]);
				}
				// 초기화
				$(".ul-member-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					memberListPagination(i);
				}						
			}
		})			
	});
	
	
	// 맨 앞으로 가기 버튼
	$(document).on("click", ".ul-member-list-page-item-first", function(){
		// 페이지를 1페이지로
		p = 1;
		// 데이터 전송 객체
		var formData = new FormData();
		formData.append("p", p);	
		formData.append("numberState", numberState);
		//검색어랑 검색 타입이 있으면
		if($(".member-form-select").val() != "" || $(".member-search-input").val() != "" ){
			formData.append("type", $(".member-form-select").val());
			formData.append("keyword", $(".member-search-input").val());
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/member_list",
			method : "post",
			data : formData,
			contentType: false,
	        processData: false,
			success : function(resp) {
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				// 초기화
				$(".member-data-body").empty();
				for(var i = 0 ; i < resp.memberList.length ; i++){
					memberList(resp.memberList[i]);
				}
				// 초기화
				$(".ul-member-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					memberListPagination(i);
				}						
			}
		})					
	});
	
/* 	//카테고리 조회
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
		
		$(".member-data-body").empty();//출력 div 비우기
		//댕모임 멤버 카운트 클릭 조회
		$.ajax({
			url:"${pageContext.request.contextPath}/admin/member_list",
			method:"post",
			data : formData,
			contentType: false,
	        processData: false,
			success:function(resp){
				console.log(resp);
				
				// 양 끝 페이지네이션 버튼 설정
				$(".ul-member-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
				$(".ul-member-list-page-item-last").attr("data-pagelast", resp.blockLast);
				if(resp.blockPrev <= 1) {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", 1);
				} else {
					$(".ul-member-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
				}
				if(resp.blockNext > resp.blockLast) {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockLast);
				} else {
					$(".ul-member-list-page-item-next").attr("data-pagenext", resp.blockNext);
				}
				
				if(resp.memberList.length==0){
					var body = $(".member-data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
				}else{
					for(var i=0; i<resp.memberList.length; i++){
						userList(resp.memberList[i]);
					}
					// 초기화
					$(".ul-member-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						memberListPagination(i);
					}
				}
			}
		});
	}); */
	
	//댕모임 멤버 목록 비동기 불러오기
	function memberList(resp){
		var body = $(".member-data-body");
		
		var tr = $("<tr>").attr("class","align-middle");
		var td_dangNo = $("<td>").text(resp.dangNo);
		var td_dangName = $("<td>").text(resp.dangName);
		var td_memberInfo = $("<td>").text(resp.memberNick+"("+resp.userId+")");
		var td_memberGrade = $("<td>").text(resp.memberGrade+"("+resp.memberScore+")");
		var td_memberJoindate = $("<td>").text(resp.memberJoindate);
		tr.append(td_dangNo).append(td_dangName).append(td_memberInfo).append(td_memberGrade).append(td_memberJoindate);
		body.append(tr);
	}	
	
	
	//댕모임 멤버 목록 페이징
	function memberListPagination(resp){
		$(".ul-member-list-page-item-next")
			.before(
				$("<li>").attr("class", "ul-member-list-page-item ul-member-list-page-item-unit d-flex justify-content-center align-items-center")
					.append(
						$("<span>").text(resp)	
					)
			)
	}
	
});
</script>