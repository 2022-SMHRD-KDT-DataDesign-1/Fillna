$(document).ready(function(e) {

        $(".alaram_list").children("li").on("click", function(){
            console.log('click');
            $(this).children(".icon_up").toggleClass("hide");
            $(this).next().toggleClass("hide");
        });
});