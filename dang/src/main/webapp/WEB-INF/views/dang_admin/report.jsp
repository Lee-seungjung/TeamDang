<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="DangHome" name="title"/>
</jsp:include>

<style>
	.report-box{
		background-color:#F1F4FF;
		padding:30px 40px;
		text-align:center;
		border-radius: 0.3rem;
	}
	p{
		margin:0;
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
						<p class="mt-1 cnt-num">${cnt.received}</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title">신고 승인</p>
						<p class="mt-1 cnt-num">${cnt.approved}</p>
					</div>
				</div>
				<div class = "col-4">
					<div class = "col report-box">
						<p class="mb-1 cnt-title">신고 반려</p>
						<p class="mt-1 cnt-num">${cnt.rejected}</p>
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
					<tbody>
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
															reportNo=${list.reportNo}&dangNo=${list.dangNo}">상세</a>
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