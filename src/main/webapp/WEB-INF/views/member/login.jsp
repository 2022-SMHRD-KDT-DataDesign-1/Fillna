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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css" />
</head>
<body class="bg">
    <div class="wrapper">
    	<jsp:include page="../common/header1.jsp"></jsp:include>
        <div class="content member">
            <div class="con">
                <div class="m_top">
                    <a href="#">
                        <img src="resources/images/logo_black.png">
                    </a>
                    <div>
                        안녕하세요<br>
                        PATPAT입니다
                    </div>
                    <p>
                        PATPAT 서비스를 제공받기 위해서는<br>반드시 카카오톡 로그인이 필요합니다.
                    </p>
                </div>
                <div class="m_btm">
                    <a class="go_link" href="${contextPath}/">
                        <span>메인으로 가기</span>
                        <span class="material-symbols-outlined icon_go">
                            arrow_forward_ios
                        </span>
                    </a>
                </div>
            </div>

            <div class="login">
                <a class="btn_yel" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=08c15618cbd45ecc0b82e9e3777c25b3&redirect_uri=http://localhost:8081/controller/kakaoLogin">
                    <img src="resources/images/icon_kakao.png" alt="">
                    <span>카카오 로그인</span>
                </a>
            </div>
        </div>
    </div>
    
    
</body>
</html>