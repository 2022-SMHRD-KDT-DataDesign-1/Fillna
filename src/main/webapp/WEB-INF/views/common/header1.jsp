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
<body>

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
            </ul>
        </header>
</body>
</html>