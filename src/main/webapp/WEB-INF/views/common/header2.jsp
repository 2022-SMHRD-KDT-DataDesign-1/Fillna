<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/my.js"></script>
<script scr="resources/js/index.js"></script>
<body>
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
        <!-- modal -->
        <div class="modal hide">
            <div class="modal_overlay"></div>
            <div class="modal_content">
                저장이 완료되었습니다.
                <button class="btn_close">
                    <span class="material-symbols-outlined icon_close">
                    close
                    </span>
                </button>
            </div>
        </div>
        <!-- header -->
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
                    <a href="${contextPath}/alarm">
                        <span class="material-symbols-outlined icon_alarm">
                            notifications
                        </span>
                        <img class="alarm_yn" src="resources/images/icon_red_circle.svg" alt="">
                    </a>
                </li>
                
                <!-- update header -->
                <li class="save_wrap hide">
                    <a href="#" id="save">
                        <span>저장</span>
                    </a>
                </li>
                
                <!-- alarm header -->
                <li class="alarm_title hide">
                    <span>알림톡 LIST</span>
                    <span></span>
                </li>
                
                <!-- diary header -->
                <li class="diary_title hide">
                    <span>6월 1일</span>
                    <span>목요일</span>
                    <span class="material-symbols-outlined icon_calendar">
                        calendar_month
                    </span>
                </li>
                
                <!-- memo header -->
                <li class="title hide">
                    <span class="material-symbols-outlined icon_back" onclick="history:back">
                        arrow_back
                    </span>
                    <span>메모하기 - 6월 1일</span>
                    <span>목요일</span>
                </li>
                
                
            </ul>
        </header>
</body>
</html>