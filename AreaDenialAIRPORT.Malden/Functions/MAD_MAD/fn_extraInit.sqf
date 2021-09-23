
params['_fnc'];
switch (_fnc) do
{
	case 'INIT':
	{
    ["INIT-extrainit"] call BIS_fnc_logFormat;	
	[] call Mad_fnc_ehplayer;
    [missionNamespace, "arsenalOpened", {_this call MAD_fnc_arsenalOpened;[]spawn MAD_fnc_WML; }] call BIS_fnc_addScriptedEventHandler;
	[missionNamespace, "arsenalClosed",{[] spawn MAD_fnc_SoundPatch;[]spawn MAD_fnc_WML;player setVariable ["c_inventory", getUnitLoadout player, false];} ] call BIS_fnc_addScriptedEventHandler;	
	disableSerialization; 
	private['_display'];
	waituntil {_display = findDisplay 46; !isnull _display};
	_display displayAddEventHandler ["KeyDown", "_this call MAD_fnc_keypress"];
	[_display,'INIT'] call MAD_fnc_dragEntityEnable; //v
	[] call MAD_fnc_MAD_Click;
	[] spawn MAD_fnc_fortify;	
	['AC'] spawn MAD_fnc_banApply; 
	[] spawn MAD_fnc_noThermal;	
	[] call MAD_fnc_welcome;
	[] call MAD_fnc_antiCampProtection;	
	//[missionNamespace, "arsenalOpened", {_this call MAD_fnc_arsenalOpened;[]spawn MAD_fnc_WML; }] call BIS_fnc_addScriptedEventHandler;
	//[missionNamespace, "arsenalClosed",{[] spawn MAD_fnc_SoundPatch;[]spawn MAD_fnc_WML;player setVariable ["c_inventory", getUnitLoadout player, false];} ] call BIS_fnc_addScriptedEventHandler;
   // ["Preload"] call BIS_fnc_arsenal;	
	};
	
	case 'SPAWN':
	{
    ["SPAWN-extrainit"] call BIS_fnc_logFormat; 	
	if (["MAD_CLASS", 1] call BIS_fnc_getParamValue isEqualTo 0) then 
	{	 
    ['INIT'] call MAD_fnc_miniMap;	   
	} else	
	{ 
	 ['INIT'] call MAD_fnc_altminiMap;     	 
	};	
	[] call MAD_fnc_minesMod_ON;
	[] call MAD_fnc_drawNametag;
	['INIT'] call MAD_fnc_banApply;
	[] call MAD_fnc_MAD_Tears;
	["Preload"] call BIS_fnc_arsenal;      
	};	
};