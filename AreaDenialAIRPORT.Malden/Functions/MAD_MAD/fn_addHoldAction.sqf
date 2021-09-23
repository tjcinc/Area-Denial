
params['_veh'];
if !(alive _veh) ExitWith {}; 
[""] call BIS_fnc_logFormat;
MAD_stop= false;
[_veh, 
"<t color='#AAFF30'>Repair</t>",
"\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa",
" (!(canMove _target) or (damage _target>0.4)) and {(player distance2D _target <5)} and {vehicle player isEqualTo player}",
"!MAD_stop", 
{ MAD_stop=false }, // Code executed when action starts
{
	params ["_target", "_caller"];  
	if (!alive _target or {!(cursorObject isEqualto _target)} or {(_caller distance2D _target >5)}) then {MAD_stop= true}
}, // Code executed on every progress tick												
{
	params ["_target", "_caller"];
	
	/* _debug= call BIS_fnc_admin >1;
	if (_debug) then { systemchat format['_caller: %1 _target: %2 cond:%3', _caller, _target, _target in nearestObjects [_caller, [], 3] and {alive _caller}] }; */
	
	if (!MAD_stop and {alive _caller} and {(_target distance2D _caller <6) }) then
	{
		_target setDamage 0;
		//if (_debug) then { systemchat format['_target: %1 setDAMAGE 0 TEST: %2', _target, damage _target] };
	};	
	MAD_stop=false;
}, 
{ }, 
[], 
5, //repair
100, //priority
false, false] call BIS_fnc_holdActionAdd;


