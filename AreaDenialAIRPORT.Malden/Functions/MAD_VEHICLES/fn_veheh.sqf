
[""] call BIS_fnc_logFormat;
	
	params ["_vehicle", "_unit"];
	_unit action ["eject", _vehicle];
	diag_log format ["uniteject: %1,vehicle: %2", _unit, _vehicle];
	sleep 1; _unit setvariable['MFired', true, true];	

