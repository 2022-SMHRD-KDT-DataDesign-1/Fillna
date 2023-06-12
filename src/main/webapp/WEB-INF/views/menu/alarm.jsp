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
<!--     <script src="resources/js/alarm.js"></script> -->
</head>
<body class="bg">
    <div class="wrapper">
    	<jsp:include page="../common/my.jsp"></jsp:include>
    	<jsp:include page="../common/header2.jsp"></jsp:include>
        <!-- content -->
        <div>
            <div class="con con_alarm">
<!--                 <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span class="today">2023.06.01(목) - 오늘</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle yel circle">
                                    circle
                                </span>
                                <span class="alarm_type">[주의]</span>
                                <span>- 구토 2회</span>
                                <span class="material-symbols-outlined icon_up">
                                    arrow_drop_up
                                </span>
                            </li>
                            <div class="alarm_detail">
                                <div class="alarm_title">
                                    <span class="alarm_type">[주의]</span>
                                    나비가 17:10분에 구토를 2회 하였습니다.
                                </div>
                                <div class="alarm_content">
                                    잦은 구토의 원인은 헤어볼 잦은 구토의 원인은 헤어볼 잦은 구토의 원인은 헤어볼
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
                        </ul>
                    </div>
                </div>

                <!-- 더보기 -->
                <div class="btn_more_wrap">
                    <button class="btn_more">더보기</button>
                </div>
            </div>
            <!-- bottom -->
			<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>

    </div>
</div>
<script type= "text/javascript">

$(document).ready(function(e) {
		
	    load_alarm();
		$(".alarm_header").toggleClass("hide");
    
	    $(document).on("click","li", function(e){
	    	console.log("click");
	    	$(this).children(".icon_up").toggleClass("hide");
	    	$(this).next().toggleClass("hide");
	    })

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
	$.ajax({
		url : "alarm/all",
		type : "get",
		dataType : "json",
		success : makeview,
		error : function(){alert("error");}
	})
};

/* 오늘 날짜를 구하는 함수 */
function getToday(){
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year +"-"+ month + "-"+ day;
}

function makeview(data){
	var list_html = "";
	var day = "";
	var check = false;
	$.each(data, function(idx, val){
        var today = val.alarm_at.split(" ")[0];
        var time = val.alarm_at.split(" ")[1].slice(0,5);
		if(day != today){ /* 전 날과 같은 날짜가 아니라면  */
			day = today
			if(check){
				list_html += '</ul></div></div>';
				check = false;
			}
			list_html += '<div class="alarm_wrap">';
			list_html += '<div class="alarm_date">';
			list_html += '<img class="icon_check" src="resources/images/icon_check.png" alt="">';
			if(getToday() === today){ /* 오늘이라면 */
				list_html += '<span class="today">'+today.replace("/-/g",".")+'('+val.alarm_week.slice(0,1)+') - 오늘</span>';
			}else{ 					  /* 오늘이 아니라면  */
				list_html += '<span>'+today.replace(/-/g,".")+'('+val.alarm_week.slice(0,1)+')</span>';
			}
			list_html += '</div>';
			list_html += '<div class="alaram_list_wrap">';
			list_html += '<ul class="alaram_list">';
        }
		list_html += '<li>';
		list_html += '<span>'+ time +'</span>';
		list_html += '<span class="material-symbols-outlined icon_circle';
		if(val.alarm_type === "일지"){
			list_html += ' green circle">';
		}else if(val.alarm_type === "주의"){
			list_html += ' yel circle">';
		}else{
			list_html += ' red circle">';
		}
		list_html += 'circle</span>';
		if(val.alarm_type != "일지"){
			list_html += '<span>['+val.alarm_type +'] - '+val.category_name+' '+val.cnt +'회</span>';
		}
		
		list_html += '<span class="material-symbols-outlined icon_up hide">arrow_drop_up</span></li>';
		list_html += '<div class="alarm_detail hide">';
		list_html += '<div class="alarm_title">';
		if(val.alarm_type != "일지"){
			list_html += '<span class="alarm_type">['+val.alarm_type+']</span>';
			list_html += ' '+val.pet_name+'가 '+ time+'분에 '+ val.category_name+'를 '+val.cnt +'회 하였습니다.</div>';
			list_html += '<div class="alarm_content">';
			list_html += val.alarm_content;
		}else{
			list_html += '<span class="alarm_type">['+val.alarm_type+'] </span>';
			var pet_name = val.alarm_content.split("+")
			list_html += pet_name[0].replace(/네로/g,val.pet_name);
			list_html += '<div class="alarm_content">';
			list_html += pet_name[1].replace(/네로/g,val.pet_name);
		}

		list_html += '</div>';
		list_html += '<div class="alarm_go"><a href="#">이상행동 녹화영상';
		list_html += '<span class="material-symbols-outlined icon_alarm_go">chevron_right</span>';
		list_html += '</a></div></div>';
		check = true;
	});
	$('.con_alarm').prepend(list_html).trigger("create");
	
}

		
</script>
</body>
</html>