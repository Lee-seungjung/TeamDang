<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 대화" name="title"/>
</jsp:include>

	<!-- sockjs cdn -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	<!-- moment cdn + 한글 언어팩-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<style>
	/* .profile-box{
		height:400px;
	} */
	.chat-box{
		overflow:scroll;
		overflow-x:hidden;
		background-color:#F1F4FF;
		width:100%; height:600px;
		border-top-right-radius: 0.3rem !important;
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
	 	width:15%;
	 	display:inline-block;
	 }
	 .fa-image{
	 	color:#76BEFF;
	 	font-size:39px;
	 }
	 .message{
	 	border:1px solid #B0CBFF;
	 	border-radius: 0.7rem;
	 	background-color:#B0CBFF;
	 	color:white;
	 	padding:5px;
	 }
	 .message2{
	 	border:1px solid #fff;
	 	border-radius: 0.7rem;
	 	background-color:#fff;
	 	color:#495057;
	 	padding:5px;
	 }
	 table>tbody>tr>td{
	 	padding:5px;
	 }
	 .progress {
	 	background-color: #F1F4FF;
	 	height: 0.5rem;
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
	.zoomin-img>img{
		max-width:800px;
	}
	
</style>
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
		$("#chat-input").on("keyup",function(key){
	        if(key.keyCode==13) {            
		        $("#send-btn").click();
	        }
	    });
		
		//전송버튼 비활성화
		$("#chat-input").on("input",function(){
			var value = $(this).val();
			if(value.length==0){
				$("#send-btn").attr("disabled",true);
			}else{
				$("#send-btn").attr("disabled",false);
			}
		});
		
		//이미지 첨부 버튼 이벤트
		//프로필 클릭하면 첨부파일 열림
		$(".fa-image").click(function(){
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

		function zoomin(){
			//채팅 이미지 확대
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
				var div = $("<div>").attr("class","text-end  mb-3");
				var formatTime = moment(data.chatDate).format('a h:mm'); //예)오후 2:24
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","align-bottom me-1");
				var text;
				if(data.imgAttachmentNo==0){
					text = $("<span>").attr("class","message2").text(data.chatContent);
				}else{
					text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.imgAttachmentNo)
					.attr("width","100").attr("height","100").attr("class","cursor-zoomin");
				}
				div.append(time).append(text);
				chatDiv.append(div);
			}else{
				var div = $("<div>").attr("class","text-start ms-2");
				var table = $("<table>").attr("class","mb-2");
				var tbody = $("<tbody>");
				var tr1 = $("<tr>");
				var td1 = $("<td>").attr("rowspan","2");
				var img = $("<img>");
				if(data.attachment==null){
					img.attr("src","${pageContext.request.contextPath}/images/basic-profile.png")
					.attr("class","img-circle").attr("width","45").attr("height","45");
				}else{
					img.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.attachmentNo)
					.attr("class","img-circle").attr("width","45").attr("height","45");
				}
				td1.append(img);
				var td2 = $("<td>");
				var nick = $("<span>").text(data.memberNick).attr("style","font-size:14px;");
				td2.append(nick);
				var td3 = $("<td>").attr("rowspan","2");
				tr1.append(td1).append(td2).append(td3);
				
				var tr2 = $("<tr>");
				var td4 = $("<td>");
				var text;
				if(data.imgAttachmentNo==null){
					text = $("<span>").attr("class","message").text(data.chatContent);
				}else{
					text = $("<img>").attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+data.imgAttachmentNo)
							.attr("width","100").attr("height","100").attr("class","cursor-zoomin");
				}
				var formatTime = moment(data.chatDate).format('a h:mm');
				var time = $("<span>").attr("style","font-size:10px;").text(formatTime).attr("class","align-bottom me-1");
				td4.append(text).append(time);
				tr2.append(td4);
				
				tbody.append(tr1).append(tr2);
				table.append(tbody);
				div.append(table);
				chatDiv.append(div);
			}
			//이미지 확대
			zoomin();
		}
		
		
	});
</script>

<div class = "container-fluid mt-3">
	<div class = "col-10 offset-1">

		<div class = "row">
			<!-- 프로필 박스 시작-->
			<div class = "col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_profile.jsp"></jsp:include>
			</div>
			<!-- 프로필 박스 끝-->
			
			<!-- 채팅 박스 시작 -->
			<div class = "col-6">
				<div class = "col">
					<div class="chat-box p-3 shadow-lg">
						<!-- 기존 메세지 생성 -->
						<div class="date-print text-center">
							<span class="date-font">
								<fmt:formatDate value="${history.get(0).chatDate}" pattern="yyyy년 M월 d일 E요일"/>
							</span>
						</div>
						<c:forEach var="vo" items="${history}">
							<c:choose>
								<c:when test="${profile.userNo==vo.userNo}">
									<div class="text-end me-2 mb-3">
										<span style="font-size:10px;" class="align-bottom me-1">
											<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
										</span>
										<c:choose>
											<c:when test="${vo.imgAttachmentNo==0}">
												<span class="message2">${vo.chatContent}</span>
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.imgAttachmentNo}" width="100" height="100" class="cursor-zoomin">
											</c:otherwise>
										</c:choose>
									</div>
								</c:when>
								<c:otherwise>
									<div class="text-start ms-2">
										<table class="mb-2">
											<tbody>
												<tr>
													<td rowspan="2" class="align-top">
														<c:choose>
															<c:when test="${vo.attachmentNo==0}">
																<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid img-circle origin-img" width="45" height="45">
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" class="img-circle" width="45" height="45">
															</c:otherwise>
														</c:choose>
													</td>
													<td><span style="font-size:14px;">${vo.memberNick}</span></td>
													<td rowspan="2"></td>
												</tr>
												<tr>
													<td>
														<c:choose>
															<c:when test="${vo.imgAttachmentNo==0}">
																<span class="message">${vo.chatContent}</span>
															</c:when>
															<c:otherwise>
																<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.imgAttachmentNo}" class="img-css cursor-zoomin">
															</c:otherwise>
														</c:choose>
														<span style="font-size:10px;" class="align-bottom ms-1">
															<fmt:formatDate value="${vo.chatDate}" pattern="a h:mm"/>
														</span>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<!-- 새 메세지 생성 -->
						<div class="new-chat" style="margin-right:10px;"></div>
					</div>
					
					<div class="chat-submit  justify-content-center rounded-bottom shadow-lg" style="display:flex; align-items:center">
						<i class="fa-regular fa-image me-1 cursor-pointer"></i>
						<input type="file" style="display:none;" class="chat-img" accept=".jpg, .png, .gif">
						<input type="text" id="chat-input" class="me-1 ms-1" >
						<button class="btn btn-primary ms-1" id="send-btn" type="button"><i class="fa-solid fa-paper-plane"></i></button>
					</div>
				</div>
			</div>
			
			<!-- 방번호, 회원번호-->
			<input type="hidden" name="roomNo" value="${history[0].roomNo}">
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
		
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>