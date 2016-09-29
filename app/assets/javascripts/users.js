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
    if(data.status == "hit"){
      $("#"+x+"-"+y)['0'].innerHTML = '<i class="fa fa-check"></i>';
    }else if(data.status == "miss"){
      $("#"+x+"-"+y)['0'].innerHTML = '<i class="fa fa-times"></i>';
    }
    getShipsSunk();
    getGameStatus();
	});
}

function getShipsSunk() {
  user_id = $("#user_id").data("id");
  $.ajax({
		method: "Get",
		url: "/ships_sunk",
		data:
			{
				user_id:user_id,
        authenticity_token:authenticity_token
			}
	}) .done(function( data ) {
    $("#ships_sunk")['0'].innerHTML = data;
	});
}

function getGameStatus() {
  user_id = $("#user_id").data("id");
  $.ajax({
		method: "Get",
		url: "/game_status",
		data:
			{
				user_id:user_id,
        authenticity_token:authenticity_token
			}
	}) .done(function( data ) {
    $("#game_status")['0'].innerHTML = data;
	});
}
