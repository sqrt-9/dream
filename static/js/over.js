$(document).ready(function(){
	$('#ul li').mouseover(function(){
	msg = "<a class='answer'>回复</a>" 

	$(this).append(msg);
	});
	$('#ul li').mouseout(function(){
	$('.answer').remove();
	});	
});


