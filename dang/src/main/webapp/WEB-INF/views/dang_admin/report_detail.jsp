<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="DangHome" name="title"/>
</jsp:include>

<style>
	table>tbody>tr>th{
		width:35%;
		height:55px;
	}
	table>tbody>tr>td{
		width:65%;
	}
	.detail-wrap{
		background-color:#F1F4FF;
	}
	.table>:not(caption)>*>* {
		border-bottom-width: 0;
	}
	.img-wrap{
		padding:0 10px;
		display:flex;
	}
	.img-box{
		width:100px;
		height:100px;
		border:1px solid #F1F4FF;
	}
	.table{
		margin-bottom:0;	
	}
	
	
</style>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">신고 상세</p>
			</div>

			<div class="row mt-4">
				<div class="col-6 offset-3 detail-wrap">
					<table class="table">
						<tbody class="text-center">
							<tr class="table ">
								<th scope="col">회원번호</th>
								<td>${detail.userNo}</td>
							</tr>
							<tr class="table">
								<th scope="col">닉네임</th>
								<td>${detail.memberNick}</td>
							</tr>
							<tr class="table">
								<th scope="col">댕모임명</th>
								<td>${detail.dangName}</td>
							</tr>
							<tr class="table">
								<th scope="col">신고날짜</th>
								<td>${detail.reportDate}</td>
							</tr>
							<tr class="table">
								<th scope="col">신고사유</th>
								<td>${detail.reportContent}</td>
							</tr>
						</tbody>
					</table>
					
					<!-- 첨부파일 여부에 따라 show/hide -->
					<c:if test="${img!=null}">
						<table class="table report-img">
							<tbody class="text-center">
								<tr class="table">
									<th scope="col">첨부파일</th>
									<td></td>
								</tr>
								<tr class="table align-middle">
									<th scope="col" colspan="2">
										<div class="img-wrap">
											<c:forEach var="img" items="${img}">
												<div class="img-box me-1">
													<img src="${pageContext.request.contextPath}/rest_attachment/download/${img.attachmentNo}" class="img-fluid">
												</div>
											</c:forEach>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
					</c:if>
					
					<div class="btn-div text-center mt-4 mb-4">
						<button class="btn btn-primary">승인</button>
						<button class="btn btn-secondary">반려</button>
						<a class="btn btn-outline-secondary" 
							href="${pageContext.request.contextPath}/admin/report?reportState=${detail.reportState}">목록</a>
					</div>
					
				</div>
			</div>
			
		</div>
	</div>
</div>