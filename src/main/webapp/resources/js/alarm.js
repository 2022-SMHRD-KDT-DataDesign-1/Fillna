$(document).ready(function(e) {
        let goAlarmDetail = $(".go_alarm_detail");
        let goBtn = $(".btn_show_detail");

        goAlarmDetail.on("click", function(){
            $(this).children("button").toggleClass("hide");
            $(this).next().toggleClass("hide");
        });

        $(".wrapper").on("mousewheel", function(){
            let h = $(this).height() + "px";
            $(".alarm_line").css("height", h);
        });

        let alramWrap = $(".alarm_wrap");

});