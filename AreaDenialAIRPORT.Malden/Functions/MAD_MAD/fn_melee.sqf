 [""] call BIS_fnc_logFormat;
0 spawn
{
	{player reveal _x} forEach nearestObjects [player, ["man"], 5];	
	if (animationState player != "acts_miller_knockout" and vehicle player == player) then
	{
		player playMove "acts_miller_knockout";  
		player setAnimSpeedCoef 3; 
		sleep 1;
		_ne= cursorTarget;
		if ((Player distance _ne < 2.5)&& (_ne isKindOf "Man")) then 
		{ 
			if !(isPlayer _ne) then { _ne setDamage 1 };
			[player, _ne, name _ne] remoteExec ['MAD_fnc_meleeSP', 2, false];
			//_ne setDamage ( damage _ne + random [0.85, 0.9, 0.92]);
		};
		sleep 1;
		player setAnimSpeedCoef 1; 
		[player,""] remoteExec ["switchMove",0,false]
	};
};	