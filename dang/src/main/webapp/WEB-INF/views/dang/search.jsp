<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="댕모임 찾기" name="title"/>
</jsp:include>

<style>
	
	* {
		border : 1px gray dotted;
	}
	
	.select-dang-search-area,
	.select-dang-search-sort {
		border : 1px solid #76BEFF;
	}
	
	.input-dang-search-keyword {
		border : 1px solid #76BEFF;
		border-right : none;
	}
	
	.btn-dang-search-submit {
		border : 1px solid #76BEFF;
		border-left : none;
		background-color : white;
	}
	
	.select-dang-search-area:focus,
	.select-dang-search-sort:focus,
	.input-dang-search-keyword:focus {
		border : 1.5px solid #76BEFF;
	}
	
	.div-dang-profile {
		position : relative;
	}
	
	.span-dang-area {
		position : absolute;
		left : 3%;
		top : 3%;
		border-radius : 10px;
		background-color : #89E3E3;
		color : white;
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
    
    .span-dang-private {
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
    
    .btn-dang-like-inactive {
    	border : 1px solid #F94888;
    	background-color: white;
    	color : #F94888;
    }
    
    .btn-dang-like-active {
    	border : 1px solid #F94888;
    	background-color: #F94888;
    	color : white;
    }
    
    .btn-dang-enter {
    	background-color: #FFE34E;
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
	.strong-modal-enter-dang-name,
	.strong-modal-interest-dang-area {
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

	.interest-OUTLINE {
		stroke-linejoin: round;
		stroke: #F5F2FF;
		stroke-width: 2;
		fill :#17065B;
		}

	.interest-POINT {
	    stroke: black;
	    stroke-width: 1;
	    fill: #ffffff;
	}

	.interest-TEXT {
	    stroke: #ffffff;
	    stroke-width : 1;
	    stroke-linecap: round;
	    text-anchor: middle;
	    alignment-baseline: middle;
	    cursor: pointer;
	}
	
	.interest-area-selected {
	    fill : #4C28DD;
	}
	
	.div-dang-interest, 
	.btn-dang-interest-submit {
	    height: 2em;
	    border-radius: 5px;
	    color: white;
	}
	
	.div-dang-interest-active {
	    background-color: #76BEFF;
	}
	
	.div-dang-interest-inactive {
	    background-color: #E0E0E0;
	}
	
	.btn-dang-interest-submit {
	    border: none;
	    background-color: #F94888;
	}
	
	.span-dang-interest {
		white-space : nowrap;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	}
	
	.i-dang-interest-cancel {
	    position: absolute;
	    top: 50%;
	    left: 85%;
	    transform: translate(-50%, -50%);
	    cursor: pointer;
	}
	
</style>

<%-- 로그인 상태 판정 --%>
<c:set var="login" value="${loginNo != null}"></c:set>
<%-- 로그인 중인 회원의 회원 번호 --%>
<input type = "hidden" id = "loginNo" value = "${loginNo}"> 
<%-- 댕모임 전체/검색 조회시 마지막 페이지 번호 --%>
<input type = "hidden" id = "pLast" value = "${pLast}">

<div class = "container-fluid my-3"> <%-- container 시작 --%>
	<div class = "row">
		<div class = "col-8 offset-2">
			<form class = "row my-3 form-search-submit"> <%-- 검색 영역 시작 --%>
				<div class = "col-10 offset-1">
					<div class = "row">
						<div class = "col-3 d-flex">
							<select class = "flex-fill p-1 select-dang-search-area" name = "searchArea">
								<option value = "">관심지역 선택</option>
								<c:choose>
								<c:when test = "${login}"> <%-- 로그인 상태일 경우 --%>
									<c:choose>
									<c:when test = "${dangInterest.size() == 0}">
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
								</c:when>
								<c:otherwise> <%-- 비로그인 상태일 경우 --%>
								<option value = "">로그인 후 사용할 수 있습니다.</option>
								</c:otherwise>
								</c:choose>
							</select>
						</div>
						<div class= "col-6 d-flex justify-content-center align-items-center">
							<div class = "d-flex flex-fill">							
								<input class = "flex-fill p-1 input-dang-search-keyword" placeholder = "검색어" name = "searchName">
								<button class = "btn-dang-search-submit" type = "submit">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</div>
						<div class= "col-3 d-flex justify-content-center align-items-center">
							<select class = "flex-fill p-1 select-dang-search-sort" name = "sort">
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
			<div class = "row my-3 div-dang-search-list">
				<c:forEach var = "dangList" items = "${dangList}">
				<div class = "col-4 my-3 p-3"> <%-- 태그 생성 시작 --%>
					<div class="card col w-100 div-outer-dang-info shadow">
						<div class = "div-dang-profile">
							<c:choose>
							<c:when test = "${dangList.dangInfo.attachmentNo == null}">
							<img src="${pageContext.request.contextPath}/images/img-dang-profile-default.png" class="card-img-top img-dang-profile">
							</c:when>
							<c:otherwise>
							<img src="${pageContext.request.contextPath}/rest_attachment/download/${dangList.dangInfo.attachmentNo}" class="card-img-top img-dang-profile">
							</c:otherwise>
							</c:choose>
							<span class = "px-2 span-dang-area">${dangList.dangInfo.dangArea}</span>
						</div>
						<div class="card-body">
						  	<div class = "row">
		            			<span class = "span-dang-createdate">since.${dangList.dangInfo.dangCreatetime}</span>
		            		</div>
		            		<div class = "row my-2">
		            			<div class = "col-9 d-flex justify-content-start align-items-center">            			
			            			<strong class = "text-middle strong-dang-name">${dangList.dangInfo.dangName}</strong>
		            			</div>
		            			<div class = "col-3 d-flex justify-content-center align-items-center div-dang-private">
		            				<c:if test = "${dangList.dangInfo.dangPrivate == 'Y'}">
		            					<span class = "w-100 p-1 text-center text-middle span-dang-private">
		            						<i class="fa-solid fa-lock"></i>
		            					</span>
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
			            				<span>/</span> 
			            				<span class = "span-dang-headmax">${dangList.dangInfo.dangHeadmax}</span>
		            				</div>
	            				</div>
	            				<div class = "col-4 d-flex justify-content-center align-items-center div-dang-like">
		            				<c:choose>
		            				<c:when test = "${dangList.dangInfo.isLike == 1}">
	            					<button class = "flex-fill btn-dang btn-dang-like btn-dang-like-selected" type = "button" data-islike = "1">
		            					<i class="fa-regular fa-heart me-1"></i><span>${dangList.dangInfo.dangLike}</span>
		            				</button>
		            				</c:when>
		            				<c:otherwise>
	            					<button class = "flex-fill btn-dang btn-dang-like" type = "button" data-islike = "0">
		            					<i class="fa-regular fa-heart me-1"></i><span>${dangList.dangInfo.dangLike}</span>
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
		            			<c:if test = "${login}">		            			
		            			<div class = "col-4 d-flex justify-content-end align-items-center div-dang-btn">
	            				<c:choose>
	            				<c:when test = "${dangList.dangInfo.isMember == 1}">
	            					<button class = "flex-fill btn-dang btn-dang-enter" type = "button">입장</button>
	            				</c:when>
	            				<c:otherwise>
	            					<button class = "flex-fill btn-dang btn-dang-join" type = "button">가입</button>
	            				</c:otherwise>
	            				</c:choose>
		            			</div> <%-- 비동기로 버튼 태그를 추가할 영역 --%>
		            			<%-- <button class = "flex-fill btn-dang btn-dang-join" type = "button">가입</button> --%>
		            			</c:if>
		            		</div>
						</div>
					</div>
				</div> <%-- 태그 생성 끝 --%>
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

<%-- 댕모임 관심지역 등록용 Modal --%>
<div class="modal fade" id="modalInterest" data-bs-backdrop="static" tabindex="-1" aria-hidden="true"> 
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content modal-dang-interest-content py-3">
            <div class = "container-fluid">
                <div class = "row">
                    <div class = "col">
                        <div class = "row">
                            <div class = "col d-flex justify-content-end align-items-center">
                                <button type="button" class="fa-solid fa-xmark btn-modal-dang-join-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                        </div>
                        <div class = "row">
                            <div class = "col d-flex justify-content-center align-items-center">
                                <strong class = "strong-modal-interest-dang-area">관심지역</strong>
                            </div>
                        </div>
                        <div class = "row my-2">
                            <div class = "col d-flex justify-content-center align-items-center">
                                <svg class = "w-100 h-100" style='background:white;overflow:visible' width="800" height="656" xmlns="http://www.w3.org/2000/svg" viewbox = "50 50 700 550">">
                                    <g id = "interest-outline">
                                        <path id="CD-interest-11110" class="interest-OUTLINE"
                                            d="M 455 297 l 4 -2 1 0 1 0 3 -1 4 5 7 3 2 6 0 8 -11 2 -11 1 -8 0 -9 1 -8 1 -9 1 -9 -2 -10 -1 -9 1 -4 3 -2 3 -6 -6 -3 -4 -5 -6 -4 -5 -2 -5 5 -3 0 -6 0 -10 0 -9 1 -9 -3 -4 -2 0 -2 0 -1 -4 0 -9 -5 -9 1 -10 -1 -11 -1 -6 2 -6 5 -2 7 -3 10 -2 2 -1 3 0 1 0 4 -2 8 -1 3 6 4 1 3 8 3 10 1 6 3 5 0 9 0 7 -1 5 -6 3 -6 4 -1 5 6 4 5 3 5 4 9 1 10 0 4 4 3 4 5 10 1 3 z " />
                                        <path id="CD-interest-11140" class="interest-OUTLINE"
                                            d="M 477 316 l 0 9 5 5 -1 3 -4 5 -4 5 -5 4 -4 7 -3 4 -4 3 -4 10 -2 -1 -3 -7 -2 -5 -2 1 -1 0 -2 -1 -3 1 0 0 -3 1 -4 2 -5 -5 -6 -3 -10 -3 -4 -1 -3 -1 -2 2 -4 -1 -3 -1 -9 0 -2 2 -4 3 0 -7 1 -4 -2 -2 0 -1 6 -3 6 -4 -1 -2 -2 -5 2 -3 4 -3 9 -1 10 1 9 2 9 -1 8 -1 9 -1 8 0 11 -1 z " />
                                        <path id="CD-interest-11170" class="interest-OUTLINE"
                                            d="M 394 349 l 3 1 4 1 2 -2 3 1 4 1 10 3 6 3 5 5 4 -2 3 -1 0 0 3 -1 2 1 1 0 2 -1 2 5 3 7 2 1 5 9 6 2 2 9 -4 5 -4 5 -5 6 -3 4 -5 4 -5 5 -5 4 -5 3 -8 8 -5 8 -7 3 -7 -1 -10 -4 -3 -1 -6 -3 -6 -5 -5 -3 -6 -3 -9 -3 1 -5 0 -10 -2 -8 -6 -11 5 -2 4 -1 5 -4 5 -6 2 -5 3 -6 6 -5 0 -3 -2 -3 4 -3 2 -2 z " />
                                        <path id="CD-interest-11200" class="interest-OUTLINE"
                                            d="M 511 315 l 7 4 6 6 4 4 6 5 2 0 15 3 4 0 -5 20 -3 5 -5 12 -3 7 -10 20 -7 -4 -5 -3 -4 -4 -10 -3 -10 0 -7 0 -12 0 -8 4 -2 -9 -6 -2 -5 -9 4 -10 4 -3 3 -4 4 -7 5 -4 4 -5 4 -5 1 -3 -5 -5 0 -9 6 1 11 -1 5 -2 2 -1 6 0 z " />
                                        <path id="CD-interest-11215" class="interest-OUTLINE"
                                            d="M 605 315 l 1 1 -1 4 -1 7 -2 9 3 6 4 4 3 -3 9 -1 3 3 -4 10 -2 10 -2 5 -2 4 -4 5 -5 5 -5 4 -11 12 -3 3 -3 2 -8 5 -6 3 -5 1 -5 -1 -5 -1 -6 -2 -12 -5 -7 -4 13 -27 5 -12 3 -5 5 -20 3 -8 4 -5 4 -9 7 1 11 3 9 -3 4 -3 4 -2 z " />
                                        <path id="CD-interest-11230" class="interest-OUTLINE"
                                            d="M 554 245 l 2 10 -2 5 -3 6 2 9 1 6 3 9 3 6 2 3 1 11 3 5 -4 9 -4 5 -3 8 -4 0 -15 -3 -2 0 -6 -5 -4 -4 -6 -6 -7 -4 -4 -2 -6 0 -2 1 -5 2 -11 1 -6 -1 0 -8 -2 -6 6 -4 6 -5 4 -6 3 -4 4 -5 2 -3 6 -8 4 -2 8 -3 4 -5 7 -1 7 -2 4 -6 7 -2 z " />
                                        <path id="CD-interest-11260" class="interest-OUTLINE"
                                            d="M 621 218 l 5 3 1 6 0 10 2 8 -3 8 -3 5 0 3 3 4 -1 6 -4 2 -5 9 0 5 -4 6 -4 3 -4 5 -3 10 -4 2 -4 3 -9 3 -11 -3 -7 -1 -3 -5 -1 -11 -2 -3 -3 -6 -3 -9 -1 -6 -2 -9 3 -6 2 -5 -2 -10 0 -8 2 -11 6 -3 4 -1 9 -4 9 1 10 1 6 -2 9 -1 z " />
                                        <path id="CD-interest-11290" class="interest-OUTLINE"
                                            d="M 455 297 l -3 -2 -1 -3 -5 -10 -3 -4 -4 -4 -10 0 -9 -1 -5 -4 -5 -3 -6 -4 1 -5 6 -4 6 -3 1 -5 0 -7 0 -9 -3 -5 -1 -6 -3 -10 -3 -8 -4 -1 -3 -6 9 -5 4 -3 4 1 5 4 6 4 3 2 4 5 5 5 7 3 5 2 -1 3 0 0 0 2 1 3 5 6 9 3 4 3 5 3 8 -1 6 4 9 -4 4 -6 4 -4 4 -4 4 -6 4 -3 5 4 4 5 5 5 5 4 9 0 9 -2 -2 11 0 8 -7 1 -7 2 -4 6 -7 2 -7 1 -4 5 -8 3 -4 2 -6 8 -2 3 -4 5 -3 4 -4 6 -6 5 -6 4 -7 -3 -4 -5 -3 1 -1 0 -1 0 z " />
                                        <path id="CD-interest-11305" class="interest-OUTLINE"
                                            d="M 448 87 l 2 0 1 0 0 0 4 4 3 7 4 5 4 7 3 5 1 2 -2 4 -2 6 -2 9 -2 8 -1 5 0 4 2 4 5 3 3 0 2 -1 3 2 7 5 3 3 7 6 2 6 5 4 3 7 6 6 7 6 3 6 -4 3 -4 6 -4 4 -4 4 -4 6 -9 4 -6 -4 -8 1 -5 -3 -4 -3 -9 -3 -4 -6 -2 -3 0 -2 0 0 1 -3 -5 -2 -7 -3 -5 -5 -4 -5 -3 -2 -6 -4 -5 -4 -4 -1 3 -4 0 -6 -3 -4 1 -3 2 -3 -2 -4 -3 -7 -4 -9 4 -1 7 -7 4 -8 6 -4 2 -5 0 -13 -1 -7 2 -5 6 -5 7 -2 z " />
                                        <path id="CD-interest-11320" class="interest-OUTLINE"
                                            d="M 463 157 l -2 -4 0 -4 1 -5 2 -8 2 -9 2 -6 2 -4 -1 -2 -3 -5 -4 -7 -4 -5 -3 -7 -1 -9 0 -8 4 -11 8 -8 10 1 9 0 3 4 1 6 3 5 9 -1 4 -2 4 -1 4 4 5 0 5 13 0 9 -1 5 -4 12 0 8 3 9 2 9 3 10 1 9 2 7 -2 13 -3 -4 -2 -3 -2 3 -5 5 -1 6 -4 9 -1 7 -6 -6 -3 -7 -5 -4 -2 -6 -7 -6 -3 -3 -7 -5 -3 -2 -2 1 -3 0 z " />
                                        <path id="CD-interest-11350" class="interest-OUTLINE"
                                            d="M 619 183 l 1 7 -3 7 -6 5 -3 7 1 8 -9 1 -6 2 -10 -1 -9 -1 -9 4 -4 1 -6 3 -9 2 -9 0 -5 -4 -5 -5 -4 -5 -5 -4 -3 -6 -7 -6 1 -7 4 -9 1 -6 5 -5 2 -3 2 3 3 4 2 -13 -2 -7 -1 -9 -3 -10 -2 -9 -3 -9 0 -8 4 -12 1 -5 0 -9 6 -4 5 -2 4 -4 4 -6 6 0 3 1 4 0 5 -1 4 -2 7 -1 5 8 5 5 5 0 3 -1 5 4 -3 10 -2 7 -1 2 1 3 3 7 2 8 -2 11 -2 5 -3 4 0 4 2 6 1 6 0 10 3 5 7 0 5 -2 5 0 4 4 4 3 z " />
                                        <path id="CD-interest-11380" class="interest-OUTLINE"
                                            d="M 368 148 l 3 2 1 3 2 11 2 9 2 8 3 5 0 5 -3 3 -5 5 -7 3 -5 2 -2 6 1 6 1 11 -1 10 -7 6 -4 3 -4 7 0 7 -5 2 -9 4 -4 4 -3 5 -3 7 -5 4 -3 4 -8 -1 0 -3 -1 0 -3 -2 -3 2 -4 5 -4 5 -5 5 -1 5 -9 -8 -12 -9 -1 -2 -6 -6 -4 -5 6 -9 1 2 -2 5 2 5 8 0 9 -1 3 -6 1 -4 2 -5 -1 -9 2 -8 -2 -10 2 -10 4 -7 3 -4 2 -6 2 -9 -1 -10 5 -4 0 -1 -1 -5 1 -4 1 -4 0 -5 -5 -3 -5 -5 0 -1 1 1 5 3 6 4 11 -1 10 -3 3 -3 4 -2 9 -4 4 -5 3 -5 5 -2 6 -2 3 4 z " />
                                        <path id="CD-interest-11410" class="interest-OUTLINE"
                                            d="M 365 255 l 1 4 2 0 2 0 3 4 -1 9 0 9 0 10 0 6 -5 3 2 5 4 5 5 6 3 4 6 6 2 5 1 2 -6 4 -6 3 -3 3 -8 0 -10 1 -11 1 -7 2 -10 -4 -7 -6 -2 -10 -6 -3 -6 -2 -4 -2 -8 -4 -5 -5 -7 -5 1 -5 5 -5 4 -5 4 -5 3 -2 3 2 1 0 0 3 8 1 3 -4 5 -4 3 -7 3 -5 4 -4 9 -4 5 -2 0 -7 4 -7 4 -3 7 -6 5 9 z " />
                                        <path id="CD-interest-11440" class="interest-OUTLINE"
                                            d="M 263 289 l 12 9 9 8 7 5 5 5 8 4 4 2 6 2 6 3 2 10 7 6 10 4 7 -2 11 -1 10 -1 8 0 3 -3 0 1 2 2 -1 4 0 7 2 3 0 3 -6 5 -3 6 -2 5 -5 6 -5 4 -4 1 -5 2 -7 -4 -5 -4 -5 -3 -5 -2 -4 1 -4 2 -6 -4 -11 0 -12 0 -5 -2 -6 -7 -6 -6 -8 -4 -8 -4 -5 -4 -5 -3 -11 -7 -8 -5 -4 -2 -6 -4 -4 -4 -4 -3 -6 -6 -1 -3 8 -4 4 -2 4 -2 10 -2 10 -2 3 -2 0 -1 -1 -6 0 -5 4 -5 5 -4 4 5 6 6 z " />
                                        <path id="CD-interest-11470" class="interest-OUTLINE"
                                            d="M 240 363 l 8 -1 5 5 2 5 4 8 4 9 -2 3 2 2 0 2 -8 3 -5 4 -3 4 -2 12 0 4 -2 7 -4 6 -1 8 -2 6 -1 -1 -4 -2 -10 -2 -6 -2 -4 -5 -8 -1 -8 2 -4 4 -7 3 -4 3 -5 1 -3 -1 -4 -5 -4 -4 -4 -2 -3 -12 2 -9 1 -7 4 -5 0 -4 -4 -4 -4 -6 -2 -11 4 -7 3 -7 5 -2 1 6 5 5 2 6 3 9 3 7 3 4 12 1 7 -2 11 -1 7 -2 1 -8 0 -7 -1 -9 0 -10 2 -8 5 2 5 4 z " />
                                        <path id="CD-interest-11500" class="interest-OUTLINE"
                                            d="M 134 254 l 3 3 6 4 4 4 4 6 4 3 6 4 5 4 6 4 5 3 4 4 6 5 3 2 6 5 9 6 1 3 6 6 4 3 4 4 6 4 4 2 8 5 11 7 -4 8 3 9 -8 1 -8 -2 -5 -4 -5 -2 -2 8 0 10 1 9 0 7 -1 8 -7 2 -11 1 -7 2 -12 -1 -3 -4 -3 -7 -3 -9 -2 -6 -5 -5 -1 -6 -5 2 -3 7 -10 2 -9 -1 -7 -4 -3 -2 0 1 -9 5 -2 5 -6 2 -2 -6 -4 -5 -5 -4 -7 -2 -9 -2 -7 -4 -4 1 -1 -2 -2 -2 1 -1 -3 -2 -2 -7 8 -4 2 -5 6 -2 -1 -5 -2 -5 0 -3 2 1 0 1 5 -3 3 -3 -1 -2 2 -1 1 -5 8 -4 1 -1 1 1 2 -5 2 -6 1 3 1 2 2 -9 2 -4 2 2 1 -4 5 -5 0 -6 -3 -5 -1 -6 0 -5 3 -4 4 -6 4 2 z " />
                                        <path id="CD-interest-11530" class="interest-OUTLINE"
                                            d="M 245 419 l 6 7 4 4 5 2 4 4 4 9 -1 9 2 9 1 6 1 5 3 7 5 5 4 3 -3 5 -4 5 -10 1 -7 -3 -4 -5 -5 -4 -5 -3 -2 0 -2 1 -3 -5 -4 -2 3 -2 0 -1 -3 0 -3 2 -1 -5 -2 -6 -2 1 -1 1 1 1 -4 4 -5 3 -4 5 -4 4 -6 6 -9 2 -2 4 -1 10 -6 0 -8 -1 -5 -4 -4 0 -4 2 -9 0 -5 1 -8 1 2 -4 4 -5 2 -8 2 -5 3 -4 -2 -5 -3 -1 -8 -5 -1 -7 6 -3 4 -6 2 -4 2 -6 5 -6 4 2 4 4 4 5 3 1 5 -1 4 -3 7 -3 4 -4 8 -2 8 1 4 5 6 2 10 2 4 2 1 1 2 -6 1 -8 4 -6 2 -7 z " />
                                        <path id="CD-interest-11545" class="interest-OUTLINE"
                                            d="M 241 486 l 2 -1 2 0 5 3 5 4 4 5 7 3 10 -1 11 -1 6 1 3 10 -3 8 3 6 3 6 1 6 4 8 8 3 3 4 5 4 2 6 -7 7 -2 5 -3 6 -8 1 -5 4 -4 7 -9 -1 -4 -4 -3 -4 -2 -9 -3 -5 -2 -3 1 -3 -1 -3 -3 -4 -6 -3 -4 -6 -1 -9 -4 -4 -1 -4 2 -2 -2 -3 -3 -5 -4 -6 -2 -4 -4 -9 -3 -8 -1 -4 1 -2 z " />
                                        <path id="CD-interest-11560" class="interest-OUTLINE"
                                            d="M 249 345 l 5 3 5 4 8 4 8 4 6 6 6 7 5 2 12 0 11 0 6 4 4 -2 4 -1 5 2 5 3 5 4 7 4 6 11 2 8 0 10 -1 5 -11 2 -8 1 -9 1 -8 2 -2 5 -3 8 -2 3 -3 10 -2 8 -9 2 -3 1 -4 7 -4 5 -3 5 -4 6 -4 -3 -5 -5 -3 -7 -1 -5 -1 -6 -2 -9 1 -9 -4 -9 -4 -4 -5 -2 -4 -4 -6 -7 2 -12 3 -4 5 -4 8 -3 0 -2 -2 -2 2 -3 -4 -9 -4 -8 -2 -5 -5 -5 -3 -9 z " />
                                        <path id="CD-interest-11590" class="interest-OUTLINE"
                                            d="M 367 426 l 6 3 5 3 6 5 6 3 3 1 10 4 7 1 -3 4 0 0 4 5 2 8 -2 11 0 6 -1 11 0 8 0 9 -5 -2 -14 0 -3 -2 -5 -4 -6 -10 0 -11 -2 -6 -7 3 -3 1 -2 -2 -7 -3 -9 1 -7 0 -11 -2 -6 -1 -6 7 -6 1 -10 4 -4 3 -2 1 -12 3 4 -6 3 -5 4 -5 4 -7 3 -1 9 -2 2 -8 3 -10 2 -3 3 -8 2 -5 8 -2 9 -1 8 -1 11 -2 z " />
                                        <path id="CD-interest-11620" class="interest-OUTLINE"
                                            d="M 323 470 l 6 1 11 2 7 0 9 -1 7 3 2 2 3 -1 7 -3 2 6 0 11 6 10 5 4 3 2 14 0 5 2 2 8 4 6 3 4 0 11 1 5 -9 4 -7 2 -3 1 -5 4 -5 7 -8 5 -2 7 -1 5 -5 2 -9 2 -9 1 -10 2 -4 2 -2 0 -3 -5 -2 -6 -5 -4 -5 -7 -4 -4 -2 -6 -5 -4 -3 -4 -8 -3 -4 -8 -1 -6 -3 -6 -3 -6 3 -8 -3 -10 -6 -1 -11 1 4 -5 3 -5 12 -3 2 -1 4 -3 10 -4 6 -1 z " />
                                        <path id="CD-interest-11650" class="interest-OUTLINE"
                                            d="M 460 413 l 1 0 2 -3 6 9 1 6 0 1 3 9 5 15 5 13 6 17 7 10 6 -1 5 5 1 3 4 9 7 13 3 5 6 -2 4 0 6 -1 9 -2 8 -4 5 -3 2 -2 11 0 4 8 2 3 5 6 2 7 4 4 1 7 -5 8 -6 10 0 6 -6 4 -4 4 -5 0 -4 -1 -4 0 -2 6 -2 8 -1 4 -1 2 1 3 -4 0 -10 2 -9 0 -8 0 -7 -4 -4 -6 -5 -5 -4 -2 -5 -4 1 -5 2 -4 -1 -8 0 -5 -2 -4 2 -5 0 -1 -3 -4 -2 -9 -2 -6 -5 0 -2 7 -3 6 -6 4 -8 2 -4 1 -2 0 -6 -3 -3 -3 0 0 -1 -2 -3 -6 -2 -8 -8 -2 -5 3 1 3 0 1 -4 4 -6 3 -4 3 -1 -5 0 -11 -3 -4 -4 -6 -2 -8 0 -9 0 -8 1 -11 0 -6 2 -11 -2 -8 -4 -5 0 0 3 -4 7 -3 5 -8 8 -8 5 -3 5 -4 5 -5 5 -4 3 -4 z " />
                                        <path id="CD-interest-11680" class="interest-OUTLINE"
                                            d="M 503 387 l 10 3 4 4 5 3 7 4 7 4 12 5 0 10 0 4 1 13 1 6 1 10 6 2 7 1 6 2 3 2 12 4 5 2 5 3 6 3 5 4 5 5 3 6 3 5 3 5 4 7 2 2 5 10 3 4 4 5 -10 11 -2 6 -4 0 -3 -4 -9 -2 -4 0 0 2 -1 1 -3 3 -11 3 -1 -7 -4 -4 -2 -7 -5 -6 -2 -3 -4 -8 -11 0 -2 2 -5 3 -8 4 -9 2 -6 1 -4 0 -6 2 -3 -5 -7 -13 -4 -9 -1 -3 -5 -5 -6 1 -7 -10 -6 -17 -5 -13 -5 -15 -3 -9 0 -1 -1 -6 -6 -9 -2 3 -1 0 -7 -6 5 -6 4 -5 4 -5 8 -4 12 0 7 0 z " />
                                        <path id="CD-interest-11710" class="interest-OUTLINE"
                                            d="M 621 374 l 6 2 4 2 4 4 0 8 -2 5 -1 3 0 7 5 2 8 5 5 3 8 4 3 2 5 3 5 2 -4 3 0 6 -3 10 4 5 5 3 10 0 9 3 5 5 -1 4 -2 7 -3 9 -4 3 -5 4 -5 5 -2 6 -3 7 -5 5 -10 0 -6 0 0 8 -4 5 -6 -2 -2 -1 -1 4 -4 -5 -3 -4 -5 -10 -2 -2 -4 -7 -3 -5 -3 -5 -3 -6 -5 -5 -5 -4 -6 -3 -5 -3 -5 -2 -12 -4 -3 -2 -6 -2 -7 -1 -6 -2 -1 -10 -1 -6 -1 -13 0 -4 0 -10 6 2 5 1 5 1 5 -1 6 -3 8 -5 3 -2 3 -3 11 -12 5 -4 5 -5 4 -5 z " />
                                        <path id="CD-interest-11740" class="interest-OUTLINE"
                                            d="M 726 320 l 1 7 3 9 0 9 1 9 1 10 1 5 -1 -1 -5 -1 -3 0 -4 2 -11 0 -8 1 -5 6 -4 5 -4 6 -2 4 -1 8 -4 7 -3 2 1 1 -1 2 -6 7 -1 8 -5 -2 -5 -3 -3 -2 -8 -4 -5 -3 -8 -5 -5 -2 0 -7 1 -3 2 -5 0 -8 -4 -4 -4 -2 -6 -2 -7 0 2 -4 2 -5 2 -10 4 -10 1 -1 4 -6 7 -6 5 -3 6 -3 8 -3 4 -1 5 0 11 0 9 -4 7 -5 8 -6 11 -6 11 0 0 7 3 6 z " />
                                    </g>
                                    <g id = "interest-text">
                                        <text id="interest-11110" class="interest-TEXT" x="399" y="277">종로구</text>
                                        <text id="interest-11140" class="interest-TEXT" x="433" y="338">중구</text>
                                        <text id="interest-11170" class="interest-TEXT" x="407" y="395">용산구</text>
                                        <text id="interest-11200" class="interest-TEXT" x="505" y="356">성동구</text>
                                        <text id="interest-11215" class="interest-TEXT" x="577" y="365">광진구</text>
                                        <text id="interest-11230" class="interest-TEXT" x="528" y="294">동대문구</text>
                                        <text id="interest-11260" class="interest-TEXT" x="589" y="270">중랑구</text>
                                        <text id="interest-11290" class="interest-TEXT" x="466" y="258">성북구</text>
                                        <text id="interest-11305" class="interest-TEXT" x="459" y="181">강북구</text>
                                        <text id="interest-11320" class="interest-TEXT" x="494" y="125">도봉구</text>
                                        <text id="interest-11350" class="interest-TEXT" x="560" y="153">노원구</text>
                                        <text id="interest-11380" class="interest-TEXT" x="323" y="218">은평구</text>
                                        <text id="interest-11410" class="interest-TEXT" x="342" y="302">서대문구</text>
                                        <text id="interest-11440" class="interest-TEXT" x="293" y="339">마포구</text>
                                        <text id="interest-11470" class="interest-TEXT" x="209" y="421">양천구</text>
                                        <text id="interest-11500" class="interest-TEXT" x="156" y="334">강서구</text>
                                        <text id="interest-11530" class="interest-TEXT" x="199" y="470">구로구</text>
                                        <text id="interest-11545" class="interest-TEXT" x="279" y="537">금천구</text>
                                        <text id="interest-11560" class="interest-TEXT" x="295" y="413">영등포구</text>
                                        <text id="interest-11590" class="interest-TEXT" x="361" y="461">동작구</text>
                                        <text id="interest-11620" class="interest-TEXT" x="353" y="529">관악구</text>
                                        <text id="interest-11650" class="interest-TEXT" x="481" y="515">서초구</text>
                                        <text id="interest-11680" class="interest-TEXT" x="533" y="464">강남구</text>
                                        <text id="interest-11710" class="interest-TEXT" x="624" y="448">송파구</text>
                                        <text id="interest-11740" class="interest-TEXT" x="675" y="358">강동구</text>
                                    </g>
                                </svg>
                            </div>
                        </div>
                        <div class = "row my-3 div-dang-interest-list">
                            <div class = "col-4">
                                <div class = "position-relative div-dang-interest div-dang-interest-active">
                                    <span class = "span-dang-interest">강동구</span>
                                    <i class="fa-solid fa-xmark i-dang-interest"></i>
                                </div>
                            </div>
                            <div class = "col-4">
                                <div class = "d-flex justify-content-center align-items-center div-dang-interest div-dang-interest-inactive">
                                    
                                </div>
                            </div>
                            <div class = "col-4">
                                <div class = "d-flex justify-content-center align-items-center div-dang-interest div-dang-interest-inactive">
                                    
                                </div>
                            </div>
                        </div>
                        <div class = "row">
                            <div class = "col d-flex">
                                <button class = "flex-fill btn-dang-interest-submit">관심지역 저장</button>
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
		
		// 좋아요 이벤트
		// - 좋아요가 아닌 상태일 때
		$(document).on("click", ".btn-dang-like", function(){
			// 비로그인 상태일 때
			if(userNo == "") {
				location.href = "${pageContext.request.contextPath}/user/login"; // 로그인 Mapping으로 redirect
				return;
			}
			// 좋아요 할 댕모임 번호
			var dangLikeNo = $(this).parent().nextAll("[name=dangNo]").val();
			// 좋아요 상태
			var dangLikeState = $(this).data("islike");
			// 태그 생성 영역
			var target = $(this).parent();
			// 좋아요 등록
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_dang_like/change",
				method : "post",
				data : {
					userNo : userNo,
					dangNo : dangLikeNo,
					isLike : dangLikeState
				},
				success : function(resp) {
					target.empty();
					// 응답에 따라 다른 처리
					if(resp.isLike == 1) {
						target
							.append(
								$("<button>").attr("class", "flex-fill btn-dang btn-dang-like btn-dang-like-active").attr("type", "button").attr("data-islike", resp.isLike)
									.append(
										$("<i>").attr("class", "fa-regular fa-heart me-1")	
									)
									.append(
										$("<span>").text(resp.dangLikeCount)	
									)
							)
					} else {
						target
							.append(
								$("<button>").attr("class", "flex-fill btn-dang btn-dang-like btn-dang-like-inactive").attr("type", "button").attr("data-islike", resp.isLike)
									.append(
										$("<i>").attr("class", "fa-regular fa-heart me-1")	
									)
									.append(
										$("<span>").text(resp.dangLikeCount)	
									)
							)
					}
				}
			});
		});
		
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
				/* console.log("관심지역 설정");
				console.log("길이 = " + $(".option-dang-interest").length);
				console.log($(".option-dang-interest").eq(0).prop("value"));
				console.log($(".option-dang-interest").eq(1).prop("value"));
				console.log($(".option-dang-interest").eq(3).prop("value")); */
				// 선택 초기화 - 셀렉트 박스의 선택한 옵션을 관심지역 선택으로 바꾸기
				$(this, "option:eq(0)").prop("selected", true);
				// 태그를 생성할 위치
				var target = $(".div-dang-interest-list");
				// 초기화
				target.empty();
				// 태그 생성
				var dangInterestLength = $(".option-dang-interest").length;
				// 등록된 관심지역이 3개인지 여부에 따라 다른 처리
				if(dangInterestLength >= 3) { // 관심지역이 3개 등록된 상태라면
					for(var i = 0 ; i < dangInterestLength ; i ++) { // 등록된 관심지역 태그 생성
						target
							.append(
								$("<div>").attr("class", "col-4")
									.append(
										$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
											.append(
												$("<span>").attr("class", "span-dang-interest").text($(".option-dang-interest").eq(i).prop("value"))
											)
											.append(
												$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
											)		
									)
							)
					}
				} else { // 관심지역이 3개 미만으로 등록된 상태라면
					for(var i = 0 ; i < dangInterestLength ; i ++) { // 등록된 관심지역 태그 생성
						target
							.append(
								$("<div>").attr("class", "col-4")
									.append(
										$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
											.append(
												$("<span>").attr("class", "span-dang-interest").text($(".option-dang-interest").eq(i).prop("value"))
											)
											.append(
												$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
											)		
									)
							)
					}
					for(var i = 0 ; i < 3 - dangInterestLength ; i ++) { // 미등록된 관심지역 태그 생성
						target
							.append(
								$("<div>").attr("class", "col-4")
									.append(
										$("<div>").attr("class", "div-dang-interest div-dang-interest-inactive")
									)
							)
					}
				}
				// 관심지역으로 등록된 지역 색 변경
				for(var i = 0 ; i < dangInterestLength ; i ++) {
					// 관심지역명으로 태그를 찾아 해당 태그의 id 저장
					var dangInterestId = $("text").filter(":contains("+$(".option-dang-interest").eq(i).prop("value")+")").prop("id");
					// 해당 관심지역 id를 가진 관심지역 영역 태그에 클래스를 부여하여 색 변경
					$("#CD-" + dangInterestId).addClass("interest-area-selected");
				}
				
				// Modal 표시
				$("#modalInterest").modal("show");
			}
		});
		
		// 관심지역 선택 - 관심지역 Modal의 지역명 클릭 이벤트
		$(document).on("click", ".interest-TEXT", function(){
			// 만약 관심지역 3개가 등록된 상태라면 return
			if($(".div-dang-interest-active").length == 3) {
				return;
			}
			// 관심지역 등록할 지역 id
			var dangInterestInsertId = $(this).prop("id");
			// 클래스를 부여할 관심지역 영역 태그
			var dangInterestInsertPath = $("#CD-" + dangInterestInsertId);
			// 만약 이미 클래스가 부여된 태그라면(이미 선택된 관심지역이라면)
			if(dangInterestInsertPath.hasClass("interest-area-selected") == true) {
				return;
			}
			// 해당 관심지역 id로 관심지역 영역 태그에 클래스를 부여하여 색 변경
			dangInterestInsertPath.addClass("interest-area-selected");
			// 관심지역 등록할 지역명
			var dangInterestInsertName = $(this).text();
			// 가장 앞에 있는 관심지역 미등록 태그 위치
			var target = $(".div-dang-interest-inactive").eq(0).parent();
			// 삭제
			target.empty();
			// 태그를 생성할 위치
			//var target = $(".div-dang-interest-list");
			// 관심지역 등록 태그 생성
			target
				.append(
					$("<div>").attr("class", "position-relative div-dang-interest div-dang-interest-active")
						.append(
							$("<span>").attr("class", "span-dang-interest").text(dangInterestInsertName)
						)
						.append(
							$("<i>").attr("class" , "fa-solid fa-xmark i-dang-interest-cancel")
						)	
				)
		});
		
		// 관심지역 삭제 - 관심지역 Modal의 X버튼 클릭 이벤트
		$(document).on("click", ".i-dang-interest-cancel", function(){
			// 관심지역 취소할 지역명
			var dangInterestCancelName = $(this).prev().text();
			// 관심지역명으로 태그를 찾아 해당 태그의 id 저장
			var dangInterestCancelId = $("text").filter(":contains("+dangInterestCancelName+")").prop("id");
			// 해당 관심지역 id로 관심지역 영역 태그에 클래스를 부여하여 색 변경
			$("#CD-" + dangInterestCancelId).removeClass("interest-area-selected");
			// 태그를 생성할 위치
			var targetAttach = $(this).parents(".div-dang-interest-list");
			var targetRemove = $(this).parent().parent();
			// 관심지역 미등록 태그 생성
			targetAttach
				.append(
					$("<div>").attr("class", "col-4")
						.append(
							$("<div>").attr("class", "div-dang-interest div-dang-interest-inactive")			
						)
				)
			// 초기화
			targetRemove.remove();
		});
		
		// 관심지역 저장 - 관심지역 Modal의 관심지역 저장 버튼 클릭 이벤트
		$(document).on("click", ".btn-dang-interest-submit", function(){
			//console.log("관심지역 저장");
			// 선택한 관심지역을 담기위한 배열
			var dangInterestArray = [];
			for(var i = 0 ; i < $(".span-dang-interest").length ; i ++) {
				dangInterestArray.push($(".span-dang-interest").eq(i).text());
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/rest_user/change_interest",
				method : "post",
				data : {
					dangInterestArray : dangInterestArray
				},
				success : function() {
					alert("관심지역이 저장되었습니다!");
					location.href = "${pageContext.request.contextPath}/dang/search"
				}
			});
//			console.log(dangInterestArray);
		});
		
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
		
		// 현재 페이지
		var p = 1;
		// 댕모임 전체/검색 결과 총 갯수
		var pLast = $("#pLast").val();
		// Query String	
		// - 현재 주소
		var urlHref = window.location.href;
		var url = new URL(urlHref);
		// - Query String
		var queryString = url.searchParams.toString();
		
		// 댕모임 목록 무한 스크롤
		$(window).scroll(_.debounce(function(){
			// 현재 페이지가 마지막 페이지와 같으면 return
			if(p == pLast) return;
			// 화면 바닥의 위치[%]
			var percentage = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
			// 전체 문서 위치의 80%에 도달했을 때
			if(percentage > 80) {
				// 페이지 수 증가
				p = p + 1;
				// 비동기 조회
				$.ajax({
					url : "${pageContext.request.contextPath}/rest_dang/list?p=" + p + "&" +  queryString,
					method : "get",
					success : function(resp) {
						
						var target = $(".div-dang-search-list");
						
						for(var i = 0 ; i < resp.length ; i ++) {
							
							var divDangInfoContainer = $("<div>").attr("class", "col-4 my-3 p-3");
							
							var divDangInfoOuter = $("<div>").attr("class", "card col w-100 div-outer-dang-info shadow");
							
							var divDangProfile = $("<div>").attr("class", "div-dang-profile")
													.append(
															$("<img>").attr("class", "card-img-top img-dang-profile").attr("src", "${pageContext.request.contextPath}/images/img-dang-profile-default.png")
														)
														.append(
															$("<span>").attr("class", "px-2 span-dang-area").text(resp[i].dangInfo.dangArea)
														)
							
							var divDangCardBody = $("<div>").attr("class", "card-body");
							
							var rowDangCreatetime = $("<div>").attr("class", "row")
														.append(
																$("<span>").attr("class", "span-dang-createdate").text("since."+resp[i].dangInfo.dangCreatetime)		
															)
												
							var rowDangName = $("<div>").attr("class", "row my-2")
												.append(
														$("<div>").attr("class", "col-9 d-flex justify-content-start align-items-center")
															.append(
																$("<strong>").attr("class", "text-middle strong-dang-name").text(resp[i].dangInfo.dangName)
															)
													)
							
							if(resp[i].dangInfo.dangPrivate == "Y") {
								rowDangName
									.append(
										$("<div>").attr("class", "col-3 d-flex justify-content-center align-items-center div-dang-private")
											.append(
												$("<div>").attr("class", "w-100 p-1 text-center text-middle span-dang-private")
													.append(
														$("<i>").attr("class", "fa-solid fa-lock")		
													)
											)
									)
								
							}
							
							var rowDangInfo = $("<div>").attr("class", "row my-2")
								.append(
									$("<div>").attr("class", "div-dang-info")
										.append(
											$("<span>").attr("class", "card-text span-dang-info py-0").text(resp[i].dangInfo.dangInfo)
										)
								)
								
							var rowDangHashtag = $("<div>").attr("class", "row mb-2")
								.append(
									$("<div>").attr("class", "d-flex flex-row flex-wrap div-hashtag-list")	
								)	
							if(resp[i].dangHashtag.length != 0) {
								for(var j = 0 ; j < resp[i].dangHashtag.length ; j ++) {									
									rowDangHashtag.children()
										.append(
											$("<span>").attr("class", "span-dang-hashtag me-1 my-1 px-2").text("#"+ resp[i].dangHashtag[j].hashtagContent)
										)
								}	
							}
							
							var rowDangButton = $("<div>").attr("class", "row")
								.append(
									$("<div>").attr("class", "col-4 d-flex justify-content-center align-items-center")
										.append(
											$("<div>").attr("class", "div-dang-head flex-fill d-flex justify-content-center align-items-center")
												.append(
													$("<i>").attr("class", "fa-solid fa-paw me-1")		
												)
												.append(
													$("<span>").attr("class", "span-dang-head").text(resp[i].dangInfo.dangHead)	
												)
												.append(
													$("<span>").text(" / ")		
												)
												.append(
													$("<span>").attr("class", "span-dang-headmax").text(resp[i].dangInfo.dangHeadmax)
												)
										)
								)
							
							if(resp[i].dangInfo.isLike == 1) {
								rowDangButton
								.append(
									$("<div>").attr("class", "col-4 d-flex justify-content-center align-items-center div-dang-like")
										.append(
											$("<button>").attr("class", "flex-fill btn-dang btn-dang-like btn-dang-like-selected").attr("type", "button").attr("data-islike", 1)
												.append(
													$("<i>").attr("class", "fa-regular fa-heart me-1")
												)
												.append(
													$("<span>").text(resp[i].dangInfo.dangLike)
												)
										)
								)
							} else {
								rowDangButton
									.append(
										$("<div>").attr("class", "col-4 d-flex justify-content-center align-items-center div-dang-like")
											.append(
												$("<button>").attr("class", "flex-fill btn-dang btn-dang-like").attr("type", "button").attr("data-islike", 0)
													.append(
														$("<i>").attr("class", "fa-regular fa-heart me-1")
													)
													.append(
														$("<span>").text(resp[i].dangInfo.dangLike)
													)
											)
									)
							}
							rowDangButton
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangNo").attr("value", resp[i].dangInfo.dangNo)
								)
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangName").attr("value", resp[i].dangInfo.dangName)
								)
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangHeadmax").attr("value", resp[i].dangInfo.dangHeadmax)
								)
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangHead").attr("value", resp[i].dangInfo.dangHead)
								)
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangPrivate").attr("value", resp[i].dangInfo.dangPrivate)
								)
								.append(
									$("<input>").attr("type", "hidden").attr("name", "dangPw").attr("value", resp[i].dangInfo.dangPw)
								)
							
							if(userNo != "" && resp[i].dangInfo.isMember == 1) {
								rowDangButton
									.append(
										$("<div>").attr("class", "col-4 d-flex justify-content-end align-items-center div-dang-btn")
											.append(
												$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-enter").attr("data-dangno", resp[i].dangInfo.dangNo).text("입장")
											)
									)
							} else if(userNo != "" && resp[i].dangInfo.isMember == 0){
								rowDangButton
									.append(
										$("<div>").attr("class", "col-4 d-flex justify-content-end align-items-center div-dang-btn")
											.append(
												$("<button>").attr("type", "button").attr("class", "flex-fill btn-dang btn-dang-join").attr("data-dangno", resp[i].dangInfo.dangNo).text("입장")
											)
									)
							}
								
							divDangCardBody
								.append(rowDangCreatetime)
								.append(rowDangName)
								.append(rowDangInfo)
								.append(rowDangHashtag)
								.append(rowDangButton)
								
							divDangInfoOuter
								.append(divDangProfile)
								.append(divDangCardBody)
								
							divDangInfoContainer.append(divDangInfoOuter)
							
							target.append(divDangInfoContainer);

						}
					}
				});
			}
		}, 300));
	});
	
</script>