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
    <script defer type="text/javascript" src="resources/js/index.js"></script>
</head>
<body class="bg">
    <div class="wrapper">
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
                    <a href="#">
                        <span class="material-symbols-outlined icon_alarm">
                            notifications
                        </span>
                        <img class="alarm_yn" src="resources/images/icon_red_circle.svg" alt="">
                    </a>
                </li>
                <li class="save_wrap">
                    <a href="#" id="submit">
                        <span>저장</span>
                    </a>
                </li>
            </ul>
        </header>
        <!-- content -->
        <div class="content">
            <div class="con">
                <div class="member_info">
                    <img class="profile_img" src="resources/images/tan_e.png" alt="">
                    <div>
                        <p>${nickname} 님</p>
                        <span>${nickname} (${email})<br>
                        010-6792-5045
                        </span>
                    </div>
                </div>
                <form action="${contextPath}/update" method="post" id="update_form">
	                <div class="pet_info">
	                    <div class="top_info">
	                        <h3>필수정보 입력</h3>
	                        <p>일지 알림시간</p>
	                        <input type="text" placeholder="24:00" name="mb_alarm">
	                        <p>반려동물 이름</p>
	                        <input type="text" placeholder="pet" name="pet_name">
	                    </div>
	                    <div class="bottom_info">
	                        <h3>선택정보 입력</h3>
	                        <p>반려동물 생일</p>
	                        <input name="pet_adoption_at" type="date" data-placeholder="선택해주세요" required aria-required="true">
	                        <p>반려동물 성별</p>
	                        <div>
	                            <button type="button" id="male" class="btn">
	                                <span class="material-symbols-outlined icon_gender">
	                                    male
	                                </span>
	                                <p>남아</p>
	                            </button>
	                            <button type="button" id="female" class="btn">
	                                <span class="material-symbols-outlined icon_gender">
	                                    female
	                                </span>
	                                <p>여아</p>
	                            </button>
	                            <input name="pet_gender" type="hidden" id="pet_gender" value="">
	                        </div>
	                        <p>반려동물 사진</p>
	                        <div class="file_wrap">
	                            <input class="file_name" value="" disabled>
	                            <label for="file">upload</label>
	                            <input name="pet_photo" type="file" id="file">
	                        </div>
	                    </div>
	                </div> 
	            </div>
            </form>
            <!-- bottom menu -->
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