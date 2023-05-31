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
    <link rel="stylesheet" href="resources/css/style.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css" />
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div id = "wrapper">
        <header>
            <div id="logo">
                <a href="#">
                    <img src="resources/images/logo_black.png">
                </a>
            </div>
            <div id="nav">
                <a href="#">서비스 바로가기</a>
            </div>
        </header>
        <div id="content">
            <div id="banner">
                <ul>
                    <li>
                        <div class="text"></div>
                        <p id="text_p">: 쓰담쓰담</p>
                    </li>
                    <li>
                        <div class="text2"></div>
                        <div class="text3"></div>
                        <div class="text4"></div>
                        <p id="text2_p">당신의 반려동물을 위한 <span>최선의 건강관리</span></p>
                    </li>
                </ul>
            </div>
            <div id="nav_mo">
                <a href="#"><span>서비스 바로가기</span><span class="icon_pointer material-symbols-outlined">touch_app</span></a>
            </div>
            <div class="landingC">
                <ul class="landingC_in">
                    <li data-aos="fade-down" data-aos-offset="10" data-aos-easing="linear" data-aos-duration="500">
                        <img src="resources/images/logo_wfont.png">
                        <p>실시간 반려동물 건강상태 모니터링 서비스</p>
                    </li>
                    <li>
                        <a href="#"  data-aos="fade-up" data-aos-offset="10" data-aos-easing="linear" data-aos-duration="500">서비스 시작하기</a>
                    </li>
                </ul>
            </div>
            <ul class="landingW">
                <li  class="landingW_writing floatL" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        사람 모자이크 처리로<br><span>사생활 보호 최우선</span>
                    </h3>
                    <p>
                        반려동물과 함께 생활하는 우리의 사생활을 보호하기 위해<br>
                        사람을 우선 인지하는 객체 인식 모델을 통해 모자이크 처리합니다
                    </p>
                </li>
                <li  class="landingW_img floatR" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img01.png">
                </li>
            </ul>
            <ul class="landingW">
                <li class="landingW_img floatL" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img02.png">
                </li>
                <li class="landingW_writing floatR" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        다묘&다견가정도 OK<br><span>반려동물을 각각 인식하여 관리</span>
                    </h3>
                    <p>
                        둘 이상의 반려동물을 키우는 가정에서도 가능합니다<br>
                        반려동물의 상하좌우앞뒤 이미지를 통해 각각 다른 객체로 인식하고<br>
                        반려동물마다 각각의 알림과 그래프를 제공합니다
                    </p>
                </li>
            </ul>
            <!--모바일버전 start-->
            <ul class="landingWM">
                <li  class="landingW_writing " data-aos="fade-down" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        사람 모자이크 처리로<br><span>사생활 보호 최우선</span>
                    </h3>
                    <p>
                        반려동물과 함께 생활하는 우리의 사생활을 보호하기 위해<br>
                        사람을 우선 인지하는 객체 인식 모델을 통해 모자이크 처리합니다
                    </p>
                </li>
                <li  class="landingW_img" data-aos="fade-top" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img01.png">
                </li>
            </ul>
            <ul class="landingWM">
                <li class="landingW_writing" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        다묘&다견가정도 OK<br><span>반려동물을 각각 인식하여 관리</span>
                    </h3>
                    <p>
                        둘 이상의 반려동물을 키우는 가정에서도 가능합니다<br>
                        반려동물의 상하좌우앞뒤 이미지를 통해 각각 다른 객체로 인식하고<br>
                        반려동물마다 각각의 알림과 그래프를 제공합니다
                    </p>
                </li>
                <li class="landingW_img" data-aos="fade-bottom" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img02.png">
                </li>
            </ul>
            <!--모바일버전 end-->
            <div class="landingC2">
                <h3>상황별 3가지 알림기능<br><span>카카오 알림톡 기능으로 확인</span></h3>
                <ul class="landingC2_in">
                    <li data-aos="fade-up" data-aos-offset="10" data-aos-easing="linear" data-aos-duration="600">
                        <div>
                            주의상황시<br><span>[주의]알림 & 메모</span>
                        </div>
                    </li>
                    <li data-aos="fade-up" data-aos-offset="10" data-aos-easing="linear" data-aos-duration="600">
                        <div>응급상황시<br><span>[긴급]알림</span></div>
                    </li>
                    <li data-aos="fade-up" data-aos-offset="10" data-aos-easing="linear" data-aos-duration="600">
                        <div>하루 한번<br><span>[일지]알림</span></div>
                    </li>
                </ul>
            </div>
            <ul class="landingW">
                <li  class="landingW_writing floatL" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        단순한 펫CCTV가 아닌,<br><span>실시간 이상행동 영상녹화 서비스</span>
                    </h3>
                    <p>
                        기존의 단순한 펫CCTV 기능에 더하여<br>
                        반려동물의 건강상태 판단에 최적화시킨 AI 모델을 활용하여<br>
                        실시간으로 이상행동을 녹화합니다
                    </p>
                </li>
                <li class="landingW_img floatR" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img01.png">
                </li>
            </ul>
            <ul class="landingW">
                <li class="landingW_img floatL" data-aos="fade-right" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img02.png">
                </li>
                <li class="landingW_writing floatR" data-aos="fade-left" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        반려동물의 특이행동을<br><span>날짜별/행동별 그래프로 제공</span>
                    </h3>
                    <p>
                        주요 특이행동들을 그래프를 통해 제공함으로써<br>
                        정보들을 시각화하여 한눈에 파악하기 쉽게 서비스합니다<br>
                        날짜별/행동별로 체크하여 장기간 아이의 행동변화를 확인하세요
                    </p>
                </li>
            </ul>
            <!--모바일 버전 start-->
            <ul class="landingWM">
                <li  class="landingW_writing" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        단순한 펫CCTV가 아닌,<br><span>실시간 이상행동 영상녹화 서비스</span>
                    </h3>
                    <p>
                        기존의 단순한 펫CCTV 기능에 더하여<br>
                        반려동물의 건강상태 판단에 최적화시킨 AI 모델을 활용하여<br>
                        실시간으로 이상행동을 녹화합니다
                    </p>
                </li>
                <li class="landingW_img" data-aos="fade-top" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img01.png">
                </li>
            </ul>
            <ul class="landingWM">
                <li class="landingW_writing" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="400">
                    <h3>
                        반려동물의 특이행동을<br><span>날짜별/행동별 그래프로 제공</span>
                    </h3>
                    <p>
                        주요 특이행동들을 그래프를 통해 제공함으로써<br>
                        정보들을 시각화하여 한눈에 파악하기 쉽게 서비스합니다<br>
                        날짜별/행동별로 체크하여 장기간 아이의 행동변화를 확인하세요
                    </p>
                </li>
                <li class="landingW_img" data-aos="fade-top" data-aos-easing="linear" data-aos-duration="400">
                    <img src="resources/images/landingW_img02.png">
                </li>
            </ul>
            <!--모바일 버전 end-->
        </div>
        <footer>
            Copyright 2023. (fillna) All pictures cannot be copied without permission.
        </footer>
        <a href="#" class="return-top" style="display: block;">top</a>
    </div>

    <script>
        /*타이핑 효과*/
        const content = "PATPAT"
        const text = document.querySelector(".text")
        const content2 = "PET"
        const text2 = document.querySelector(".text2")
        const content3 = "HEALTH"
        const text3 = document.querySelector(".text3")
        const content4 = "CARE"
        const text4 = document.querySelector(".text4")
       
        let index = 0;
        let index2 = 0;
        let index3 = 0;
        let index4 = 0;
        
        document.getElementById("text_p").className ='fade';
        document.getElementById("text2_p").className ='fade';

        function typing(){
            text.textContent += content[index++]
            if(index > content.length){
                text.textContent = ""
                index = 0;
            }
            document.getElementById("text_p").className ='';
        }
        function typing2(){
            
            text2.textContent += content2[index2++]
            if(index2 > content2.length){
                text2.textContent = ""
                index2 = 0;
            }
        }
        function typing3(){
            text3.textContent += content3[index3++]
            if(index3 > content3.length){
                text3.textContent = ""
                index3 = 0;
            }
        }
        function typing4(){
            text4.textContent += content4[index4++]
            if(index4 > content4.length){
                text4.textContent = ""
                index4 = 0;
            }
            document.getElementById("text2_p").className ='';
        }
        var intervalld = setInterval(typing, 140);
        setTimeout(function(){
            clearTimeout(intervalld);
            //text.style.setProperty("border-right","none");

            var intervalld2 = setInterval(typing2, 65);
            setTimeout(function(){
                clearTimeout(intervalld2);
                //text2.style.setProperty("border-right","none");

                var intervalld3 = setInterval(typing3, 65);
                setTimeout(function(){
                    clearTimeout(intervalld3);
                    //text3.style.setProperty("border-right","none");
                    
                    var intervalld4 = setInterval(typing4, 65);
                    setTimeout(function(){
                        clearTimeout(intervalld4);
                        //text4.style.setProperty("border-right","none");
                    }, 300);
                }, 400);
            }, 230);
        }, 900);


		/*aos스크롤*/
		AOS.init();

        /*scroll-top*/
        $(document).ready(function(e) {
            $(".return-top").hide();//탑 버튼 숨김
            
            $(function(){
                $(window).scroll(function(){
                    if($(this).scrollTop() > 120){ //버튼 보이는 시작 위치
                        $(".return-top").fadeIn();
                    } else {
                        $(".return-top").fadeOut();
                    }
                });

            
            $(".return-top").click(function(){
                $("body,html").animate({
                    scrollTop : 0
                }, 800);//스크롤 이동속도
                return false;
            });
        });
        });



    </script>

</body>
</html>