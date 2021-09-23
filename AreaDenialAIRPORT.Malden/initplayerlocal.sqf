#include "Mission\params.hpp"
"m1" setMarkerAlphaLocal  1;
[] spawn MAD_fnc_diary;
[["Welcomehint", "intro"], 10,"", 20, "", true, true, false, true] call BIS_fnc_advHint;
disableSerialization;
params['_fnc'];		

waitUntil { !isNull findDisplay 46 };

		
SAVE_007=0;
MAD_ready =false;
UID= getPlayerUID player;
S3_NAME=profileName;

if (["MAD_CLASS", 1] call BIS_fnc_getParamValue isEqualTo 0) then 
	{	 
     S3_Side= if (vehicleVarName player find 'W'>=0) then {WEST} else {RESISTANCE};      
	 //for ger vs us 	   
	} else	
	{ 
	 S3_Side= if (vehicleVarName player find 'W'>=0) then {WEST} else {EAST}; 
	};
if (uiNamespace getVariable ["MAD_IN_AIR", true]) then {uiNamespace setVariable ["MAD_IN_AIR", false]} ;
player setVariable ['_N', S3_NAME, true];
player setVariable ['_S', S3_Side, true];
player setvariable['_groupspawn', false, false];
['INIT'] call MAD_fnc_arsenalAddRI;
['INIT'] spawn MAD_fnc_extraInit;
[] spawn MAD_fnc_lowgear;
[[t_w,t_e]] call BIS_fnc_drawAO;
true remoteExec ["BIS_fnc_drawRespawnPositions", 0];
[["MAD_VD_DEF", 666] call BIS_fnc_getParamValue] call MAD_fnc_setViewD;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
player setUnitTrait ["engineer",true];
player setUnitTrait ["explosiveSpecialist",true];
player setUnitTrait ["uavhacker",true,true];
if (["MAD_CLASS", 1] call BIS_fnc_getParamValue isEqualTo 4) then 
	{     	   
	player setUnitTrait ["vn_artillery",true,true];
	};
"m1" setMarkerAlphaLocal  0;

sleep 1;
['DEAD'] spawn MAD_fnc_tlspawn; 
enableEnvironment [false, true]; 