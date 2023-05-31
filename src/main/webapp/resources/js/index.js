$(document).ready(function(){
	
	$("#male").on("click", function(){
	    $("#pet_gender").val("M");
	    console.log($("#pet_gender").val());
		$(this).toggleClass("active");
		$(".btn").not($(this)).removeClass("active");
	});
	
	$("#female").on("click", function(){
	    $("#pet_gender").val("F");
	    console.log($("#pet_gender").val());
		$(this).toggleClass("active");
		$(".btn").not($(this)).removeClass("active");
	});
		
	$("#file").change(function(){
	    let fileName = $("#file").val();
	    $(".file_name").val(fileName);
	});
	
	$("#submit").on("click", function(){
		$("#update_form").submit();
	});
	
	$('#time').timepicker({
        timeFormat:"HH:mm",
        dropdown:false,
    });
});    

