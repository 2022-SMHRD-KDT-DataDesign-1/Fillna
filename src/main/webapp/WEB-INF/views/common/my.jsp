<%@page import="kr.patpat.entity.Pet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %> 
<%@ page import="java.lang.Math" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/js/my.js"></script>
</head>
<body>
        <div class="modal_overlay hide"></div>
        <div class="my_content">
            <div class="my_top">
                <a href="${contextPath}/monitoring">
                    <img src="resources/images/logo4.png" alt="">
                </a>
                <div class="icon_x">
                    <img src="resources/images/icon_x.png" alt="">
                </div>
                <a href="https://kauth.kakao.com/oauth/logout?client_id=b38c873dac6c4b245d22412fae37e4af&logout_redirect_uri=http://localhost:8081/controller/logout">
                    <img src="resources/images/icon_logout.png" alt="">
                </a>
                <a href="${contextPath}/updateForm">
                    <img src="resources/images/icon_my_set.png" alt="">
                </a>
            </div>
            <div class="my_profile">
                <c:set var="petPhotoPath" value="${pvo.petPhotoPath}"/>
               	<c:set var = "length" value = "${fn:length(petPhotoPath)}"/>
                <img src="${fn:substring(petPhotoPath, 42, length)}" alt="">
				<%
					// 현재 날짜
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(new java.util.Date());
 					int currentYear = calendar.get(Calendar.YEAR);
					
					// 반려동물 생년월일
					Pet pvo = (Pet)session.getAttribute("pvo");
					String dateString = pvo.getPetAdoptionAt();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date petDate = dateFormat.parse(dateString);
					calendar.setTime(petDate);
					int petYear = calendar.get(Calendar.YEAR);
					
					// 반려동물 나이 출력
					int diff = currentYear - petYear;
					
					String month="";
			        if(dateString.substring(5, 7).length() < 10) {
			        	month = dateString.substring(6, 7);
			        } else if(dateString.substring(5, 7).length() >= 10){
			        	month = dateString.substring(5, 7);
			        }
				%>
                <p>탄이 <span><%=month%>월 <%=dateString.substring(8)%>일 (<%=diff%>살)</span></p>
                
            </div>
            <div>
                <a href="#">
                    <img src="resources/images/ad.png" alt="">
                </a>
            </div>
            <div class="my_menu">
                <ul>
                    <li>
                        <a href="${contextPath}/alarm">
                            <img src="resources/images/icon_my_alarm.png" alt="">
                            <span>알림톡 리스트</span>
                        </a>
                    </li>
                    <li>
                        <a href="${contextPath}/monitoring">
                            <img src="resources/images/icon_my_monitor.png" alt="">
                            <span>모니터링</span>
                        </a>
                    </li>
                    <li>
                        <a href="${contextPath}/chart">
                            <img src="resources/images/icon_my_report.png" alt="">
                            <span>PATPAT 리포트</span>
                        </a>
                    </li>
                    <li>
                        <a href="${contextPath}/diary">
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
                <a href="#">
                    <span>FAQ</span>
                </a>
            </div>
        </div>
</body>
</html>