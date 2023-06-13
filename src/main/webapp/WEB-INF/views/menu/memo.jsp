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
		<jsp:include page="../common/header2.jsp"></jsp:include>
        <div class="content">
            <div class="con">
                <form action="#" method="post" id="memo_form">
                    <div class="memo_title">
                        <div class="mini_title">메모주제 선택(증상별 정보제공)</div>
                        <div>
                            <input type="button" class="select_symptom_list" value="써클링">
                                <span class="material-symbols-outlined icon_down">
                                    keyboard_arrow_down
                                </span>
                                <span class="material-symbols-outlined icon_memo_up hide">
                                    keyboard_arrow_up
                                </span>
                            </input>
                            <ul class="sympton_list">
                                <li><button type="button">방귀뿡</button></li>
                                <li><button type="button">재채기</button></li>
                                <li><button type="button">똥싸기</button></li>
                                <li><button type="button">그루밍</button></li>
                                <li><button type="button">테스트</button></li>
                                <li><button type="button">고양이</button></li>
                                <li><button type="button">강아지</button></li>
                                <li><button type="button">그루밍</button></li>
                                <li><button type="button">써클링</button></li>
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
                                <input class="file_name" value="" disabled>
                                <label for="file" class="memo_upload">upload</label>
                                <input name="memo_photo" type="file" id="file">
                            </div>
                        </div>
                        <div class="memo_write">
                            <div class="mini_title">메모하기</div>
                            <textarea name="pet_memo" id="" cols="30" rows="10" placeholder="최대 50자까지 입력이 가능합니다."></textarea>
                        </div>
                        <div class="memo_save">
                            <a href="">저장</a>
                        </div>
                    </div>
                </form>
            </div>

		<jsp:include page="../common/footer.jsp"></jsp:include>
        </div>
    </div>
<script>
    $(document).ready(function(e) {
    	
    	$(".title").toggleClass("hide");

        let selectBtn = $(".select_symptom_list");

        selectBtn.on("click", function(){
            console.log("click");
            $(".icon_memo_up").toggleClass("hide");
            $(".icon_down").toggleClass("hide");
            $(".sympton_list").toggleClass("on");
        });

        $(".sympton_list").children("li").children("button").on("click", function(e){
            selectBtn.val($(this).text());
            $(".sympton_list").toggleClass("on");
            $(".icon_memo_up").toggleClass("hide");
            $(".icon_down").toggleClass("hide");
        });

        $("#file").change(function(e){
            let fileName = $("#file").val();
            $(".file_name").val(fileName);
        });

        $(".memo_save").on("click", function(){
            $("#memo_form").submit();
        })

    });
</script>
</body>
</body>
</html>