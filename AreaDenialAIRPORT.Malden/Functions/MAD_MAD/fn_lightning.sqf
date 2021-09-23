 [""] call BIS_fnc_logFormat;
	_group = createGroup independent; 
	_lightning = _group createUnit ["ModuleLightning_F", getPos _this, [], 0, "CAN_COLLIDE"]; 
	sleep 0.5;
	//vehicle _this setDamage 1;
	vehicle player setDamage 1;
   