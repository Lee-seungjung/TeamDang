<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="회원관리 현황" name="title"/>
</jsp:include>

<style>
	
	.report-box{
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
	
	.ul-user-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-user-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-user-list-page-item-selected {
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
					<div class = "col report-box select-color">
						<p class="mb-1 cnt-title">총 회원 수</p>
						<p class="mt-1 cnt-num"  data-userListInfo="회원수">3</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title">총 댕 등록 수</p>
						<p class="mt-1 cnt-num" data-userListInfo="댕등록수">3</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title" >총 댕모임 가입 수</p>
						<p class="mt-1 cnt-num" data-userListInfo="댕모임가입수">3</p>
					</div>
				</div>
			</div>
			
			<div class="row mt-5">
				<div class="col-6 offset-3 text-center search-wrap d-flex">
					<select class="form-select flex-fill me-1" style="width:20%;" name="type">
						<option value="">선택</option>
						<option value="user_no">회원아이디</option>
						<option value="dang_name">회원닉네임</option>
					</select>
					<div class="d-flex" style="width:70%;">
						<input type="text" class="input form-control search-input ms-1 flex-fill" name="keyword">
						<button class="btn btn-primary search-btn ms-1">
							<i class="fa-solid fa-magnifying-glass cursor-pointer"></i>
						</button>
			    	</div>
				</div>
			</div>
			
<%--  			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-user-list-page-navigator">
						<li class = "ul-user-list-page-item ul-user-list-page-item-first d-flex justify-content-center align-items-center" data-pagefirst = "1">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${DangUserListRequestDto..blockPrev() != 0}">
						<li class = "ul-user-list-page-item ul-user-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${DangUserListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-user-list-page-item ul-user-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						

						<c:forEach var = "i" begin = "${DangUserListRequestDto.blockStart()}" end = "${DangUserListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-user-list-page-item ul-user-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>

						<c:choose>
						<c:when test = "${reportListRequestDto.blockNext() >= reportListRequestDto.blockLast()}">
						<li class = "ul-user-list-page-item ul-user-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${reportListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-user-list-page-item ul-user-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${reportListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<li class = "ul-user-list-page-item ul-user-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${reportListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>  --%>
			
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
							<c:when test="${userListAdmin==null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">내역이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="userListAdmin" items="${userListAdmin}">
									<tr class="table align-middle">
										<td class="list-userNo" data-dno="">${userListAdmin.userNo}</td>
										<td class="list-userId" data-dno="">${userListAdmin.userId}</td>
										<td class="list-userNick" data-dno="">${userListAdmin.userNick}</td>
										<td class="list-userJoindate" data-dno="">${userListAdmin.userJoindate}</td>
										<td>
											<a class="btn btn-primary user-detail" data-rno="" href="${pageContext.request.contextPath}/admin/user_detail?userNo=${userListAdmin.userNo}">상세</a>
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

<!-- <script>
	$(function(){
		
		//회원목록 상세버튼
		$(document).on("click",".user-detail",function(e){
			//e.preventDefault();
			var thistag = $(this);
			var userNo = thistag.parent().siblings(".findNo").text();
			var dangNo = thistag.parent().siblings(".findNo").data("uno");
			var userNo = thistag.data("uno");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_member/search_member_no?userNo="+userNo,
				method:"get",
				async:false,
				success:function(resp){
					thistag.attr("href","${pageContext.request.contextPath}/admin/report_detail?reportNo="+reportNo+"&memberNo="+resp);
				}
			});
			
		});
		
		
		
		
		var p = 1;
		var userListInfo = "회원수";
		var type;
		var keyword;
		
		// 다음 페이지 버튼
		$(document).on("click", ".ul-user-list-page-item-next", function(){
			p = $(this).attr("data-pagenext");
			console.log(p);
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			formData.append("reportState", reportState);
			// 검색어랑 검색 타입이 있으면
			if($(".form-select").val() != "" || $(".search-input").val() != "") {
				formData.append("type", $(".form-select").val());
				formData.append("keyword", $(".search-input").val());
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-user-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 이전 페이지 버튼
		$(document).on("click", ".ul-user-list-page-item-prev", function(){
			p = $(this).attr("data-pageprev");
			console.log(p);
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			formData.append("reportState", reportState);
			// 검색어랑 검색 타입이 있으면
			if($(".form-select").val() != "" || $(".search-input").val() != "") {
				formData.append("type", $(".form-select").val());
				formData.append("keyword", $(".search-input").val());
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-user-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 맨 뒤로 가기 버튼
		$(document).on("click", ".ul-user-list-page-item-last", function(){
			// 마지막 페이지 번호
			p = $(this).attr("data-pagelast");
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			formData.append("reportState", reportState);
			// 검색어랑 검색 타입이 있으면
			if($(".form-select").val() != "" || $(".search-input").val() != "") {
				formData.append("type", $(".form-select").val());
				formData.append("keyword", $(".search-input").val());
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-user-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 맨 앞으로 가기 버튼
		$(document).on("click", ".ul-user-list-page-item-first", function(){
			// 페이지를 1페이지로
			p = 1;
			// 데이터 전송 객체
			var formData = new FormData();
			formData.append("p", p);
			formData.append("reportState", reportState);
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-user-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 검색 버튼 클릭 이벤트
		$(document).on("click", ".search-btn", function(){
			
			var type = $(".form-select").val();
			var keyword = $(".search-input").val();
			
			if(type == "" || keyword == "") {
				return;
			}
			
			var formData = new FormData();
			formData.append("p", 1);
			formData.append("reportState", reportState);
			formData.append("type", type);
			formData.append("keyword", keyword);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					console.log(resp);
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i=0; i<resp.reportList.length; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-user-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		$(document).on("click", ".ul-user-list-page-item-unit", function(){
			p = $(this).children().text();
			console.log(p);
			/* 
			type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val();
			reportState = $(this).data("reportstate");
			 */ 
			/* reportStateData={
				p : p,
				reportState:reportState,
				type:type,
				keyword:keyword
			} */
			 
			 var formData = new FormData();
			 formData.append("p", p);
			 formData.append("reportState", reportState);
			 
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/report_list",
				method : "post",
				data : formData,
				contentType: false,
		        processData: false,
				success : function(resp) {
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i=0; i<resp.reportList.length; i++){
						reportList(resp.reportList[i]);
					}
				}
			});
		});
		
		//카테고리 조회
		$(document).on("click", ".cnt-num", function(){
			$(".report-box").removeClass("select-color");
			$(this).parent().addClass("select-color");
			
			var type = $(".form-select").val("").prop("selected", true);
			var keyword = $(".search-input").val("");
	/* 		
			var type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val(); */
			reportState = $(this).attr("data-reportstate");
			p = 1;
			console.log(reportState);
			
			var formData = new FormData();
			formData.append("p", p);
			formData.append("reportState", reportState);

			//if(type==""||keyword=="") return; //입력값 없으면 클릭 막기
/* 			
			reportStateData={
					reportState:reportState,
					type:type,
					keyword:keyword
			} */
			
			$(".data-body").empty();//출력 div 비우기
			//신고 카운트 클릭 조회
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/report_list",
				method:"post",
				data : formData,
				contentType: false,
		        processData: false,
				success:function(resp){
					console.log(resp);
					
					// 양 끝 페이지네이션 버튼 설정
					$(".ul-user-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-user-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-user-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-user-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					
					if(resp.reportList.length==0){
						var body = $(".data-body");
						var tr = $("<tr>").attr("class","align-middle");
						var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
										.text("내역이 존재하지 않습니다.");
						tr.append(td);
					}else{
						for(var i=0; i<resp.reportList.length; i++){
							reportList(resp.reportList[i]);
						}
						// 초기화
						$(".ul-user-list-page-item-unit").remove();
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							reportListPagination(i);
						}
					}
				}
			});
		});
		
		function reportList(resp){
			var body = $(".data-body");
			
			var tr = $("<tr>").attr("class","align-middle");
			var fir_td = $("<td>").text(resp.userNo);
			var sec_td = $("<td>").text(resp.dangName);
			var third_td = $("<td>").text(resp.memberNick);
			var four_td = $("<td>").text(resp.reportDate);
			var fifth_td = $("<td>");
			var a_btn = $("<a>").attr("class","btn btn-primary").text("상세")
								.attr("href","${pageContext.request.contextPath}/admin/report_detail?reportNo="+resp.reportNo);
			fifth_td.append(a_btn);
			tr.append(fir_td).append(sec_td).append(third_td).append(four_td).append(fifth_td);
			body.append(tr);
		}
		
		function reportListPagination(resp){
			$(".ul-user-list-page-item-next")
				.before(
					$("<li>").attr("class", "ul-user-list-page-item ul-user-list-page-item-unit d-flex justify-content-center align-items-center")
						.append(
							$("<span>").text(resp)	
						)
				)
		}
		
	});
</script> -->