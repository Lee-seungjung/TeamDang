<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<style>
	
    * {
        border: 1px gray dotted;
    }

    .mypage-border{
        border: solid 1px gray;
        border-radius: 1em;
    }
     .myprofile-border{
        border: solid 1px gray;
        border-radius: 1em;
    }
    
    .myprofile-edit{
        font-size: 16px;
        font-weight: 600; 
        color: A3A0A0;
    }
      .mydang-border{
        border: solid 1px gray;
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
                        <span class="hello-common">안녕하세요 <span class="dang-nick">${userInfo.userNick}</span>님,</span>
                        <span class="hello-common">댕모임과 함께 하신 지 <span class="dang-d-day">14일</span>이 되었어요.</span>
                    </div>
                </div>

                <div class="row">
                    
                    <div class="col-7 myprofile-border">
                        <div class="row">

                            <div class="col-6 dang-owner-profile">
                                <div class="row d-flex flex-column align-items-center justify-content-center px-5 py-3">                                    
                                    <img class = "row img-fluid img-owner-profile w-100" src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}">
                                    <span class="dang-nick2 row align-items-center justify-content-center py-2 ">${userInfo.userNick}</span>
                                    <a class="myprofile-edit row align-items-center justify-content-center">내정보 수정</a>
                                </div>
                            </div>

                            
                            <div class="col-6 dang-owner-info">
                                <div class = "row px-3 py-3 align-items-center">
                                    <div class = "col-6 offset-3">
                                        <span class = "owner-profile span-info-category">댕주인 프로필</span>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">관심지역</span>
                                    </div>
                                    <div class = "owner-common2 col-5">
                                    
                                        <span class = "span-info">서울 강남구</span>
                                        <span class = "span-info">서울 강남구</span>
                                        <span class = "span-info">서울 강남구</span>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">키우는 댕</span>
                                    </div>
                                    <div class = "owner-common2 col-5">
                                        <span class = "span-info">2마리</span>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">활동 댕모임</span>
                                    </div>
                                    <div class = "owner-common2 col-5">
                                        <span class = "span-info">3개</span>
                                    </div>
                                </div>
                                <div class = "row px-3 py-3">
                                    <div class = "owner-common col-5 offset-1">
                                        <span class = "span-info-category">최근 로그인</span>
                                    </div>
                                    <div class = "owner-common2 col-5">
                                        <span class = "span-info">2023.02.01</span>
                                    </div>
                                </div>                                
                            </div>


                        </div>

                    </div>
                    
                    <div class="col-5 mydang-border">
                        <div class="row">
                            <div class="col-6 dang-profile">
                                <div class="dang-photo row px-3 py-4 d-flex flex-column align-items-center justify-content-center">
                                    <img class="row img-fluid img-owner-profile w-100" src = "${pageContext.request.contextPath}/rest_attachment/download/${userInfo.attachmentNo}" >
                                    <div class="dang-gender">
                                     <img class="row img-fluid img-dang" src ="">
                                    </div>
                                    <span class="row d-flex align-items-center justify-content-center py-1 ">초코</span>
                                </div>
                            </div>
                            <div class="col-6 dang-info">
                                <div class = "row px-3 py-3 align-items-center">
                                    <div class = "col-8 offset-2">
                                        <span class = "dang-profile span-info-category">댕 프로필</span>
                                    </div>
                                </div>
                                <div class = "row py-3">
                                    <div class = "col-5 offset-1">
                                        <span class = "dang-common span-info-category">이름</span>
                                    </div>
                                    <div class = "col-5">
                                        <span class = "dang-common2 span-info">초코</span>
                                    </div>
                                </div>
                                <div class = "row py-3">
                                    <div class = "col-5 offset-1">
                                        <span class = "dang-common span-info-category">나이</span>
                                    </div>
                                    <div class = "col-5">
                                        <span class = "dang-common2 span-info">3살</span>
                                    </div>
                                </div>
                                <div class = "row py-3">
                                    <div class = "col-5 offset-1">
                                        <span class = "dang-common span-info-category">성별</span>
                                    </div>
                                    <div class = "col-5">
                                        <span class = "dang-common2 span-info">여아</span>
                                    </div>
                                </div>                     
                            </div>

                        </div>  
                        <div class="row dang-detail">
                            <div class="col-12 dang-detail py-3 d-flex justify-content-center align-items-center">
                                <span class="detail-1 px-2">#낮을가려요</span>
                                <span class="detail-2 px-2">#사람을좋아해요</span>
                                <span class="detail-3 px-2">#입질이있어요</span>
                            </div>
                        </div>    

                        </div>
                    </div>

            <div class="mypage-border py-3 mt-3">

                <div class="row mypage-1">

                    <div class="mypage-one col-4 d-flex flex-column justify-content-center align-items-center" onClick = "location.href='${pageContext.request.contextPath}/user/change_interest_area'">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-interest_area_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-5 mt-4">
                            <span class="mypage-menu-common">관심지역 설정</span>
                        </div>
                    </div>     


                    <div class="col-4 d-flex flex-column justify-content-center align-items-center" onClick = "location.href='${pageContext.request.contextPath}/user/edit_pwck'">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >                        
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-myinfo_edit_pink.png" >
                        </div>
                        <div class="row px-4 py-2 mb-5 mt-4">
                            <span class="mypage-menu-common">회원정보 변경</span>
                        </div>
                    </div> 
                    <div class="col-4 d-flex flex-column justify-content-center align-items-center">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/change_pw'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-pw_change_pink.png" >
                        </div>
                        <div class="row px-4 py-2 mb-5 mt-4">
                            <span class="mypage-menu-common">비밀번호 변경</span>
                        </div>
                    </div>    
                </div>
                <div class="row mypage-2">
                    <div class="col-4 d-flex flex-column justify-content-center align-items-center">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" onClick = "location.href='${pageContext.request.contextPath}/user/edit_puppy_info'">
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-mydang_edit_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-5 mt-4">
                            <span class="mypage-menu-common">댕 정보 변경</span>
                        </div>
                    </div> 
                    <div class="col-4 d-flex flex-column justify-content-center align-items-center" onClick = "location.href='${pageContext.request.contextPath}/user/list_mydang'">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-join_dang_pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-5 mt-4">
                            <span class="mypage-menu-common">가입 댕모임</span>
                        </div>
                    </div>   
                    <div class="col-4 d-flex flex-column justify-content-center align-items-center" onClick = "location.href='${pageContext.request.contextPath}/user/schedule_history'">
                        <div class="row px-4 py-1 mt-5 d-flex flex-column align-items-center justify-content-center" >
                            <img class="row  mypage-common  img-fluid img-owner-profile w-50" src = "${pageContext.request.contextPath}/images/mypage-join-meeting-pink.png" >
                        </div>
                        <div class="row px-4 py-2  mb-5 mt-4">
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