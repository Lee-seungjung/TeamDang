<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%-- dang_header --%>
<jsp:include page="/WEB-INF/views/template/dang_header.jsp">
	<jsp:param value="댕모임 사진첩" name="title"/>
</jsp:include>

<style>
	.img-size>img{
		max-width:250px;
		max-height:150px;
		object-fit: cover;
		padding:10px 10px;
		border-radius: 20px;
	}
	.img-size{	
		background-color:white;
	}	
	.title-line{
	    width: 100%;
	    border-bottom: 2px solid #e7e7e7;
	    line-height: 0.1em;
	    margin: 10px 0 20px;
	    align-items: center
	}
	.title-font{
		font-size: 25px;
		text-align: center;
		font-weight: 500;
		background: #fff;
    	padding: 0 100px;
	}
	
	.fa-face-frown-open{
		font-size:30px;
	}
	.top-btn-div{
		position: fixed;
		cursor: pointer;
		top:88%;
		left:94%;
		color:#76BEFF;
		display:none;
	}
	.zoomin-img>img{
		max-width:800px;
	}
	.body-content{
		min-height:800px;
	}

	
</style>



<div class = "container-fluid mt-3 mb-5 body-wrapper">

	<div class = "col-10 offset-1 body-content">
		<div class="image-group mb-5" >
			<!-- 이미지 불러오기 -->
			<c:choose>
				<c:when test="${imgList.size()==0}">
					<div class="mt-5 text-center">
						<p class="title-line">
							<span class="title-font font-gray">등록된 이미지가 없습니다
								<i class="fa-regular fa-face-frown-open blue"></i>
							</span>
						</p>
					</div>
				</c:when>
				<c:otherwise>
					<div class="mt-5 text-center">
						<p class="title-line">
							<span class="title-font font-gray">댕모임 사진 몰아보기</span>
						</p>
					</div>
					
					<div class="img-size mt-5 text-center" data-checkno="">
						<c:forEach var="vo" items="${imgList}">
							<img src="${pageContext.request.contextPath}/rest_attachment/download/${vo.attachmentNo}"
										data-attachno="${vo.attachmentNo}" class="img-tag cursor-zoomin">
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
			
			<c:if test="${imgList.size()!=0}">
				<div class="text-center mt-4 mb-5 more-view-div">
					<button type="button" class="btn btn-outline-primary p-2 more-btn" style="width:20%; font-size:15px;">더보기</button>
				</div>
			</c:if>	
		</div>
	</div>

	<!-- 위로 올라가기 버튼 -->
	<div class="top-btn-div text-end">
		<i class="fa-solid fa-circle-up fa-3x"></i>
	</div>
	
	<!-- 이미지 확대 -->
	<div class="zoomin">
		<div class="zoomin-img">
			<!-- 확대 이미지 코드-->
		</div>
	</div>
	
	<input type="hidden" name="dangNo" value="${dangNo}">
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</div>


<script>
	$(function(){
		zoomin(); //이미지 확대
		
		var dangNo = $("[name=dangNo]").val();
		var attachmentNo = $(".img-tag").last().data("attachno");

		//무한스크롤
		$(document).on("scroll",function(){
			var scrollHeight = document.documentElement.scrollTop; //스크롤 현재 높이
			
			if(scrollHeight>150){
				$(".top-btn-div").show();
			}else{
				$(".top-btn-div").hide();
			}
			
		});
		
		//상단으로 이동 버튼
		$(".fa-circle-up").click(function(){
			$("html").scrollTop(0);
		});
	
		$(document).on("click",".more-btn",function(){
			var checkno = $(".img-size").attr("data-checkno");
			
			if(checkno==1) return; //불러올 자료 없을 경우 ajax 중지
			
			imgData={
					dangNo:dangNo,
					attachmentNo:attachmentNo
			}
			$.ajax({
				url:"${pageContext.request.contextPath}/rest_board/img_list",
				method:"get",
				data:imgData,
				async:false,
				success:function(resp){
					
					for(var i=0; i<resp.length; i++){
						imgTagCreat(resp[i]);
					}
					
					if(resp.length<10){
						$(".img-size").attr("data-checkno",1);
						$(".more-view-div").hide();//더보기 버튼 안보이게 처리
					}
				}
			});
		});
		
		//이미지 확대창 클릭 시 닫기
		$(".zoomin").click(function (e) {
		    $(".zoomin").toggle();
		});

		//이미지 태그 생성
		function imgTagCreat(resp){
			var div = $(".img-size");
			var img = $("<img>").attr("class","img-tag cursor-zoomin").attr("data-attachno",resp.attachmentNo)
			.attr("src","${pageContext.request.contextPath}/rest_attachment/download/"+resp.attachmentNo);
			div.append(img);
		}
		
		//채팅 이미지 확대
		function zoomin(){
			$(document).on("click",".cursor-zoomin",function(){
				var src = $(this).attr("src");
				var img = $("<img>").attr("src",src);
				$(".zoomin-img").html(img);
				$(".zoomin").show();
			});
		}

	});
</script>