<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<style>
	
    * {
      
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
        background-color:white;
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
    
    .strong-puppy-info-puppy-name {
    	font-size : 24px;
    }
    
	.i-puppy-gender-male {
	    color: #76BEFF;
	}
	
	.i-puppy-gender-female {
	    color: #F94888;
	}
	
	.span-puppy-character {
	    color: #76BEFF;
	}
	
	.carousel-control-prev-icon, .carousel-control-next-icon {
	     background-color: #76BEFF;	
	}
</style>

<body>

    <div class="container-fluid my-3">
        <div class="row">
            <div class="col-8 offset-2">

                <div class="row">
                    <div class="col d-flex flex-column justify-content-center align-items-center py-3">				
                        <span class="hello-common">안녕하세요 <span class="dang-nick">${userInfo.userNick}</span>님,</span>      
	                        <c:if test = "${myDangDday > 0}">                 
	                      	  <span class="hello-common">댕모임과 함께 하신 지 <span class="dang-d-day">${myDangDday}</span>일이 되었어요.</span>
	                        </c:if>
	                        <c:if test = "${myDangDday == 0}"> 
	                          <span class="hello-common">오늘 가입하셨네요~ 댕모임에서 좋은 추억을 만들어보세요.</span>
	                        </c:if>
                    </div>
                </div>

                <div class="row mb-3 ">
                    <div class="col-7 myprofile-border d-flex flex-column align-items-center justify-content-center">
                        <div class="row">
                            <div class="col-5 dang-owner-profile d-flex flex-column align-items-center justify-content-center">
                                <div class="row px-3">
                                	<div class = "col d-flex flex-column align-items-center justify-content-center">
	                                	<c:choose>             
	                                	<c:when test = "${loginProfileImg == null}" >                     
		                                    <img class = "img-owner-profile img-circle origin-img w-75 my-1" src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid img-circle origin-img origin-css">
		                                    <span class="dang-nick2 row align-items-center justify-content-center my-2">${userInfo.userNick}</span>
	                                    </c:when>
	                                    <c:otherwise>   
											<img class = "img-circle img-owner-profile w-75 my-1" src="${pageContext.request.contextPath}/rest_attachment/download/${loginProfileImg}">
		                                    <span class="dang-nick2 row align-items-center justify-content-center my-2">${userInfo.userNick}</span>                        
	                                    </c:otherwise>    
	                                    </c:choose>   
                                	</div>
                                </div>
                            </div>
                            
                            <div class="col-7 dang-owner-info py-3">
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-4">
                                        <span class = "span-info-category">관심지역</span>
                                    </div>                                                       
                                    <div class = "owner-common2 col-8 d-flex flex-column"> 
                                    <c:if test="${interestArea != null}">  
	                                   	 <c:forEach var="mypageInterestArea" items="${interestArea}">      
	                                        <span class = "span-info">서울 ${mypageInterestArea}</span>
	                                      </c:forEach>  
                                       </c:if>   
                                       <c:if test="${interestArea.size() == 0}">
                                       <span class = "span-info">관심지역이 없습니다.</span>
                                       </c:if>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                
                                    <div class = "owner-common col-4">                                   
                                        <span class = "span-info-category">키우는 댕</span>
                                    </div>
									<div class = "owner-common2 col-8">
									 <c:if test="${mypageDangNum > 0}">   
									       <span class = "span-info">${mypageDangNum}</span>
									       <span>마리</span>
									</c:if>
                                       <c:if test="${mypageDangNum == 0}">									
											<span class = "span-info">댕댕이 정보가 없습니다.</span>
                                       </c:if>									
								  </div>

                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-4">
                                        <span class = "span-info-category">활동 댕모임</span>
                                    </div>
                                    <div class = "owner-common2 col-8">                                  
                                    <c:if test="${mypagePartyNum > 0}">
                                        <span class = "span-info">${mypagePartyNum}</span>
                                        <span>개</span>
									</c:if>
									<c:if test="${mypagePartyNum == 0}">
									    <span class = "span-info">활동 댕모임이 없습니다.</span>
									</c:if>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-4">
                                        <span class = "span-info-category">최근 로그인</span>
                                    </div>
                                    <div class = "owner-common2 col-8">
                                        <span class = "span-info">${mypageLogin}</span>
                                    </div>
                                </div>                       
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-5 mydang-border">
                    	<div id="carouselPuppyInfo" class="carousel slide" data-bs-ride="carousel">
						  	<div class="carousel-inner">
						  	  <c:if test = "${dangPuppyList ne null}">
						  		<c:forEach var = "dangPuppyList" items = "${dangPuppyList}">						  		
							    	<div class="carousel-item">						    	
							      		<div class = "container-fluid">
							      			<div class = "row px-5 py-4 mt-3">
							      				<div class = "col-6 d-flex justify-content-center align-items-center">
							      					<img class = "w-100 img-puppy-profile img-circle" src = "${pageContext.request.contextPath}/rest_attachment/download/${dangPuppyList.dangPuppyInfoDto.attachmentNo}">
							      				</div>
							      				<div class = "col-6">
							      					<div class = "row my-4">
							      						<div class = "col d-flex justify-content-center align-items-center">
								      						<strong class = "strong-puppy-info-puppy-name">${dangPuppyList.dangPuppyInfoDto.puppyName}</strong>
							      						</div>
							      					</div>
							      					<div class = "row my-4">
							      						<div class = "col-6 d-flex justify-content-center align-items-center">
							      							<span>나이</span>
							      						</div>
							      						<div class = "col-6">
							      							<span>${dangPuppyList.dangPuppyInfoDto.puppyAge}살</span>
							      						</div>
							      					</div>
							      					<div class = "row my-4">
							      						<div class = "col-6 d-flex justify-content-center align-items-center">
							      							<span>성별</span>
							      						</div>
							      						<div class = "col-6">
							      							<c:choose>
							                                <c:when test = "${dangPuppyList.dangPuppyInfoDto.puppyGender == 'M'}">
							                                <span>남아</span>
						                                    <i class="fa-solid fa-mars ms-1 i-puppy-gender-male"></i>
							                                </c:when>
							                               	<c:otherwise>
							                           		<span>여아</span>
						                                    <i class="fa-solid fa-venus ms-1 i-puppy-gender-female"></i>
							                               	</c:otherwise>
							                                </c:choose>
							      						</div>
							      					</div>
							      				</div>
							      			</div>
							      			<div class = "row mb-5">
							      				<div class = "col d-flex flex-row justify-content-center align-items-center">
							      					<c:forEach var = "dangPuppyCharacter" items = "${dangPuppyList.dangPuppyCharacter}">
							      						<span class = "mx-2 span-puppy-character">#${dangPuppyCharacter}</span>
							      					</c:forEach>
							      				</div>
							      			</div>
							      		</div>
							    	</div>						    	
						    	</c:forEach>
							    <button class="carousel-control-prev" type="button" data-bs-target="#carouselPuppyInfo" data-bs-slide="prev">
						    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    		<span class="visually-hidden">Previous</span>
						  		</button>
						  		<button class="carousel-control-next" type="button" data-bs-target="#carouselPuppyInfo" data-bs-slide="next">
						    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
						    		<span class="visually-hidden">Next</span>
						  		</button>
						    	</c:if>
						    	<c:if test= "${dangPuppyList.size() == 0}">					   
							    	<div class="carousel-item">						    	
							      		<div class = "container-fluid">
							      			<div class = "row px-5 py-5 mt-3">
							      				<div class = "col">
							      					<div class = "row my-5 py-3">
							      						<div class = "col my-3 d-flex justify-content-center align-items-center">
								      						<strong class = "strong-puppy-info-puppy-name">댕댕이 정보가 없습니다</strong>
							      						</div>
							      						<div class="d-flex d-flex justify-content-center align-items-center" >
							      							<a href = "${pageContext.request.contextPath}/user/edit_puppy_info">댕댕이 정보 등록하기</a>
							      						</div>
							      					</div>
							      					</div>
							      				</div>
							      			</div>
							      		</div>		    							    	
							    	</c:if>		    	
						  		</div>
							</div>
						</div> <!-- col-5끝 -->
					</div>
            
            <div class="col">
                <div class="row mypage-1 mb-3">

                    <div class="under-menu mypage-one col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/change_interest_area'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-interest_area_pink.png" >
                        </div>
                        <div class="row px-3 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">관심지역 설정</span>
                        </div>
                    </div>     


                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/edit_user_info_pwck'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >                        
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-myinfo_edit_pink.png" >
                        </div>
                        <div class="row px-3 py-2 mb-3 mt-4">
                            <span class="mypage-menu-common">회원정보 변경</span>
                        </div>
                    </div> 
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/change_pw_pwck'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-pw_change_pink.png" >
                        </div>
                        <div class="row px-3 py-2 mb-3 mt-4">
                            <span class="mypage-menu-common">비밀번호 변경</span>
                        </div>
                    </div>    

                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/edit_puppy_info'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_pink.png" >
                        </div>
                        <div class="row px-3 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">댕댕이 정보 변경</span>
                        </div>
                    </div> 
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/list_mydang'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-join_dang_pink.png" >
                        </div>
                        <div class="row px-3 py-2  mb-3 mt-4">
                            <span class="mypage-menu-common">가입한 댕모임</span>
                        </div>
                    </div>   
                    <div class="under-menu col-2 d-flex flex-column justify-content-center align-items-center cursor-pointer" onClick = "location.href='${pageContext.request.contextPath}/user/schedule_history'">
                        <div class=" row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-75" src = "${pageContext.request.contextPath}/images/mypage-join-meeting-pink.png" >
                        </div>
                        <div class="row px-3 py-2 mb-3 mt-4">
                            <span class="mypage-menu-common">참여일정 조회</span>
                        </div>
                    </div> 
                </div>
                
                </div>
                  
            </div>
        </div>	
    </div>



</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

    <script type="text/javascript">
        $(function(){
            
            $(".carousel-item").eq(0).addClass("active");
        });

    </script>