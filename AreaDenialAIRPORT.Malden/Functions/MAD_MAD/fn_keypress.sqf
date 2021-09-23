 
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
//#include "..\..\Mission\params.hpp"


private['_handled'];
_handled= false;
params['_d','_key','_shift_state','_control_state','_alt_state'];
    _veh =(vehicle player); 
	//if (inputAction "personView" > 0) then { if (_veh == player) then { _handled= true } };
	//if (inputAction "TacticalView" > 0) then { if (_veh == player) then { _handled= true } };
	//if (inputAction "SwitchWeapon" > 0) then  {[] spawn MAD_fnc_FULLAUTO; };
    	

	if ((inputAction "swapGunner" > 0) and !(_veh == player) and !(_veh isKindOf 'AIR')) then 	
		{ 		
		if ((driver _veh isEqualTo player) and (_veh emptyPositions "gunner">0)) then
		{  
		if (isnull (gunner _veh)) then {player action ["movetogunner", _veh]; _handled= true;};
		}
		else
		{
		if (((gunner _veh) isEqualTo player) and (_veh emptyPositions "driver">0)) then
		{  
		if (isnull (driver _veh)) then {player action ["movetodriver", _veh]; _handled= true;};	
		} 
		else
		{
		if (((commander _veh) isEqualTo player) and (_veh emptyPositions "driver">0)) then
		{  
		if (isnull (driver _veh)) then {player action ["movetodriver", _veh]; _handled= true;};
		}
		else
		{
		if ((isnull (gunner _veh))and (_veh emptyPositions "gunner">0)) then {player action ["movetogunner", _veh]; _handled= true;}
		}; 
		};	
		};
		_handled= true;
		};	
	if ((inputAction "swapGunner" > 0) and (_veh isKindOf 'AIR')) then { _handled= true;};
	 
	if (!(secondaryWeapon player isEqualTo "") and {(inputAction "SwitchWeapon"+ inputAction "SwitchSecondary"+inputAction "Action")> 0}) then 
	{ 
		if (currentWeapon player isEqualTo secondaryWeapon player) ExitWith {};
		call MAD_fnc_titan_VD; 
	}; //extends aa vd  


switch (_key) do
{
	/* case DIK_NUMPADENTER : 
	{
		if (vehicle player != player) then 
		{
			if( isNil "vis3D") then 
			{
			vis3D = addMissionEventHandler ["EachFrame", { player switchCamera "EXTERNAL" }]
			} else 
			{
				removeMissionEventHandler ["EachFrame", vis3D];
				vis3D = nil;
			};
		};
	}; */	
	case DIK_F1: 
	{
    // hint parseText (localize 'STR_HELP_F1');	
	if (isNull (findDisplay 454)) then {createDialog 'MAD_WELCOME'}else {closeDialog 454;};
	//[["help", "intructions"], 5,"", 5, "", true, true, false, true] call BIS_fnc_advHint;
	};		 
	
	
	case DIK_F2:
	{
	if(['MAD_CLASS',1] call BIS_fnc_getParamValue isEqualTo 0)then
	{	if (_control_state and ((!isServer && call BIS_fnc_admin == 2) || isServer)) then {if (isNull (findDisplay 404)) then {  createDialog 'S3_ADMINMENU2'}; }; 
	} else
	{	if (_control_state and ((!isServer && call BIS_fnc_admin == 2) || isServer)) then {if (isNull (findDisplay 404)) then {  createDialog 'S3_ADMINMENU'}; }; 	
	};
	};		
	
	case DIK_3: 
	{
		if (currentWeapon player==secondaryWeapon player) ExitWith {};
		player selectWeapon secondaryWeapon player; 
		call MAD_fnc_titan_VD;
	}; 
	case DIK_4: 
	{
		if !(vehicle player isKindOf 'MAN') ExitWith {}; 
		call S3_Ifnc_Mine;
		_handled= true;
	};
	
	case DIK_5: 
	{
	if !(vehicle player isKindOf 'MAN') ExitWith {}; 
		S3_MY_IED_A= not S3_MY_IED_A;
		if (S3_MY_IED_CNT>0) then 
		{
			call S3_Ifnc_IED;
		};
     _handled= true	;	
	};
	case DIK_6: {call Mad_fnc_melee;_handled= true;};	
	
	};//switch
	
_handled;
// if (vehicle player != player) then {case DIK_C: {player forceWeaponFire ["CMFlareLauncher","Burst"]; };}; //for scripted flares
/* case DIK_F2: 
	{
	if (_control_state  and call BIS_fnc_admin >1) then {if (isNull (findDisplay 404)) then {  createDialog 'S3_ADMINMENU2'}; };	
	}; */ 

