 [""] call BIS_fnc_logFormat;
params ['_killer', '_victim', '_name'];
[_killer, _victim, _name] spawn
{
	params ['_killer', '_victim', '_name'];
	
	_Bullet= "B_408_Ball" createVehicle [0,0,0];
	_Bullet setShotParents [_killer, _killer];
	sleep 0.15;
	_victim setDamage 1;
	_Bullet attachto [_victim,[0,0,0.3],'spine3'];
	detach _Bullet;
	_Bullet setVelocity ([0,0,-3] vectorMultiply 15); 
	sleep 0.5;
	if (!alive _victim and _victim !=objNull) then 
	{ 
		[format['%2 WAS MELEED BY %1 ', name _killer, _name]] remoteExec ['systemChat', 0, false]; 
		[_killer, 3] remoteExec ['addScore', 2, false];
	};
	deleteVehicle _Bullet;
	
};