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
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle yel circle">
                                    circle
                                </span>
                                <span>[주의]</span>
                                <span>- 구토 2회</span>
                                <span class="material-symbols-outlined icon_up hide">
                                    arrow_drop_up
                                </span>
                            </li>
                            <div class="alarm_detail hide">
                                <div class="alarm_title">
                                    <span>[주의]</span>
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
                    
                </div> -->
<!--                 <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.41(수)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle red circle">
                                    circle
                                </span>
                                <span class="alarm_type">[긴급]</span>
                                <span>- 구토 2회</span>
                            </li>
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle yel circle">
                                    circle
                                </span>
                                <span class="alarm_type">[주의]</span>
                                <span>- 재패기 5회</span>
                            </li>
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle yel circle">
                                    circle
                                </span>
                                <span class="alarm_type">[주의]</span>
                                <span>- 써클링 1회</span>
                            </li>
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 6월 1일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.21(화)</span>
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
                            </li>
                            <li>
                                <span>17:10</span>
                                <span class="material-symbols-outlined icon_circle red circle">
                                    circle
                                </span>
                                <span class="alarm_type">[주의]</span>
                                <span>- 구토 2회</span>
                            </li>
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 구토 2회</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.11(월)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.11(월)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.11(월)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.11(월)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type ">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <div class="alarm_wrap">
                    <div class="alarm_date">
                        <img class="icon_check" src="resources/images/icon_check.png" alt="">
                        <span>2023.05.11(월)</span>
                    </div>
                    <div class="alaram_list_wrap">
                        <ul class="alaram_list">
                            <li>
                                <span>10:01</span>
                                <span class="material-symbols-outlined icon_circle green circle">
                                    circle
                                </span>
                                <span class="alarm_type">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>
 -->
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
		
		$(".alarm_header").toggleClass("hide");
	
	    $(".alaram_list").children("li").on("click", function(){
	        console.log('click');
	        $(this).children(".icon_up").toggleClass("hide");
	        $(this).next().toggleClass("hide");
	    });
	    load_alarm();
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

    return year +"."+ month + "."+ day;
}

function alarm_list_wrap(idx,val){
	var list_html = "" 
		list_html += '<div class="alaram_list_wrap">';
		list_html += '<ul class="alaram_list">';
		list_html += '<li>';
		list_html += '<span>'+ val.alarm_at.split(" ")[1].slice(0,5) +'</span>';
		if(val.alarm_type === "주의"){
			list_html += '<span class="material-symbols-outlined icon_circle yel circle">';
		}else if(val.alarm_type === "긴급"){
			list_html += '<span class="material-symbols-outlined icon_circle red circle">';
		}else{
			list_html += '<span class="material-symbols-outlined icon_circle green circle">';	
		}
		list_html += "circle</span>";
		list_html += '<span class="alarm_type">['+ val.alarm_type +']</span>';
		if(val.alarm_type === "일지"){
			var split_month = val.alarm_at.split(" ")[0].slice(5,7);
			var split_day   = val.alarm_at.split(" ")[0].slice(8,10);
			list_html += '<span> - '+split_month.replace(/(^0+)/, "")+"월 "+ split_day.replace(/(^0+)/, "") +"일"+'</span>';
		}else{
			list_html +- '<span> - '+val.category_name+' '+ val.cnt+'회</span>';			
		}
		list_html += '<span class="material-symbols-outlined icon_up">';
		list_html += 'arrow_drop_up</span></li>';
		/* alarm detail */
/* 		list_html += '<div class="alarm_detail">';
		list_html += '<div class="alarm_title">'; */
		/* end */
		list_html += "</ul></div></div>";
		
	
	return list_html;
}


function makeview(data){
	console.log("성공");
	console.log(data);
	var list_html = ""
	var today = getToday();
	var day = ""
	$.each(data, function(idx, val){
		if(day === val.alarm_at.split(" ")[0]){
			list_html += alarm_list_wrap(idx,val);
		}else{
			day = val.alarm_at.split(" ")[0];
			list_html += '<div class="alarm_wrap">' ;
			list_html += '<div class="alarm_date">' ;
			list_html += '<img class="icon_check" src="resources/images/icon_check.png" alt="">' ;
			if(today === val.alarm_at.split(" ")[0]){
				list_html += '<span class="today"> '+ val.alarm_at.split(" ")[0].replace("-/g",".") + "(" + val.alarm_week[0] + ")" + " - 오늘"+'</span>' ;			
			}else{
				list_html += '<span> '+ val.alarm_at.split(" ")[0].replace("-/g",".") + "(" + val.alarm_week[0] + ")" + '</span>' ;
			}
			list_html += '</div>';
			list_html += alarm_list_wrap(idx,val);
		}
	});
	
	$('.con_alarm').html(list_html).trigger("create");
}
		
</script>
</body>
</html>