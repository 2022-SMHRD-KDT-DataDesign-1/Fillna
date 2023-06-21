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
	<style>
		.alarm_yn{
			display:none;
		}
	</style>
</head>
<body class="bg">
    <div class="wrapper">
    	<jsp:include page="../common/my.jsp"></jsp:include>
    	<jsp:include page="../common/header2.jsp"></jsp:include>

        <!-- content -->
        <div>
        <%
    	  // 현재 날짜 가져오기
    	  Calendar calendar = Calendar.getInstance();
    	  
    	  // 오늘 날짜로 설정
    	  int year = calendar.get(Calendar.YEAR);
    	  int month = calendar.get(Calendar.MONTH) + 1; // 월은 0부터 시작하므로 1을 더해줌
    	  int day = calendar.get(Calendar.DAY_OF_MONTH);
    	  
    	  // 20일 전의 날짜 계산
    	  calendar.add(Calendar.DAY_OF_MONTH, -20);
    	  int prevYear = calendar.get(Calendar.YEAR);
    	  int prevMonth = calendar.get(Calendar.MONTH) + 1;
    	  int prevDay = calendar.get(Calendar.DAY_OF_MONTH);
    	  
    	  // dateFormat
    	  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	  
    	  String startDate = prevYear+"-"+prevMonth+"-"+prevDay;
    	  String endDate = year+"-"+month+"-"+day;
    	  
    	%>
    	<input type='hidden' value='${vo.mbIdx}' id="mbIdx">
    	<input type='hidden' value='<%=endDate %>' id='endDate'>
    	<input type='hidden' value='<%=startDate %>' id='startDate'>
            <div class="con con_alarm">
            </div>
            <!-- bottom -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

    </div>
</div>
<script type= "text/javascript">
var cnt = 0;
var data_len = 0;
$(document).ready(function(e) {
		
	   
		load_alarm();
		$(".alarm_header").toggleClass("hide");

	    $(document).on("click",".alaram_list > li", function(e){
	    	console.log("click");
    		$(this).children(".icon_up").toggleClass("hide");
	    	$(this).next().toggleClass("hide");
	    });
	    

	    $(document).on("click",".btn_more", function(e){
	    	if(parseInt(data_len / 10) === 0){
		    	$(".alarm_wrap").slice(cnt,cnt+data_len).toggleClass("hide");
		    	$(this).toggleClass("hide");
		    }else{
		    	$(".alarm_wrap").slice(cnt,cnt+10).toggleClass("hide");
		    	data_len -= 10;
		    	cnt += 10;
		    }
	    });
	    
	});
	
/* C61A727500F311EE875C0242AC14000B */	
/* 알림 내용 데이터 가져오기 */
/* 
 * alarm_idx : 인덱스
 * mb_idx : 회원번호
   pet_name : 반려동물 이름
   alarm_type : 주의, 긴급 , 일지
   category_name : 행동
   cnt : 횟수
   alarm_content : 알림 내용  
   alarm_at : 시간
   alarm_week : 요일 
 */
function load_alarm(){
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
	var mbIdx = $("#mbIdx").val();
	//console.log(startDate+" "+endDate);
	
	$.ajax({
		url : "alarm/all-test",
		type : "post",
		data : {"startDate": startDate, "endDate": endDate, "mbIdx": mbIdx},
		dataType : "json",
		success : makeview,
		error : function(){alert("error");}
	})
};


function makeview(data){
	var list_html = "";
	
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
	
	for(var i = 0; i <= 20; i++) {
		  var currentDate = new Date(today.getTime() - i * 24 * 60 * 60 * 1000);
		  console.log("날짜: " + formatDate(currentDate));
		  console.log("요일: " + getDayOfWeek(currentDate));
		  
		  var date = formatDate(currentDate);
		  var dayOfWeek = getDayOfWeek(currentDate);
		  
		  
		  list_html += '<div class="alarm_wrap hide">';
		  list_html += '<div class="alarm_date">';
		  list_html += '<img class="icon_check" src="resources/images/icon_check.png" alt="">';
		  if(i==0){
			  list_html += '<span class="today">'+date.replace(/-/g,".")+'('+dayOfWeek+') - 오늘</span>';
		  } else {
			  list_html += '<span>'+date.replace(/-/g,".")+'('+dayOfWeek+')</span>';
		  }
		  list_html += '</div>';
		  list_html += '<div class="alaram_list_wrap">';
		  list_html += '<ul class="alaram_list">';
		  
		  
		  for(var j = 0; j < data.length; j++){
		  	list_html += '<li>';
		  	  // 날짜가 일치할때만 데이터 출력
  			  if(date == data[j].alarm_at.split(" ")[0]){
  				  console.log(data[j].alarm_at.split(" ")[0]);
  				  var time = data[j].alarm_at.split(" ")[1].slice(0, 5);
				  list_html += '<span>'+time+'</span>';
				  list_html += '<span class="material-symbols-outlined icon_circle';
					if(data[j].alarm_type === "일지"){
						list_html += ' green circle">';
					}else if(data[j].alarm_type === "주의"){
						list_html += ' yel circle">';
					}else{
						list_html += ' red circle">';
					}
					list_html += 'circle</span>';
					if(data[j].alarm_type != "일지"){
						list_html += '<span class="a_alarm_type">['+data[j].alarm_type +'] - '+data[j].category_name+' '+data[j].cnt +'회</span>';
					}else{
						list_html += '<span class="a_alarm_type">['+data[j].alarm_type +']</span>';
					}
					
					if(j==0){
						list_html += '<span class="material-symbols-outlined icon_up">arrow_drop_up</span></li>';
						list_html += '<div class="alarm_detail first_detail">';
					} else {
						list_html += '<span class="material-symbols-outlined icon_up hide">arrow_drop_up</span></li>';
						list_html += '<div class="alarm_detail hide">';
					}
					list_html += '<div class="alarm_title">';
					if(data[j].alarm_type != "일지"){
						list_html += '<span class="alarm_type">['+data[j].alarm_type+']</span>';
						list_html += ' '+data[j].pet_name+'가 '+ time+'분에 '+ data[j].category_name+'를 '+data[j].cnt +'회 하였습니다.</div>';
						list_html += '<div class="alarm_content">';
						list_html += data[j].alarm_content.replace(/\n/g,"<br>");
					}else{
						list_html += '<span class="alarm_type">['+data[j].alarm_type+'] </span>';
						var pet_name = data[j].alarm_content.split("+")
						list_html += pet_name[0].replace(/네로/g,data[j].pet_name).replace(/\n/g,"<br>");
						list_html += '</div>'
						list_html += '<div class="alarm_content">';
						list_html += pet_name[1].replace(/네로/g,data[j].pet_name).replace(/\n/g,"<br>");
					}
					list_html += '</div>';
					list_html += '<div class="alarm_go"><a href="#">이상행동 녹화영상';
					list_html += '<span class="material-symbols-outlined icon_alarm_go">chevron_right</span>';
					list_html += '</a></div></div>';
  			  }
		  }
		  list_html += '</ul></div></div>';
	}
	var button = "";
	$('.con_alarm').prepend(list_html).trigger("create");
	if(data.length >= 10){
		button += '<div class="btn_more_wrap">';
        button += '<button class="btn_more">더보기</button>';
        button += '</div>';
        $('.alarm_wrap').slice(0,10).toggleClass("hide");
        cnt = 10;
        data_len = $('.alarm_wrap').length-10;
	}else{
		$('.alarm_wrap').toggleClass("hide");
	}
	$('.con_alarm').append(button).trigger("create");
	//console.log(data);
}

		
</script>
</body>
</html>