<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<input type="hidden" value="${vo.mbIdx}" id="memId">
        <input type="hidden" value="${pvo.petIdx}" id="petId">
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
					  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-E");
					
					  // 현재 날짜
					  String today = dateFormat.format(currentDate);
					  out.print("<input type='hidden' value='"+today+"' id='today'>");
					
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
							if(temp[3].equals("월")) {
								dayOfWeek="MON";
							} else if(temp[3].equals("화")) {
								dayOfWeek="TUE";
							} else if(temp[3].equals("수")) {
								dayOfWeek="WED";
							} else if(temp[3].equals("목")) {
								dayOfWeek="THU";
							} else if(temp[3].equals("금")) {
								dayOfWeek="FRI";
							} else if(temp[3].equals("토")) {
								dayOfWeek="SAT";
							} else if(temp[3].equals("일")) {
								dayOfWeek="SUN";
							}
							
							if(j==0){
								out.print("<li class='date today'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[2]+"</p>");
								out.print("</li>");
								out.print("<input type='hidden' id='thisDate' clsas='today' value='"+dateList[j].substring(0, 10)+"'>");
							} else{
								out.print("<li class='date'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[2]+"</p>");
								out.print("</li>");
								out.print("<input type='hidden' id='thisDate' value='"+dateList[j].substring(0, 10)+"'>");
							} 
						}
					  }
				%>
                </ul>
            </div>

            <!-- content -->
            <div class="con">
                <div class="diary_top">
					<!-- 일지 -->
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
	$(document).ready(function(e) {
		loadDiary();
		
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
	    
	    $(document).on("click", ".diaryAlarmList", function(){
	    	console.log("click");
	    	$(this).children(".icon_up").toggleClass("hide");
	    	$(this).next().toggleClass("hide");
	    });
	   
	    
	    $(".date").on("click", function(){
	    	$(".date").not(this).removeClass("today");
	    	$(this).addClass("today");
	    	
	    	var mbIdx = $("#memId").val();
	    	var petIdx = $("#petId").val();
	    	var date = $(this).next("#thisDate").val();
	    	console.log(date);
	    	
	    	$.ajax({
	    		url : "diary/diary-all",
	    		type : "get",
	    		data : {"mbIdx":mbIdx, "petIdx":petIdx, "date":date},
	    		dataType : "json",
	    		success : showDiary,
	    		error : function(){alert("error");}
	    	})
	    });
    });
    
    
    function loadDiary(){
    	var mbIdx = $("#memId").val();
    	var petIdx = $("#petId").val();
    	var date = $("#today").val();
    	
    	$.ajax({
    		url : "diary/diary-all",
    		type : "get",
    		data : {"mbIdx":mbIdx, "petIdx":petIdx, "date":date},
    		dataType : "json",
    		success : showDiary,
    		error : function(){alert("error");}
    	})
    };
    
    function showDiary(data){
    	var listHtml = "";
        listHtml += "<div>오늘의 일지</div>";
        listHtml += "<div class='today_ment'>";
        listHtml += "오늘 하루, 탄이와 얼마나 오랫동안 눈을 맞추었나요?</div>";
        listHtml += "<div class='today_ment2'>";
        listHtml += "<img src='resources/images//tan_e_2.png' alt=''>";
        listHtml += "<p>나비는 오늘 조금 힘들었어요.<br>구토, 심한 재채기로 컨디션이 정상적이지 않아요.<br>식사에는 큰 문제는 없었지만, 물과 밥양을 확인해주세요.<br>그루밍도 평소보다 적게 했어요. 피부와 구강상태를 한번 체크해주세요<br><br>당분간 세심하게 나비를 신경써주세요";
        listHtml += "<span class='material-symbols-outlined icon_pets'>pets</span></p></div>";
            
        listHtml += "<ul class='alaram_list'>";    
        
        $.each(data, function(index, dInfo){
        	listHtml += "<li class='diaryAlarmList'>";
        	listHtml += "<span>"+dInfo.action_at.hour+":"+dInfo.action_at.minute+"</span>";
     		listHtml += "<span class='material-symbols-outlined icon_circle";
    		if(dInfo.alarm_type === "일지"){
    			listHtml += " green circle'>";
    		}else if(dInfo.alarm_type === "주의"){
    			listHtml += " yel circle'>";
    		}else{
    			listHtml += " red circle'>";
    		}
    		listHtml += "circle</span>";
        	listHtml += "<span class='diary_alarm_type'>["+dInfo.alarm_type+"]</span>";
        	if(dInfo.alarm_type != "일지"){
	        	listHtml += "<span>-"+dInfo.category_name+" "+dInfo.cnt+"회</span>";
        	}
        	
        	if(index==0){
	        	listHtml += "<span class='material-symbols-outlined icon_up'>arrow_drop_up</span>";
        	} else{
	        	listHtml += "<span class='material-symbols-outlined icon_up hide'>arrow_drop_up</span>";
        	}
        	listHtml += "</li>";
        	
			
        	if(dInfo.alarm_type != "일지"){
        		if(index===0){
		        	listHtml += "<div class='alarm_detail'>";
        		} else {
		        	listHtml += "<div class='alarm_detail hide'>";
        		}
	        	listHtml += "<div class='alarm_title'>";
	        	listHtml += "<span>["+dInfo.alarm_type+"]</span>";
	        	
	        	var hour = "";
	        	var min = "";
	        	
	        	var len = dInfo.action_at.minute.length;
	        	console.log(len);
	        	
	        	if(dInfo.action_at.minute.length < 2){
		        	listHtml += "${pvo.petName}가 "+dInfo.action_at.hour+"시 0"+dInfo.action_at.minute+"분에 "+dInfo.category_name+"를 "+dInfo.cnt+"회 하였습니다.</div>";
	        	} else {
		        	listHtml += "${pvo.petName}가 "+dInfo.action_at.hour+"시 "+dInfo.action_at.minute+"분에 "+dInfo.category_name+"를 "+dInfo.cnt+"회 하였습니다.</div>";
	        	}
	        	listHtml += "<div class='alarm_content'>";
	        	listHtml += dInfo.alarm_content+"</div>";
	        	listHtml += "<div class='alarm_go'>";
	        	listHtml += "<a href='#'>이상행동 녹화영상";
	        	listHtml += "<span class='material-symbols-outlined icon_alarm_go'>chevron_right</span>";
	        	listHtml += "</a></div></div>"
        	}
        });
        
        listHtml += "</ul></div>";
        
    	console.log("성공티비");
    	$(".diary_top").html(listHtml);
    };
   

</script>
</html>