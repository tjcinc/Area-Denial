[""] call BIS_fnc_logFormat;

VIRTUAL_BOX = nearestObject [[0,0,0], "B_supplyCrate_F"];
if (isNull VIRTUAL_BOX) then  
{
	VIRTUAL_BOX= "B_supplyCrate_F" createVehicleLocal  [0,0,0];
};
[call MAD_fnc_getRole] call MAD_fnc_Arsenal;
["Open",[nil, VIRTUAL_BOX, player]] call BIS_fnc_arsenal;







