<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.1.1/chart.min.js"></script>
</head>
<body class="bg">
    <div class="wrapper">
		<jsp:include page="../common/my.jsp"></jsp:include>
		<jsp:include page="../common/header2.jsp"></jsp:include>
		<!-- modal -->
        <div class="modal hide">
            <div class="modal_back"></div>
            <div class="modal_content chart_modal_content">
                차트를 생성할 충분한 데이터가 수집되지 않았습니다.
                <button class="btn_close">
                    <span class="material-symbols-outlined icon_close">
                    close
                    </span>
                </button>
            </div>
        </div>
		<input type="hidden" value="${vo.mbIdx}" id="memId">
        <input type="hidden" value="${pvo.petIdx}" id="petId">
        <div class="content chart_con">
            <div class="chart_type">
                <div class="select weekly">
                    <span class="select weekly">주간 리포트</span>
                </div>
                <div class="monthly">
                    <span class="monthly">월간 리포트</span>
                </div>
            </div>
            <!-- date -->
            <div class="chart1">
                <div class="date_wrap">
                <ul class="date_ul date_chart_ul">
                <%
                // Calendar 인스턴스 생성
                Calendar calendar = Calendar.getInstance();

                // 오늘 날짜 설정
                calendar.setTime(new java.util.Date());

                // SimpleDateFormat 설정
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                // 현재 요일 가져오기 (1: 일요일, 2: 월요일, ..., 7: 토요일)
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                // 오늘이 월요일이 아닌 경우, 이전 월요일로 이동
                if (dayOfWeek != Calendar.SUNDAY) {
                	calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
                }
                
            	// 월요일 날짜 출력
            	String today = dateFormat.format(calendar.getTime());
               	Date todayMon = dateFormat.parse(today);
               	String[] todayTemp = today.split("-");
               	
            	calendar.setTime(todayMon);
            	String[] dateChart = new String[10];
               	for(int i = 1; i <= 9; i++){
              		calendar.add(Calendar.DAY_OF_MONTH, -7);
               		dateChart[i-1] = dateFormat.format(calendar.getTime());
               	}
               	
			    String month = "";
			    String todayMonth = "";
			    for(int j=8; j>=0; j--){
 				  String[] temp = dateChart[j].split("-");
				  if(Integer.parseInt(dateChart[j].substring(5, 7)) >= 10){
					  month = dateChart[j].substring(5, 7);
					  todayMonth = today.substring(5, 7);
				  } else {
					  month = dateChart[j].substring(6, 7);
					  todayMonth = today.substring(6, 7);
				  }
				  out.print("<li class='date'>");
			      out.print("<p>"+month+"월</p>");
			      out.print("<p>"+temp[2]+"</p>");
				  out.print("</li>");
				  out.print("<input type='hidden' class='thisDate' value='"+dateChart[j]+"'>");
			    }
			    
				out.print("<li class='date today test'>");
			    out.print("<p>"+todayMonth+"월</p>");
			    out.print("<p>"+todayTemp[2]+"</p>");
				out.print("</li>");
				out.print("<input type='hidden' class='thisDate' value='"+today+"'>");
				
				%>
                </ul>
                </div>
                <div class="con">
                    <div class="chart_date">
                        <span class="month_week"></span>
                        <span class="week_range"></span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="chart_wrap">
                                <!-- chart -->
                                <canvas id="totalWeeklyChart" class="myChart" aria-level="chart"></canvas>
                            </div>
                            <div class="chart_result" id="chartWeekResult">
                            </div>
                        </div>
                        <ul class="chart_list" id="chartWeekList">

                        </ul>
                    </div>

                </div>
            </div>
			<!-- 월간 -->
            <div class="chart2 hide">
                <div class="date_wrap">
                <ul class="date_ul date_chart_ul">
                <%   
                 // 현재 날짜 가져오기
					Date d = new Date();

   					int currentMonth = d.getMonth()+1; // 월은 0부터 시작하므로 1을 더해줌
					int currentYear = d.getYear();
   					// 이번달과 이전 10개월 동안의 달 출력
    				for (int i = 10; i > 0; i--) {
       					int chartYear = currentYear;
       					int chartMonth = currentMonth - i;

       					// 이전 년도의 달일 경우 처리
       					if (chartMonth <= 0) {
    	   					chartYear--;
    	   					chartMonth = 12 + chartMonth; // 12를 더해줌
       					}
       					
    			  		out.print("<li class='date chart_month'>");
    		      		out.print("<span>"+chartMonth+"<span>월</span></span>");
    			  		out.print("</li>");
       				}
		
			  		out.print("<li class='date chart_month today'>");
		      		out.print("<span>"+currentMonth+"<span>월</span></span>");
			  		out.print("</li>");
                
                %>
                </ul>
                </div>
                <div class="con">
                    <div class="chart_date">
                        <span>6월</span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="">
                                <!-- chart 들어갈 자리 -->
                                <canvas id="totalMonthlyChart" class="myChart" aria-level="chart"></canvas>
                            </div>
                            <div class="chart_result">
                                한 달 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 4.5시간, 귀/피부 긁는 행동 3회,
                                재채기 2회, 식사 10회, 배변 5회, 구토 0회, 써클링 0회, 개구호흡 0회, 발작 0회, 후지마비 0회입니다.
                            </div>
                        </div>
                        <ul class="chart_list" id="chartMonthList">
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>그루밍</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>귀/피부 긁는 행동</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>재채기</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>식사</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>배변</span>
                                        <span class="material-symbols-outlined icon_circle red chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>구토</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>써클링</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>개구호흡</span>
                                        <span class="material-symbols-outlined icon_circle yel chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>발작</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="chart_name">
                                        <span>후지마비</span>
                                        <span class="material-symbols-outlined icon_circle green chart_circle">
                                            circle
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_up">
                                            keyboard_arrow_up
                                        </span>
                                        <span class="material-symbols-outlined icon_chart_down hide">
                                            keyboard_arrow_down
                                        </span>
                                    </div>
                                    <div class="chart_hide hide">
                                        <div class="chart_week">
                                            <!-- chart 들어갈 자리 -->
                                        </div>
                                        <div class="chart_result">
                                            그루밍 시간은 전체적으로 높은 편으로, 한 주 평균 4시간 정도입니다. 월(4.2h), 화(4H), 수(5.5H), 목(5.5H), 금(3.5H),
                                            토(3.5H), 일(3H)로 확인됩니다.
                                        </div>
                                        <div class="chart_detail">
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis dictum sapien in nunc vehicula venenatis. Fusce varius ultricies leo, eget facilisis est rutrum sed. Etiam ornare nunc magna, vel pulvinar ligula tempus mattis. Cras sit amet nulla dictum, vulputate mi at, eleifend orci. Phasellus consectetur placerat velit vitae maximus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

		<jsp:include page="../common/footer.jsp">
			<jsp:param name="tel" value="010-1234-5678" />
		</jsp:include>
        </div>
    </div>

    <script>
        $(document).ready(function(e) {
    	    /* 몇월 몇주 날짜 범위 출력 */
	    	var weekAndMonth = new Date($(".today").next().val());
	    	var month = weekAndMonth.getMonth()+1;
	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7);
	    	var txt = month+"월"+week+"주";
	    	$(".month_week").text(txt);
	    	
	    	// 오늘 날짜
	    	var today = new Date();
	    	var year = today.getFullYear();
	    	var month = today.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1
	    	var day = today.getDate();
	    	var endDay = today.getDate() + 1;
	    	
	    	var formattedDate = (''+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
	    	var endDate = year+'-'+month+'-'+endDay;
	    	
			// 선택된 날짜
			var selectDate = $(".today").next().val();
			targetDate = selectDate.split("-").join(".").slice(2);
			
	    	$(".week_range").text(targetDate+"~"+formattedDate);
	    	
	    	var mbIdx = $("#memId").val();
	    	var petIdx = $("#petId").val();
	    	
	    	loadWeeklyChart(mbIdx, petIdx, selectDate, endDate);
	    	loadWeeklyTotalChart(mbIdx, petIdx, selectDate, endDate);
        	
        	$(".chart_header").toggleClass("hide");
        	$("#chart_footer").toggleClass("this_menu");
        	
    	    var x = 0;
    	    var tabx = 0;
    	    var xx = 0;
    	    var limit = $(".date_ul").width() - $(".date_wrap").width() + 12;
    	    $(".date_ul").bind('touchstart', function(e) {
    	        var event = e.originalEvent;
    	        x = event.touches[0].screenX;
    	        tabx = $(".date_ul").css("transform").replace(/[^0-9\-.,]/g, '').split(',')[4];
    	    });
    	    $(".date_ul").bind('touchmove', function(e) {
    	        var event = e.originalEvent;
    	        xx = parseInt(tabx) + parseInt(event.touches[0].screenX - x);
    	        $(".date_ul").css("transform", "translate(" + xx + "px, 0px)");
    	        event.preventDefault();
    	    });
    	    $(".date_ul").bind('touchend', function(e) {
    	        if ((xx > 0) && (tabx <= 0)) {
    	        $(".date_ul").css("transform", "translate(0px, 0px)");
    	        }
    	        if (Math.abs(xx) > limit) {
    	        $(".date_ul").css("transform", "translate(" + -limit + "px, 0px)");
    	        }
    	    });
    	    
	    	/* 차트 열고 닫기 */
            $(document).on("click", ".chart_list>li", function(){
                $(this).find(".chart_hide").toggleClass("hide");
                $(this).find(".icon_chart_up").toggleClass("hide");
                $(this).find(".icon_chart_down").toggleClass("hide");
            });

	    	/* 주간,월간 변환 */
            $(".chart_type>div:eq(0)").on("click", function(){
            	$(".weekly").addClass("select");
            	$(".chart1").removeClass("hide");
            	$(".monthly").removeClass("select");
            	$(".chart2").addClass("hide");
            });

            $(".chart_type>div:eq(1)").on("click", function(){
            	$(".monthly").addClass("select");
            	$(".chart2").removeClass("hide");
            	$(".weekly").removeClass("select");
            	$(".chart1").addClass("hide");
            });
                       
            
            $(".chart1").find(".test").on("click", function(){
            	console.log("test-click");
    	    	if($(this).hasClass("today")===true){
    	    		e.preventDefault();
    	    	} else{
    		    	$(".date").not(this).removeClass("today");
    		    	$(this).addClass("today");
    	    	}
    	    	
        	    /* 몇월 몇주 날짜 범위 출력 */
    	    	var weekAndMonth = new Date($(".today").next().val());
    	    	var month = weekAndMonth.getMonth()+1;
    	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7);
    	    	var txt = month+"월"+week+"주";
    	    	$(".month_week").text(txt);
    	    	
    	    	// 오늘 날짜
    	    	var today = new Date();
    	    	var year = today.getFullYear();
    	    	var month = today.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1
    	    	var day = today.getDate();
    	    	var endDay = today.getDate() + 1;
    	    	
    	    	var formattedDate = (''+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
    	    	var endDate = year+'-'+month+'-'+endDay;
    	    	
    			// 선택된 날짜
    			var selectDate = $(".today").next().val();
    			targetDate = selectDate.split("-").join(".").slice(2);
    			
    	    	$(".week_range").text(targetDate+"~"+formattedDate);
    	    	
    	    	$(".chart").removeClass("hide");
    	    	
    	    	var mbIdx = $("#memId").val();
    	    	var petIdx = $("#petId").val();
    	    	
    	    	loadWeeklyChart(mbIdx, petIdx, selectDate, endDate);
    	    	loadWeeklyTotalChart(mbIdx, petIdx, selectDate, endDate);

            });
            
            // 날짜 클릭시 차트 출력(주간)
    	    $(".chart1").find(".date").not(".test").on("click", function(e){
    	    	console.log("click")
    	    	if($(this).hasClass("today")===true){
    	    		e.preventDefault();
    	    	} else{
    		    	$(".date").not(this).removeClass("today");
    		    	$(this).addClass("today");
    	    	}
    	    	
    	    	/* 몇월 몇주 날짜 범위 출력 */
    	    	var weekAndMonth = new Date($(this).next().val());
    	    	var month = weekAndMonth.getMonth()+1;
    	    	var week = Math.ceil((weekAndMonth.getDate() + weekAndMonth.getDay()) / 7);
    	    	var txt = month+"월"+week+"주";
    	    	$(".month_week").text(txt);
    	    	
    	    	var selectDate = $(".today").next().val();
    			var targetDate = new Date(selectDate);
    			targetDate.setDate(targetDate.getDate()+6);
   			  	var year = targetDate.getFullYear();
   			  	var month = targetDate.getMonth() + 1;
   			  	var day = targetDate.getDate();
   			  	var endDay = targetDate.getDate() + 1;
   			  	
   			  	var formattedDate = ('0'+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
    			var endDate = year+'-'+month+'-'+endDay;
   			  	
   				selectDate = selectDate.split("-").join(".").slice(2);
    	    	$(".week_range").text(selectDate+"~"+formattedDate);
    	    	
				$(".chart").addClass("hide");
				
				$(".modal").removeClass("hide");
				$(".btn_close").click(function(){
					$(".modal").addClass("hide");
				});
				
				$(".modal").click(function(){
					$(".modal").addClass("hide");
				});
				
    	    });
        });
        

        
        
        /* total 주간 차트 출력 함수 */
        function showTotalChartWeek(data){
        	var chrt = $("#totalWeeklyChart");
			var categoryName = [];
			var sum = [];
			
			for(var key in data){
				if(data.hasOwnProperty(key)){
					categoryName.push(data[key].category_name);
					sum.push(data[key].sum);
				}
			}
			
			console.log(data);
			
        	/* weekly-total */
        	var totalWeeklyChart = new Chart(chrt, {
        		type:"polarArea",
        		data:{
        			labels:categoryName,
        			datasets:[{
        				label:"weekly-total",
        				data:sum,
        				backgroundColor: ['rgb(178, 255, 102, 0.7)', 'rgb(241, 255, 145, 0.7)', 'rgb(153, 153, 255, 0.7)', 'rgb(255, 178, 102, 0.7)', 'rgb(255, 153, 153, 0.7)', 'rgb(0, 102, 102, 0.7)', 
	                        'rgb(102, 0, 102)', 'rgb(100, 0, 0)', 'rgb(32, 22, 55)', 'rgb(64, 64, 64)'],
        			}],
        		},
        		options:{
        			responsive: true,
        			plugins:{
        				legend:{
        					display:true,
        					labels:{
        						color:"rgb(94, 94, 94)",
        						boxWidth:10,
        						boxHeight:10,
        						font:{size:13}
        					}
        				}
        			}
        		}
        	})
        	
        	var dividedSum = [];
        	for (var i = 0; i < sum.length; i++) {
        		dividedSum.push(Math.round(sum[i] / 7));
        	}

        	var totalDetailHtml = "일주일 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 "+dividedSum[0]+"시간, 귀/피부 긁는 행동 "+dividedSum[1]+"회, 재채기"+dividedSum[2]+"회, 식사 "+dividedSum[3]+"회, 배변 "+dividedSum[4]+"회, 구토 "+dividedSum[5]+"회, 써클링 "+dividedSum[6]+"회, 개구호흡 "+dividedSum[7]+"회, 발작 "+dividedSum[8]+"회, 후지마비 "+dividedSum[9]+"회입니다.";
        	$("#chartWeekResult").text(totalDetailHtml);
        };
        
        
        /* 주간 차트 출력 함수 */
        function showChartWeek(data){
        	//console.log(data);
        	var result = {};
        	var label = ['그루밍', '피부 긁음', '재채기', '식사', '배변', '구토', '써클링', '개구호흡', '발작', '후지마비'];

        	for (var key in data) {
        	  var item = data[key];
        	  var categoryName = item.category_name;
        	  
        	  if (result[categoryName]) {
        	    result[categoryName].push(item);
        	  } else {
        	    result[categoryName] = [item];
        	  }
        	}
        	
        	var keys = Object.keys(result);
        	var categoryChartHtml = "";
        	
        	for(var i = 0; i < keys.length; i++){
       		  	var key = keys[i];

       		  	var weeklyCategory = result[key];
       		  	
       		  	var sums = weeklyCategory.map(function(item){
       		  		return {
       		  			sum : item.sum,
       		  			sub_date : item.sub_date,
       		  			alarm_type : item.alarm_type,
       		  			cnt : item.cnt,
       		  			alarm_content : item.alarm_content
       		  		};
       		  	});
        		
        		var filteredData = sums.filter(function(item) {
        			return item.sub_date === undefined;
        		});
        		
        		var totalSums = filteredData.map(function(item){
        			return item.sum;
        		});
        		
        		var totalSum = Math.round((totalSums[0]/7)*10)/10;
        		//console.log(totalSum);
       		  	
       		  	console.log(sums);
       		  	
         		categoryChartHtml += "<li><div><div class='chart_name'>";
        		categoryChartHtml += "<span>"+key+"</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_circle";
        		if(sums[0].alarm_type === "일지"){
        			categoryChartHtml += " green chart_circle'>";
        		}else if(sums[0].alarm_type === "주의"){
        			categoryChartHtml += " yel chart_circle'>";
        		}else{
        			categoryChartHtml += " red chart_circle'>";
        		}
        		categoryChartHtml += "circle</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_chart_up'>keyboard_arrow_up</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_chart_down hide'>keyboard_arrow_down</span></div>";
        		categoryChartHtml += "<div class='chart_hide'><div class='chart_week'>";
        		var className = "categoryChart"+i;
        		categoryChartHtml += "<canvas id='"+className+"' class='categoryChart' aria-level='chart'></canvas>";
        		//categoryChartHtml += "<img src='resources/images/chart_ex_2.png' alt='' style='width:100%;'>";
        		categoryChartHtml += "</div><div class='chart_result'>";

        		
				if(key === "그루밍") { 
            		if(totalSum >= sums[0].cnt) {
						categoryChartHtml += key+" 시간은 전체적으로 높은 편으로, 일일 평균 "+totalSum+"시간 입니다.  ";
					} else {
						categoryChartHtml += key+" 시간은 일일 평균 "+totalSum+"시간 입니다.  ";
					}
				} else {
            		if(totalSum >= sums[0].cnt) {
						categoryChartHtml += key+" 횟수는 전체적으로 높은 편으로, 일일 평균 "+totalSum+"회 입니다.  ";
					} else {
						categoryChartHtml += key+" 횟수는 일일 평균 "+totalSum+"회 입니다.  ";
					}
				}
				
				var daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
					
				if(totalSum != 0){
					var totalList = [];
					for(var j = 0; j < sums.length-1; j++){
		       		  	//console.log(sums[j]);
						var date = new Date(sums[j].sub_date);
						if(key === "그루밍"){
							categoryChartHtml += daysOfWeek[date.getDay()]+"("+sums[j].sum+"H)  ";
						} else {
							categoryChartHtml += daysOfWeek[date.getDay()]+"("+sums[j].sum+"회)  ";
						}
					}
					categoryChartHtml += "로 확인됩니다.";
				}
				
				categoryChartHtml += "<div class='chart_detail'>"+sums[0].alarm_content.replace(/\n/g,"<br>")+"</div>";
				categoryChartHtml += "</div></div></li>";

				
        	}
        	
        	$("#chartWeekList").html(categoryChartHtml);
        	
        };
        
        /* 월간 차트 출력 함수 */
        function showChartMonth(data){
        	//console.log(data);
        	var result = {};
        	var label = ['그루밍', '피부 긁음', '재채기', '식사', '배변', '구토', '써클링', '개구호흡', '발작', '후지마비'];

        	for (var key in data) {
        	  var item = data[key];
        	  var categoryName = item.category_name;
        	  
        	  if (result[categoryName]) {
        	    result[categoryName].push(item);
        	  } else {
        	    result[categoryName] = [item];
        	  }
        	}
        	
        	var keys = Object.keys(result);
        	var categoryChartHtml = "";
        	
        	for(var i = 0; i < keys.length; i++){
       		  	var key = keys[i];

       		  	var weeklyCategory = result[key];
       		  	
       		  	var sums = weeklyCategory.map(function(item){
       		  		return {
       		  			sum : item.sum,
       		  			sub_date : item.sub_date,
       		  			alarm_type : item.alarm_type,
       		  			cnt : item.cnt,
       		  			alarm_content : item.alarm_content
       		  		};
       		  	});
        		
        		var filteredData = sums.filter(function(item) {
        			return item.sub_date === undefined;
        		});
        		
        		var totalSums = filteredData.map(function(item){
        			return item.sum;
        		});
        		
        		var totalSum = Math.round((totalSums[0]/7)*10)/10;
        		//console.log(totalSum);
       		  	
       		  	console.log(sums);
       		  	
         		categoryChartHtml += "<li><div><div class='chart_name'>";
        		categoryChartHtml += "<span>"+key+"</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_circle";
        		if(sums[0].alarm_type === "일지"){
        			categoryChartHtml += " green chart_circle'>";
        		}else if(sums[0].alarm_type === "주의"){
        			categoryChartHtml += " yel chart_circle'>";
        		}else{
        			categoryChartHtml += " red chart_circle'>";
        		}
        		categoryChartHtml += "circle</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_chart_up'>keyboard_arrow_up</span>";
        		categoryChartHtml += "<span class='material-symbols-outlined icon_chart_down hide'>keyboard_arrow_down</span></div>";
        		categoryChartHtml += "<div class='chart_hide'><div class='chart_week'>";
        		var className = "categoryChart"+i;
        		categoryChartHtml += "<canvas id='"+className+"' class='categoryChart' aria-level='chart'></canvas>";
        		//categoryChartHtml += "<img src='resources/images/chart_ex_2.png' alt='' style='width:100%;'>";
        		categoryChartHtml += "</div><div class='chart_result'>";

        		
				if(key === "그루밍") { 
            		if(totalSum >= sums[0].cnt) {
						categoryChartHtml += key+" 시간은 전체적으로 높은 편으로, 일일 평균 "+totalSum+"시간 입니다.  ";
					} else {
						categoryChartHtml += key+" 시간은 일일 평균 "+totalSum+"시간 입니다.  ";
					}
				} else {
            		if(totalSum >= sums[0].cnt) {
						categoryChartHtml += key+" 횟수는 전체적으로 높은 편으로, 일일 평균 "+totalSum+"회 입니다.  ";
					} else {
						categoryChartHtml += key+" 횟수는 일일 평균 "+totalSum+"회 입니다.  ";
					}
				}
				
				var daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
					
				if(totalSum != 0){
					var totalList = [];
					for(var j = 0; j < sums.length-1; j++){
		       		  	//console.log(sums[j]);
						var date = new Date(sums[j].sub_date);
						if(key === "그루밍"){
							categoryChartHtml += daysOfWeek[date.getDay()]+"("+sums[j].sum+"H)  ";
						} else {
							categoryChartHtml += daysOfWeek[date.getDay()]+"("+sums[j].sum+"회)  ";
						}
					}
					categoryChartHtml += "로 확인됩니다.";
				}
				
				categoryChartHtml += "<div class='chart_detail'>"+sums[0].alarm_content.replace(/\n/g,"<br>")+"</div>";
				categoryChartHtml += "</div></div></li>";

				
        	}
        	
        	$("#chartMonthList").html(categoryChartHtml);
        	
        };
        
        // loadWeeklyChart
        function loadWeeklyChart(mbIdx, petIdx, selectDate, endDate) {
	    	$.ajax({
	    		url : "chart/weekly",
	    		type : "post",
	    		data : {"mbIdx":mbIdx, "petIdx":petIdx, "startDate":selectDate, "endDate":endDate},
	    		dataType : "json",
	    		success : showChartWeek,
	    		error : function(){alert("error");}
	    	}).done(function(){
				var chrt = $("#categoryChart"+0);
				new Chart(chrt, {
			        type: 'bar',
			        data: {
			          labels: ['일', '월', '화', '수', '목' ,'금', '토'], // 데이터 레이블
			          datasets: [{
			            label: '그루밍',
			            data: [0, 4, 3, 5, 5, 4, 4], // 카테고리별 데이터
			            backgroundColor: 'rgba(205, 0, 0, 0.5)' // 차트 색상
			          }]
			        },
			        options: {
			          // 차트 옵션 설정
			          plugins:{
				          legend: {
				        	  display:false
				          }
			          }
			        }
				});
				
				var chrt1 = $("#categoryChart"+1);
				new Chart(chrt1, {
					type: 'bar',
					data: {
						labels: ['일', '월', '화', '수', '목', '금', '토'],
						datasets: [{
							label: '피부긁음',
							data: [0, 0, 0, 0, 4, 0, 0],
							backgroundColor: 'rgba(205, 0, 0, 0.5)'
						}]
					},
					options: {
						plugins:{
							legend: {
								display:false
							}
						}
					}
				});
	    	});

        };
        
        // loadWeeklyTotalChart
        function loadWeeklyTotalChart(mbIdx, petIdx, selectDate, endDate) {
	    	$.ajax({
	    		url : "chart/weekly-total",
	    		type : "post",
	    		data : {"mbIdx":mbIdx, "petIdx":petIdx, "startDate":selectDate, "endDate":endDate},
	    		dataType : "json",
	    		success : showTotalChartWeek,
	    		error : function(){alert("error");}
	    	})
        };
        
        
    </script>
</body>
</html>