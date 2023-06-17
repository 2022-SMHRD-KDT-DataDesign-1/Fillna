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
<%-- 		<input type="hidden" value="${vo.mbIdx}" id="memId">
        <input type="hidden" value="${pvo.petIdx}" id="petId"> --%>
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
                <ul class="date_ul">
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
                if (dayOfWeek != Calendar.MONDAY) {
                	calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
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
			    
				out.print("<li class='date today'>");
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
                        <span class="week_range">23.06.05~23.06.11</span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="chart_wrap">
                                <!-- chart 들어갈 자리 -->
                                <canvas id="totalWeeklyChart" class="myChart" aria-level="chart"></canvas>
                            </div>
                            <div class="chart_result">
                                일주일 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 4.5시간, 귀/피부 긁는 행동 3회,
                                재채기 2회, 식사 10회, 배변 5회, 구토 0회, 써클링 0회, 개구호흡 0회, 발작 0회, 후지마비 0회입니다.
                            </div>
                        </div>
                        <ul class="chart_list">
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
                                            <img src="resources/images/chart_ex_2.png" alt="" style="width:100%;">
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
			<!-- 월간 -->
            <div class="chart2 hide">
                <div class="date_wrap">
                <ul class="date_ul">
                <%
					/* 수정예정 */
	
				%>
                </ul>
                </div>
                <div class="con">
                    <div class="chart_date">
                        <span>6월</span>
                        <span>23.06.01~23.06.21</span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">똥싸기</div>
                            <div class="">
                                <!-- chart 들어갈 자리 -->
                            </div>
                            <div class="chart_result">
                                일주일 기준, 이상행동의 일 평균 시간과 횟수는 다음과 같습니다. 그루밍 평균 4.5시간, 귀/피부 긁는 행동 3회,
                                재채기 2회, 식사 10회, 배변 5회, 구토 0회, 써클링 0회, 개구호흡 0회, 발작 0회, 후지마비 0회입니다.
                            </div>
                        </div>
                        <ul class="chart_list">
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
	    	var formattedDate = (''+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
	    	
			// 선택된 날짜
			var targetDate = $(".today").next().val();
			targetDate = targetDate.split("-").join(".").slice(2);
			
	    	$(".week_range").text(targetDate+"~"+formattedDate);

	    	/* 차트 열고 닫기 */
            $(".chart_list").children("li").on("click", function(){
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
            
            /* 주간 차트 출력 함수 */
            function showChartWeek(data){
            	var chrt = $("#totalWeeklyChart");
            	var labels = ["써클링", "발작", "후지마비", "재채기", "피부긁음", "구토", "배변", "그루밍", '개구호흡', '식사'];
            	/* weekly-total */
            	var totalWeeklyChart = new Chart(chrt, {
            		type:"polarArea",
            		data:{
            			labels:labels,
            			datasets:[{
            				label:"weekly-total",
            				data:[],
            				backgroundColor: ['rgb(205, 0, 0)', 'rgb(248, 150, 140)', 'rgb(241, 232, 73)', 'rgb(73, 230, 241)', 'rgb(241, 73, 139)', 'rgb(99, 99, 202)', 
    	                        'rgb(120, 223, 152)', 'rgb(195, 224, 85)', 'rgb(231, 129, 129)', 'rgb(253, 126, 126)'],
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
            	/* weekly-category */
            	
            }
            
            // 날짜 클릭시 차트 출력(주간)
    	    $(".chart1").find(".date").on("click", function(e){
    	    	
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
   			  	
   			  	var formattedDate = ('0'+year).slice(-2) + '.' + ('0' + month).slice(-2) + '.' + ('0' + day).slice(-2);
    			
   				selectDate = selectDate.split("-").join(".").slice(2);
    	    	$(".week_range").text(selectDate+"~"+formattedDate);
    	    	
    	    	/* 데이터 불러오기 start */
    	    	var mbIdx = $("#memId").val();
    	    	var petIdx = $("#petId").val();
				
    	    	$.ajax({
    	    		url : "chart/weekly",
    	    		type : "post",
    	    		data : {"mbIdx":mbIdx, "petIdx":petIdx, "startDate":selectDate, "endDate":formattedDate},
    	    		dataType : "json",
    	    		success : showChartWeek,
    	    		error : function(){alert("error");}
    	    	})
    	    });
    	    	


        });
    </script>
</body>
</html>