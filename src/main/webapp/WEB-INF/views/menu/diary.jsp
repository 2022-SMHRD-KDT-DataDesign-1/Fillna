<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.lang.Math" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.video{
    margin-bottom: 1.5vw;
    cursor: pointer;
    width: 35vw;
    height: 20vw;
    object-fit: cover;
}
..diary_bottom_list_1 {
	overflow : auto;
}
.diary_bottom_list_1>li>div{
	background-corlor : none;
}
.diary_bottom_list_1{
	padding-left: 5vw;
    padding-top: 3vw;
}
.diary_bottom_list_1>li{
    display: flex;
    justify-content: center;
    justify-items: center;
    flex-direction: column;
}
	</style>
</head>
<body class="bg">
    <div class="wrapper diary_wrapper">
    	<jsp:include page="../common/my.jsp"></jsp:include>
		<jsp:include page="../common/header2.jsp"></jsp:include>
		<input type="hidden" value="${vo.mbIdx}" id="memId">
        <input type="hidden" value="${pvo.petIdx}" id="petId">
        <c:set var="petPhotoPath" value="${pvo.petPhotoPath}"/>
        <c:set var = "length" value = "${fn:length(petPhotoPath)}"/>
        <input type="hidden" value="${fn:substring(petPhotoPath, 42, length)}" id="petPhotoPath">
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
					  out.print("<input type='hidden' value='"+today.substring(0, 10)+"' id='today'>");
					
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
								out.print("<li class='date date_today'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[2]+"</p>");
								out.print("</li>");
								out.print("<input type='hidden' class='thisDate' value='"+dateList[j].substring(0, 10)+"'>");
							} else{
								out.print("<li class='date'>");
							    out.print("<p>"+dayOfWeek+"</p>");
							    out.print("<p>"+temp[2]+"</p>");
								out.print("</li>");
								out.print("<input type='hidden' class='thisDate' value='"+dateList[j].substring(0, 10)+"'>");
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
					<!-- 메모 -->
                </div>
                <div class="diary_bottom">
<!--                		<div>
                     	<span>이상행동 녹화영상 LIST</span>
                        <span></span>
                    </div> -->
                    
<!--                     <ul class="diary_bottom_list_1">
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
                    </ul> -->
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
		/* loadMemo(); */

    	$(".diary_header").toggleClass("hide");
    	$("#diary_footer").toggleClass("this_menu");
    	
    	
    	var path = "";
    	
    	//상단 터치 슬라이드
	    var x = 0;
	    var tabx = 0;
	    var xx = 0;
	    var limit = $(".date_ul").width() - $(".date_wrap").width() + 12;
	    
    	$.ajax({
        	url : "diary/"+"${vo.mbIdx}",
        	type : "get",
        	data : {"idx": "${vo.mbIdx}"},
        	dataType : "json",
        	success :function(data){
        		path = data.petPhotoPath.substr(42,data.petPhotoPath.length);
        	},	
        	error : function(){alert("error");}
        });
    	
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
	    
	    
	    //메모 터치슬라이드
	    /* var x1 = 0;
	    var tabx1 = 0;
	    var xx1 = 0;
	    var limit1 = $(".diary_middle_list").width() - $(".diary_middle_list_wrap").width() + 12;
	    $(document).bind('touchstart', '.diary_middle_list', function(e) {
	        var event = e.originalEvent;
	        x1 = event.touches[0].screenX;
	        tabx1 = $(".diary_middle_list").css("transform").replace(/[^0-9\-.,]/g, '').split(',')[4];
	    });
	    $(document).bind('touchmove', '.diary_middle_list', function(e) {
	        var event = e.originalEvent;
	        xx1 = parseInt(tabx) + parseInt(event.touches[0].screenX - x1);
	        $(".diary_middle_list").css("transform", "translate(" + xx1 + "px, 0px)");
	        event.preventDefault();
	    });
	    $(document).bind('touchend', '.diary_middle_list', function(e) {
	        if ((xx1 > 0) && (tabx1 <= 0)) {
	        $(".diary_middle_list").css("transform", "translate(0px, 0px)");
	        }
	        if (Math.abs(xx1) > limit1) {
	        $(".diary_middle_list").css("transform", "translate(" + -limit1 + "px, 0px)");
	        }
	    });
 */
	    
	    $(document).on("click", ".diaryAlarmList", function(){
	    	console.log("click");
	    	$(this).children(".icon_up").toggleClass("hide");
	    	$(this).next().toggleClass("hide");
	    });
	    
	    $(document).on("click", ".icon_more", function(){
	    	$(this).next().toggleClass("hide");
	    });
	    
	    $("body").click(function(){
	    	$(".icon_more").next().addClass("hide");
	    });
	    
	    
	    $(".date").on("click", function(e){
	    	
	    	if($(this).hasClass("date_today")===true){
	    		e.preventDefault();
	    	} else{
		    	$(".date").not(this).removeClass("date_today");
		    	$(this).addClass("date_today");
	    	}
	    	var mbIdx = $("#memId").val();
	    	var petIdx = $("#petId").val();
	    	var date = $(this).next(".thisDate").val();
	    	console.log(date);
	    	
	    	$.ajax({
	    		url : "diary/diary-all",
	    		type : "get",
	    		data : {"mbIdx":mbIdx, "date":date},
	    		dataType : "json",
	    		success : showDiary,
	    		error : function(){alert("error");}
	    	}).done(function(){
	    		var photoPath = $("#petPhotoPath").val();
	    		$("#petProfile").attr("src", photoPath);
	    	});
	    	
	        $.ajax({
    		url : "diary/memo-all",
    		type : "get",
    		data : {"mbIdx":mbIdx, "date":date},
    		dataType : "json",
    		success : showMemo,
    		error : function(){alert("error");}
    		})
    		
	    	$.ajax({
	    		url : "recording/ai/all",
	    		type : "get",
	    		data : {"date":date},
	    		dataType : "json",
	    		success : showAi,
	    		error : function(){console.log("error");}
	    	})
	    });
	    
	    
    });
    
    // 오늘 일지
    function loadDiary(){
    	var mbIdx = $("#memId").val();
    	var date = $("#today").val();
    	console.log(date);
    	
    	$.ajax({
    		url : "diary/diary-all",
    		type : "get",
    		data : {"mbIdx":mbIdx, "date":date},
    		async : false,
    		dataType : "json",
    		success : showDiary,
    		error : function(){alert("error");}
    	}).done(function(){
    		var photoPath = $("#petPhotoPath").val();
    		$("#petProfile").attr("src", photoPath);
    	});

    	$.ajax({
    		url : "diary/memo-all",
    		type : "get",
    		data : {"mbIdx":mbIdx, "date":date},
    		async : false,
    		dataType : "json",
    		success : showMemo,
    		error : function(){alert("error");}
    	})
    	
    	$.ajax({
    		url : "recording/ai/all",
    		type : "get",
    		data : {"date":date},
    		dataType : "json",
    		success : showAi,
    		error : function(){console.log("error");}
	    })
    };
    
    function showDiary(data){
    	var listHtml = "";
    	
    	console.log(data);
		var alarmDate = data[0].alarm_at.split(" ")[0];

		
    	if(alarmDate == '2023-06-20'){
	        listHtml += "<div>오늘의 일지</div>";
	        listHtml += "<div class='today_ment'>";
	        listHtml += "오늘 하루, 네로와 얼마나 오랫동안 눈을 맞추었나요?</div>";
	        listHtml += "<div class='today_ment2'>";
	       	listHtml += "<img id='petProfile' src='' alt=''>";
	        listHtml += "<p>네로는 오늘 조금 힘들었어요.<br>발작과 개구호흡으로 컨디션이 최악이에요.<br>식사도 평소보다 적은 횟수라 걱정이에요. 물과 밥양을 확인해주세요.<br>그루밍도 평소보다 적게 했어요. 피부와 구강상태를 한번 체크해주세요<br><br>네로에게 평소보다 훨씬 더 사랑을 담아 신경써주세요";
	        listHtml += "<span class='material-symbols-outlined icon_pets'>pets</span></p></div>";
    	} else if(alarmDate == '2023-06-11'){
	        listHtml += "<div>오늘의 일지</div>";
	        listHtml += "<div class='today_ment'>";
	        listHtml += "네로에게는 당신이 세상의 전부라는 사실. 알고있나요?</div>";
	        listHtml += "<div class='today_ment2'>";
	       	listHtml += "<img id='petProfile' src='' alt=''>";
	        listHtml += "<p>네로는 오늘 조금 힘들었어요.<br>심하게 귀/피부 긁는 행동, 심한 그루밍으로 컨디션이 정상적이지 않아요.<br>식사에는 큰 문제는 없었지만, 물과 밥양을 확인해주세요.<br>피부와 구강상태가 많이 걱정되니 반드시 체크해야해요.<br><br>당분간 세심하게 네로를 신경써주세요";
	        listHtml += "<span class='material-symbols-outlined icon_pets'>pets</span></p></div>";
    	} else {
	        listHtml += "<div>오늘의 일지</div>";
	        listHtml += "<div class='today_ment'>";
	        listHtml += "오늘 하루, 네로와 얼마나 오랫동안 눈을 맞추었나요?</div>";
	        listHtml += "<div class='today_ment2'>";
	       	listHtml += "<img id='petProfile' src='' alt=''>";
	        listHtml += "<p>네로는 오늘 조금 힘들었어요.<br>발작과 개구호흡으로 컨디션이 최악이에요.<br>식사도 평소보다 적은 횟수라 걱정이에요. 물과 밥양을 확인해주세요.<br>그루밍도 평소보다 적게 했어요. 피부와 구강상태를 한번 체크해주세요<br><br>네로에게 평소보다 훨씬 더 사랑을 담아 신경써주세요";
	        listHtml += "<span class='material-symbols-outlined icon_pets'>pets</span></p></div>";
    	}
            
        listHtml += "<ul class='alaram_list'>";    
        
        $.each(data, function(index, dInfo){
        	listHtml += "<li class='diaryAlarmList'>";
        	//var min = dInfo.alarm_at.minute;
        	var time = dInfo.alarm_at.split(" ")[1].slice(0, 5);
        	listHtml += "<span>"+time+"</span>";
	     	listHtml += "<span class='material-symbols-outlined icon_circle";
    		if(dInfo.alarm_type === "일지"){
    			listHtml += " green circle'>";
    		}else if(dInfo.alarm_type === "주의"){
    			listHtml += " yel circle'>";
    		}else{
    			listHtml += " red circle'>";
    		}
    		listHtml += "circle</span>";
        	if(dInfo.alarm_type != "일지"){
	        	listHtml += "<span class='diary_alarm_type'>["+dInfo.alarm_type+"]</span>";
	        	listHtml += "<span>-"+dInfo.category_name+" "+dInfo.cnt+"회</span>";
        	}else{
        		listHtml += '<span>['+dInfo.alarm_type +']</span>';
        	}
        	
        	if(index==0 && dInfo.alarm_type != '일지'){
	        	listHtml += "<span class='material-symbols-outlined icon_up'>arrow_drop_up</span>";
        	} else {
	        	listHtml += "<span class='material-symbols-outlined icon_up hide'>arrow_drop_up</span>";
        	}
        	listHtml += "</li>";

       		if(index===0){
	        	listHtml += "<div class='alarm_detail'>";
       		} else {
	        	listHtml += "<div class='alarm_detail hide'>";
       		}
        	listHtml += "<div class='alarm_title'>";
        	if(dInfo.alarm_type != "일지"){
	        	listHtml += "<span>["+dInfo.alarm_type+"]</span>";	
	        	listHtml += "${pvo.petName}가 "+time+"분에 "+dInfo.category_name+"를 "+dInfo.cnt+"회 하였습니다.</div>";
	        	listHtml += "<div class='alarm_content'>";
	        	listHtml += dInfo.alarm_content.replace(/\n/g,"<br>");
        	} else {
        		listHtml += '<span>['+dInfo.alarm_type+']</span>';
        		var pet_name = dInfo.alarm_content.split("+")
				listHtml += pet_name[0].replace(/네로/g,dInfo.pet_name).replace(/\n/g,"<br>");
        		listHtml += '</div>'
        		listHtml += '<div class="alarm_content">';
        		listHtml += pet_name[1].replace(/네로/g,dInfo.pet_name).replace(/\n/g,"<br>");
        	}
        	listHtml += "</div>";
        	listHtml += "<div class='alarm_go'>";
        	listHtml += "<a href='#'>이상행동 녹화영상";
        	listHtml += "<span class='material-symbols-outlined icon_alarm_go'>chevron_right</span>";
        	listHtml += "</a></div></div>"
        	
        });
        
        listHtml += "</ul></div>";
        
    	console.log("성공티비");
    	$(".diary_top").html(listHtml);
    };
    
    // 메모 목록
/* 	function loadMemo(){
    	var mbIdx = $("#memId").val();
    	var date = $(".today").next().val();
    	
    	$.ajax({
    		url : "diary/memo-all",
    		type : "get",
    		data : {"mbIdx":mbIdx, "date":date},
    		dataType : "json",
    		success : showMemo,
    		error : function(){alert("error");}
    	})
    }; */
    
    function deleteMemo(idx){
		$.ajax({
			url : "diary/"+idx, 
			type : "delete",
			data : {"idx": idx},
			success : loadDiary,
			error : function () { alert("error"); }
		});	
    };
    
    function showMemo(data){
    	var listHtml = "";
    	listHtml += "<div><span>메모</span>";
    	var date = $(".date_today").next().val(); 
    	var addMemoUrl = "${contextPath}/memo/show?date="+date;
    	listHtml += "<span class='material-symbols-outlined icon_add_circle' onclick='location.href=\""+addMemoUrl+"\"'>add_circle</span></div>";
    	listHtml += "<div class='diary_middle_list_wrap'>";
    	listHtml += "<ul class='diary_middle_list'>";
    	
    	if (data.length > 0){
	    	$.each(data, function(index, mInfo){
	    		var ua = mInfo.memo_update_at;
	    		if(ua.monthValue >= 10){
		    		var date = ua.year+"-"+ua.monthValue+"-"+ua.dayOfMonth;
	    		} else {
		    		var date = ua.year+"-0"+ua.monthValue+"-"+ua.dayOfMonth;
	    		}
	    		var todayDate = new Date();
	    		var updateDate = new Date(ua.year, ua.monthValue-1, ua.dayOfMonth, ua.hour, ua.minute);
	    		var diff = Math.abs(todayDate.getTime() - updateDate.getTime());
	    		diff = Math.round(diff / (1000 * 60));
	    		
	    		listHtml += "<li class='memo_list_content'><div>"
	    		listHtml += "<span>"+mInfo.category_name+"</span>";
	    		if(diff<60){
		    		listHtml += "<span>"+diff+"분전</span>";
	    		} else if(diff>=60 && diff<1440){
	    			diff = Math.round(diff/60);
		    		listHtml += "<span>"+diff+"시간전</span>";
	    		} else if(diff>=1440){
	    			diff = Math.round(diff/60/24);
		    		listHtml += "<span>"+diff+"일전</span>";
	    		} else if(diff>=525600){
	    			diff = Math.round(diff/365/60/24);
	    			listHtml += "<span>"+diff+"년 전</span>";
	    		}
	    		listHtml += "<span class='material-symbols-outlined icon_more'>more_vert</span>";
	    		listHtml += "<div class='memo_menu hide'><ul>";
	    		var url = "${contextPath}/memo/update?memoIdx="+mInfo.memo_idx+"&date="+date;
	    		listHtml += "<li onclick='location.href=\""+url+"\"'>수정하기</li>";
	    		listHtml += "<li class='deleteMemo' onclick='deleteMemo(\""+mInfo.memo_idx+"\")'>삭제하기</li></ul></div>";
	    		listHtml += "<img src='"+mInfo.memo_photo_path.substr(42)+"' alt='' id='petMemoPhoto'>";
	    		listHtml += "<p>"+mInfo.memo_content+"</p></div>";
	    		listHtml += "</li>";
	    	});
    	} else {
    		listHtml += "<div class='memo_none'>작성된 메모가 없습니다.</div>";
    	}
    	listHtml += "</ul></div>";
    	$(".diary_middle").html(listHtml);
    };
    
    function showAi(data){
    	console.log(data);
    	var listHtml = "";
    	listHtml += "<div><span>이상행동 녹화영상 LIST</span><span>총 "+data.length+"개의 영상</span></div>";

		if(data.length > 0){
	    	listHtml += '<ul class="diary_bottom_list_1">';
	    	$.each(data,function(idx,val){
	    		listHtml += "<li>";
	    		/* listHtml += "<div>";	 */			
	    		listHtml += '<video class="video" poster onclick="location.href=\''+'/controller'+val.recordingFile+'\'">';
				listHtml += '<source src="/controller'+val.recordingFile+'" type="video/mp4">';
				listHtml += '</video>';
				/* listHtml += "</div>"; */
				if(idx == 0){
					listHtml += "<span>2:28 발작</span>";
				}else{
					listHtml += "<span>0:34 개구호흡</span>";
				}
				listHtml += "</li>";
	    	});
		} else {
			listHtml += '<ul class="">';
			listHtml+= "<li class='diary_video_none'>저장된 동영상이 없습니다.</li>"
		}
		
		listHtml += "</ul>";
/*     	if($(".diary_bottom_list_1>li").length == 0){
	    	$(".diary_bottom").append(listHtml).trigger("create");
    	} */
    	$(".diary_bottom").html(listHtml);
    }
    


</script>
</html>