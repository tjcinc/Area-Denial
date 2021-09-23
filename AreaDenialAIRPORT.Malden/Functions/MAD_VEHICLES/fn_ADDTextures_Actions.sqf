if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat; 
params['_vehicle'];
    if !((["MAD_CLASS", 1] call BIS_fnc_getParamValue isEqualTo 0)or(["MAD_CLASS", 1] call BIS_fnc_getParamValue isEqualTo 4)) then
	{	 
    if (_vehicle inArea 're_1') then {_vehicle setObjectTextureGlobal [0, "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa"]};
	if (_vehicle inArea 'rw_1') then {_vehicle setObjectTextureGlobal [0, "\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_CO.paa"]}; 	
	};
    [_vehicle] remoteExec ['MAD_fnc_addHoldAction', 0, true];
