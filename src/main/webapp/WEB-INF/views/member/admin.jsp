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
	<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=b38c873dac6c4b245d22412fae37e4af&redirect_uri=http://localhost:8081/controller/kakaotalk/login&scope=friends,profile_nickname,profile_image,account_email,phone_number,talk_message">
		<img src="resources/images/icon_kakao.png" alt="">
		<span>메시지 보내기</span>
	</a>
</body>
</html>