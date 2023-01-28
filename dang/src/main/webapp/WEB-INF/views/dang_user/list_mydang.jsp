<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내가 가입한 댕모임" name="title"/>
</jsp:include>

<style>
	
	* {
		
	}
	
	.div-mydang-dang-list-unit {
		border : 2px solid #E8E8E8;
		border-radius : 10px;
	}
	
	.img-mydang-dang-profile {
		border-radius : 15px;
		aspect-ratio : 1/1;
	}
	
	.div-row-mydang-dang-name {
		height : 3rem;
	}
	
	.span-mydang-dang-area {
		background-color : #89E3E3;
		color : white;
		border-radius : 5px;
	}
	
	.strong-mydang-dang-name {
		font-size : 24px;
	}
	
    .span-dang-private {
    	background-color : #FFE34E;
    	border : none;
    	border-radius : 5px;
    }
	
	.div-row-mydang-dang-info {
		height : 2rem;
	}
	
	.div-row-dang-mydang-joindate {
		height : 2rem;
	}
	
	.span-mydang-member-joindate {
		font-size : 14px;
	}
	
	.btn-mydang-dang-enter {
		border : none;
		border-radius : 10px;
		background-color : #76BEFF;
		color : white;
	}
	
	.btn-mydang-dang-close {
		border : none;
		border-radius : 10px;
		background-color : #787878;
		color : white;
	}
	
	.btn-mydang-dang-delete {
		border : none;
		border-radius : 10px;
		background-color : #E8E8E8;
		color : white;
	}
	
</style>

<jsp:include page="/WEB-INF/views/template/mypage_menu.jsp"></jsp:include>

<style>
	
</style>

<input type = "hidden" class = "input-user-no" value = "${loginNo}">

<div class = "container-fluid my-3">	
	<div class = "row">
		<div class = "col-8 offset-2 my-3">
			<div class = "row">
                <div class = "col d-flex justify-content-center align-items-center">
                    <strong class = "strong-modal-interest-dang-area">가입한 댕모임</strong>
                </div>
            </div>
			<div class = "row">
				<div class = "offset-1 col-10">
					<c:forEach var = "dangUserJoinList" items = "${dangUserJoinList}">
					<div class = "row my-4 div-mydang-dang-list-unit">
						<div class = "col-2 p-3">
							<c:choose>
							<c:when test = "${dangUserJoinList.attachmentNo != null}">
								<img class = "w-100 img-mydang-dang-profile" src = "${pageContext.request.contextPath}/rest_attachment/download/${dangUserJoinList.attachmentNo}">
							</c:when>
							<c:otherwise>
								<img class = "w-100 img-mydang-dang-profile" src = "${pageContext.request.contextPath}/images/img-dang-profile-default.png">
							</c:otherwise>
							</c:choose>
						</div>
						<div class = "col-10 p-3">
							<div class = "row mb-2 div-row-mydang-dang-name">
								<div class = "col-11 d-flex flex-row align-items-center">		
									<span class = "span-mydang-dang-area px-1 me-2">${dangUserJoinList.dangArea}</span>						
									<strong class = "strong-mydang-dang-name">${dangUserJoinList.dangName}</strong>
									<c:if test = "${dangUserJoinList.dangPrivate == 'Y'}">
									<span class = "span-dang-private px-2 mx-2">
	            						<i class="fa-solid fa-lock"></i>
	            					</span>
									</c:if>
								</div>
							</div>
							<div class = "row mb-2 div-row-mydang-dang-info">
								<div class = "col d-flex align-items-center">								
									<span class = "span-mydang-dang-info">${dangUserJoinList.dangInfo}</span>
								</div>
							</div>
							<div class = "row div-row-dang-mydang-joindate">
								<div class = "col-8 d-flex align-items-center">								
									<span class = "span-mydang-member-joindate">가입일자 : ${dangUserJoinList.memberJoindate}</span>
								</div>
								<input type = "hidden" class = "input-dang-no" value = "${dangUserJoinList.dangNo}">
								<div class = "col-2 d-flex align-items-center">
									<button class = "w-100 btn-mydang-dang-enter">입장</button>
								</div>
								<div class = "col-2 d-flex align-items-center">
									<c:choose>
									<c:when test = "${dangUserJoinList.isOwner == 1}">
									<button class = "w-100 btn-mydang-dang-delete">해체</button>
									</c:when>
									<c:otherwise>
									<button class = "w-100 btn-mydang-dang-close">탈퇴</button>
									</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">
	$(function(){
		
		// 마이페이지 메뉴 색 변경
		$(".img-select-user-dang").attr("src", "/images/mypage-join_dang_pink.png");
		
		// 입장 버튼 클릭
		$(document).on("click", ".btn-mydang-dang-enter", function(){
			// 댕모임 번호
			var dangNo = $(this).parent().prevAll(".input-dang-no").val();
			// 댕모임 입장
			location.href = "${pageContext.request.contextPath}/dang/"+dangNo;
		});
		
		// 탈퇴 버튼 클릭
		$(document).on("click", ".btn-mydang-dang-close", function(){
			var choice = window.confirm("정말 탈퇴하시겠습니까?");
			if(choice == false) {
				return;
			}
			var dangNo = $(this).parent().prevAll(".input-dang-no").val();
			var userNo = $(".input-user-no").val();
			var form = $("<form>").attr("method", "post").attr("action", "delete_member");
			form
				.append(
					$("<input>").attr("type", "hidden").attr("name", "dangNo").attr("value", dangNo)		
				)
				.append(
					$("<input>").attr("type", "hidden").attr("name", "userNo").attr("value", userNo)		
				)
			$("body").append(form);
			form.submit();
		});
	});
</script>