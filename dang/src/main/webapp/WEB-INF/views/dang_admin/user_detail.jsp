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
				<p style="font-size:25px; font-weight:bolder;">회원 상세</p>
			</div>
			
			<div class="row mt-4">
				<div class="col-6 offset-3 detail-wrap" >
					<table class="table mt-2">
						<tbody class="text-center">
							<tr class="table ">
								<th scope="col">회원 번호</th>
								<td class="userNo">${userDetail.userNo}</td>
							</tr>
							<tr class="table">
								<th scope="col">회원 아이디</th>
								<td>${userDetail.userId }</td>
							</tr>
							<tr class="table">
								<th scope="col">닉네임</th>
								<td>${userDetail.userNick}</td>
							</tr>
							<tr class="table">
								<th scope="col">이메일</th>
								<td>${userDetail.userEmail}</td>
							</tr>
							<tr class="table">
								<th scope="col">전화번호</th>
								<td>${userDetail.userTel}</td>
							</tr>
							<tr class="table">
								<th scope="col">성별</th>
								<td>${userDetail.userGender}</td>
							</tr>							
							<tr class="table">
								<th scope="col">가입일자</th>
								<td>${userDetail.userJoindate}</td>
							</tr>							
							<tr class="table">
								<th scope="col">최종로그인</th>
								<td>${userDetail.userLogindate}</td>
							</tr>							
						</tbody>
					</table>
								
					<div class="btn-div text-center mt-4 mb-4">
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/user_list">목록</a>
					</div>
					
				</div>
			</div>

		</div>
	</div>
</div>