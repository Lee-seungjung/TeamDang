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

</style>

<script>
	$(function(){
		//카테고리 검색조회
		$(document).on("click", ".cnt-num", function(){
			$(".report-box").removeClass("select-color");
			$(this).parent().addClass("select-color");
			
			var type = $("[name=type]").val();
			var keyword = $("[name=keyword]").val();
			var reportState = $(this).data("reportstate");

			//if(type==""||keyword=="") return; //입력값 없으면 클릭 막기
			
			reportStateData={
					reportState:reportState,
					type:type,
					keyword:keyword
			}
			
			$(".data-body").empty();//출력 div 비우기
			//신고 카운트 클릭 조회
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/report_list",
				method:"get",
				data:reportStateData,
				success:function(resp){
					console.log(resp);
					if(resp.length==0){
						var body = $(".data-body");
						var tr = $("<tr>").attr("class","align-middle");
						var td = $("<td>").attr("colspan","5").attr("style","height:200px; border-bottom:none;")
										.text("내역이 존재하지 않습니다.");
						tr.append(td);
					}else{
						for(var i=0; i<resp.length; i++){
							reportList(resp[i]);
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
		
		
	});
</script>

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
										<td>${list.userNo}</td>
										<td>${list.dangName}</td>
										<td>${list.memberNick}</td>
										<td>${list.reportDate}</td>
										<td>
											<a class="btn btn-primary" 
												href="${pageContext.request.contextPath}/admin/report_detail?
															reportNo=${list.reportNo}">상세</a>
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