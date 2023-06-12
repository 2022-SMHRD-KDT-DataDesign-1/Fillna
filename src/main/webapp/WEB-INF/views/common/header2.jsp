<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
                <li class="alarm_header hide">
                    <span>알림톡 LIST</span>
                    <span></span>
                </li>
                
                <!-- diary header -->
                <li class="diary_header hide">
                <%
				  // 현재 날짜 가져오기
				  Date currentDate = new Date();
				
				  // 날짜 포맷 설정
				  SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-E");
				  
				  String today = dateFormat.format(currentDate);
				  out.print("<span>"+today.substring(1, 2)+"월 "+today.substring(3, 5)+"일 </span>");  
				  out.print("<span>"+today.substring(6, 7)+"요일 </span>");
                  out.print("<span class='material-symbols-outlined icon_calendar'>calendar_month</span>");
                %>
                </li>
                
                <!-- chart header -->
                <li class="chart_header hide">
                    <span>PATPAT 리포트</span>
                    <span></span>
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
        
<script>
	$(function(){
		$("#save").on("click", function(){
			$("#update_form").submit();
		});
		
		if(${not empty msg}){
			$(".modal").toggleClass("hide");
			$(".btn_close").click(function(){
				$(".modal").toggleClass("hide");
			});
			
			$(".modal_back").click(function(){
				$(".modal").toggleClass("hide");
			});
		}
		
		
	});
</script>
</body>
</html>