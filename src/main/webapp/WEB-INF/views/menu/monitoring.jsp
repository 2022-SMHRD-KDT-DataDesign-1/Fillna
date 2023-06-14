<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/reset.css">
    <link rel="stylesheet" href="resources/css/substyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/qrcode.js"></script>
	<style>
#modal {
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
  display: none;
}
.modal-content {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 70vh;
  margin: 15% auto;
  padding: 20px;
  width: 80%;
}


.close-modal{
    position: absolute;
    right: -2px;
    top: 4px;
    border: none;
    background: none;
    cursor: pointer;
}

#qrcode{
	background: #fff;
    border-radius: 2vw;
	padding: 3.5vw;
	position:relative;
	width: 60vw;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
}

#qrcode>img{
	width: 23vw !important;
    height: 23vw !important;
}
	</style>
</head>
<body class="bg">
    <div class="wrapper">
        <jsp:include page="../common/my.jsp"></jsp:include>
        <jsp:include page="../common/header1.jsp"></jsp:include>
        <div>
            <div class="con monitoring_con">
                <div class="monitoring_top">
                    <div>
<!--                         <a href="alarm">
                            <span>
                                최근 3일간 <span>긴급(1)/주의(5)</span> 알림 발생
                            </span>
                        </a> -->
                    </div>
                    <div onclick="location.href='cctv'" style="cursor:pointer;">
                        <span>실시간 모니터링 - CCTV1</span>
                        <div>
                            <span>LIVE</span>
                        </div>
                    </div>
                    <div id="open-modal">
                    	<a href="#">
                            <span class="material-symbols-outlined">
                                add_circle
                            </span>
                            <p>추가</p>
                    	</a>
                    </div>
                </div>
                <div class="monitoring_bottom">
                    <div>
                        <p>녹화영상 리스트</p>
                        <p>최대 7일간 보관됩니다. 중요한 영상은 다운로드 해주세요.</p>
                    </div>

                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span class="today">2023.06.01(목) - 오늘</span>
                            <span class="material-symbols-outlined icon_up today">
                                    arrow_drop_up
                            </span>
                        </div>
                        <div class="m_list">
                            <ul class="">
                                <li>
                                    <div>
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.30(수)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.21(월)</span>
                            <span class="material-symbols-outlined icon_up">
                                    arrow_drop_up
                            </span>
                        </div>
                        <div class="m_list">
                            <ul class="">
                                <li>
                                    <div>
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                	<div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                </div>
            </div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
	<div id="modal">
		<div class="modal-content">
			<div id="qrcode">
				<button id="close_btn" class="close-modal">
					<span class="material-symbols-outlined icon_close">
	                    close
	                </span>
				</button>			
			</div>
		</div>
	</div>
    <script>
    	$(document).ready(function(e) {
    		$("#monitoring_footer").toggleClass("this_menu");
    		
	        $(".rec_date").on("click", function(){
	            $(this).children(".icon_up").toggleClass("hide");
	            $(this).next().toggleClass("hide");
	        });
			
	        var typeNumber =4;
	        var errorCorrectionLevel = "L";
	        var qr = qrcode(typeNumber, errorCorrectionLevel);
	        qr.addData("https://www.naver.com");
	        qr.make();
	        $('#qrcode').append(qr.createImgTag());
	        
	        load_alarm_cnt();
	        load_record_list();
    	});
	        			
        $(document).on("click","#open-modal",function(){
        	$('#modal').css("display","block");        
        	$("#modal, body").css("overflow", "hidden");
        });
        
        $(document).on("click",".close-modal",function(){
        	$('#modal').css("display","none");
        	$("#modal, body").css("overflow", "");
        });
        
        function load_alarm_cnt(){
	    	$.ajax({
	    		url : "alarm/cnt/all",
	    		type : "get",
	    		dataType : "json",
	    		success : alarm_cnt,
	    		error : function(){alert("error1");}
	    	});
        }
    	
    	function alarm_cnt(data){
    		var war_cnt = 0;
    		var eg_cnt  = 0;
    		$.each(data, function(idx,val){
    			if(val.alarm_type === "긴급"){
    				eg_cnt = val.cnt
    			}else{
    				war_cnt = val.cnt
    			}
    		});
    		var cntHtml = '<a href="alarm">';  			
    		cntHtml += '<span> 최근 3일간 <span>긴급('+eg_cnt+')/주의('+ war_cnt +')';		
            cntHtml += '</span> 알림 발생</span>';
            cntHtml += '</a>';
    		$('.monitoring_top>div:nth-child(1)').html(cntHtml);
    	}
    	
    	function load_record_list(){
    		$.ajax({
    			url : "recording/all",
    			type : "get",
    			dataType : "json",
    			success : record_list,
    			error : function(){alert("error2");}
    		});
    	}
    	
    	function record_list(data){
    		console.log("성공");
    		console.log(data);
    	}
    </script>
</body>
</html>