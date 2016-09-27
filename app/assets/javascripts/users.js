function nuke(x,y){
  user_id = $("#user_id").data("id");
  authenticity_token = $("#authenticity_token").data("token");

  $.ajax({
		method: "Post",
		url: "/nuke.json",
		data:
			{	x:x,
				y:y,
				user_id:user_id,
        authenticity_token:authenticity_token
			}
	}) .done(function( data ) {
    $("#"+x+"-"+y).addClass(data.status);
    $("#"+x+"-"+y).prop('onclick',null);
	});
}
