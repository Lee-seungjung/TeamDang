<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 대화" name="title"/>
</jsp:include>

<style>

	.chat-box{
		overflow:scroll;
		overflow-x:hidden;
		background-color:#F1F4FF;
		width:100%; height:725px;
		border-top-right-radius: 0.3rem !important;
		position : relative;
	}
	.chat-box::-webkit-scrollbar {
	    width: 5px;
	 }
	  .chat-box::-webkit-scrollbar-thumb {
	  	height:30%;
	    background-color: #B0CBFF;
	    border-radius: 0.3rem;
	 }
	  .chat-box::-webkit-scrollbar-track {
	    background-color: #F1F4FF;
	    border-radius: 0.3rem;
	 }
	 .chat-submit{
	 	width:100%;
	 	background-color:#F1F4FF;
	 	height:50px;
	 	position: relative;
    	z-index: 1;
	 }
	 #chat-input{
	 	width:70%;
	 	inline-height:1.5;
	 	display:inline-block;
	 	border:none;
	 	border-radius:0.25rem;
	 	padding:0.5rem 1rem;
	 	font-size:15px;
	 }
	 #chat-input:focus{
	 	outline: 0;
	 }
	 #send-btn{
	 	display:inline-block;
	 	width:40px;
	 	height:40px;
	 	background-color:#B0CBFF;
	 	border-color:#B0CBFF;
	 }
	 .chat-icon-image{
	 	width:35px;
	 	height:auto;
	 }
	 .message{
	 	max-width:75%;
		float:left;
		border:1px solid #B0CBFF;
	 	border-radius: 0.7rem;
	 	background-color:#B0CBFF;
	 	color:#fff;
	 	padding:5px;
	 	word-wrap: break-word;
	 }
	 .my-message{
	 	max-width:75%;
		float:right;
		border:1px solid #fff;
	 	border-radius: 0.7rem;
	 	background-color:#fff;
	 	color:#495057;
	 	padding:5px;
	 	word-wrap: break-word;
	 }
	 table>tbody>tr>td{
	 	padding:5px;
	 }
	 .progress-bar{
	 	background-color: #6C7AEF;
	 }
	 .rounded-bottom {
	  border-bottom-right-radius: 0.3rem !important;
	  border-bottom-left-radius: 0.3rem !important;
	}
	.img-css{
		width:100px;
		height:100px;
		margin-top:-7px;
	}
	.date-print{
		border:1px solid #DEE0EB;
		border-radius:1rem;
		padding:5px;
		background-color:#DEE0EB;
		width:160px;
		margin:0 auto;
	}
	.date-font{
		font-size:14px;
		color:#878787;
			
	}
	.zoomin-img>img{
		max-width:800px;
	}
	.alert{
		margin-bottom:0.7rem;
	}
	
</style>


<div class = "container-fluid mt-3 mb-5">
	<div class = "col-8 offset-2">

		<div class = "row">
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<!-- 채팅 박스 시작 -->
			<div class = "col-6">
				<div class = "col">
					<!-- 신고 경고창 -->
					<c:if test="${report!=null}">
						<div class="alert alert-dismissible alert-danger">
							<button type="button" class="btn-close alert-xbtn" data-bs-dismiss="alert" data-rno="${report.reportNo}"></button>
							<strong>신고 1건 발생! </strong>
							<p style="font-size:15px;">신고 2번 경과 시 현재 댕모임에서 자동 탈퇴처리 됩니다.<br>
									* 자세한 사항은 관리자에게 문의부탁드립니다.</p>
						</div>
					</c:if>
					<div class="chat-box p-3 shadow">
						<c:if test="${history.size()==0}">
							<div class="no-chat text-center">
								<span style="font-size:15px; border-bottom:1px solid gray;">아직 채팅내역이 없습니다 :)</span>
							</div>
						</c:if>
						<div class="past-chat" data-no="${history[0].chatNo}"></div>
							
							<!-- 기존 메세지 생성 -->
							<c:forEach var="vo" items="${history}">
								<c:choose>
									<c:when test="${profile.userNo==vo.userNo}">
										<div class="d-flex flex-row-reverse align-items-end my-3">
											<c:choose>
												<c:when test="${vo.imgAttachmentNo==0}">
													<span class="my-message  ms-1">${vo.chatContent}</span>
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.imgAttachmentNo}" 
															width="100" height="100" class="cursor-zoomin">
												</c:otherwise>
											</c:choose>
											<span style="font-size:10px;" class="text-end me-1">
												<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
											</span>
										</div>
									</c:when>
									<c:otherwise>
										<div class="d-flex" style="margin-bottom:18px;">
											<div class="flex-shrink-0">
												<c:choose>
													<c:when test="${vo.attachmentNo==0}">
														<img src="${pageContext.request.contextPath}/images/basic-profile.png" data-uno="${vo.userNo}"
																class="img-fluid c-profile-info img-circle  cursor-pointer" width="45" height="45">
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" 
															class="img-circle c-profile-info cursor-pointer" width="45" height="45" data-uno="${vo.userNo}">
													</c:otherwise>
												</c:choose>
											</div>
											<div class="flex-grow-1 ms-2 d-flex flex-column">
												<p class="chat-nick" style="font-size:14px;">${vo.memberNick}</p>
												<div class="d-flex flex-row">
													<c:choose>
														<c:when test="${vo.imgAttachmentNo==0}">
															<span class="message mt-1">${vo.chatContent}</span>
														</c:when>
														<c:otherwise>
															<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.imgAttachmentNo}"
																	class="img-css cursor-zoomin mt-1">
														</c:otherwise>
													</c:choose>
													<span style="font-size:10px;" class="ms-1 align-self-end">
														<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
													</span>
												</div>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						<!-- 새 메세지 생성 -->
						<div class="new-chat"></div>
						
					</div>
					
					<c:if test="${adminInfo.userNo!=1}">
					<div class="chat-submit  justify-content-center rounded-bottom shadow w-100 middle-items" >
						<img src="${pageContext.request.contextPath}/images/add-image.png" class="img-fluid chat-icon-image cursor-pointer ms-1">
						<input type="file" style="display:none;" class="chat-img" accept=".jpg, .png, .gif">
						<input type="text" id="chat-input" class="ms-1 me-1" style="width:85%;">
						<button class="btn btn-primary me-1" id="send-btn" type="button">
							<i class="fa-solid fa-paper-plane middle-items"></i>
						</button>
					</div>
					</c:if>
					
				</div>
			</div>
			
			<!-- 방번호, 회원번호-->
			<input type="hidden" name="roomNo" value="${roomNo}">
			<input type="hidden" name="userNo" value="${profile.userNo}">
			<input type="hidden" name="dangNo" value="${profile.dangNo}">
			
			<!-- 채팅 박스 끝-->
			
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
		</div>
		
		<div class="zoomin">
			<div class="zoomin-img">
				<!-- 확대 이미지 코드-->
			</div>
		</div>
		
		<!-- 무한스크롤 높이 -->
		<input type="hidden" name="originHeight" value="">
		
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script>
	$(function(){
		//1. 시작하자마자 웹소켓 연결을 생성
		//2. 나가기 전에 웹소켓 연결을 제거
		//3. 전송버튼을 누르면 웹소켓으로 입력된 메세지를 전송

		//첫페이지 스크롤 하단 유지
		$(".chat-box").scrollTop($(".chat-box")[0].scrollHeight);
		//전송버튼 비활성화
		$("#send-btn").attr("disabled",true);
		//채팅이미지 확대
		zoomin();
		
		//전역변수 방번호, 댕모임번호
		var roomNo = $("[name=roomNo]").val();
		var dangNo = $("[name=dangNo]").val();
		console.log(dangNo);
		
		//1. 웹소켓 연결 생성
		var uri = "${pageContext.request.contextPath}/ws/chat";
		
		//- 접속 시 생성하는 객체가 WebSocket이 아니라 SockJS로 바뀐다
		socket = new SockJS(uri);
		
		//(+추가) 웹소켓이 연결되었는지 종료되었는지 어떻게 아나?
		// - 웹소켓 객체가 기본 제공하는 4가지 이벤트를 설정해서 처리
		socket.onopen = function(){
			//접속하자마자 서버로 입장메세지를 보냄
			console.log("open");
			var data = {
					type :1,
					room : roomNo
			};
			socket.send(JSON.stringify(data)); 		
		};
		
		socket.onclose = function(){
			console.log("close");
		};
		
		socket.onerror = function(){

		};
		socket.onmessage = function(e){
			//수신된 e.data는 JSON 문자열
			var data = JSON.parse(e.data);
			console.log(data);
			$(".no-chat").hide();
			
			//메세지 찍어주기 - 함수로 처리
			newChatList(data);
			
			//스크롤 하단으로 이동
			$(".chat-box").scrollTop($(".chat-box")[0].scrollHeight);

		};
		
		//2. 페이지를 벗어나면 웹소켓 연결을 제거
		$(window).on("beforeunload", function(){
			//웹소켓 연결 종료
			socket.close();
		});
		
		//3. 웹소켓으로 입력된 메세지를 전송
		$("#send-btn").click(function(){
			var text = $("#chat-input").val();
			
			//JSON으로 변환해서 전송
			//- JSON.stringify(객체) : 객체를 문자열로
			//- JSON.parse(문자열) : 문자열을 객체로
			
			var data = {
				type : 2,
				room : roomNo,
				chatContent : text,
				dangNo:dangNo
			};
			socket.send(JSON.stringify(data));
			$("#chat-input").val("");  //텍스트 창 비우기
			$("#send-btn").attr("disabled",true);
			
		});
		
		//4 엔터키 이벤트
		$("#chat-input").on("keyup",function(e){
			var inputText = $("#chat-input").val();
			console.log(inputText);
	        if(inputText!="" && e.keyCode==13 && inputText.length<=1000) {            
		        $("#send-btn").click();
	        }
	    });
		
		//전송버튼 비활성화
		$("#chat-input").on("input",function(){
			var value = $(this).val();
			console.log(value.length);
			if(value.length==0){
				$("#send-btn").attr("disabled",true);
			}else if(value.length>1000){
				alert('채팅 입력은 최대 1000자까지 전송 가능합니다.');
				$(this).val(value.substring(0,1000));
			}else{
				$("#send-btn").attr("disabled",false);
			}
		});
		
		//이미지 첨부 버튼 이벤트
		//프로필 클릭하면 첨부파일 열림
		$(".chat-icon-image").click(function(){
			$(".chat-img").click();
		});
		
		//채팅 사진 등록
		$(".chat-img").change(function(){
			var value = $(this).val();
			if(value.length>0){ //파일 있음
				var formData = new FormData();
				formData.append("attachment", this.files[0]);
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/upload",
					method:"post",
					data:formData,
					processData:false, 
                    contentType:false,
                    success:function(resp){
                    	var index = resp.lastIndexOf("/"); //경로에서 마지막/위치 찾기
                    	var imgAttachmentNo = resp.substr(index+1); //attachmentNo 꺼내기
						
                    	var ImgData = {
                				type : 2,
                				room : roomNo,
                				dangNo:dangNo,
                				attachmentNo:imgAttachmentNo
                		};
                		socket.send(JSON.stringify(ImgData));

			        }
				});
			}
		});
		
		//이미지 확대창 클릭 시 닫기
		$(".zoomin").click(function (e) {
		    $(".zoomin").toggle();
		});
		
		//무한스크롤 채팅 내역	
		var firstTotalHeight = parseInt($(".chat-box")[0].scrollHeight); //첫전체높이
		var firstBoxHeight = parseInt($(".chat-box").scrollTop()); //첫박스높이
		var sideheight = firstTotalHeight-firstBoxHeight; //남은공간
		$("[name=originHeight]").val(firstTotalHeight-sideheight); //첫스크롤 높이 저장(전체-남은공간)
		
		$(".chat-box").scroll(function() {
			var boxHeight = $(".chat-box").scrollTop(); //실시간 박스 높이
			var chatNo = $(".past-chat").attr("data-no"); //채팅 번호

			if(chatNo==1) return; //데이터 없을경우 비동기화 실행 중지
			
			var scrollBottomCheck = parseInt($("[name=originHeight]").val());
			var judge = scrollBottomCheck-boxHeight;
			
			scrollData = {
					roomNo:roomNo,
					chatNo:chatNo
			}
			if(boxHeight==0){
				$.ajax({
            		url:"http://localhost:8888/rest_chat/scroll_list/"+roomNo+"/"+chatNo,
            		method:"get",
            		data:scrollData,
            		success:function(resp){
            			console.log(resp);
            			console.log(resp.length);
            			if(resp.length<20){
            				$(".past-chat").attr("data-no",1);
            			}else{
            				$(".past-chat").attr("data-no",resp[resp.length-1].chatNo); //다음 비동기화 위한 chatNo 설정
            			}
            			
            			pastChatList(resp); //채팅내역 출력
            			
            			var totalNewHeight = parseInt($(".chat-box")[0].scrollHeight); //새 토탈 높이
            			var newBoxHeight = parseInt(totalNewHeight-sideheight); //새 박스 높이
            			var originBoxHeight = parseInt($("[name=originHeight]").val());//원래높이
            			var saveHeight = newBoxHeight-originBoxHeight; //새 박스높이 - 이전 박스높이
            			
            			$(".chat-box").scrollTop(saveHeight); //스크롤 유지

            			$("[name=originHeight]").val(newBoxHeight); //input창 새 높이 저장
            		}
    			});
			}
		});
		
		//경고창 x버튼 클릭 시 출력안되게 처리
		$(".alert-xbtn").click(function(){
			var reportNo = $(this).data("rno");
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_chat/alert_update/"+reportNo,
				method:"patch",
				success:function(resp){}
			});
		});

		//채팅 이미지 확대
		function zoomin(){
			$(".cursor-zoomin").click(function(){
				var src = $(this).attr("src");
				var img = $("<img>").attr("src",src);
				$(".zoomin-img").html(img);
				$(".zoomin").show();
			});
		}
		
		//새로운 채팅 화면에 표시
		function newChatList(data){
			var userNo = $("[name=userNo]").val();
			var chatUserNo = data.userNo;
			var chatDiv = $(".new-chat");
			
			if(userNo==chatUserNo){
				var div = $("<div>").attr("class","d-flex flex-row-reverse align-items-end my-3");
				var text;
				if(data.imgAttachmentNo==0){
					text = $("<span>").attr("class","my-message ms-1").text(data.chatContent);
				}else{
					text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.imgAttachmentNo)
					.attr("width","100").attr("height","100").attr("class","cursor-zoomin");
				}
				var formatTime = moment(data.chatDate).format('a h:mm'); //예)오후 2:24
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","text-end me-1");
				
				div.append(text).append(time);
				chatDiv.append(div);
			}else{
				var out_div = $("<div>").attr("class","d-flex").attr("style","margin-bottom:18px;");
				var shrink_div = $("<div>").attr("class","flex-shrink-0"); 
				var img = $("<img>").attr("class","img-circle c-profile-info cursor-pointer")
										.attr("width","45").attr("height","45").attr("data-uno",data.userNo);
				if(data.attachmentNo==null){
					img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
				}else{
					img.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.attachmentNo);
				}
				shrink_div.append(img);
				
				var grow_div = $("<div>").attr("class","flex-grow-1 ms-2 d-flex flex-column"); 
				var nick = $("<p>").text(data.memberNick).attr("class","chat-nick").attr("style","font-size:14px;");
				var flex_div = $("<div>").attr("class","d-flex flex-row"); 
				var text;
				if(data.imgAttachmentNo==0){
					text = $("<span>").attr("class","message mt-1").text(data.chatContent);
				}else{
					text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.imgAttachmentNo)
							.attr("width","100").attr("height","100").attr("class","cursor-zoomin mt-1");
				}
				var formatTime = moment(data.chatDate).format('a h:mm');
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","ms-1 align-self-end");
				flex_div.append(text).append(time);
				grow_div.append(nick).append(flex_div);
				out_div.append(shrink_div).append(grow_div);

				chatDiv.append(out_div);
			}
			//이미지 확대
			zoomin();
		}
		
		//과거 채팅내역
		function pastChatList(data){
			var userNo = $("[name=userNo]").val();
			var chatDiv = $(".past-chat");
			
			for(var i=0; i<data.length; i++){
				var chatUserNo = data[i].userNo;
				if(userNo==chatUserNo){
					var div = $("<div>").attr("class","d-flex flex-row-reverse align-items-end my-3");
					var text;
					if(data[i].imgAttachmentNo==0){
						text = $("<span>").attr("class","my-message ms-1").text(data[i].chatContent);
					}else{
						text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data[i].imgAttachmentNo)
						.attr("width","100").attr("height","100").attr("class","cursor-zoomin");
					}
					var formatTime = moment(data[i].chatDate).format('a h:mm'); //예)오후 2:24
					var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","text-end me-1");
					div.append(text).append(time);
					chatDiv.append(div);
				}else{
					var out_div = $("<div>").attr("class","d-flex").attr("style","margin-bottom:18px;");
					var shrink_div = $("<div>").attr("class","flex-shrink-0");
					var img = $("<img>").attr("class","img-circle c-profile-info cursor-pointer")
										.attr("width","45").attr("height","45").attr("data-uno",data[i].userNo);
					if(data[i].attachmentNo==0){
						img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
					}else{
						img.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data[i].attachmentNo);
					}
					shrink_div.append(img);
				
					var grow_div = $("<div>").attr("class","flex-grow-1 ms-2 d-flex flex-column"); 
					var nick = $("<p>").text(data[i].memberNick).attr("class","chat-nick").attr("style","font-size:14px;");
					var flex_div = $("<div>").attr("class","d-flex flex-row"); 
					var text;
					if(data[i].imgAttachmentNo==0){
						text = $("<span>").attr("class","message mt-1").text(data[i].chatContent);
					}else{
						text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data[i].imgAttachmentNo)
								.attr("width","100").attr("height","100").attr("class","cursor-zoomin mt-1");
					}
					var formatTime = moment(data[i].chatDate).format('a h:mm');
					var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","ms-1 align-self-end");
					flex_div.append(text).append(time);
					grow_div.append(nick).append(flex_div);
					out_div.append(shrink_div).append(grow_div);

					chatDiv.append(out_div);
				}
			}
			//이미지 확대
			zoomin();
		}

	});
</script>