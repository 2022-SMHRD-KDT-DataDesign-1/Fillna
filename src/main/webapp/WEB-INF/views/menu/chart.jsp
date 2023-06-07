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
    <script src="resources/js/my.js"></script>
</head>
<body class="bg">
    <div class="wrapper">
        <div class="modal_overlay hide"></div>
        <div class="my_content">
            <div class="my_top">
                <a href="#">
                    <img src="resources/images/logo4.png" alt="">
                </a>
                <a href="#" class="icon_x">
                    <img src="resources/images/icon_x.png" alt="">
                </a>
                <a href="#">
                    <img src="resources/images/icon_logout.png" alt="">
                </a>
                <a href="#">
                    <img src="resources/images/icon_my_set.png" alt="">
                </a>
            </div>
            <div class="my_profile">
                <img src="resources/images/tan_e_2.png" alt="">
                <p>탄이 <span>5월 21일 (3년)</span></p>
            </div>
            <div>
                <a href="#">
                    <img src="resources/images/ad.png" alt="">
                </a>
            </div>
            <div class="my_menu">
                <ul>
                    <li>
                        <a href="">
                            <img src="resources/images/icon_my_alarm.png" alt="">
                            <span>알림톡 리스트</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="resources/images/icon_my_monitor.png" alt="">
                            <span>모니터링</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="resources/images/icon_my_report.png" alt="">
                            <span>PATPAT 리포트</span>
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="resources/images/icon_my_diary.png" alt="">
                            <span>건강수첩</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="my_bottom">
                <a href="#">
                    <span>공지사항</span>
                </a>
                <span>|</span>
                <a href="#">
                    <span>FAQ</span>
                </a>
            </div>
        </div>
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
                        <img class="alarm_yn" src="resources/images/icon_red_circle.svg" alt="">
                    </a>
                </li>
                <li class="title">
                    <span>PATPAT 리포트</span>
                    <span></span>
                </li>
            </ul>
        </header>
        <div class="content">
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
                    <div class="date">
                        <p>THU</p>
                        <p>01</p>
                    </div>
                    <div class="date">
                        <p>FRI</p>
                        <p>31</p>
                    </div>
                    <div class="date">
                        <p>SAT</p>
                        <p>20</p>
                    </div>
                    <div class="date">
                        <p>SUN</p>
                        <p>21</p>
                    </div>
                    <div class="date">
                        <p>MON</p>
                        <p>09</p>
                    </div>
                    <div class="date">
                        <p>TUE</p>
                        <p>14</p>
                    </div>
                    <div class="date date_today">
                        <p>WEN</p>
                        <p>07</p>
                    </div>
                </div>
                <div class="con">
                    <div class="chart_date">
                        <span>6월 1주</span>
                        <span>23.06.05~23.06.11</span>
                    </div>
                    <div class="chart">
                        <div class="chart_total">
                            <div class="chart_name">TOTAL</div>
                            <div class="">
                                <!-- chart 들어갈 자리 -->
                                <img src="resources/images/chart_ex_1.png" alt="" style="width:100%">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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

            <div class="chart2 hide">
                <div class="date_wrap">
                    <div class="date date_month">
                        <span>5<span>월</span></span>
                    </div>
                    <div class="date date_month">
                        <span>11<span>월</span></span>
                    </div>
                    <div class="date date_month">
                        <span>12<span>월</span></span>
                    </div>
                    <div class="date date_month">
                        <span>9<span>월</span></span>
                    </div>
                    <div class="date date_month">
                        <span>8<span>월</span></span>
                    </div>
                    <div class="date date_month">
                        <span>7<span>월</span></span>
                    </div>
                    <div class="date date_month date_today">
                        <span>8<span>월</span></span>
                    </div>
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
                                <img src="img/chart_ex_1.png" alt="" style="width:100%">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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
                                            <img src="img/chart_ex_2.png" alt="" style="width:100%;">
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

    <script>
        $(document).ready(function(e) {

            let changeChart = function(){
                $(".monthly").toggleClass("select");
                $(".weekly").toggleClass("select");
                $(".chart2").toggleClass("hide");
                $(".chart1").toggleClass("hide");
            }

            $(".chart_list").children("li").on("click", function(){
                $(this).find(".chart_hide").toggleClass("hide");
                $(this).find(".icon_chart_up").toggleClass("hide");
                $(this).find(".icon_chart_down").toggleClass("hide");
            });

            $(".chart_type>div:eq(0)").on("click", changeChart);

            $(".chart_type>div:eq(1)").on("click", changeChart);

        });
    </script>
</body>
</html>