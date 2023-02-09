<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<jsp:include page="/WEB-INF/views/template/admin_header.jsp">
   <jsp:param value="������ ����" name="title"/>
</jsp:include>

<style>
	.statistics-number {
		font-size: 23px;
		font-weight: bold;
	}
	
	.statistics-font {
	    font-size: 12px;
	    font-weight: bold;
	}
	
	.img-dang-admin-main {
		aspect-ratio : 11/3;
		border-radius : 10px;
	}
</style>

<!--��� ���� ����-->
<div class="container-fluid">

   	 <div class="row mt-2">
    	<div class="col d-flex align-items-center justify-content-center">
      		<img src="${pageContext.request.contextPath}/images/img-admin-page-main.jpg" class="img-dang-admin-main">
    	</div>
  	</div>

    <div class="row mt-4 offset-md-1">
       
    </div>
    <div class="row mt-4 offset-1 mb-5">
    	 <div class="col-2 shadow  ms-3 me-4">
            <div class="row">
                <div class="col-7 mt-3">
                    <p class="statistics-font">�ְ� ����� ��</p>
                    <p class="statistics-number ms-2">${recentLogin}</p>
                </div>
                <div class="col">
                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-growth-graph.png" width="100%;"
                        height="70%;">
                </div>
            </div>
        </div>
        <div class="col-2 shadow ms-5 me-5">
            <div class="row">
                <div class="col-7 mt-3">
                    <p class="statistics-font">�ְ� ����� ���� ��</p>
                    <p class="statistics-number ms-2">${recentDang}</p>
                </div>
                <div class="col">
                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-gathering.png" width="100%;" height="70%;">
                </div>
            </div>
        </div>
        <div class="col-2 shadow ms-5 me-5">
            <div class="row">
                <div class="col-7 mt-3">
                    <p class="statistics-font">�ְ� ���� ���� ��</p>
                    <p class="statistics-number ms-2">${recentSchdule}</p>
                </div>
                <div class="col">
                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim_icon-schedule.png" width="100%;" height="70%;">
                </div>
            </div>
        </div>
        <div class="col-2 shadow ms-4 me-5">
            <div class="row">
                <div class="col-7 mt-3">
                    <p class="statistics-font">7�ϰ� ������ ��</p>
                    <p class="statistics-number ms-2">${recentJoin}</p>
                </div>
                <div class="col">
                    <img class="mt-3" src="${pageContext.request.contextPath}/images/admim-icon-user-profile.png" width="100%;"
                        height="70%;">
                </div>
            </div>
        </div>
    	
        <div class="col-md-5 shadow ms-3 me-3 mt-3">
        	<h5 class="mt-3 mb-3 text-center">������ �̿���Ȳ</h5>
            <canvas id="regionChart" width="300" height="186"></canvas>
        </div>
        <div class="col-md-5 shadow ms-1 me-1 mt-3">
        	<h5 class="mt-3 mb-3 text-center">�Ű� ���</h5>
        </div>
    </div>
</div>

<script>
	
	$(function(){
		
		var labelList = new Array();//��ܿ� ���� ��� �迭
		var valueList = new Array();//������ ������ ��� �迭
		var colorList = new Array();//������ �������ֱ����� �迭
		    
	    $.ajax({//������ �̿���Ȳ ��ȸ �񵿱����
	        url: "${pageContext.request.contextPath}/admin/group_list",
	        method: "get",
	        contentType: "application/json",
	        success: function (resp) {
	        	//List �ݺ���
	        	for(var i = 0; i<resp.length; i++) {
	        		labelList.push(resp[i].dangArea);//�󺧹迭�� �о�ֱ�
	        		valueList.push(resp[i].cnt);//����迭�� �о�ֱ�
	        		colorList.push(colorize());//����迭�� �о�ֱ�
	        	}

	        	var data = {
	    				labels: labelList,//��
	    				datasets: [{
	    						backgroundColor: colorList,
	    						data : valueList
	    				}],
	    				options : {
	    						title : {
	    						display : true,
	    						text: 'regionChart'
	    						}
	    				}
	   				 };

	        	var ctx = document.getElementById('regionChart').getContext('2d');
	        	new Chart(ctx, {//��Ʈ ��ü ����
	        		      type: 'pie',
	        			  data: data
	        	});
	        	
	        
	        }
	    });
	    //���� rgb�� �������� �����ϴ� �Լ�
	    function colorize() {
	    	var r = Math.floor(Math.random()*200);
	    	var g = Math.floor(Math.random()*200);
	    	var b = Math.floor(Math.random()*200);
	    	var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
	    	return color;
	    }
	});
    
</script>