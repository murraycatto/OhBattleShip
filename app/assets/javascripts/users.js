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
