<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	        <div class="bottom">
                <div id="monitoring_footer">
                    <a href="${contextPath}/monitoring">
                        <span class="material-symbols-outlined">
                            slideshow
                        </span>
                        <p>모니터링</p>
                    </a>
                </div>
                <div id="diary_footer">
                    <a href="${contextPath}/diary">
                        <span class="material-symbols-outlined">
                        edit_square
                        </span>
                        <p>건강수첩</p>
                    </a>
                </div>
                <div id="chart_footer">
                    <a href="${contextPath}/chart">
                        <span class="material-symbols-outlined">
                            analytics
                        </span>
                        <p>PATPAT리포트</p>
                    </a>
                </div>
            </div>
</body>
</html>