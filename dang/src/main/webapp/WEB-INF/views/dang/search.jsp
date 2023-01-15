<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	* {
		border : 1px gray dotted;
	}
	
	.img-dang-profile {
    	height : 300px;
    	object-fit : fit;
    	border-radius : 15px 15px 0 0 !important;
    }
    
    .div-outer-dang-info {
    	border-radius : 15px !important;
    	aspect-ratio : 6/9;
    }
    
    .div-dang-info {
    	aspect-ratio : 13/2;
    }
    
    .span-dang-createdate {
    	font-size : 10px;
    	color : #9D9FA2;
    }
    
    .strong-dang-name {
    	font-size : 20px;
    }
    
    .span-dang-info {
    	color : #9D9FA2;
    }
    
    .span-dang-hashtag {
    	white-space : nowrap;
    	background-color : #7E9AFF;
    	color : white;
    	border-radius : 5px;
    	font-size : 14px;
    }
    
    .modal-backdrop {
    	background-color : #CEE3F2 !important;
    	opacity: 0.5;
    }
    
    .btn-dang {
    	border : none;
    	border-radius : 5px;
    }
    
    .btn-dang-like {
    	border : 1px solid #F94888;
    	background-color: white;
    	color : #F94888;
    }
    
    .btn-dang-like-selected {
    	border : 1px solid #F94888;
    	background-color: #F94888;
    	color : white;
    }
    
    .btn-dang-enter {
    	background-color: FFE34E;
    	color : white;
    }
    
    .btn-dang-join {
    	background-color: #76BEFF;
    	color : white;
    }
    
    .div-dang-head {
    	border-radius : 5px;
    	background-color: #EDEDED;
    }
	
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 찾기" name="title"/>
</jsp:include>

<%-- 로그인 상태 판정 --%>
<c:set var="login" value="${loginNo != null}"></c:set>
<input type = "hidden" id = "loginNo" value = "${loginNo}"> 

<div class = "container-fluid my-3"> <%-- container 시작 --%>
	<div class = "row">
		<div class = "col-8 offset-2">
			<form class = "row my-3 form-search-submit"> <%-- 검색 영역 시작 --%>
				<div class = "col-10 offset-1">
					<div class = "row">
						<div class = "col-3 d-flex">
							<c:choose>
							<c:when test = "${login}"> <%-- 로그인 상태일 경우 --%>
								<select class = "flex-fill p-1" name = "searchArea">
									<option value = "">관심지역 선택</option>
									<c:choose>
									<c:when test = "${dangInterest.get(0) == null}">
									<option>등록된 관심지역이 없습니다.</option>
									</c:when>
									<c:otherwise>
									<c:forEach var = "dangInterest" items = "${dangInterest}">
									<option value = "${dangInterest}" class = "option-dang-interest">${dangInterest}</option>
									</c:forEach>
									<option value = "all">관심지역 전체</option>
									</c:otherwise>
									</c:choose>
									<option value = "interest-area-setting" class = "option-area-setting">관심지역 설정</option>
								</select>
							</c:when>
							<c:otherwise> <%-- 비로그인 상태일 경우 --%>
								<select class = "flex-fill p-1" name = "searchArea">
									<option value = "">관심지역 선택</option>
									<option value = "">로그인 후 사용할 수 있습니다.</option>
								</select>
							</c:otherwise>
							</c:choose>
						</div>
						<div class= "col-6 d-flex justify-content-center align-items-center">
							<div class = "d-flex flex-fill">							
								<input class = "flex-fill" placeholder = "검색어" name = "searchName">
								<button class = "btn-search-submit" type = "submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</div>
						<div class= "col-3 d-flex justify-content-center align-items-center">
							<select class = "flex-fill p-1" name = "sort">
								<option value = "">정렬 선택</option>
								<option value = "dudldid.dang_head desc">인원수 높은순</option>
								<option value = "dudldid.dang_like desc">좋아요 높은순</option>
								<option value = "dudldid.dang_createtime desc">개설일 최신순</option>
								<option value = "dudldid.dang_createtime asc">개설일 오래된순</option>
							</select>
						</div>
					</div>
				</div>
			</form> <%-- 검색 영역 끝 --%>
			<div class = "row my-3">
				<c:forEach var = "dangList" items = "${dangList}">
				<div class = "col-4 my-3 p-3">
					<div class="card col w-100 div-outer-dang-info shadow">
						<img src="${pageContext.request.contextPath}/rest_attachment/download/${dangList.dangInfo.attachmentNo}" class="card-img-top img-dang-profile">
						<div class="card-body">
						  	<div class = "row">
		            			<span class = "span-dang-createdate">since.${dangList.dangInfo.dangCreatetime}</span>
		            		</div>
		            		<div class = "row my-2">
		            			<div class = "col-8">            			
			            			<strong class = "card-title strong-dang-name">${dangList.dangInfo.dangName}</strong>
		            			</div>
		            			<div class = "col-4 d-flex justify-content-end align-items-center">
		            				<c:choose>
		            				<c:when test = "${dangList.dangInfo.isLike == 1}">
		            					<button class = "flex-fill btn-dang btn-dang-like-selected" type = "button">
			            					<i class="fa-regular fa-heart"></i>
			            					<span>${dangList.dangInfo.dangLike}</span>
			            				</button>
		            				</c:when>
		            				<c:otherwise>
		            					<button class = "flex-fill btn-dang btn-dang-like" type = "button">
			            					<i class="fa-regular fa-heart"></i>
			            					<span>${dangList.dangInfo.dangLike}</span>
			            				</button>
		            				</c:otherwise>
		            				</c:choose>
		            			</div>
		            		</div>
		            		<div class = "row my-2">
		            			<div class = "div-dang-info">		            			
			            			<span class = "card-text span-dang-info py-0">${dangList.dangInfo.dangInfo}</span>
		            			</div>
		            		</div>
		            		<div class = "row mb-2">
		            			<div class = "d-flex flex-row flex-wrap div-hashtag-list">
		            				<c:choose>
		            				<c:when test = "${dangList.dangHashtag.size() != 0}">
		            				<c:forEach var = "dangHashtag" items = "${dangList.dangHashtag}">
		            					<span class = "span-dang-hashtag me-1 my-1 px-2">#${dangHashtag.hashtagContent}</span>
		            				</c:forEach>
		            				</c:when>
		            				<c:otherwise>
		            					<span> </span>
		            				</c:otherwise>
		            				</c:choose>
		            			</div>
		            		</div>
		            		<div class = "row">
		            			<div class = "col-8 d-flex justify-content-start align-items-center">
		            				<div class = "div-dang-head px-1">
		            					<i class="fa-solid fa-paw"></i>
			            				<span class = "span-dang-head">${dangList.dangInfo.dangHead}</span>
			            				 / 
			            				<span class = "span-dang-headmax">${dangList.dangInfo.dangHeadmax}</span>
		            				</div>
		            			</div>
		            			<input type = "hidden" name = "dangNo" value = "${dangList.dangInfo.dangNo}">
		            			<div class = "col-4 d-flex justify-content-end align-items-center"></div>
		            			<!-- <button class = "flex-fill btn-dang btn-dang-join" type = "button">가입</button> -->
		            		</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div> <%-- container 끝 --%>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 특정 댕모임에 가입했는지 여부에 따라 입장/가입 버튼 태그를 생성하는 함수 실행
		isMember();
		
		// 검색 이벤트
		$(".form-search-submit").submit(function(e){
			// 기본 이벤트 차단 (form 전송)
			e.preventDefault();
			// 새로운 form 생성
			var form = $("<form>").attr("action", "search").attr("method", "get");
			console.log($(".option-dang-interest").length);
			// 기존 form 내부의 name을 가진 태그 각각에 대해
			$(this).find("[name]").each(function(){
				if($(this).prop("value") != "") { // value가 ""이 아닌 경우
					form.append($("<input>").attr("type", "hidden").attr("name", $(this).prop("name")).attr("value", $(this).val())); // 새로 생성한 form에 추가
					/*
					if($(this).prop("value") == "all") {
						for(var i = 0 ; i < $(".option-dang-interest").length ; i ++) {
							form.append($("<input>").attr("type", "hidden").attr("name", "searchArea").attr("value", $(".option-dang-interest").eq(i).val()));
						}
					} else {						
						form.append($("<input>").attr("type", "hidden").attr("name", $(this).prop("name")).attr("value", $(this).val())); // 새로 생성한 form에 추가
					}*/
				
				} 
			})
			$("body").append(form);
			form.submit();
		});
		
		// 관심지역 설정 Modal
		$("[name=searchArea]").change(function(){
			if($(this).val() == "interest-area-setting") {
				console.log("관심지역 설정");
				console.log($(".option-dang-interest").eq(0).prop("value"));
			}
		})
		
		// 특정 댕모임에 가입했는지 여부에 따라 입장/가입 버튼 태그를 생성하는 함수
		function isMember() {
			var userNo = $("#loginNo").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_dang_like/select?userNo=" + userNo,
				method : "get",
				success : function(resp) {
					// 이미 가입한 댕모임에 대해 입장 버튼 생성
					for(var i = 0 ; i < resp.length ; i ++) {	
						$("body").find("[name=dangNo]").each(function(){
							// 태그 생성 위치
							var target = $(this).next();
							if($(this).val() == resp[i]) {
								target.append(
									$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-enter").text("입장")
								);
							}
						})
					}
					// 가입하지 않은 댕모임에 대해 가입 버튼 생성
					for(var i = 0 ; i < resp.length ; i ++) {
						$("body").find("[name=dangNo]").each(function(){
							// 태그 생성 위치
							var target = $(this).next();
							if($(this).val() != resp[i]) {
								if(target.is(":empty")) {									
									target.append(
										$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-join").text("가입")
									);
								}
							} 
						})
					}
				}
			})
		}
	});
	
</script>