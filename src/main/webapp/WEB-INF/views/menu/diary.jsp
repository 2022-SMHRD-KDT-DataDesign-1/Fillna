<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body class="bg">
    <div class="wrapper">
    	<jsp:include page="../common/my.jsp"></jsp:include>
		<jsp:include page="../common/header2.jsp"></jsp:include>
        <div>
            <!-- date -->
            <div class="date_wrap">
                <ul class="date_ul">
                <%
					  // 현재 날짜 가져오기
					  Date currentDate = new Date();
					
					  // 2주 전 날짜 계산
					  long twoWeeksInMillis = 15 * 24 * 60 * 60 * 1000L;
					  Date twoWeeksAgoDate = new Date(currentDate.getTime() - twoWeeksInMillis);
					
					  // 날짜 포맷 설정
					  SimpleDateFormat dateFormat = new SimpleDateFormat("dd-E");
					
					  // 현재 날짜 출력
					  // out.println("today:" + dateFormat.format(currentDate) + "<br>");
					
					  String[] dateList = new String[15];
					  int i = 0;
					  
					  // 2주 전 날짜부터 하루씩 감소하며 출력
					  Date date = currentDate;
					  while (date.after(twoWeeksAgoDate)) {
						dateList[i] = dateFormat.format(date);
						i+=1;
					    long oneDayInMillis = 24 * 60 * 60 * 1000L;
					    date = new Date(date.getTime() - oneDayInMillis);
					  }
					
					  String dayOfWeek = "";
					  for(int j=14; j>=0; j--){
						String[] temp = dateList[j].split("-");
						if(j>=0){
							if(temp[1].equals("월")) {
								dayOfWeek="MON";
							} else if(temp[1].equals("화")) {
								dayOfWeek="TUE";
							} else if(temp[1].equals("수")) {
								dayOfWeek="WED";
							} else if(temp[1].equals("목")) {
								dayOfWeek="THU";
							} else if(temp[1].equals("금")) {
								dayOfWeek="FRI";
							} else if(temp[1].equals("토")) {
								dayOfWeek="SAT";
							} else if(temp[1].equals("일")) {
								dayOfWeek="SUN";
							}
							
							if(j==0){
								out.print("<li class='date today'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[0]+"</p>");
								out.print("</li>");
							} else{
								out.print("<li class='date'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[0]+"</p>");
								out.print("</li>");
							} 
						}
					  }
				%>
                </ul>
            </div>
            <!-- content -->
            <div class="con">
                <div class="diary_top">
                    <div>오늘의 일지</div>
                    <div class="today_ment">
                        "오늘 하루, 탄이와 얼마나 오랫동안 눈을 맞추었나요?"
                    </div>
                    <div class="today_ment2">
                        <img src="resources/images//tan_e_2.png" alt="">
                        <p>나비는 오늘 조금 힘들었어요.<br>
                        구토, 심한 재채기로 컨디션이 정상적이지 않아요.<br>
                        식사에는 큰 문제는 없었지만, 물과 밥양을 확인해주세요.<br>
                        그루밍도 평소보다 적게 했어요. 피부와 구강상태를 한번 체크해주세요<br>
                        <br>
                        당분간 세심하게 나비를 신경써주세요
                        <span class="material-symbols-outlined icon_pets">
                            pets
                        </span>
                        </p>
                    </div>
                    <ul class="alaram_list">
                        <li>
                            <span>17:10</span>
                            <span class="material-symbols-outlined icon_circle yel circle">
                                circle
                            </span>
                            <span>[주의]</span>
                            <span>- 구토 2회</span>
                            <span class="material-symbols-outlined icon_up">
                                arrow_drop_up
                            </span>
                        </li>
                        <div class="alarm_detail">
                            <div class="alarm_title">
                                <span>[주의]</span>
                                나비가 17:10분에 구토를 2회 하였습니다.
                            </div>
                            <div class="alarm_content">
                                잦은 구토의 원인은 헤어볼 잦은 구토의 원인은 헤어볼
                                <span>+ 구체적으로 확인해야할 부위들 : 귓속의 상태</span>
                            </div>
                            <div class="alarm_go">
                                <a href="#">
                                    이상행동 녹화영상
                                    <span class="material-symbols-outlined icon_alarm_go">
                                        chevron_right
                                    </span>
                                </a>
                            </div>
                        </div>
                        <li>
                            <span>16:11</span>
                            <span class="material-symbols-outlined icon_circle yel circle">
                                circle
                            </span>
                            <span>[주의]</span>
                            <span>- 재채기 4회</span>
                            <span class="material-symbols-outlined icon_up hide">
                                arrow_drop_up
                            </span>
                        </li>
                        <li>
                            <span>15:15</span>
                            <span class="material-symbols-outlined icon_circle green circle">
                                circle
                            </span>
                            <span>[일지]</span>
                            <span>- 6월 1일</span>
                            <span class="material-symbols-outlined hide">
                                arrow_drop_up
                            </span>
                        </li>
                    </ul>
                </div>
                <div class="diary_middle">
                    <div>
                        <span>메모</span>
                        <span class="material-symbols-outlined icon_add_circle">
                            add_circle
                        </span>
                    </div>
                    <ul class="diary_middle_list">
                        <li>
                            <div>
                                <span>써클링</span><span>30분전</span>
                                <a href="">
                                    <span class="material-symbols-outlined icon_more">
                                        more_vert
                                    </span>
                                </a>
                                <img src="resources/images/cat.jpeg" alt="">
                                <p>귀 내부 상태 양호함. 털 빗질 필요한듯</p>
                            </div>
                        </li>
                        <li>
                            <div>
                                <span>써클링</span><span>30분전</span>
                                <a href="">
                                    <span class="material-symbols-outlined icon_more">
                                        more_vert
                                    </span>
                                </a>
                                <img src="resources/images/cat.jpeg" alt="">
                                <p>귀 내부 상태 양호함. 털 빗질 필요한듯</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="diary_bottom">
                    <div>
                        <span>이상행동 녹화영상 LIST</span>
                        <span>총 5개의 영상</span>
                    </div>
                    <ul class="diary_bottom_list_1">
                        <li>
                            <div>
                            </div>
                            <span>4:11 재채기</span>
                        </li>
                        <li>
                            <div>
                            </div>
                            <span>17:10 구토</span>
                        </li>
                        <li>
                            <div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- bottom -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
</div>
</body>

<script>
    $(function() {
    	$(".diary_header").toggleClass("hide");
    	$("#diary_footer").toggleClass("this_menu");
    	
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
	    
	    $(".alaram_list").children("li").on("click", function(){
	        console.log('click');
	        $(this).children(".icon_up").toggleClass("hide");
	        $(this).next().toggleClass("hide");
	    });
	    

	    let now = new Date();
	    let day = ('0'+now.getDate()).slice(-2);
	    const week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
	    let dayOfWeek = week[now.getDay()];
    	
	    let result = day+"-"+dayOfWeek;
	    console.log(result);
	    
	    let yes = new Date(now.setDate(now.getDate()-1));
	    /* let yesDayOfWeek = now.setDay(now.getDay()-1); */
	    
	    console.log(yes.getDate());
	    /* console.log(yesDayOfWeek) */
	    
	    
	    $(".nalzza").text(day);
	    $(".yoil").text(dayOfWeek);
	    
	    

    });

</script>
</html>