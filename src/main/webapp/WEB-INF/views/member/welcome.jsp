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
                        <img class="alarm_yn" src="resources/images/icon_red_circle.svg" alt="">
                    </a>
                </li>
            </ul>
        </header>
        <div class="content member">
            <div class="con">
                <div class="m_top">
                    <a href="${contextPath}/">
                        <img src="resources/images/logo_black.png">
                    </a>
                    <div>
                        ${vo.mbNick}님 환영합니다!<br>
                        회원가입에 성공하셨습니다
                    </div>
                    <p>
                        서비스 이용을 위해 '추가설정' 하시겠습니까?<br>
                        알림시간, 반려동물 이름은 기본설정되어있습니다.
                    </p>
                </div>
                <div class="s_btm">
                    <div>
                        <a href="${contextPath}/updateForm" class="go_link red">
                            <span>알림시간/반려동물 설정하기</span>
                            <span class="material-symbols-outlined icon_go">
                                arrow_forward_ios
                            </span>
                        </a>
                    </div>
                    <div>
                        <a href="${contextPath}/" class="go_link">
                            <span>메인으로 가기</span>
                            <span class="material-symbols-outlined icon_go">
                                arrow_forward_ios
                            </span>
                        </a>
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
</body>
</html>