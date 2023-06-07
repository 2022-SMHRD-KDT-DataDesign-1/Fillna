$(document).ready(function(e) {

    $(".icon_ham").parent("a").click(function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"0%"}, 200);
    });

    $(".icon_x").click(function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"-75%"}, 200);
    })

});