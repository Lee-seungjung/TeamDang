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
    }
    
    .div-dang-info {
    	height : 55px;
    	overflow: auto;
    	overflow-y : scroll;
    	overflow-x : hidden;
    }
    
    .div-dang-info::-webkit-scrollbar {
    	width : 0.3em;
    	background-color : white;
    }
    
    .div-dang-info::-webkit-scrollbar-thumb {
    	background-color : #8A8A8A;
    }
    
    .div-dang-info::-webkit-scrollbar-track {
    	background-color : white;
    }
    
    .span-dang-createdate {
    	font-size : 10px;
    	color : #9D9FA2;
    }
    
    .strong-dang-name {
    	font-size : 20px;
    }
    
    .div-dang-private {
    	background-color : #FFE34E;
    	border : none;
    	border-radius : 5px;
    	
    }
    
    .span-dang-info {
    	color : #9D9FA2;
    }
    
    .div-hashtag-list {
    	height : 66px;
    	overflow: auto;
    	overflow-y : scroll;
    	overflow-x : hidden;
    }
    
    .div-hashtag-list::-webkit-scrollbar {
    	width : 0.3em;
    	background-color : white;
    }
    
    .div-hashtag-list::-webkit-scrollbar-thumb {
    	background-color : #8A8A8A;
    }
    
    .div-hashtag-list::-webkit-scrollbar-track {
    	background-color : white;
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
    
	.img-modal-join-member-profile {
	    border-radius: 50%;
	    aspect-ratio: 1/1;
	}
	
	.strong-modal-join-dang-name, 
	.strong-modal-enter-dang-name {
	    font-size: 30px;
	}
	
	.span-modal-join-dang-helper,
	.span-modal-enter-dang-helper {
	    font-weight: bold;
	}
	
	.btn-modal-join-dang-nick-search,
	.btn-modal-enter-dang-nick-search {
	    background-color: #6A6A6A;
	    color: white;
	    border: none;
	    border-radius: 10px;
	}
	
	.input-modal-join,
	.input-modal-enter  {
	    background-color: #EAEAEA;
	    border: none;
	    border-radius: 10px;
	}
	
	.btn-modal-join-submit,
	.btn-modal-enter-submit {
	    background-color: #76BEFF;
	    color: white;
	    border: none;
	    border-radius: 10px;
	}
	
	.btn-modal-join-submit:disabled,
	.btn-modal-enter-submit:disabled {
	    background-color: #76BEFF;
	    opacity: 0.5;
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
						<div>
							<c:choose>
							<c:when test = "${dangList.dangInfo.attachmentNo == null}">
							<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" class="card-img-top img-dang-profile">
							</c:when>
							<c:otherwise>
							<img src="${pageContext.request.contextPath}/rest_attachment/download/${dangList.dangInfo.attachmentNo}" class="card-img-top img-dang-profile">
							</c:otherwise>
							</c:choose>
							<span>${dangList.dangInfo.dangArea}</span>
						</div>
						<div class="card-body">
						  	<div class = "row">
		            			<span class = "span-dang-createdate">since.${dangList.dangInfo.dangCreatetime}</span>
		            		</div>
		            		<div class = "row my-2">
		            			<div class = "col-9 d-flex justify-content-start align-items-center">            			
			            			<strong class = "text-middle strong-dang-name">${dangList.dangInfo.dangName}</strong>
		            			</div>
		            			<div class = "col-3 d-flex justify-content-center align-items-center">
		            				<c:if test = "${dangList.dangInfo.dangPrivate == 'Y'}">
		            					<div class = "w-100 p-1 text-center text-middle div-dang-private">
		            						<i class="fa-solid fa-lock"></i>
		            					</div>
		            				</c:if>
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
		            			<div class = "col-4 d-flex justify-content-center align-items-center">
		            				<div class = "div-dang-head flex-fill d-flex justify-content-center align-items-center">		            				
		            					<i class="fa-solid fa-paw me-1"></i>
			            				<span class = "span-dang-head">${dangList.dangInfo.dangHead}</span>
			            				 / 
			            				<span class = "span-dang-headmax">${dangList.dangInfo.dangHeadmax}</span>
		            				</div>
	            				</div>
	            				<div class = "col-4 d-flex justify-content-center align-items-center">
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
		            			<input type = "hidden" name = "dangNo" value = "${dangList.dangInfo.dangNo}">
		            			<input type = "hidden" name = "dangName" value = "${dangList.dangInfo.dangName}">
		            			<input type = "hidden" name = "dangHeadmax" value = "${dangList.dangInfo.dangHeadmax}">
		            			<input type = "hidden" name = "dangHead" value = "${dangList.dangInfo.dangHead}">
		            			<input type = "hidden" name = "dangPrivate" value = "${dangList.dangInfo.dangPrivate}">
		            			<input type = "hidden" name = "dangPw" value = "${dangList.dangInfo.dangPw}">
		            			<div class = "col-4 d-flex justify-content-end align-items-center div-dang-btn"></div> <%-- 비동기로 버튼 태그를 추가할 영역 --%>
		            			<%-- <button class = "flex-fill btn-dang btn-dang-join" type = "button">가입</button> --%>
		            		</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div> <%-- container 끝 --%>

<%-- 댕모임 입장용 Modal --%>
<div class="modal fade" id="modalEnterPirvate" data-bs-backdrop="static" tabindex="-1" aria-hidden="true"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-dang-enter-content py-3">
            <div class = "container-fluid">
                <div class = "row">
                    <div class = "col div-modal-enter-dang-content">
                    	<div class = "row">
                            <div class = "col d-flex justify-content-end align-items-center">
                                <button type="button" class="fa-solid fa-xmark btn-modal-dang-enter-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col d-flex justify-content-center align-items-center div-modal-dang-enter-name">
                                <%-- <strong class = "strong-modal-enter-dang-name">마포 목욕댕댕이팸</strong> --%>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex flex-column">
                                <span class = "span-modal-enter-dang-helper">비공개 댕모임입니다.</span>
                                <div class = "d-flex">
                                    <input class = "flex-fill p-2 input-modal-enter input-modal-enter-dang-pw" type = "password" maxlength="4" placeholder = "비밀번호(숫자 4자리)">
                                </div>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex justify-content-center align-items-center">
                                <button class = "py-2 px-3 btn-modal-enter-submit">입장하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- 댕모임 가입용 Modal --%>
<div class="modal fade" id="modalJoin" data-bs-backdrop="static" tabindex="-1" aria-hidden="true"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-dang-join-content py-3">
            <div class = "container-fluid">
                <div class = "row">
                    <div class = "col">
                    	<div class = "row">
                            <div class = "col d-flex justify-content-end align-items-center">
                                <button type="button" class="fa-solid fa-xmark btn-modal-dang-join-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col d-flex justify-content-center align-items-center div-modal-join-dang-name">
                                <%-- <strong class = "strong-modal-join-dang-name">마포 목욕댕댕이팸</strong> --%>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex flex-column div-modal-dang-join-check-nick">
                                <span class = "span-modal-join-dang-helper">닉네임을 입력해 주세요.</span>
                                <div class = "d-flex">
                                    <input class = "flex-fill me-2 p-2 input-modal-join input-modal-join-dang-nick" type = "text" maxlength="10" placeholder = "닉네임(1~10자)">
                                    <button type = "button" class = "px-3 btn-modal-join-dang-nick-search">확인</button>
                                </div>
                                <%--
                                <span class = "span-check span-check-invalid check-nick check-nick-already">이미 사용 중인 닉네임입니다.</span>
                                <span class = "span-check span-check-invalid check-nick check-nick-empty">닉네임을 입력해 주세요.</span>
                                <span class = "span-check span-check-valid check-nick check-nick-valid">멋진 닉네임이네요!</span>
                                --%>
                            </div>
                        </div>
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex flex-column">
                                <span class = "span-modal-join-dang-helper">가입 인사를 작성해 주세요.</span>
                                <div class = "d-flex">
                                    <input class = "flex-fill p-2 input-modal-join input-modal-join-dang-message" type = "text" maxlength="30" placeholder = "가입 인사(최대 30자)">
                                </div>
                            </div>
                        </div>
                        <%--
                        <div class = "row my-3">
                            <div class = "col-10 offset-1 d-flex flex-column div-modal-dang-join-check-pw">
                                <span class = "span-modal-join-dang-helper">비공개 댕모임입니다.</span>
                                <div class = "d-flex">
                                    <input class = "flex-fill p-2 input-modal-join input-modal-join-dang-pw" type = "password" maxlength="4" placeholder = "비밀번호(숫자 4자리)">
                                </div>
                            </div>
                        </div>
                         --%>
                        <div class = "row my-3 row-modal-join-submit">
                            <div class = "col-10 offset-1 d-flex justify-content-center align-items-center">
                                <button class = "py-2 px-3 btn-modal-join-submit">가입하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function(){
		
		// 로그인 중인 회원의 회원 번호
		var userNo = $("#loginNo").val();
		
		// 특정 댕모임에 가입했는지 여부에 따라 입장/가입 버튼 태그를 생성하는 함수 실행
		isMember();
		
		// 댕모임 번호
		var dangNo;
		// 댕모임 이름
		var dangName;
		// 댕모임 총원
		var dangHeadmax;
		// 댕모임 현원
		var dangHead;
		// 댕모임 비공개 여부
		var dangPrivate;
		// 댕모임 비밀번호
		var dangPw;
		
		// 검색 이벤트
		$(".form-search-submit").submit(function(e){
			// 기본 이벤트 차단 (form 전송)
			e.preventDefault();
			// 새로운 form 생성
			var form = $("<form>").attr("action", "search").attr("method", "get");
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
		
		// 입장 버튼 클릭 이벤트
		$(document).on("click", ".btn-dang-enter", function(){
			// 댕모임 번호
			dangNo = $(this).parent().prevAll("[name=dangNo]").val();
			// 댕모임명
			dangName = $(this).parent().prevAll("[name=dangName]").val();
			// 댕모임 총원
			dangHeadmax = $(this).parent().prevAll("[name=dangHeadmax]").val();
			// 댕모임 현원
			dangHead = $(this).parent().prevAll("[name=dangHead]").val();
			// 댕모임 비공개 여부
			dangPrivate = $(this).parent().prevAll("[name=dangPrivate]").val();
			// 댕모임 비밀번호
			dangPw = $(this).parent().prevAll("[name=dangPw]").val();
			// 댕모임 총원과 현원이 같을 경우
			if(dangHeadmax == dangHead) {
				alert("만원입니다");
				return;
			}
			// 댕모임 번호
			var dangNo = $(this).parent().prevAll("[name=dangNo]").val();
			// 댕모임 비공개 여부
			var dangPrivate = $(this).parent().prevAll("[name=dangPrivate]").val();
			// 비공개 댕모임이 아니라면(공개 댕모임이라면)
			if(dangPrivate != "Y") {
				location.href = "${pageContext.request.contextPath}/dang/"+dangNo; // 바로 입장
				return;
			}
			// 입장 Modal 표시 전 작업
			// - 댕모임명 초기화
			$(".div-modal-dang-enter-name").empty();
			// - 입장할 댕모임명 태그 추가
			$(".div-modal-dang-enter-name")
				.append(
					$("<strong>").attr("class", "strong-modal-enter-dang-name").text(dangName)
				);
			// (그렇지 않다면) 비밀번호 입력 Modal 표시
			$("#modalEnterPirvate").modal("show");
			$(".btn-modal-enter-submit").click(function(){
				// 비밀번호 입력 Modal의 비밀번호 입력창의 값
				var inputPw = $(".input-modal-enter-dang-pw").val();
				// 입력 비밀번호와 댕모임 비밀번호 비교
				if(inputPw == dangPw) { // 댕모임 비밀번호와 비밀번호 입력창의 값이 같다면
					location.href = "${pageContext.request.contextPath}/dang/"+dangNo; // 입장
					$(".input-modal-enter-dang-pw").val("");
				} else { // 그렇지 않다면
					$(".div-modal-enter-dang-content")
						.append(
							$("<div>").attr("class", "row my-3")
								.append(
									$("<div>").attr("class", "col d-flex justify-content-center align-items-center")
										.append(
											$("<span>").attr("class", "span-check span-check-invalid check-pw check-pw-invalid").text("비밀번호가 일치하지 않습니다.")
										)
								)
						);
				}
			});
		});
		
		// 가입 Modal 내에서 X버튼 클릭시 입력창 초기화		
		$(".btn-modal-dang-join-close").click(function(){
			// 댕모임명 초기화
			$(".div-modal-join-dang-name").empty();
			// 닉네임 입력창 초기화
			$(".input-modal-join-dang-nick").val("");
			// 가입인사 초기화
			$(".input-modal-join-dang-message").val("");
		});
		
		// 가입 버튼 클릭 이벤트
		$(document).on("click", ".btn-dang-join", function(){
			// Helper Text 초기화
			$(".span-check").remove();
			// 댕모임 번호
			dangNo = $(this).parent().prevAll("[name=dangNo]").val();
			// 댕모임명
			dangName = $(this).parent().prevAll("[name=dangName]").val();
			// 댕모임 총원
			dangHeadmax = $(this).parent().prevAll("[name=dangHeadmax]").val();
			// 댕모임 현원
			dangHead = $(this).parent().prevAll("[name=dangHead]").val();
			// 댕모임 비공개 여부
			dangPrivate = $(this).parent().prevAll("[name=dangPrivate]").val();
			// 댕모임 비밀번호
			dangPw = $(this).parent().prevAll("[name=dangPw]").val();
			// 초기화(비공개 댕모임 비밀번호 입력창 제거)
			$(".div-modal-join-dang-private").remove();
			// 댕모임 총원과 현원이 같을 경우
			if(dangHeadmax == dangHead) {
				alert("만원입니다");
				return;
			}
			// 가입 Modal 표시 전 작업
			// - 댕모임명 초기화
			$(".div-modal-join-dang-name").empty();
			// - 가입할 댕모임명 태그 추가
			$(".div-modal-join-dang-name")
				.append(
					$("<strong>").attr("class", "strong-modal-join-dang-name").text(dangName)
				);
			// (그렇지 않다면) 가입 Modal 표시
			$("#modalJoin").modal("show");
			// 비공개 댕모임이라면
			if(dangPrivate == "Y") {
				$(".row-modal-join-submit")
					.before(
						$("<div>").attr("class", "row my-3 div-modal-join-dang-private")
							.append(
								$("<div>").attr("class", "col-10 offset-1 d-flex flex-column div-modal-dang-join-check-pw")
									.append(
										$("<span>").attr("class", "span-modal-join-dang-helper").text("비공개 댕모임입니다.")
									)
									.append(
										$("<div>").attr("class", "d-flex")
											.append(
												$("<input>").attr("class", "flex-fill p-2 input-modal-join input-modal-join-dang-pw").attr("type", "password").attr("maxlength", 4).attr("placeholder", "비밀번호(숫자 4자리)")
											)
									)
							)
					)
			}
		});
		
		// 모달 내 닉네임 중복 검사 버튼
		$(".btn-modal-join-dang-nick-search").click(function(e){
			// 이벤트 전파 방지
			e.stopPropagation();
			// 초기화
			$(".span-check").remove();
			// 닉네임 입력창의 입력값
			var inputNick = $(".input-modal-join-dang-nick").val();
			// 입력창의 값이 비어있다면
			if(inputNick == "") {
				$(".div-modal-dang-join-check-nick")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-nick check-nick-empty").text("닉네임을 입력해 주세요.")
					)
				formJoinValid.checkNick = false;
				formJoinCheck();
				return;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_member/checkNick/"+dangNo+"/"+inputNick,
				method : "get",
				success : function(resp){
					console.log(resp);
					if(resp == false ) {
						console.log("이미 존재하는 닉네임");
						$(".div-modal-dang-join-check-nick")
							.append(
								$("<span>").attr("class", "span-check span-check-invalid check-nick check-nick-already").text("이미 사용 중인 닉네임입니다.")
							)
						formJoinValid.checkNick = false;
						formJoinCheck();
						return;
					} else {
						console.log("사용할 수 있는 닉네임");
							$(".div-modal-dang-join-check-nick")
							.append(
								$("<span>").attr("class", "span-check span-check-valid check-nick check-nick-valid").text("멋진 닉네임이네요!")
							)
						formJoinValid.checkNick = true;
						formJoinCheck();
						return;
					}
				}
			});
		});
		
		// 모달 내 가입하기 버튼
		$(".btn-modal-join-submit").click(function(){
			// 비밀번호 helper text 초기화
			$(".check-pw").remove();
			// Modal 내 비밀번호 입력창의 값
			var inputPw = $(".input-modal-join-dang-pw").val();
			// 비밀번호 미입력시
			if(inputPw == "") {
				$(".div-modal-dang-join-check-pw")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-pw check-pw-empty").text("비밀번호를 입력해 주세요.")	
					)
				formJoinValid.checkPw = false;
				formJoinCheck();
				return;
			}
			// 비밀번호 입력시
			if(dangPw != inputPw) { // 비밀번호가 옳지 않다면
				$(".div-modal-dang-join-check-pw")
					.append(
						$("<span>").attr("class", "span-check span-check-invalid check-pw check-pw-invalid").text("비밀번호가 일치하지 않습니다.")	
					)
				formJoinValid.checkPw = false;
				formJoinCheck();
				return;
			}
			formJoinValid.checkPw = true;
			formJoinCheck();
			console.log("isAllValid = " + formJoinValid.isAllValid());
			// 유효성 검사를 통과하지 못하면 return
			if(formJoinValid.isAllValid() == false) {
				return;
			}
			
			// 닉네임
			var memberNick = $(".input-modal-join-dang-nick").val();
			// 상태 메시지
			var memberMessage = $(".input-modal-join-dang-message").val();
			// 가입 완료 메시지
			alert("댕모임 가입이 완로되었습니다!");
			// 댕모임 가입
			var form = $("<form>").attr("action", "${pageContext.request.contextPath}/member/join").attr("method", "post")
							.append(
								$("<input>").attr("type", "hidden").attr("name", "dangNo").attr("value", dangNo)
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "userNo").attr("value", userNo)
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "memberNick").attr("value", memberNick)	
							)
							.append(
								$("<input>").attr("type", "hidden").attr("name", "memberMessage").attr("value", memberMessage)
							);
			$("body").append(form);
			form.submit();
		});
		
		// 특정 댕모임에 가입했는지 여부에 따라 입장/가입 버튼 태그를 생성하는 함수
		function isMember() {
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_member/search_already_join?userNo=" + userNo,
				method : "get",
				success : function(resp) {
					// 이미 가입한 댕모임에 대해 입장 버튼 생성
					for(var i = 0 ; i < resp.length ; i ++) {	
						$("body").find("[name=dangNo]").each(function(){
							// 댕모임 번호 추출
							var dangNo = $(this).val();
							// 태그 생성 위치
							var target = $(this).nextAll(".div-dang-btn");
							// 이미 가입한 댕모임에 대해
							if($(this).val() == resp[i]) {
								target.append(
									$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-enter").attr("data-dangno", dangNo).text("입장") // 입장 버튼 추가
								);
							}
						})
					}
					// 가입하지 않은 댕모임에 대해 가입 버튼 생성
					for(var i = 0 ; i < resp.length ; i ++) {
						$("body").find("[name=dangNo]").each(function(){
							// 댕모임 번호 추출
							var dangNo = $(this).val();
							// 태그 생성 위치
							var target = $(this).nextAll(".div-dang-btn");
							// 가입하지 않은 댕모임에 대해
							if($(this).val() != resp[i]) {
								if(target.is(":empty")) { // 빈 태그일 경우에만							
									target.append(
										$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-join").attr("data-dangno", dangNo).text("가입") // 가입버튼 추가
									);
								}
							} 
						})
					}
				}
			})
		}
		
		// 가입 유효성 검사
		var formJoinValid = {
			checkNick : false,
			checkPw : false,
			isAllValid : function() {
				return this.checkNick && this.checkPw;
			}
		}
		function formJoinCheck() {
			console.log("formValid.checkNick = " + formJoinValid.checkNick);
			console.log("formValid.checkPw = " + formJoinValid.checkPw);
		}
	});
	
</script>