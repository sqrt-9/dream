$(".nav-slider>a").click(function(){
	$(this).addcClass("active").siblings().removeClass("active");
	var $width = $(this).width();
	var $index = $(this).index();
	$(".on").stop(true,true).animate({"left":$width*$index+5+"px"},300);
	$(this).parents(".index-body").children(".change").children().eq($index).stop(true,false).show().siblings().hide();
	});