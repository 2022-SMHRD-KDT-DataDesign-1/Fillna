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
    <script defer src="resources/js/alarm.js"></script>
</head>
<body class="bg">
    <div class="wrapper">
        <header class="header">
            <ul>
                <li>
                    <a href="#">
                        <span class="material-symbols-outlined icon_ham">
                            menu
                        </span>
                    </a>
                </li>
                <li class="icon_alarm_wrap">
                    <a href="#">
                        <span class="material-symbols-outlined icon_alarm">
                            notifications
                        </span>
                        <!-- <img class="alarm_yn" src="img/icon_red_circle.svg" alt=""> -->
                    </a>
                </li>
                <li class="title">
                    <span>알림톡 LIST</span>
                </li>
            </ul>
        </header>
        <!-- content -->
        <div>
            <div class="con con_alarm">
                <div class="alarm_wrap">
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
                    
                </div>
                <div class="alarm_wrap">
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
                                <span class="circle green"></span>
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
                                <span class="circle green"></span>
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
                                <span class="circle green"></span>
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
                                <span class="circle green"></span>
                                <span class="alarm_type">[일지]</span>
                                <span>- 5월 30일</span>
                            </li>
                        </ul>
                    </div>
                    
                </div>

                <!-- 더보기 -->
                <div class="btn_more_wrap">
                    <button class="btn_more">더보기</button>
                </div>
            </div>
            <!-- bottom -->
            <div class="bottom">
                <div>
                    <a href="#">
                        <span class="material-symbols-outlined">
                            slideshow
                        </span>
                        <p>모니터링</p>
                    </a>
                </div>
                <div>
                    <a href="#">
                        <span class="material-symbols-outlined">
                            analytics
                        </span>
                        <p>PATPAT리포트</p>
                    </a>
                </div>
                <div>
                    <a href="#">
                        <span class="material-symbols-outlined">
                        edit_square
                        </span>
                        <p>건강수첩</p>
                    </a>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>