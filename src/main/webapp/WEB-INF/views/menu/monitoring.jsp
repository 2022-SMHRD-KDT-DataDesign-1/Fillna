<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
	width: 50vw;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

#qrcode>img{
	width: 23vw !important;
    height: 23vw !important;
}
.video{
    margin-bottom: 1.5vw;
    cursor: pointer;
    width: 35vw;
    height: 20vw;
    object-fit: cover;
}
.m_list>ul {
	overflow : auto;
}
.material-symbols-outlined{
	position : relative;
}
#qrcode>span:nth-child(1){
    font-size: 4vw;
    order: 1;
}
	</style>
</head>
<body class="bg">
    <div class="wrapper">
        <jsp:include page="../common/my.jsp"></jsp:include>
        <jsp:include page="../common/header1.jsp"></jsp:include>
        <div>
        <%
		  	  // 현재 날짜 가져오기
		  	  Calendar calendar = Calendar.getInstance();
		  	  
		  	  // 오늘 날짜로 설정
		  	  int year = calendar.get(Calendar.YEAR);
		  	  int month = calendar.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줌
		  	  int day = calendar.get(Calendar.DAY_OF_MONTH);
		  	  
		  	  // 7일 전의 날짜 계산
		  	  calendar.add(Calendar.DAY_OF_MONTH, -7);
		  	  int prevYear = calendar.get(Calendar.YEAR);
		  	  int prevMonth = calendar.get(Calendar.MONTH) + 1;
		  	  int prevDay = calendar.get(Calendar.DAY_OF_MONTH);
		  	  
		  	  // dateFormat
		  	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		  	  
		  	  String startDate = prevYear+"-"+prevMonth+"-"+prevDay;
		  	  String endDate = year+"-"+month+"-"+day;
        %>
        <input type='hidden' value='<%=endDate %>' id='endDate'>
    	<input type='hidden' value='<%=startDate %>' id='startDate'>
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

<%--                     <div class="monitoring_wrap">
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
                                        <video class="video" poster onclick="location.href='${contextPath}/resources/video/vomiting2.mp4';">
                                        	<source src="${contextPath}/resources/video/vomiting2.mp4" type="video/mp4">
                                        </video>
                                        <p>14:11</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div> --%>
                </div>
            </div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
	<div id="modal">
		<div class="modal-content">
			<div id="qrcode">
				<span>QR코드를 찍어주세요!</span>
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
    		
	        $(document).on("click",".rec_date", function(){
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
	        //load_week();
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
        
        $(document).on("click","#modal",function(){
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
    		var startDate = $("#startDate").val();
    		var endDate = $("#endDate").val();
    		
    		$.ajax({
    			url : "recording/direct/all",
    			type : "post",
    			data : {"startDate":startDate, "endDate":endDate},
    			dataType : "json",
    			success : record_list,
    			error : function(){alert("error2");}
    		});
    	}
    	
    	function record_list(data){
    		console.log(data);
    		var videoHtml = "";
    		
    		// date format 함수
    		function formatDate(date) {
    			  var year = date.getFullYear();
    			  var month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줌
    			  var day = date.getDate();
    			  if(month<10){ month = '0'+month; }
    			  if(day<10){ day = '0'+day; }
    			  return year + "-" + month + "-" + day;
    		}

    		// 요일 출력 함수
    		function getDayOfWeek(date) {
    			  var daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    			  var dayOfWeekIndex = date.getDay();
    			  return daysOfWeek[dayOfWeekIndex];
    		}
    		
    		// 오늘 날짜
    		var today = new Date();
    		
    		for(var i = 0; i < 7; i++) {
    			var currentDate = new Date(today.getTime() - i * 24 * 60 * 60 * 1000);
    			var date = formatDate(currentDate);
    			var dayOfWeek = getDayOfWeek(currentDate);
    			
    			videoHtml += '<div class="monitoring_wrap">';
	    		videoHtml += '<div class="alarm_date rec_date">';
	    		videoHtml += '<img class="icon_check" src="resources/images/icon_check.png" alt="">';
	    		if(i == 0){
		    		videoHtml += '<span class="today">'+date.replace(/-/g,".")+'('+dayOfWeek+')- 오늘</span>';
		    		videoHtml += '<span class="material-symbols-outlined icon_up today">arrow_drop_up</span></div>';
		    		videoHtml += '<div class="m_list"><ul>';
	    		} else {
		    		videoHtml += '<span>'+date.replace(/-/g,".")+'('+dayOfWeek+')</span>';
		    		videoHtml += '<span class="material-symbols-outlined icon_up hide">arrow_drop_up</span></div>';
		    		videoHtml += '<div class="m_list hide"><ul>';
	    		}
	    		// 날짜가 일치할때만 데이터 출력
    			var cnt = 0;
	    		for(var j = 0; j < data.length; j++){
	    			if(date === data[j].recordingAt.split(" ")[0]){
	    				videoHtml += '<li><div>';
	    				videoHtml += '<video class="video" poster onclick="location.href=\''+'/controller'+data[j].recordingFile+'\'">';
	    				videoHtml += '<source src="/controller'+data[j].recordingFile+'" type="video/mp4"></video>';
	    				videoHtml += '</div>';
	    				videoHtml += '</li>';
	    				cnt += 1;
	    			} 
	    		}
	    		// 동영상 없을 경우
    			if(cnt == 0){
	    			videoHtml += '<li class="video_none">저장된 동영상이 없습니다.</li>';
    			}
	    		
    			videoHtml += '</ul></div></div>';
    			
    		}
    		$('.monitoring_bottom').append(videoHtml).trigger("create");
    	}
		
/*     	function record_list(data){
    		console.log(data);
    		var videoHtml = "";
    		var day = "";
    		var check = false;
			var checkday = ['2023-06-08','2023-06-07','2023-06-06','2023-06-05','2023-06-04','2023-06-03','2023-06-02'];
			var videoHtml_list = [];
			//실시간
			//getCurrentWeek().forEach(function(day,idx,array){
			//	checkday.push(day.split(" ")[0]);
			//})
			data.push(data[0]);
			var first_el = true;
			$.each(data,function(idx,val){
				var today = val.recordingAt.split(" ")[0];
				if(day != today){
					if(check){
						videoHtml += "</ul></div>";
						videoHtml_list.push(videoHtml+"+"+today);
						videoHtml = "";
						if(idx === data.length-1){
							return false;
						}
					}
					day = today;
					if(first_el){
						videoHtml += '<div class="m_list">';
						first_el = false;
					}else{
						videoHtml += '<div class="m_list hide">';
					}
					videoHtml += '<ul class="">';
				}
				videoHtml += '<li>';
				videoHtml += '<div>';
				videoHtml += '<video class="video" poster onclick="location.href=\''+'/controller'+val.recordingFile+'\'">';
				videoHtml += '<source src="/controller'+val.recordingFile+'" type="video/mp4">';
				videoHtml += '</video>';
				// videoHtml += '<p>14:11</p>';
				videoHtml += '</div>';
				videoHtml += '</li>';
				check = true;
			});
			for(var i = 7; i  > 0; i--){
				//var week = $('.monitoring_wrap:nth-child('+i+')>.alarm_date>span:nth-last-child(2)').text().slice(0,10).replace(/\./g,"-");
				var today = videoHtml_list[i-1].split("+")[1];
				for(var j = 7; j > 0; j--){
					if(checkday[j-1] === today){
						$('.monitoring_wrap:nth-last-child('+(j)+')').append(videoHtml_list[6-(j-1)].split("+")[0]).trigger("create");
					}
				}
			}
			for(var i = 1; i< 8; i++){
				if($('.monitoring_wrap:nth-last-child('+(8-i)+')>.m_list').length === 0){
					$('.monitoring_wrap:nth-last-child('+(8-i)+')').append("<p>저장된 동영상이 없습니다.</p>").trigger("create");
					
				}
				
			}
		} */
    	
    	
    	function getCurrentWeek() {
    		  var date = new Date();
    		  var offset = date.getTimezoneOffset() * 60000;
    		  var day = new Date(date.getTime() - offset);
    		  var result = [day.toISOString().slice(0, 10)+" "+day.getDay()];
    		  for (let i = 1; i < 7; i++) {
    		    day.setTime(day.getTime() - 86400000);
    		    result.push(day.toISOString().slice(0, 10)+" "+day.getDay());
    		  }
    		  return result;
    		}
    	
    	function getToday(){
    	    var date = new Date();
    	    var year = date.getFullYear();
    	    var month = ("0" + (1 + date.getMonth())).slice(-2);
    	    var day = ("0" + date.getDate()).slice(-2);

    	    return year +"-"+ month + "-"+ day;
    	}
    	
/*     	function load_week(){
    		const weekday = ['일','월','화','수','목','금','토'];
    		var week = getCurrentWeek();
    		var testWeek = ['2023-06-08 4','2023-06-07 3','2023-06-06 2','2023-06-05 1','2023-06-04 0','2023-06-03 6','2023-06-02 5'];
    		var weekHtml = "";
    		var today = getToday();
    		for(var i = 0; i<week.length;i++){
    			weekHtml += '<div class="monitoring_wrap">';
    			weekHtml += '<div class="alarm_date rec_date">';
    			weekHtml += '<img class="icon_check" src="resources/images/icon_check.png" alt="">';
    			if(week[i].split(" ")[0] === today){
    				weekHtml += '<span class="today">'+testWeek[i].split(" ")[0].replace(/-/g,".")+'('+weekday[testWeek[i].split(" ")[1]]+')';
    				weekHtml += ' - 오늘</span>';
    				weekHtml += '<span class="material-symbols-outlined icon_up today">';
    			}else{
    				weekHtml += '<span>'+testWeek[i].split(" ")[0].replace(/-/g,".")+'('+weekday[testWeek[i].split(" ")[1]]+')';
    				weekHtml += '</span>';
    				weekHtml += '<span class="material-symbols-outlined icon_up hide">';
    			}
    			weekHtml += 'arrow_drop_up</span></div></div>';
    		}
    		$('.monitoring_bottom').append(weekHtml).trigger("create");
    		
    	} */
    	
    	
    </script>
</body>
</html>