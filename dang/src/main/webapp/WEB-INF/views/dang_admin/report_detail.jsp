<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="DangHome" name="title"/>
</jsp:include>

<style>
	table>tbody>tr>th{
		width:35%;
		height:50px;
	}
	table>tbody>tr>td{
		width:65%;
	}
	
	
</style>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">신고 상세</p>
			</div>

			<div class="row mt-5">
				<div class="col-6 offset-3 detail-wrap">
					<table class="table">
						<tbody class="text-center">
							<tr class="table align-middle">
								<th scope="col">회원번호</th>
								<td>${detail.userNo}</td>
							</tr>
							<tr class="table align-middle">
								<th scope="col">닉네임</th>
								<td>${detail.memberNick}</td>
							</tr>
							<tr class="table align-middle">
								<th scope="col">댕모임명</th>
								<td>${detail.dangName}</td>
							</tr>
							<tr class="table align-middle">
								<th scope="col">신고날짜</th>
								<td>${detail.reportDate}</td>
							</tr>
							<tr class="table align-middle">
								<th scope="col">신고사유</th>
								<td>${detail.reportContent}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>