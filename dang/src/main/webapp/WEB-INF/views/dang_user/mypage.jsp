<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<style>
	
    * {
        /* border: 1px gray dotted; */
    }

    .under-menu{
        border: solid 1px #76BEFF;
        border-radius: 1em;
    }
     .myprofile-border{
        border: solid 1px #76BEFF;
        border-radius: 1em;
    }
    
    .myprofile-edit{
        font-size: 16px;
        font-weight: 600; 
        color: A3A0A0;
    }
      .mydang-border{
        border: solid 1px #76BEFF;
        border-radius: 1em;
    }

    .hello-common{
        font-size: 24px;
        font-weight: 400;
    }
    
    .owner-common, .dang-common{
        font-size: 20px;
        font-weight: 400;
        color: #515151;
    }
    .owner-common2, .dang-common2{
        font-size: 20px;
        font-weight: 400;
        color: #76BEFF;
    }
    
    .mypage-menu-common{
    	font-size: 18px;
    	font-weight: bold;
    	color: #787878;
    }

    .dang-nick{
        font-size: 26px;
        font-weight: 600;
        color :#76BEFF;
    }
    
    .owner-profile,.dang-profile{
        font-size: 20px;
        font-weight: 600;
        color :#515151;
    }
    
    .dang-nick2{
        font-size: 24px;
        font-weight: 600;
        color :#515151;
    }
    

    .dang-d-day{
        font-size: 26px;
        font-weight: 600;
        color :#F94888;
    }
    
    .dang-detail{
        font-size: 20px;
        font-weight: 400;
        color :#76BEFF;
    }
    
    .dang-photo{
    	position: relative;
    
    }
    
    .dang-gender{
	    position: absolute;
	    top: 60%;
	    left: 60%;
    }
</style>

<body>

    <div class="container-fluid my-3">
        <div class="row">
            <div class="col-8 offset-2">

                <div class="row">
                    <div class="col d-flex flex-column justify-content-center align-items-center py-3">				
                        <span class="hello-common">안녕하세요 <span class="dang-nick">${userInfo.userNick}</span>님</span>
                        <span class="hello-common">댕댕이와 함께하는 모임, 댕모임입니다.</span>
                        <!--  <span class="hello-common">댕모임과 함께 하신 지 <span class="dang-d-day">14일</span>이 되었어요.</span>-->
                    </div>
                </div>

                <div class="row mb-3 ">
                    
                    <div class="col-7 myprofile-border">
                        <div class="row">

                            <div class="col-6 dang-owner-profile">
                                <div class="row d-flex flex-column align-items-center justify-content-center px-5 py-3">                                    
                                    <img class = "row img-fluid img-owner-profile w-100" src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}">
                                    <span class="dang-nick2 row align-items-center justify-content-center py-2 ">${userInfo.userNick}</span>                                
                                </div>
                            </div>

                            
                            <div class="col-6 dang-owner-info">
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">관심지역</span>
                                    </div>                                                       
                                    <div class = "owner-common2 col-5 d-flex flex-column">
                                    <c:choose> 
                                    <c:when test="${mypageInterestArea!= null}">  
	                                   	 <c:forEach var="InterestArea" items="${mypageInterestArea}">      
	                                        <span class = "span-info">${InterestArea.mypageInterestArea}</span>
	                                      </c:forEach>  
                                       </c:when>   
                                       <c:otherwise>
                                       <span class = "span-info">-</span>
                                       </c:otherwise>
                            		 </c:choose> 
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                
                                    <div class = "owner-common col-5 offset-1">                                   
                                        <span class = "span-info-category">키우는 댕</span>
                                    </div>
									<div class = "owner-common2 col-5">
									<c:choose>
									 <c:when test="${mypageDangNum!= null}">   
									       <span class = "span-info">${mypageDangNum}마리</span>
									</c:when>
                                       <c:otherwise>									
											<span class = "span-info">댕댕이 정보를 등록해주세요.</span>
                                       </c:otherwise>	
                                       </c:choose>										
								  </div>

                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">활동 댕모임</span>
                                    </div>
                                    <div class = "owner-common2 col-5">       
                                    <c:choose>                             
                                    <c:when test="${mypagePartyNum!= null}">
                                        <span class = "span-info">${mypagePartyNum}개</span>
									</c:when>
									<c:otherwise>
									    <span class = "span-info">활동 댕모임이 없습니다.</span>
									</c:otherwise>
									</c:choose>
                                    </div>

                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">최근 로그인</span>
                                    </div>
                                    <div class = "owner-common2 col-5">
                                        <span class = "span-info">${mypageLogin}</span>
                                    </div>
                                </div>                       
                            </div>


                        </div>
                    </div>
                    
                    <div class="col-5 mydang-border">
				                    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
									  <div class="carousel-indicators">
									    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
									    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
									    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
									  </div>
									  <div class="carousel-inner">
									    <div class="carousel-item active">
									      <img src="https://placeimg.com/600/300/any" class="d-block w-100" alt="...">
									      <div class="carousel-caption d-none d-md-block">
									        <h5>First slide label</h5>
									        <p>Some representative placeholder content for the first slide.</p>
									      </div>
									    </div>
									    <div class="carousel-item">
									      <img src="https://placeimg.com/600/300/any" class="d-block w-100" alt="...">
									      <div class="carousel-caption d-none d-md-block">
									        <h5>Second slide label</h5>
									        <p>Some representative placeholder content for the second slide.</p>
									      </div>
									    </div>
									    <div class="carousel-item">
									      <img src="https://placeimg.com/600/300/any" class="d-block w-100" alt="...">
									      <div class="carousel-caption d-none d-md-block">
									        <h5>Third slide label</h5>
									        <p>Some representative placeholder content for the third slide.</p>
									      </div>
									    </div>
									  </div>
									  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
									    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
									    <span class="visually-hidden">Previous</span>
									  </button>
									  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
									    <span class="carousel-control-next-icon" aria-hidden="true"></span>
									    <span class="visually-hidden">Next</span>
									  </button>
									</div>
                    
                        </div> <!-- col-5끝 -->
                    </div>
            
            <div class="col">
                <div class="row mypage-1 mb-3">

                    <div class="under-menu mypage-one col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/change_interest_area'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-interest_area_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">관심지역 설정</span>
                        </div>
                    </div>     


                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/edit_pwck'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >                        
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-myinfo_edit_pink.png" >
                        </div>
                        <div class="row px-4 py-2 mb-3 mt-4">
                            <span class="mypage-menu-common">회원정보 변경</span>
                        </div>
                    </div> 
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/change_pw'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-pw_change_pink.png" >
                        </div>
                        <div class="row px-4 py-2 mb-3 mt-4">
                            <span class="mypage-menu-common">비밀번호 변경</span>
                        </div>
                    </div>    

                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/edit_puppy_info'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">댕 정보 변경</span>
                        </div>
                    </div> 
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/list_mydang'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-join_dang_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">가입 댕모임</span>
                        </div>
                    </div>   
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/schedule_history'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-join-meeting-pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">일정 히스토리</span>
                        </div>
                    </div> 
                </div>
                
                </div>
                  
            </div>
        </div>	
    </div>



</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>