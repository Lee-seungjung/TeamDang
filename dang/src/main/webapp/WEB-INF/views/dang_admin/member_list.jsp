<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="회원관리 현황" name="title"/>
</jsp:include>

<style>
	
	.member-list-box{
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
					<div class = "col member-list-box select-color">
						<p class="mb-1 cnt-title">총 가입자 수</p>
						<p class="mt-1 cnt-num"  data-userstate="가입자수">${userTotal}명</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col member-list-box">
						<p class="mb-1 cnt-title">총 댕 등록 수</p>
						<p class="mt-1 cnt-num" data-userstate="댕등록수">${dangTotal}마리</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col member-list-box">
						<p class="mb-1 cnt-title" >총 댕모임 가입자수</p>
						<p class="mt-1 cnt-num" data-userstate="댕모임가입자수">${dangMemberTotal}명</p>
					</div>
				</div>
			</div>
			
			
			<div class="row mt-5">
				<div class="col-6 offset-3 text-center search-wrap d-flex">
					<select class="member-form-select flex-fill me-1" style="width:20%;" name="type">
						<option value="">선택</option>
						<option value="user_id">회원아이디</option>
						<option value="user_nick">회원닉네임</option>
					</select>
					<div class="d-flex" style="width:70%;">
						<input type="text" class="input form-control member-search-input ms-1 flex-fill" name="keyword">
						<button class="btn btn-primary user-search-btn ms-1">
							<i class="fa-solid fa-magnifying-glass cursor-pointer"></i>
						</button>
			    	</div>
				</div>
			</div>
			
  			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-user-list-page-navigator">
						<li class = "ul-member-list-page-item ul-member-list-page-item-first d-flex justify-content-center align-items-center">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${userListRequestDto.blockPrev() != 0}">
						<li class = "ul-member-list-page-item ul-member-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${userListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-member-list-page-item ul-member-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						

						<c:forEach var = "i" begin = "${userListRequestDto.blockStart()}" end = "${userListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-member-list-page-item ul-member-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>

						<c:choose>
						<c:when test = "${userListRequestDto.blockNext() >= userListRequestDto.blockLast()}">
						<li class = "ul-member-list-page-item ul-member-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${userListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-member-list-page-item ul-member-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${userListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<li class = "ul-member-list-page-item ul-member-list-page-item-last d-flex justify-content-center align-items-center" >
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>  
			
			<div class="row mt-5">
				<table class="table text-center ">
					<thead>
						<tr class="table">
							<th scope="col" style="width:15%;">회원 번호</th>
							<th scope="col" style="width:25%;">회원 아이디</th>
							<th scope="col" style="width:25%;">회원 닉네임</th>
							<th scope="col" style="width:20%;">가입일자</th>
							<th scope="col">상세</th>
						</tr>
					</thead>
					<tbody class="data-body">
						<c:choose>
							<c:when test="${userListAdminB==null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">내역이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="userListAdminB" items="${userListAdminB}">
									<tr class="table align-middle">
										<td class="list-userNo" data-dno="">${userListAdminB.userNo}</td>
										<td class="list-userId" data-dno="">${userListAdminB.userId}</td>
										<td class="list-userNick" data-dno="">${userListAdminB.userNick}</td>
										<td class="list-userJoindate" data-dno="">${userListAdminB.userJoindate}</td>
										<td>
											<a class="btn btn-primary user-detail" data-rno="" href="${pageContext.request.contextPath}/admin/user_detail?userNo=${userListAdminB.userNo}">상세</a>
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
	//검색 버튼 클릭 이벤트
	$(document).on("click",".user-search-btn", function(){
		
		var userSelectBox = $(".member-form-select").val();
		console.log(userSelectBox);
		
		var userSearchInput = $(".member-search-input").val();
		console.log(userSearchInput);	
		
		if(userSelectBox == "" || userSearchInput == "") {
			console.log("안돼");
			return;
		}
		
		console.log("돼");
		
		var formData = new FormData();
		formData.append("p", 1);
		formData.append("type", userSelectBox);
		formData.append("keyword", userSearchInput);
		
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
				
				if(resp.userList.length==0){
					var body = $(".data-body");
					var tr = $("<tr>").attr("class","align-middle");
					var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
									.text("내역이 존재하지 않습니다.");
					tr.append(td);
				}else{
					$(".data-body").empty();
					for(var i=0; i<resp.userList.length; i++){
						userList(resp.userList[i]);
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
				
				$(".data-body").empty();
				for(var i=0; i<resp.userList.length; i++){
					userList(resp.userList[i]);
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
				$(".data-body").empty();
				for(var i = 0 ; i < resp.userList.length ; i++){
					userList(resp.userList[i]);
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
				$(".data-body").empty();
				for(var i = 0 ; i < resp.userList.length ; i++){
					userList(resp.userList[i]);
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
				$(".data-body").empty();
				for(var i = 0 ; i < resp.userList.length ; i++){
					userList(resp.userList[i]);
				}
				// 초기화
				$(".ul-member-list-page-item-unit").remove();
				for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
					memberListPagination(i);
				}						
			}
		})					
	});
	
	//댕모임 멤버 목록 비동기 불러오기(한번 더 체크하기)
	function memberList(resp){
		var body = $(".member-data-body");
		
		var tr = $("<tr>").attr("class","align-middle");
		var td_dangNo = $("<td>").text(resp.dangNo);
		var td_dangName = $("<td>").text(resp.dangName);
		var td_memberInfo = $("<td>").text(resp.memberNick).text(resp.userId);
		var td_memberGrade = $("<td>").text(resp.memberGrade).text(resp.memberScore);
		//var td_memberScore = $("<td>").text(resp.memberScore);
		var td_memberJoindate = $("<td>").text(resp.memberJoindate);

		tr.append(td_puppyNo).append(td_puppyName).append(td_puppyAge).append(td_puppyGender).append(td_userId);
		body.append(tr);
	}
	
	
	//댕모임 멤버 목록 페이징
	function memberListPagination(resp){
		$(".-next")
			.before(
				$("<li>").attr("class", " -unit d-flex justify-content-center align-items-center")
					.append(
						$("<span>").text(resp)	
					)
			)
	}
	
});

</script>