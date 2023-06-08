$(function(){
    $(".icon_ham").on("click", function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"0%"}, 200);
        $(".wrapper, body").css("overflow", "hidden");
    });

    $(".icon_x, .modal_overlay").click(function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"-75%"}, 200);
        $(".wrapper, body").css("overflow", "");
    })
});