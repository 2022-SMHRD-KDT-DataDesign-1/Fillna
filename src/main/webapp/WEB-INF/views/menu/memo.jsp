<%@page import="kr.patpat.entity.Memo"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Locale" %>
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
</head>
<body>
    <body class="bg">
    <div class="wrapper">
		<jsp:include page="../common/my.jsp"></jsp:include>
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
		        <li class="title">
			       <%
			       		String dateString = (String)session.getAttribute("date");
			       		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
 				     	Date memoDate = dateFormat2.parse(dateString);
				     	
				        Calendar calendar = Calendar.getInstance();
				        calendar.setTime(memoDate);
				        int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
				         
				        String[] weekDays = {"일", "월", "화", "수", "목", "금", "토"};
				        
				        String month = "";
				        
				        if(dateString.substring(5, 7).length() < 10) {
				        	month = dateString.substring(6, 7);
				        } else if(dateString.substring(5, 7).length() >= 10){
				        	month = dateString.substring(5, 7);
				        }
			       %>
			       <span class="material-symbols-outlined icon_back" onclick="">
			            arrow_back
			       </span>
			       <span>메모하기 - <%=month%>월 <%=dateString.substring(8)%>일</span>
			       <span><%=weekDays[dayOfWeek - 1]%>요일</span>
		        </li>
	        </ul>
        </header>
        <!-- modal -->
        <div class="modal hide">
            <div class="modal_back"></div>
            <div class="modal_content">
                파일이 없습니다. 다시 작성해주세요
                <button class="btn_close">
                    <span class="material-symbols-outlined icon_close">
                    close
                    </span>
                </button>
            </div>
        </div>
        <div class="content">
            <div class="con">
                <form method="post" id="memo_form" enctype="multipart/form-data">
                	<input type="hidden" value="${vo.mbIdx}" name="mbIdx">
                	<input type="hidden" value="${mvo.memoIdx}" name="memoIdx">
                    <div class="memo_title">
                        <div class="mini_title">메모주제 선택(증상별 정보제공)</div>
                        <div>
                        <c:if test="${not empty mvo.memoIdx}">
                            <input type="button" class="select_symptom_list" value="${category}"/>
                        </c:if>
                        <c:if test="${empty mvo.memoIdx}">
                            <input type="button" class="select_symptom_list" value="써클링"/>
                        </c:if>
                        	<input type="hidden" class="sympton" name="category">
                            <span class="material-symbols-outlined icon_down">
                                keyboard_arrow_down
                            </span>
                            <span class="material-symbols-outlined icon_memo_up hide">
                                keyboard_arrow_up
                            </span>
                            <ul class="sympton_list">
                                <li><button type="button">써클링</button></li>
                                <li><button type="button">발작</button></li>
                                <li><button type="button">후지마비</button></li>
                                <li><button type="button">재채기</button></li>
                                <li><button type="button">피부긁음</button></li>
                                <li><button type="button">구토</button></li>
                                <li><button type="button">배변</button></li>
                                <li><button type="button">그루밍</button></li>
                                <li><button type="button">개구호흡</button></li>
                                <li><button type="button">식사</button></li>
                                <li><button type="button">일지</button></li>
                                <li><button type="button">기타</button></li>
                            </ul>
                        </div>
                    </div>
                    <div class="memo_detail">
                        ※ 성묘 : 써클링을 지속적으로 하는 경우 뇌병변, 인지장애, 두부외상, 뇌수막염 등이 의심됩니다.
                        외상으로 머리를 다치지 않았는지 확인해 주시기 바랍니다.
                        <br><br>
                        ※ 노령묘 : 한 자리에서 지속적으로 써클링을 하는 경우 초기 치매가 의심됩니다. 벽을 타고 돌거나,
                        방향감각 상실 등을 동반할 수 있습니다.
                    </div>
                    <div class="memo_input">
                        <div class="memo_photo">
                            <div class="mini_title">사진 업로드</div>
                            <div class="file_wrap">
                            <c:if test="${not empty mvo.memoContent}">
                                <input class="file_name" value="${mvo.memoPhotoName}" disabled>
                            </c:if>
                            <c:if test="${empty mvo.memoContent}">
                                <input class="file_name" value="" disabled>
                            </c:if>
                                <label for="file" class="memo_upload">upload</label>
                                <input type="file" id="file" name="file">
                            </div>
                        </div>
                        <div class="memo_write">
                            <div class="mini_title">메모하기</div>
                            <c:if test="${not empty mvo.memoContent}">
	                            <textarea name="memocontent" id="" cols="30" rows="10" spellcheck="false">${mvo.memoContent}</textarea>
                            </c:if>
                            <c:if test="${empty mvo.memoContent}">
	                            <textarea name="memocontent" id="" cols="30" rows="10" placeholder="최대 50자까지 입력이 가능합니다." spellcheck="false"></textarea>
                            </c:if>
                        </div>
                        <c:if test="${not empty mvo.memoIdx}">
                        <div class="memo_update">
	                    	수정
	                    </div>
                        </c:if>
                        <c:if test="${empty mvo.memoIdx}">
                        <div class="memo_save">
                            저장
                        </div>
                        </c:if>
                    </div>
                </form>
            </div>

		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
<script>
    $(document).ready(function(e) {

        let selectBtn = $(".select_symptom_list");

        selectBtn.on("click", function(){
            console.log("click");
            $(".icon_memo_up").toggleClass("hide");
            $(".icon_down").toggleClass("hide");
            $(".sympton_list").toggleClass("on");
        });

        $(".sympton_list").children("li").children("button").on("click", function(e){
            selectBtn.val($(this).text());
            $(".sympton").val($(this).text());
            $(".sympton_list").toggleClass("on");
            $(".icon_memo_up").toggleClass("hide");
            $(".icon_down").toggleClass("hide");
        });

        $("#file").change(function(e){
    		var fileName = $(this).val().toString().split('/').pop().split('\\').pop();
       	  
            $(".file_name").val(fileName);
        });

        $(".memo_save").on("click", function(){
        	$("#memo_form").attr("action", "${contextPath}/memo/write");
            $("#memo_form").submit();
            // uploadFile();
        });
        
        $(".memo_update").on("click", function(){
        	$("#memo_form").attr("action", "${contextPath}/memo/updatecom");
        	$("#memo_form").submit();
        	// uploadFile();
        });
        
    	if(${msgType=="nofile"}){
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
</body>
</html>