<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/my.js"></script>
</head>
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
</body>
</html>