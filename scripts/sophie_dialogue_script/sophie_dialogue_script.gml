function sophie_dialogue_script( _text, _delete, _side){
	if instance_exists(Obj_Sofia_Dialogue){
		if _delete == true{
			instance_destroy(Obj_Sofia_Dialogue);
			var _dlg = instance_create_depth(0,0,0,Obj_Sofia_Dialogue);
			_dlg.full_text = _text;
			_dlg.side = _side;
		}
	}
	else{
		var _dlg = instance_create_depth(0,0,0,Obj_Sofia_Dialogue);
		_dlg.full_text = _text;
		_dlg.side = _side;
	}
	if instance_exists(obj_Sofia){
		obj_Sofia.s_states = sophie_actions.talking;
		obj_Sofia.alarm[0] = 60
	}
}