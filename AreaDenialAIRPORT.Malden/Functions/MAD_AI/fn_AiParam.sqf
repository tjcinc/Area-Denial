if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat;
if (['MAD_AI_ON', 1] call BIS_fnc_getParamValue isEqualTo 0) then{ []spawn MAD_fnc_aiInit }else {MAD_MAD_Ai = 0;};