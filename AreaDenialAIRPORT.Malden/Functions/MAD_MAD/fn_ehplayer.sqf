player setvariable['MFired', false, false];
[""] call BIS_fnc_logFormat;
EH_MADNAMEID = player addEventHandler ["Respawn", {
['SPAWN'] spawn MAD_fnc_extraInit;
['RESPAWN'] spawn MAD_fnc_tlspawn;

["1strespawn-eh"] call BIS_fnc_logFormat;
player removeEventHandler ["Respawn",EH_MADNAMEID] 
}]; 
 
player addEventHandler ["Respawn",
	{    	
	['RESPAWN'] spawn MAD_fnc_tlspawn;
	["respawn-eh"] call BIS_fnc_logFormat;
    }]; 

player addEventHandler
["HandleDamage", {

params ['_unit', '_selection', '_damage', '_source', '_projectile', '_hitIndex', '_instigator', '_hitPoint'];
	
	if !(alive _unit) ExitWith {};
	["handledamage-eh"] call BIS_fnc_logFormat;
	//systemchat format ['00: %1', !(player getvariable['MFired', 'idk'])];
	if !(_unit isEqualTo _source) then
	{
		if !(isNull _source) then
		{
			if ((_unit inArea t_e or _unit inArea t_w) and !(player getvariable['MFired', false])) then
			{  
				if ((_source getVariable ['_S', civilian]) isEqualTo S3_Side) then  
				{ 
					if (isnil 'MADTKMSG') then
					{
						MADTKMSG= true;
						[_source, "AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["playMove", _source];
						['NO TEAMKILLING !!!',
						['the player you are shooting at is invincible until he pulls trigger', 'BASTARD']] remoteExec ['hintc', _source, false];
						['AlarmCar'] remoteExec ['playsound', _source, false];
						[] spawn {sleep 1; MADTKMSG= nil};
					};
					_damage=0
				} 
				else 
				{
					if (isnil 'MADTKMSG') then
					{
						MADTKMSG= true;
						[_source, "AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["playMove", _source];
						
						if (isPlayer _source) then
						{
						['STOP SPAWNCAMPING',['the player you are shooting at is invincible until he pulls trigger or enter play area',
						'Play the zone']] remoteExec ['hintc', _source, false];
						};
						[] spawn {sleep 1; MADTKMSG= nil};
					};	
					_damage=0 
				};	
			};		
		};
	};
	_damage

}];

player addEventHandler ["Hit", {
	 ["hit-eh"] call BIS_fnc_logFormat;
		_unit setVariable['_BASTARD', _source, false];		
		if ((lifeState _unit == "INCAPACITATED")and (vehicle _unit != _unit)) then {moveOut _unit};
}];
player addEventHandler ["HandleRating",
{
["handlerating-eh"] call BIS_fnc_logFormat;
	params ["_unit", "_rating"];
		if (_rating<0) then
		{
			_unit addrating (-_rating);
		};
}];
player addEventHandler ["killed",
{
   ["killed-eh"] call BIS_fnc_logFormat;
	params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isNull _instigator) then {_instigator = _killer};
		if (_killer inArea t1 and {_unit inArea t1}) then {
		if (_unit isEqualTo _killer) then 
		{
			_bastard= _unit getVariable['_BASTARD', objNull];
  
		if (_bastard inArea t1 and {_killer inArea t1}) then {
		[_unit,-1,true] call bis_fnc_respawnTickets} else {[_unit,-1,true] call bis_fnc_respawnTickets};
		}
		else
		{
			[_unit,-1,true] call bis_fnc_respawnTickets;
		};
};      
        removeAllActions _unit;
      //  _unit switchCamera 'INTERNAL';
		_unit setVariable['_BASTARD', objNull, false];
		_unit setVariable ['_N', S3_NAME, false];
		_unit setVariable ['_S', S3_Side, false];
		['ROLE_CHANGE'] spawn MAD_fnc_arsenalAddRI;		
		player setvariable['MFired', false, false];
		//if !(isnil 'vis3D') then{removeMissionEventHandler ["EachFrame", vis3D];};			    
		[] spawn {['DEAD'] spawn MAD_fnc_tlspawn; };
		if (vehicle _unit != _unit) then { if (lifeState _unit == "DEAD-RESPAWN") then {moveOut _unit}; };		
}];


player addEventHandler ["GetOutMan", 
{
 ["getoutman-eh"] call BIS_fnc_logFormat;
 params ["_unit", "_role", "_vehicle", "_turret"];
_unit setVariable [_vehicle call BIS_fnc_netId, cameraView];
 
   /*  if !(isnil 'vis3D') then
	{
		removeMissionEventHandler ["EachFrame", vis3D];
	}; */
	
   // player switchCamera 'INTERNAL';
	
	[["MAD_VD_DEF", 666] call BIS_fnc_getParamValue] call MAD_fnc_setViewD;
	
	if (currentWeapon player isEqualTo secondaryWeapon player) then 
	{
		call MAD_fnc_titan_VD;
	};
	 player setvariable['_EARPLUGS', true, false];
	[MAD_VM_EA_ID] spawn MAD_fnc_EARPLUGS;
    
	params ["_unit", "_role", "_vehicle", "_turret"];
	if (_vehicle getVariable ['_armor', false]) then
	{
		player allowDamage false;
		player setvariable['MFired', false, false];
		
		[] spawn MAD_fnc_armor;
		
		
	};
	
}];




vehicle player addEventHandler ["FiredMan", //need test  (from minimap,altminimap)
	 {params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	 
	 player allowDamage true;
	 player setvariable['MFired', true, false];
	 if !(vehicle _unit inArea t1) then {
	 ['HINT', MAD_HUD_hintBASTARD,[1, 0.2, 0, 1]] spawn MAD_fnc_altminiMap;
	 };
 }];

player addEventHandler ["GetInMan", 
{
   ["GetinMan-eh"] call BIS_fnc_logFormat;
	params ["_unit", "_role", "_vehicle", "_turret"];
	private ['_vehicle'];
	_dist= ["MAD_VD_DEF", 666] call BIS_fnc_getParamValue;
	[["earplugs", "earplugson"], 5,"", 5, "", true, false, false, false] call BIS_fnc_advHint;
    [["vehhint", "vehicle"], 10,"", 20, "", true, true, true, true] call BIS_fnc_advHint;
	
	if  (_vehicle isKindOf 'land') then
	{
	     1 cutText ["<t  size='1.5'><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Press G to swap to gunner's / driver's seat<br/> Press R for lowgear</t>", "PLAIN", -1, true, true]; 
         //1 cutFadeOut 3; 
	};
	
	
	if  (_vehicle isKindOf 'Plane') then
	{
	    player setVariable ["LIB_canStaticLineJump",false];
	    player setvariable['MFired', true, false];
		_dist= 3000;
	};	
	if  (_vehicle isKindOf 'Helicopter') then
	{
		player setvariable['MFired', true, false];
		_dist= 2000;
	};
	
	/* if  (_vehicle isKindOf 'Tank') then
	{
	//player setvariable['MFired', true, false];
		
	}; */	
	
	if (difficultyOption "thirdPersonView" == 2) then
	{
		params ["_unit", "_role", "_vehicle", "_turret"];
		_unit switchCamera (_unit getVariable [_vehicle call BIS_fnc_netId, "INTERNAL"]);
	};
	
	if((vehicle player isKindOf "Plane") and (driver (vehicle player)) isEqualTo player) then
	{		
		_dist= 3000;
		[_vehicle] spawn{
		Params ['_vehicle'];
		private ['_vehicle','_result','_dist'];		
		_result = ["Press ok to takeoff ,Cancel to get out", "No Runway, No Problem", true, true] call BIS_fnc_guiMessage;		
		if !( _result isequalto true) then { moveout player; }else {[_vehicle]spawn MAD_fnc_fly;};
	  };
	};
	
	
	if( typeOf _vehicle in ["LIB_FlaK_36_AA_w","LIB_DAK_FlaK_36_AA","LIB_FlaK_36_AA","LIB_FlaK_38","LIB_Flakvierling_38","LIB_DAK_FlakPanzerIV_Wirbelwind_DLV","LIB_SdKfz_7_AA_DLV","LIB_SdKfz_7_AA_KOTH_DLV","LIB_SdKfz_7_AA","vn_b_sf_static_m45","vn_b_wheeled_m54_mg_02","vn_o_nva_65_static_zpu4","vn_o_nva_static_zpu4","vn_o_nva_navy_static_zpu4","vn_b_army_static_m45","vn_o_nva_65_static_dshkm_high_02","vn_o_nva_navy_static_dshkm_high_02","vn_o_vc_static_dshkm_high_02","vn_o_wheeled_btr40_mg_03_nva65","vn_o_wheeled_z157_mg_02_nva65","vn_o_wheeled_btr40_mg_03","vn_o_wheeled_btr40_mg_03_nvam","vn_o_wheeled_z157_mg_02_nvam","vn_o_wheeled_btr40_mg_03_vcmf","vn_o_wheeled_z157_mg_02_vcmf"]) then
	
	{	
        systemChat "view distance extended";	
		_dist= 3000;	
	};	
		
	[_dist] call MAD_fnc_setViewD;	
	 player setvariable['_EARPLUGS', false, false];
     [MAD_VM_EA_ID] spawn MAD_fnc_EARPLUGS;
	
}];

player addEventHandler ["InventoryOpened", {
    ["inventoryopened-eh"] call BIS_fnc_logFormat;
	[["itemhint", "item"], 10,"", 20, "", true, true, true, true] call BIS_fnc_advHint;
}];

