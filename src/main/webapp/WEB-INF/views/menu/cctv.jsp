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
    <script src="resources/js/my.js"></script>
    
    <style>
    	.cctv_video {width: 100%;height: 100vh;}
   		.cctv_video html{overflow: hidden;}
    </style>
    
</head>
<body class="record_bg">
    <div class="wrapper" style="position:absolute;z-index:0;">
        <jsp:include page="../common/my.jsp"></jsp:include>
        <!-- header -->
        <header class="cctv_header">
            <ul>
                <li>
                    <a href="#">
                        <span class="material-symbols-outlined icon_ham">
                            menu
                        </span>
                    </a>
                </li>
                <li class="cam_name">
                    <span>CCTV01</span>
                </li>
            </ul>
            <div>
                <a href="#">
                    <span class="material-symbols-outlined icon_sound">
                        volume_up
                    </span>
                </a>
            </div>
        </header>
        <!-- info -->
       
        <!-- <div class="record_message">
            <div>
                <p>CCTV 영상 수신이 고르지 못합니다.</p>
                <p>네트워크를 확인해주세요.</p>
            </div>
        </div> -->
         <!-- bottom menu -->
	    <div class="record_bottom">
	      <div>
	          <a href="#">
	              <img src="resources/images/icon_home.png" alt="">
	          </a>
	      </div>
	      <div class="icon_record">
	          <a href="#" id="recordBtn">
	              <img src="resources/images/icon_record.png" alt="">
	          </a>
	      </div>
	      <div>
	          <a href="#">
	              <img src="resources/images/icon_menu.png" alt="">
	          </a>
	      </div>
	    </div>
	    
	    <iframe class="cctv_video" src="http://218.149.72.104:5000/"></iframe>
	    
    </div>
    
     
</body>
</html>