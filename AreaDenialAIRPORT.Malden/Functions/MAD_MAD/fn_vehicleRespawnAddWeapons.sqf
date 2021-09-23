if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat;
params['_veh'];
{_veh removeMagazine _x} forEach magazines _veh;


if (typeOf _veh isKindOf 'AIR') then 
{
	//{_veh addweapon _x} forEach ["M134_minigun"];
	//{_veh addmagazine _x} forEACH ["5000Rnd_762x51_Yellow_Belt","5000Rnd_762x51_Yellow_Belt"];
	{_veh addweapon _x} forEach ["CMFlareLauncher"];
	{_veh addmagazine _x} forEACH ["60Rnd_CMFlare_Chaff_Magazine","60Rnd_CMFlare_Chaff_Magazine"];
	
	{_veh addweapon _x} forEach ["LMG_Minigun_heli"];
    _veh addMagazines ["2000Rnd_65x39_Belt_Tracer_Green_Splash", 1]; 		
};
_type= typeOf _veh;
