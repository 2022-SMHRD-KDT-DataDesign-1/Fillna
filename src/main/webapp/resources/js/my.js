$(document).ready(function(e) {

    $(".icon_ham").parent("a").click(function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"0%"}, 200);
        $("body").css("overflow", "hidden");
    });

    $(".icon_x, .modal_overlay").click(function(){
        $(".modal_overlay").toggleClass("hide");
        $(".my_content").animate({right:"-75%"}, 200);
    })
    
    

});