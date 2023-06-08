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
</head>
<body class="bg">
    <div class="wrapper">
        <jsp:include page="../common/my.jsp"></jsp:include>
        <jsp:include page="../common/header1.jsp"></jsp:include>
        <div>
            <div class="con monitoring_con">
                <div class="monitoring_top">
                    <div>
                        <a href="">
                            <span>
                                최근 3일간 <span>긴급(1)/주의(5)</span> 알림 발생
                            </span>
                        </a>
                    </div>
                    <div>
                        <span>실시간 모니터링 - CCTV1</span>
                        <div>
                            <span>LIVE</span>
                        </div>
                    </div>
                    <div>
                        <a href="">
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

                    <div class="monitoring_wrap">
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
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.30(수)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.21(월)</span>
                            <span class="material-symbols-outlined icon_up">
                                    arrow_drop_up
                            </span>
                        </div>
                        <div class="m_list">
                            <ul class="">
                                <li>
                                    <div>
                                        <p> </p>
                                        <p>14:11</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        
                    </div>
                	<div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                    <div class="monitoring_wrap">
                        <div class="alarm_date rec_date">
                            <img class="icon_check" src="resources/images/icon_check.png" alt="">
                            <span>2023.05.31(목)</span>
                        </div>
                    </div>
                </div>
            </div>
		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>

    <script>
    	$(document).ready(function(e) {
    		$("#monitoring_footer").toggleClass("this_menu");
    		
	        $(".rec_date").on("click", function(){
	            $(this).children(".icon_up").toggleClass("hide");
	            $(this).next().toggleClass("hide");
	        });
    	});
    </script>
</body>
</html>