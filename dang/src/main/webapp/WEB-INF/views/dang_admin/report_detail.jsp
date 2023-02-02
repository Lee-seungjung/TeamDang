<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="신고 상세" name="title"/>
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

<script>
	$(function(){
		//전역변수
		var reportNo = $(".detail-wrap").data("rno");
		
		//이미지 확대 및 확대창 클릭 시 닫기
		zoomin();
		$(".zoomin").click(function (e) {
		    $(".zoomin").toggle();
		});
		
		//승인 모달
		$(".report-app-btn").click(function(){
			$("#report-app-Modal").modal("show");
			//누적 신고 2회일 경우 
			//승인확인 버튼 클릭 시 신고테이블 상태 변경
			$(".app-confirm-btn").click(function(){
				var reportAppCnt = $("[name=reportAppCnt]").val();
				var dangNo = $("[name=dangNo]").val();
				var userNo = $(".userNo").text();
				var roomNo = $("[name=roomNo]").val();
				var reportState = "완료";
				updateState(reportNo, reportState);
				
				if(reportAppCnt==1){
					//강퇴예정인 사람 나머지 신고내역 있을 경우 신고상태 반려로 이동,, 
					rejectData = {
							userNo:userNo,
							dangNo:dangNo
					}
					$.ajax({
						url:"${pageContext.request.contextPath}/admin/report_rejected",
						method:"patch",
						data:JSON.stringify(rejectData),
		        		contentType: 'application/json',
		        		async:false,
		        		success:function(resp){
		        			console.log("반려로 이동 성공!");
		        		}
					});
					
					//해당 댕모임 강퇴처리
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_member/report_delete_member?dangNo="+dangNo+"&userNo="+userNo,
						method:"delete",
						async:false,
						success:function(resp){
							console.log("회원 삭제 성공!");
							$.ajax({
								url:"${pageContext.request.contextPath}/rest_chat/delete_member_history?userNo="+userNo+"&roomNo="+roomNo,
								method:"delete",
								async:false,
								success:function(resp){
									console.log("채팅내역 삭제 성공!");
								}
							});
						}
					});

					//개설자일 경우 가입 오래된 멤버를 방장으로 변경
					//방장여부 확인
					$.ajax({
						url:"${pageContext.request.contextPath}/rest_dang/find_user_no?dangNo="+dangNo,
						method:"get",
		        		async:false,
		        		success:function(resp){
		        			console.log("개설자 번호 = "+resp);
		        			var ownerUserNo = resp;
		        			if(userNo==ownerUserNo){
		        				//1. 댕모임 테이블 - 개설자 회원번호 컬럼 변경
		    					//2. 댕모임 회원 테이블 - 새로운 방장의 방장여부 컬럼 변경
		        				var oldMemberNo = $("[name=oldMemberNo]").val();
								var oldUserNo = $("[name=oldUserNo]").val();
								
								updateData = {
										userNo:oldUserNo,
										dangNo:dangNo
								}
								
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_dang/uno_head_update",
									method:"patch",
									data:JSON.stringify(updateData),
					        		contentType: 'application/json',
					        		async:false,
					        		success:function(resp){
					        			console.log("댕모임 개설자 회원번호, 댕모임 회원수-1 변경 성공!");
					        		}
								});
								
								$.ajax({
									url:"${pageContext.request.contextPath}/rest_member/owner_update/"+oldMemberNo,
									method:"patch",
					        		contentType: 'application/json',
					        		async:false,
					        		success:function(resp){
					        			console.log("방장여부 변경 성공!");
					        		}
								});
		        			}
		        		}
					});
				}
				location.href="${pageContext.request.contextPath}/admin/report";
			});
		});
		
		//반려 모달
		$(".report-rej-btn").click(function(){
			$("#report-rej-Modal").modal("show");
			
			//반려확인 버튼 클릭 시 신고테이블 상태 변경
			$(".rej-confirm-btn").click(function(){
				var reportState = "반려";
				updateState(reportNo, reportState); //신고 상태 반려로 변경
				
			});
		});
		
		//신고테이블 상태 변경
		function updateState(reportNo, reportState){
			data = {
					reportNo:reportNo,
					reportState:reportState
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/admin/report_update",
				method:"patch",
				data:JSON.stringify(data),
        		contentType: 'application/json',
        		async:false,
        		success:function(resp){
        			if(reportState=="반려"){
        				$("#report-rej-Modal").modal("hide");
        			}else{
        				$("#report-app-Modal").modal("hide");
        			}
        		}
			});
		}
		
		//이미지 확대
		function zoomin(){
			$(".img-one").click(function(){
				var src = $(this).attr("src");
				var img = $("<img>").attr("src",src);
				$(".zoomin-img").html(img);
				$(".zoomin").show();
			});
		}
		
		
		
	});
</script>

<div class = "container-fluid mt-5">
	<div class = "row">
		<div class = "col-8 offset-2">
			<div class="row text-center">
				<p style="font-size:25px; font-weight:bolder;">신고 상세</p>
			</div>
			
			<div class="row mt-4">
				<div class="col-6 offset-3 detail-wrap" data-rno="${detail.reportNo}" data-rstate="${detail.reportState}">
					<table class="table mt-2">
						<tbody class="text-center">
							<tr class="table ">
								<th scope="col">회원번호</th>
								<td class="userNo">${detail.userNo}</td>
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
									<th scope="col">첨부파일(${img.size()}개)</th>
									<td></td>
								</tr>
								<tr class="table align-middle">
									<th scope="col" colspan="2">
										<div class="img-wrap">
											<c:forEach var="img" items="${img}">
												<div class="img-box me-1" style="border:1px solid #D6DEFF;">
													<img src="${pageContext.request.contextPath}/rest_attachment/download/${img.attachmentNo}" 
															class="img-fluid cursor-pointer img-one" data-ino="${img.attachmentNo}">
												</div>
											</c:forEach>
										</div>
									</th>
								</tr>
							</tbody>
						</table>
					</c:if>
					
					<div class="btn-div text-center mt-4 mb-4">
						<c:if test="${detail.reportState=='접수'}">
							<button class="btn btn-primary report-app-btn">승인</button>
							<button class="btn btn-secondary report-rej-btn">반려</button>
						</c:if>
						<a class="btn btn-outline-secondary" 
							href="${pageContext.request.contextPath}/admin/report?reportState=${detail.reportState}">목록</a>
					</div>
					
				</div>
			</div>
			
			<!-- 이미지 확대 -->
			<div class="zoomin">
				<div class="zoomin-img">
					<!-- 확대 이미지 코드-->
				</div>
			</div>
			
			<!-- 신고 승인 모달 시작 -->
			<div class="modal" id="report-app-Modal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body ">
							<div class="middle-items">
								<i class="fa-solid fa-circle-exclamation pink fa-2x me-2"></i>
								<span style="font-weight:bolder;">해당 신고건을 승인하시겠습니까?</span><br>
							</div>
							<span style="font-size:13px; margin-left:35px;">
								댕모임 내 누적신고 <strong class="pink">${reportAppCnt}회</strong>(승인 완료 기준) 회원입니다.
							</span><br>
							<c:if test="${reportAppCnt==1}">
								<span style="font-size:13px; margin-left:35px;">
									신고건 승인 후 해당 댕모임에서 <strong class="pink">자동 강퇴</strong> 처리됩니다.
								</span>
							</c:if>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary app-confirm-btn">확인</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 신고 승인 모달 끝 -->
			
			<!-- 신고 반려 모달 시작 -->
			<div class="modal" id="report-rej-Modal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body middle-items">
							<i class="fa-solid fa-circle-exclamation pink fa-2x me-2"></i>
							<span style="font-weight:bolder;">해당 신고건을 반려하시겠습니까?</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary rej-confirm-btn">확인</button>
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 신고 반려 모달 끝 -->
			
			<input type="hidden" name="dangNo" value="${detail.dangNo}">
			<input type="hidden" name="reportAppCnt" value="${reportAppCnt}">
			<input type="hidden" name="oldUserNo" value="${oldMember.userNo}">
			<input type="hidden" name="oldMemberNo" value="${oldMember.memberNo}">
			<input type="hidden" name="roomNo" value="${roomNo}">
		</div>
	</div>
</div>