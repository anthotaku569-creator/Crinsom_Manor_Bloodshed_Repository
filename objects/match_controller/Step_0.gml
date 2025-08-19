/// @description Insert description here
// You can write your code in this editor
/*
function deactivate_backgruound_instances(instance){
	array_push(objects_array, instance);
	instance_deactivate_object(instance);
}

function reactivate_backgruound_instances(){
	var reactiovation = function(_element)
	{
		var x1 = camera_get_view_x(view_camera[0]);
		var y1 = camera_get_view_y(view_camera[0]);
		var x2 = x1 + camera_get_view_width(view_camera[0]);
		var y2 = y1 + camera_get_view_height(view_camera[0]);
	    if point_in_rectangle( _element.x, _element.y, x1, y1, x2, y2){
			instance_activate_object(_element);
		}
	}
}
*/


if alarm_get(0) == -1{
	room_speed = 60
}

timing();

follow_players();

pause();

//reactivate_backgruound_instances();