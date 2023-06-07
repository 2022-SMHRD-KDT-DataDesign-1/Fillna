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
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    <script src="resources/js/my.js"></script>
    <script defer src="resources/js/index.js"></script>
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
                        <img class="alarm_yn" src="resources/icon_red_circle.svg" alt="">
                    </a>
                </li>
                <li class="save_wrap">
                    <a href="#" id="save">
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
                        <p>${vo.mbNick}</p>
                        <span>${vo.mbNick} (${vo.mbEmail}))<br>
                        010-6792-5045
                        </span>
                    </div>
                </div>
                <form action="${contextPath}/update" method="post" id="update_form"></form>
                <input type="hidden" name="mb_idx" value="${vo.mbIdx}">
                <div class="pet_info">
                    <div class="top_info">
                        <h3>필수정보 입력</h3>
                        <p>일지 알림시간</p>
                        <c:if test="${empty vo.mbAlarm}"><input type="text" placeholder="24:00" name="mb_alarm" id="time"></c:if>
	                    <c:if test="${not empty vo.mbAlarm}"><input type="text" placeholder="${vo.mbAlarm}" name="mb_alarm" id="time" value="${vo.mbAlarm}"></c:if>
                        <p>반려동물 이름</p>
                       	<c:if test="${empty pvo.petName}"><input type="text" placeholder="pet" name="pet_name"></c:if>
                        <c:if test="${not empty pvo.petName}"><input type="text" placeholder="${pvo.petName}" value="${pvo.petName}" name="pet_name"></c:if>
                    </div>
                    <div class="bottom_info">
                        <h3>선택정보 입력</h3>
                        <p>반려동물 생일</p>
                        <c:if test="${empty pvo.petAdoptionAt}"><input name="pet_adoption_at" type="date" data-placeholder="선택해주세요" required aria-required="true"></c:if>
                        <c:if test="${not empty pvo.petAdoptionAt}"><input name="pet_adoption_at" type="date" data-placeholder="${pvo.petAdoptionAt}" value="${pvo.petAdoptionAt}" required aria-required="true"></c:if>
                        <p>반려동물 성별</p>
                        <div>
                            <c:if test="${empty pvo.petGender}">
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
                        	</c:if>
                        	<c:if test="${pvo.petGender eq 'M'}">
                        		<button type="button" id="male" class="btn active">
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
	                            <input name="pet_gender" type="hidden" id="gender" value="M">
                        	</c:if>
                        	<c:if test="${pvo.petGender eq 'F'}">
                        		<button type="button" id="male" class="btn">
	                                <span class="material-symbols-outlined icon_gender">
	                                    male
	                                </span>
	                                <p>남아</p>
	                            </button>
	                            <button type="button" id="female" class="btn active">
	                                <span class="material-symbols-outlined icon_gender">
	                                    female
	                                </span>
	                                <p>여아</p>
	                            </button>
                           		<input name="pet_gender" type="hidden" id="gender" value="F">
                        	</c:if>
                        </div>
                        <p>반려동물 사진</p>
                        <div class="file_wrap">
     	                        <c:if test="${empty pvo.petPhoto}">
		                            <input class="file_name" value="" disabled>
		                            <label for="file">upload</label>
		                            <input type="file" id="file" name="pet_photo">
	                        	</c:if>
	   							<c:if test="${not empty pvo.petPhoto}">
		                            <input class="file_name" value="${pvo.petPhoto}" disabled>
		                            <label for="file">upload</label>
		                            <input type="file" id="file" name="pet_photo">
	                        	</c:if>
                        </div>
                    </div>
                </div> 
            </div>
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