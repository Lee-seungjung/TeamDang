<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="신고 현황" name="title"/>
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
	
	.ul-report-list-page-item {
		cursor : pointer;
		width : 2.5rem;
		height : 2rem;
		border : 1px solid #CEE3F2;
		color : #76BEFF;
	}
	
	.ul-report-list-page-item:hover {
		border : 2px solid #76BEFF;
		background-color : #F0F9FF;
	}
	
	.ul-report-list-page-item-selected {
		border : 2px solid #76BEFF;
		background-color : #76BEFF;
		color : white;
	}

</style>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">신고 현황</p>
			</div>
			
			<div class = "row mt-4">
				<div class = "col-4">
					<div class = "col report-box select-color">
						<p class="mb-1 cnt-title">신고 접수</p>
						<p class="mt-1 cnt-num"  data-reportstate="접수">${cnt.received}</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title">신고 승인</p>
						<p class="mt-1 cnt-num" data-reportstate="완료">${cnt.approved}</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title" >신고 반려</p>
						<p class="mt-1 cnt-num" data-reportstate="반려">${cnt.rejected}</p>
					</div>
				</div>
			</div>
			
			<div class="row mt-5">
				<div class="col-6 offset-3 text-center search-wrap d-flex">
					<select class="form-select flex-fill me-1" style="width:20%;" name="type">
						<option value="">선택</option>
						<option value="user_no">회원번호</option>
						<option value="dang_name">댕모임명</option>
						<option value="member_nick">닉네임</option>
					</select>
					<div class="d-flex" style="width:70%;">
						<input type="text" class="input form-control search-input ms-1 flex-fill" name="keyword">
						<button class="btn btn-primary search-btn ms-1">
							<i class="fa-solid fa-magnifying-glass cursor-pointer"></i>
						</button>
			    	</div>
				</div>
			</div>
			
			<div class="row mt-3">
				<div class = "col d-flex justify-content-center align-items-center">
					<ul class = "d-flex flex-row ul-report-list-page-navigator">
						<li class = "ul-report-list-page-item ul-report-list-page-item-first d-flex justify-content-center align-items-center" data-pagefirst = "1">
							<span><i class="fa-solid fa-backward"></i></span>
						</li>
						
						<c:choose>
						<c:when test = "${reportListRequestDto.blockPrev() != 0}">
						<li class = "ul-report-list-page-item ul-report-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "${reportListRequestDto.blockPrev()}">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-report-list-page-item ul-report-list-page-item-prev d-flex justify-content-center align-items-center" data-pageprev = "1">
							<span><i class="fa-solid fa-backward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>						

						<c:forEach var = "i" begin = "${reportListRequestDto.blockStart()}" end = "${reportListRequestDto.blockEnd()}" step = "1">
						<li class = "ul-report-list-page-item ul-report-list-page-item-unit d-flex justify-content-center align-items-center">
							<span>${i}</span>
						</li>
						</c:forEach>

						<c:choose>
						<c:when test = "${reportListRequestDto.blockNext() >= reportListRequestDto.blockLast()}">
						<li class = "ul-report-list-page-item ul-report-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${reportListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:when>
						<c:otherwise>
						<li class = "ul-report-list-page-item ul-report-list-page-item-next d-flex justify-content-center align-items-center" data-pagenext = "${reportListRequestDto.blockNext()}">
							<span><i class="fa-solid fa-forward-step"></i></span>
						</li>
						</c:otherwise>
						</c:choose>
						
						<li class = "ul-report-list-page-item ul-report-list-page-item-last d-flex justify-content-center align-items-center" data-pagelast = "${reportListRequestDto.blockLast()}">
							<span><i class="fa-solid fa-forward"></i></span>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="row mt-5">
				<table class="table text-center ">
					<thead>
						<tr class="table">
							<th scope="col" style="width:15%;">회원번호</th>
							<th scope="col" style="width:25%;">댕모임명</th>
							<th scope="col" style="width:25%;">닉네임</th>
							<th scope="col" style="width:20%;">신고날짜</th>
							<th scope="col">상세</th>
						</tr>
					</thead>
					<tbody class="data-body">
						<c:choose>
							<c:when test="${list==null}">
								<tr class="table align-middle">
									<td colspan="5" style="height:200px; border-bottom:none;">내역이 존재하지 않습니다.</td>
								</tr>						
							</c:when>
							<c:otherwise>
								<c:forEach var="list" items="${list}">
									<tr class="table align-middle">
										<td class="findNo" data-dno="${list.dangNo}">${list.userNo}</td>
										<td>${list.dangName}</td>
										<td>${list.memberNick}</td>
										<td>${list.reportDate}</td>
										<td>
											<a class="btn btn-primary detail-link" data-rno="${list.reportNo}">상세</a>
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
		
		//상세버튼
		$(document).on("click",".detail-link",function(e){
			//e.preventDefault();
			var thistag = $(this);
			var userNo = thistag.parent().siblings(".findNo").text();
			var dangNo = thistag.parent().siblings(".findNo").data("dno");
			var reportNo = thistag.data("rno");
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_member/search_member_no?userNo="+userNo+"&dangNo="+dangNo,
				method:"get",
				async:false,
				success:function(resp){
					thistag.attr("href","${pageContext.request.contextPath}/admin/report_detail?reportNo="+reportNo+"&memberNo="+resp);
				}
			});
			
		});
		
		
		
		
		var p = 1;
		var reportState = "접수";
		var type;
		var keyword;
		
		// 다음 페이지 버튼
		$(document).on("click", ".ul-report-list-page-item-next", function(){
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-report-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 이전 페이지 버튼
		$(document).on("click", ".ul-report-list-page-item-prev", function(){
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-report-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 맨 뒤로 가기 버튼
		$(document).on("click", ".ul-report-list-page-item-last", function(){
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-report-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		// 맨 앞으로 가기 버튼
		$(document).on("click", ".ul-report-list-page-item-first", function(){
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i = 0 ; i < resp.reportList.length ; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-report-list-page-item-unit").remove();
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
					}
					// 초기화
					$(".data-body").empty();
					for(var i=0; i<resp.reportList.length; i++){
						reportList(resp.reportList[i]);
					}
					// 초기화
					$(".ul-report-list-page-item-unit").remove();
					for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
						reportListPagination(i);
					}
				}
			});
		});
		
		$(document).on("click", ".ul-report-list-page-item-unit", function(){
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
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
					$(".ul-report-list-page-item-first").attr("data-pagefirst", resp.blockFirst);
					$(".ul-report-list-page-item-last").attr("data-pagelast", resp.blockLast);
					if(resp.blockPrev <= 1) {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", 1);
					} else {
						$(".ul-report-list-page-item-prev").attr("data-pageprev", resp.blockPrev);	
					}
					if(resp.blockNext > resp.blockLast) {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockLast);
					} else {
						$(".ul-report-list-page-item-next").attr("data-pagenext", resp.blockNext);
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
						$(".ul-report-list-page-item-unit").remove();
						for(var i = resp.blockStart ; i <= resp.blockEnd ; i ++) {
							reportListPagination(i);
						}
					}
				}
			});
		});
		
		function reportList(resp){
			var body = $(".data-body");
			
			var tr = $("<tr>").attr("class","table align-middle");
			var fir_td = $("<td>").attr("class", "findNo").attr("data-dno", resp.dangNo).text(resp.userNo);
			var sec_td = $("<td>").text(resp.dangName);
			var third_td = $("<td>").text(resp.memberNick);
			var four_td = $("<td>").text(resp.reportDate);
			var fifth_td = $("<td>");
			var a_btn = $("<a>").attr("class","btn btn-primary detail-link").attr("data-rno", resp.reportNo).text("상세");
			fifth_td.append(a_btn);
			tr.append(fir_td).append(sec_td).append(third_td).append(four_td).append(fifth_td);
			body.append(tr);
		}
		
		function reportListPagination(resp){
			$(".ul-report-list-page-item-next")
				.before(
					$("<li>").attr("class", "ul-report-list-page-item ul-report-list-page-item-unit d-flex justify-content-center align-items-center")
						.append(
							$("<span>").text(resp)	
						)
				)
		}
		
	});
</script>