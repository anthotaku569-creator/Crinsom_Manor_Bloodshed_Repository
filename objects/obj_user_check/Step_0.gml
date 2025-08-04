/// @description Insert description here
// You can write your code in this editor

if (point_in_rectangle(mouse_x, mouse_y, x , y, x + 160, y + 24))
{
   mouse_enter = true;
   if mouse_check_button_pressed(mb_left) {
	   room_goto(Menu_1)
   }
}
else{
	mouse_enter = false;
}