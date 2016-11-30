$(function(){
	$("#user_content").submit(function(){
		var content = $("#id_content").val();
		var dream_id = $("#id_dream").val();
		$.ajax({
			type:"post",
			dataType:"json",
			url:"/comment/",
			data:{'content':content,'dream_id':dream_id},
			success:function(data){
				$("#user_content")[0].reset();
				var newcomment = "<li class=\"\">"+"<div class=\"\">你:</div>"+
					"<div class=\"\">"+"<p>"+data.content+"</p>"+"</div>"+"<div class=\"time\">回复时间：刚刚</div>"+"</li>";
				$(".con").append(newcomment);
			}
		});
		return false;
	});
});
