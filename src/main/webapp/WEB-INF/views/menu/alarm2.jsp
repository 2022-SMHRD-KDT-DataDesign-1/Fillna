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
	console.log(startDate+" "+endDate);
	
	$.ajax({
		url : "alarm/all-test",
		type : "post",
		data : {"startDate": startDate, "endDate": endDate},
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
		  
		  if(date == data[i].alarm_at.split(" ")[0]){
			  console.log(data);
		  }
		  
		  
	}
	
	//console.log(data);
}

		
</script>
</body>
</html>