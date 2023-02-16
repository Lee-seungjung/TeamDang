<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="회원 관리" name="title"/>
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
		border-radius: 0.3rem;
	}
	.table>:not(caption)>*>* {
		border-bottom-width: 0;
	}
	.img-wrap{
		padding:0 35px;
		display:flex;
	}
	.img-box{
		width:100px;
		height:100px;
	}
	.table{
		margin-bottom:0;	
	}
	.zoomin-img>img{
		max-width:800px;
	}
	.zoomin {
	    display: none;
	    z-index: 500;
	    max-width: 100%;
	    height: auto;
	    position: fixed;
	    top:0; left: 0; bottom: 0; right: 0;
	    background-color: gray;
	    background: rgba(0, 0, 0, 0.8);
	  }
	.zoomin-img {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
  	}
	
	
</style>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">댕댕이 상세</p>
			</div>
			
			<div class="row mt-4">
				<div class="col-6 offset-3 detail-wrap" >
					<table class="table mt-2">
						<tbody class="text-center">
							<tr class="table ">
								<th scope="col">댕댕이 번호</th>
								<td>${puppyDetail.puppyNo}</td>
							</tr>			
							<tr class="table">
								<th scope="col">댕댕이 등록번호</th>
								<c:choose>
									<c:when test="${puppyDetail.puppyRegNo != null}">
										<td>${puppyDetail.puppyRegNo}</td>
									</c:when>
									<c:otherwise>
										<td>등록번호 미기재</td>
									</c:otherwise>
								</c:choose>
							</tr>									
							<tr class="table">
								<th scope="col">댕댕이 이름</th>
								<td>${puppyDetail.puppyName}</td>
							</tr>					
							<tr class="table">
								<th scope="col">댕댕이 성별</th>
								<td>${puppyDetail.puppyGender}</td>
							</tr>
							<tr class="table">
								<th scope="col">댕댕이 나이</th>
								<td>${puppyDetail.puppyAge}</td>
							</tr>	
							<tr class="table">
								<th scope="col">댕댕이 주인</th>
								<td>${puppyDetail.userId}</td>
							</tr>																								
						</tbody>
					</table>
								
					<div class="btn-div text-center mt-4 mb-4">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/puppy_list">목록</a>
					</div>
					
				</div>
			</div>

		</div>
	</div>
</div>