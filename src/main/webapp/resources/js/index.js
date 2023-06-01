$(document).ready(function(){
	
	$("#male").on("click", function(){
	    $("#gender").val("M");
	    console.log($("#gender").val());
		$(this).toggleClass("active");
		$(".btn").not($(this)).removeClass("active");
	});
	
	$("#female").on("click", function(){
	    $("#gender").val("F");
	    console.log($("#gender").val());
		$(this).toggleClass("active");
		$(".btn").not($(this)).removeClass("active");
	});
		
	$("#file").change(function(){
	    let fileName = $("#file").val();
	    $(".file_name").val(fileName);
	});
	
	$("#time").timepicker({
        timeFormat:"HH:mm",
        dropdown: true
    });
	
	$("#save").on("click", function(){
		$("#update_form").submit();
	});
});    

