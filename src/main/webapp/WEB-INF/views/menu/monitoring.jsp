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
            </ul>
        </header>
        <div>
            <div class="con">
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
                        <p>최대 7일간 보관됩니다. 중요한 영상은 다운로드하여 보관해주세요.</p>
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
                </div>
            </div>
            <div class="bottom">
                <div class="this_menu">
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
        $(".rec_date").on("click", function(){
            $(this).children(".icon_up").toggleClass("hide");
            $(this).next().toggleClass("hide");
        });
    </script>
</body>
</html>