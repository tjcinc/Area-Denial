[""] call BIS_fnc_logFormat;
_weapons= ["launch_B_Titan_F","rhs_weap_igla","rhs_weap_fim92","CUP_launch_FIM92Stinger_Loaded","CUP_launch_9K32Strela_Loaded","CUP_launch_Igla_Loaded","launch_I_Titan_F","vn_sa7b","vn_sa7"];
if (secondaryWeapon player in _weapons) then 
{
	[2000] call MAD_fnc_setViewD;
	[_weapons] spawn
	{
		params['_weapons'];
		waitUntil
		{
			sleep 1;
			//change weapon or get in vehicle
			!(currentWeapon player in _weapons) or !(vehicle player isKindOf 'MAN')
		};
		if (vehicle player isKindOf 'MAN') then
		{
			[["MAD_VD_DEF", 666] call BIS_fnc_getParamValue] call MAD_fnc_setViewD;
		};
	};
	
}; 