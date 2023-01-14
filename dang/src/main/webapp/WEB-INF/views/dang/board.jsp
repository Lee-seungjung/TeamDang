<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 게시판" name="title"/>
</jsp:include>

<style>
	.board-box{
		border:1px solid #E7E7E7;
		width:650px;
		height:auto;
		margin:0 auto;
		padding:20px;
	}
	.nick-font{
		font-weight:bolder;
		font-size:20px;
	}
	.re-nick-font{
		font-weight:bolder;
		font-size:16px;
	}
	.date-font{
		font-size:13px;
		color:#6F6F6F;
	}
	.re-date-font{
		font-size:11px;
		color:#6F6F6F;
	}
	.fa-ellipsis-vertical{
		font-size:25px;
	}
	.content-font{
		font-size:15px;
	}
	.re-content-font{
		font-size:13px;
	}
	.full-heart{
		display:none;
	}
	.content-div1{
		background-color:#DEEFFF;
		padding:7px;
		border-radius: 0.3rem;
	}
	.content-div2{
		background-color:#EBEBEB;
		padding:7px;
		border-radius: 0.3rem;
	}
	.re-more-view{
		font-size:14px;
	}
	.reply-box{
		display:none;
	}
	.btn-blue{
		border:1px solid #fff;
		background-color:#76BEFF;
		color:#fff;
	}
	.category-css:hover {
	  	color: #495057;
	 	background-color: #DEEFFF;
	  	border-color: #DEEFFF;
	}
	.dropdown-menu{
		width: 50%;
		min-width: 4rem;
		
	}
	.dropdown-item{
		font-size: 0.8rem;
	}
	.dropdown-item:hover{
		background-color:#EBEBEB;
		color:#495057;
	}
	.content-font{
		white-space:pre-wrap;
		word-wrap: break-word;
		word-break: break-word;
	}

</style>

<script>
	$(function(){
		
		printImg(); //게시글 사진 출력
		originLike() //좋아요 출력

		//카테고리 색상변경
		$(".category").click(function(){
			var category = $(".category");	
			category.removeClass("btn-blue");
			$(this).addClass("btn-blue");
		});
		
		//엔터키 이벤트
		$("[name=keyword]").on("keyup",function(key){
			var inputText = $("[name=keyword]").val();
	        if(inputText!=undefined && key.keyCode==13) {            
		        //검색조회 비동기 필요
	        }
	    });
		
		//게시글 수정 첫 화면 기본셋팅
		$(".edit-drop").click(function(){
			$("#boardEditModal").modal("show");
			//원본데이터 출력준비
			var boardContent = $(this).parents(".first-line").next().find(".content-font").text();
			var boardCategory = $(this).parents(".first-line").next().next().next().children(".col-7").children().text();
			var boardNo = $(this).parent().data("bno");
			//원본데이터 출력
			$("#edit-category").val(boardCategory).prop("selected", true);
			$("#edit-content").val(boardContent);
			$(".edit-btn").attr("data-no",boardNo);
			$("#edit-select-file").val("");
			$("#edit-file-wrap").empty();
	
			$.ajax({
				url:"http://localhost:8888/rest_board/find_img/"+boardNo,
				method:"get",
				async:false,
				success:function(resp){
					console.log(resp);
					
					var fileDiv = $("#edit-file-wrap");
	               	for(var i=0; i<resp.length; i++){
	                   	var url = "${pageContext.request.contextPath}/rest_attachment/download/"+resp[i].attachmentNo;
	               		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
	               		var img = $("<img>").attr("src",url).attr("class","img-fluid file1")
	               						.attr("style","width:70px; height:70px;").attr("data-no",resp[i].attachmentNo);
	               		var x = $("<p>").text("x").attr("class","text-center x-btn cursor-pointer").attr("style","margin-top:-5px;");
						div.append(img).append(x);
						fileDiv.append(div);
	               	}
	               	$(".x-btn").click(function(){
                		var thistag = $(this);
                		xBtn(thistag);
        			});
				}
			});
		});
		
		//입력 항목 상태 판정
		eCheck={
				boardContent : true, 
				boardCategory : false,
				allValid:function(){
					return this.boardContent && this.boardCategory;
				}
		};
		
		//카테고리 선택 검사
		$("#edit-category").on("change",function(){
			var value = $(this).val();
			if(value==""){
				eCheck.boardCategory=false;
			}else{
				eCheck.boardCategory=true;
			}
		});
		
		//입력창 글자수 확인(최대 1000자)
		$("#edit-content").on("input",function(){
			var length = $(this).val().length; //글자수
			var value = $(this).val(); //입력내용
			//글자수 표시
			$(".be-length").text(length);
			console.log(value);
			$(this).removeClass("is-invalid");
			if(length==0){
				$(".be-length").css("color","#495057");
				eCheck.boardContent=true;
			}else if(length>1000){
				$(this).val(value.substring(0,1001));	
				$(".be-length").css("color","red").text(1000);
				eCheck.boardContent=false;
				$(this).addClass("is-invalid");
			}else if(length>0){
				$(".be-length").css("color","#495057");
				eCheck.boardContent=true;
			}
		});
		
		//파일 선택
		$("#edit-select-file").change(function(e){
			var value = $(this).val(); //파일위치+파일명
			console.log(this.files); //파일 배열
			if(this.files.length>0){ //파일 있음
				var formData = new FormData();
			
				for(var i=0; i<this.files.length; i++){
					formData.append("attachment", this.files[i]);
				}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_attachment/upload2",
					method:"post",
					data:formData,
					processData:false, 
                    contentType:false,
                    async:false,
                    success:function(resp){
                    	console.log("등록성공!");
                    	console.log(resp);
                    	
                    	var fileDiv = $("#edit-file-wrap");
                    	for(var i=0; i<resp.url.length; i++){
                    		console.log(resp.url[i]);
                    		var check = resp.url[i].lastIndexOf("/"); //경로에서 /위치 찾기
                        	var attachmentNo = resp.url[i].substr(check+1); //attachmentNo 꺼내기
                        	
                    		var div = $("<div>").attr("class","form-control col-1 inbl w-auto file-div me-1");
                    		var img = $("<img>").attr("src",resp.url[i]).attr("class","img-fluid files file1")
                    						.attr("style","width:70px; height:70px;").attr("data-no",attachmentNo);
                    		var x = $("<p>").text("x").attr("class","text-center x-btn cursor-pointer").attr("style","margin-top:-5px;");
    						div.append(img).append(x);
							fileDiv.append(div);
                    	}
                    	
                    	$(".x-btn").click(function(){
                    		var thistag = $(this);
                    		xBtn(thistag);
            			});

			        }
				});
			}
		});
		
		//폼 전송 이벤트
		$(".board-edit-form").submit(function(e){
			e.preventDefault();
			
			//강제실행
			$("#edit-category").change();
			
			console.log("수정!");
			console.log("콘텐츠 = "+eCheck.boardContent);
			console.log("카테고리 = "+eCheck.boardCategory);
			console.log("수정전체크 = "+eCheck.allValid());
			
			if(eCheck.allValid()){
				//수정 데이터 준비
				var boardNo = $(this).children(".modal-footer").children(".edit-btn").data("no");
				var boardContent = $("#edit-content").val();
				var boardCategory = $("#edit-category").val();
						
				editBoardData = {
					boardNo:boardNo,
					boardContent:boardContent,
					boardCategory:boardCategory
				}
						
				//게시글 DB등록
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/edit_board",
					method:"patch",
					data:JSON.stringify(editBoardData),
					contentType:"application/json",
					success:function(resp){
						console.log("수정성공!");
						//게시글 이미지 DB 등록
						var findtag = $(".files");
			        	var attachmentNo;
			        	if(findtag.length!=0){
			        		for(var i=0; i<findtag.length; i++){
				        		attachmentNo = findtag.eq(i).attr("data-no");
				        		
				        		data = {
				        				boardNo:boardNo,
				        				attachmentNo:attachmentNo
				        		}
				        		
				        		$.ajax({
				    				url:"${pageContext.request.contextPath}/rest_board/img_insert/",
				    				method:"post",
				    				data:JSON.stringify(data),
				    				async:false,
									contentType:"application/json",
				    				success:function(resp){
				    					console.log("이미지 저장성공!");
			
				    				}
				    			});
				        	}
			        	}
			        	
			        	//원본게시글에 수정내용 찍어주기
    					var selectTag = $(".img-check[data-no="+boardNo+"]");
    					var div = selectTag.parent();
    					var contentTag = selectTag.parent().prev().children();
    					var categoryTag = selectTag.parent().parent().next().next().children('.col-7').children();
    					contentTag.text(boardContent);
    					categoryTag.text(boardCategory);
    					console.log(categoryTag);
    					
    					selectTag.remove(); //img태그 지움

						$.ajax({
							url:"http://localhost:8888/rest_board/find_img/"+boardNo,
							method:"get",
							async:false,
							success:function(resp){
								var img = $("<img>").
   								attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp[0].attachmentNo)
   								.attr("class","img-fluid img-check").attr("data-no",boardNo);
								
								div.prepend(img);
							}
						});
			        	
						$("#boardEditModal").modal('hide');
					}
				});
			}
		});
		
		
		
		//게시글 삭제
		$(".delete-drop").click(function(){
			//작성자와 삭제실행자 일치여부 확인
			//(닉네임 변경 가능성 있으므로 member_no로 확인)
			var writer = $(this).parent().data("mno"); //작성자
			var boardNo = $(this).parent().data("bno"); //글번호
			var memberNo = $("[name=memberNo]").val(); //실행자

			if(writer!=memberNo){
				alert('작성자가 일치하지 않습니다! 삭제불가능!');
			}else{
				boardDeleteAttachmentAll(boardNo);
				$(this).parents(".board-box").remove();
				//삭제 ajax 실행
				$.ajax({
					url:"${pageContext.request.contextPath}/rest_board/delete/"+boardNo,
					method:"delete",
					success:function(resp){
						
					}
				});
			}
			
		});
		
		function replyList(thisTag,boardNo){
			//댓글출력
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_reply/list/"+boardNo,
				method:"get",
				data:boardNo,
				success:function(resp){
					
					for(var i=0; i<resp.length; i++){
						<!-- 댓글 목록 -->	
						replyRepeat(resp[i], thisTag);
					}
					
					<!-- 5개 이상일 경우 더보기 보이게 처리 -->
					if(resp.length>=5){
						var more = $("<div>").attr("class","row mt-3 re-more-view");
						var ptag = $("<p>").attr("class","text-center").attr("data-no",resp[0].boardNo).text("+ 더보기");
						more.append(ptag);
						thisTag.append(more);
					}
					
					<!-- 댓글 입력창 -->	
					inputReply(thisTag);
				}
			});
		}

		//댓글창 토글
		$(".toggle-btn").click(function(){
			var thisTag = $(this).parent().next(); //reply-box
			$(".reply-box").attr("style","display:none;");
			$(".reply-box").empty();
			thisTag.toggle();

			var style = thisTag.attr("style");
			if(style=="display: block;"){ //댓글div 열림
				var boardNo = $(this).data("no");
			
				var hr = $("<hr>");
				thisTag.append(hr);
				
				//목록 출력
				replyList(thisTag,boardNo);
				
			}else{ //댓글div 닫힘
				thisTag.empty();
			}
		});
		
		//좋아요 버튼 이벤트
		$(".like-btn").click(function(){
			var thistag = $(this);
			var type = thistag.children('.islike').data("type");
			if(type==undefined||type==null){
				type=1;
			}else{
				type=2;
			}
			
			var memberNo = $("[name=memberNo]").val();
			var boardNo = $(this).prev().data("no");
			
			data = {
					memberNo:memberNo,
					boardNo:boardNo
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/update_like/"+boardNo+"/"+type,
				method:"patch",
				contentType:"application/json",
				success:function(resp){
					var number = thistag.children('.islike').text();
					if(type==1){
						thistag.children('.full-heart').show();
						thistag.children('.empty-heart').hide();
						if(number==""){
							number = 0;
						}else{
							number = parseInt(thistag.children('.islike').text());
						}
						thistag.children('.islike').text(number+1);
						thistag.children('.islike').data("type",1);
						
						//좋아요 테이블 DB 등록
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/like_insert",
							method:"post",
							async:false,
							data:JSON.stringify(data),
							contentType:"application/json",
							success:function(resp){

							}
						});
					}else{
						thistag.children('.full-heart').hide();
						thistag.children('.empty-heart').show();
						
						var number = parseInt(thistag.children('.islike').text());
						var checknumber = number-1<=0;
						if(checknumber){
							thistag.children('.islike').text("");
						}else{
							thistag.children('.islike').text(number-1);
						}
						thistag.children('.islike').data("type",null);

						//좋아요 테이블 DB 삭제
						$.ajax({
							url:"${pageContext.request.contextPath}/rest_board/delete_like",
							method:"delete",
							data:JSON.stringify(data),
							async:false,
							contentType:"application/json",
							success:function(resp){								
							}
						});						
					}
				}
			});			
		});
		
		//수정 전 게시글 내 첨부파일 삭제
		function xBtn(thistag){
			var attachmentNo = thistag.prev().data("no");
			var div = thistag.parent().remove();
			console.log(attachmentNo);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
				method:"delete",
				data:attachmentNo,
				async:false,
				success:function(resp){
				}
			});
		}
		
		//게시글 삭제 시 첨부파일 삭제
		function boardDeleteAttachmentAll(boardNo){
			$.ajax({
				url:"http://localhost:8888/rest_board/find_img/"+boardNo,
				method:"get",
				async:false,
				success:function(resp){
					for(var i=0; i<resp.length; i++){
						var attachmentNo = resp[i].attachmentNo;
		        		$.ajax({
		    				url:"${pageContext.request.contextPath}/rest_attachment/delete/"+attachmentNo,
		    				method:"delete",
		    				data:attachmentNo,
		    				async:false,
		    				success:function(resp){
		    				}
		    			});
		        	}
				}
			});
		}
		
		//기존 좋아요 목록 출력
		function originLike(){
			var memberNo = $("[name=memberNo]").val();
			$.ajax({
				url:"http://localhost:8888/rest_board/fint_like/"+memberNo,
				method:"get",
				data:memberNo,
				success:function(resp){
					for(var i=0; i<resp.length; i++){
						var tag = $(".islike[data-like="+resp[i].boardNo+"]");
						tag.attr("data-type",1);
						tag.siblings('.full-heart').show();
						tag.siblings('.empty-heart').hide();
					}
				}
			});
		}

		//댓글 목록
		function replyRepeat(resp, thisTag){
			//본인 비교 위해 데이터 준비
			var memberNo = $("[name=memberNo]").val();
			var replyBox = thisTag;
			
			var replyContent = $("<div>").attr("class","reply-content d-flex mb-2");
			
			var col1 = $("<div>").attr("class","col-1 middle-items");
			var img = $("<img>");
			if(resp.attachmentNo!=null){
				img = img.attr("class","img-fluid img-circle").attr("style","width:50px; height:50px;")
						.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			}else{
				img = img.attr("class","img-fluid img-circle").attr("src","${pageContext.request.contextPath}/images/basic-profile.png");
			}
			col1.append(img);
			
			var col8 = $("<div>").attr("class","col-8 middle-items ms-3");
			var contentDiv = $("<div>");
			if(memberNo!=resp.memberNo){
				contentDiv.attr("class","col content-div2");
			}else{
				contentDiv.attr("class","col content-div1");
			}
			var p1 = $("<p>").attr("class","middle-items");
			var span1 = $("<span>").attr("class","re-nick-font").text(resp.memberNick);
			var span2 = $("<span>").attr("class","re-date-font ms-2").text(resp.replyWriteDate);
			p1.append(span1).append(span2);
			var p2 = $("<p>").attr("class","re-content-font middle-items text-start").text(resp.replyContent);
			contentDiv.append(p1).append(p2);
			col8.append(contentDiv);
			
			var col3 = $("<div>").attr("class","col-3 justify-content-end middle-items");
			if(memberNo==resp.memberNo){
				var div1 = $("<div>").attr("class","dropdown inbl w-auto");
				var span1  = $("<span>").attr("data-bs-toggle","dropdown").attr("role","button")
									.attr("aria-haspopup","true").attr("aria-expanded","false");	
				var i = $("<i>").attr("class","fa-solid fa-ellipsis-vertical me-3");
				span1.append(i);
				
				var div2 = $("<div>").attr("class","dropdown-menu").attr("data-bno",resp.boardNo).attr("data-mno",memberNo);
				var span2 =  $("<span>").attr("class","dropdown-item reply-edit cursor-pointer").text("수정");	
				var span3 =  $("<span>").attr("class","dropdown-item reply-delete cursor-pointer").text("삭제");	
				div2.append(span2).append(span3);
				
				div1.append(span1).append(div2);
				col3.append(div1);
			}
			replyContent.append(col1).append(col8).append(col3);
			replyBox.append(replyContent);
		}
			
		//댓글 입력
		function inputReply(thisTag){	
			var replyBox = thisTag;
			var form = $("<form>").attr("class","input-reply-form");
			var inputReply = $("<div>").attr("class","row input-reply mt-3");
			var col10 =  $("<div>").attr("class","col-10");
			var input1 = $("<input>").attr("class","input form-control ms-2 reply-input").attr("type","text").attr("placeholder","댓글을 달아주세요");
			col10.append(input1);
			
			var col2 =  $("<div>").attr("class","col-2");
			var button1 = $("<button>").attr("class","btn btn-primary me-2 reply-write")
								.attr("type","submit").text("전송");
			col2.append(button1);
			inputReply.append(col10).append(col2);
			form.append(inputReply);
			replyBox.append(form);
			$(".reply-write").attr("disabled",true);
			
			//나중에 함수 따로 빼기! function sendReply()
			//댓글 입력
			$(".reply-input").on("input",function(){
				var value = $(this).val();
				console.log(value.length);
				$(this).removeClass("is-invalid");
				if(value.length==0){
					$(".reply-write").attr("disabled",true);
				}else if(value.length>100){
					$(".reply-write").attr("disabled",true);
					$(this).addClass("is-invalid");
					$(this).val(value.substring(0,101));
				}else if(value.length>0){
					$(".reply-write").attr("disabled",false);
				}
			});
			
			$(".input-reply-form").submit(function(e){
				e.preventDefault();
				
				var formtag = $(this); //form
				var inputCheck = $(".reply-input").val();
				var thisTag = $(this).parent(); //reply-box

				if(inputCheck.length!=0){
					//댓글 DB저장 데이터 준비
					var boardNo = $(this).parents(".reply-box").siblings('.third-line').children().data("no");
					console.log(boardNo);
					var memberNo = $("[name=memberNo]").val();
					var memberNick = $("[name=memberNick]").val();
					var replyContent = inputCheck;
					
					replyData = {
							boardNo:boardNo,
							memberNo:memberNo,
							memberNick:memberNick,
							replyContent:replyContent							
					}
					
					$.ajax({
						url:"http://localhost:8888/rest_reply/insert",
						method:"post",
						data:JSON.stringify(replyData),
						contentType:"application/json",
						success:function(resp){
							console.log("댓글 등록성공!");
							//목록 출력
							thisTag.empty();
							var hr = $("<hr>");
							thisTag.append(hr);
							
							replyList(thisTag,boardNo);
							
							//댓글 숫자 증가
							var findnum = thisTag.prev().children().children('.replycnt');
							console.log(findnum);
							var num = findnum.text();
							console.log(num);
							if(num==""){
								num = parseInt(0);
							}else{
								num = parseInt(num);
							}
							console.log(num);
							findnum.text(num+1);
						}
					});
				}
			});
		}
		
		//파일번호 있는 게시글 확인 후 출력
		function printImg(){
			var check = $(".img-check");

			if(check!=0){ //첨부파일 게시글이 있을때만 실행!
				for(var i=0; i<check.length; i++){
					var boardNo = check.eq(i).data("no");
					var thistag = check.eq(i);

					$.ajax({
						url:"http://localhost:8888/rest_board/find_img/"+boardNo,
						method:"get",
						async:false,
						success:function(resp){
							thistag.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp[0].attachmentNo);
							
							//나중에 혹시 모르지만 스와이퍼를 위해 data-attach로 첨부파일 번호 넣어둠!
							if(resp.length>1){
								for(var i=0; i<resp.length; i++){
									thistag.attr("data-attach"+i,resp[i].attachmentNo);
								}
							}
						}
					});
				}
			}
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
			
			<div class = "col-6">
				<div class = "col">
					<!-- 검색바 시작 -->
					<div class="search-group text-center mt-3">
						<select class="form-select inbl w-auto me-1" name="type">
							<option>선택</option>
							<option value="memberNick">작성자</option>
							<option value="boardContent">내용</option>
						</select>
						<input type="text" class="input form-control inbl w-auto ms-1" size="40" name="keyword">
						<i class="fa-solid fa-magnifying-glass cursor-pointer" style=" margin-left:-30px; color:#a2c1f6;"></i>
				    </div>
				    <!-- 검색바 끝 -->
				    
				    <!-- #카테고리 시작 -->
				    <div class="category-group text-center mt-4">
						<a class="btn gray category-css rounded-pill me-1 category" data-value="정모후기">#정모후기</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="공지사항">#공지사항</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="가입인사">#가입인사</a>
						<a class="btn gray category-css rounded-pill me-1 category" data-value="자유글">#자유글</a>
						<a class="btn gray category-css rounded-pill me-1 category btn-blue">#전체</a>
				    </div>
				    <!-- #카테고리 끝 -->

				    <!-- 게시글 시작 -->
				    <div class="board-group text-center mt-4">
				    
				    	<c:forEach var="vo" items="${boardList}">
				    		<!-- 게시글 박스 시작 -->
							<div class="board-box shadow-sm mb-3">
								<div class="first-line d-flex">
									<div class="col-1">
										<c:choose>
											<c:when test="${vo.attachmentNo==null}">
												<img src="${pageContext.request.contextPath}/images/basic-profile.png" class="img-fluid img-circle">
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}" class="img-fluid img-circle" style="width:50px; height:50px;">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-7 middle-items ms-3">
										<span class="nick-font">${vo.memberNick}</span>
										<c:if test="${vo.memberOwner=='Y'}">
											<img src="${pageContext.request.contextPath}/images/crown.png" class="ms-1" width="25" height="25">
										</c:if>
									</div>
									<div class="col-4 justify-content-end middle-items">
										<span class="date-font me-4">
											<fmt:formatDate value="${vo.boardWriteDate}" pattern="yyyy.MM.dd a h:mm"/>
										</span>
										<c:if test="${vo.memberNo==profile.memberNo}">
											<div class="dropdown inbl w-auto">
												<span data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
													<i class="fa-solid fa-ellipsis-vertical me-3"></i>
												</span>
												<div class="dropdown-menu" data-bno="${vo.boardNo}" data-mno="${vo.memberNo}">
													<span class="dropdown-item edit-drop cursor-pointer" data-bs-toggle="modal" data-bs-target="#boardEditModal" data-bs-whatever="@mdo">수정</span>
													<span class="dropdown-item delete-drop cursor-pointer">삭제</span>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								
								<div class="second-line ms-3 me-3 mt-3 mb-4 d-flex" >
									<div class="col-9 text-start me-1">
										<span class="content-font d-inline-block text-truncate2">${vo.boardContent}</span>
									</div>
									<div class="col-3 middle-items">
										<c:if test="${vo.boardAttachmentCnt!=null}">
											<!-- 비동기로 사진 불러오기 스와이퍼 태그에 파일번호 data-no숨기기 -->
											<img src="#" class="img-fluid img-check" data-no="${vo.boardNo}">
											+<span style="font-size:13px;">${vo.boardAttachmentCnt-1}</span>
										</c:if>
									</div>
								</div>
								<hr>
								
								<div class="third-line d-flex ms-3 me-3">
									<div class="col-2 middle-items cursor-pointer toggle-btn" data-no="${vo.boardNo}">
										<i class="fa-regular fa-message mt-1 me-2"></i>
										<span class="me-1">댓글</span>
										<c:if test="${vo.replyCnt!=0}">
											<span class="blue replycnt" style="font-weight:bolder;">${vo.replyCnt}</span>
										</c:if>
									</div>
									<div class="col-3 middle-items cursor-pointer like-btn">
										<span class="me-2">좋아요</span>
										<i class="fa-regular fa-heart blue me-1 empty-heart"></i>
										<i class="fa-solid fa-heart blue me-1 full-heart"></i>
										<c:choose>
											<c:when test="${vo.boardLike!=0}">
												<span class="blue islike" style="font-weight:bolder;" data-like="${vo.boardNo}">${vo.boardLike}</span>
											</c:when>
											<c:otherwise>
												<span class="blue islike" style="font-weight:bolder;"></span>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-7 justify-content-end middle-items">
										<span>${vo.boardCategory}</span>
									</div>
								</div>
								
								<!-- 댓글 박스 시작 -->
								<div class="reply-box">
									<!-- 비동기 처리 -->	
								</div>
								<!-- 댓글 박스 끝 -->
								
							</div>
							<!-- 게시글 박스 끝 -->
					    	</c:forEach>
					    	
				    </div>
				    <!-- 게시글 끝 -->

				</div>
			</div>
			
			<!-- 다가오는 일정 박스 시작-->
			<div class="col-3">
				<jsp:include page="/WEB-INF/views/template/dang_side_upcoming.jsp"></jsp:include>
			</div>
			<!-- 다가오는 일정 박스  끝-->
			
			<input type="hidden" name="memberNo" value="${profile.memberNo}">

			<!-- 게시판 글수정 모달 시작-->					
			<div class="modal fade" id="boardEditModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">게시글 수정</h5>
						</div>
						<form class="form-tag board-edit-form">
						<div class="modal-body">
							
							<div class="mb-3 text-start">
								<label for="edit-category" class="col-form-label ms-2 me-1">카테고리</label><i class="fa-solid fa-asterisk text-danger"></i>
								<div>
									<select class="form-select form-select-sm inbl w-auto" aria-label=".form-select-sm example" name="boardCategory" id="edit-category">
									  <option value="">선택</option>
									  <option value="자유글">자유글</option>
									  <option value="가입인사">가입인사</option>
									  <option value="정모후기">정모후기</option>
									  <c:if test="${profile.memberOwner=='Y'}">
									  	<option value="공지사항">공지사항</option>
									  </c:if>
									</select>
								</div>
							</div>
							
							<div class="mb-3 text-start">
								<label for="message-text" class="col-form-label ms-2 me-1">내용</label>
								<span class="length-font">( </span>
								<span class="be-length length-font">0</span>
								<span class="length-font">/ 1000 )</span>
								<textarea name="boardContent" id="edit-content" class="form-control b-contentbox" rows="7" style="resize:none;"></textarea>
							</div>
							
							<div class="mb-3 text-start mt-2">
								<div>
									<input class="form-control" id="edit-select-file" type="file" accept=".jpg, .png, .gif" multiple>
							    </div>
							    <div class="mt-2" id="edit-file-wrap">
									<!-- 비동기화 출력 -->
							    </div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary write-cancel" data-bs-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary edit-btn">수정</button>
						</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 게시판 글수정 모달 끝-->
	
		</div>
	</div>
</div>