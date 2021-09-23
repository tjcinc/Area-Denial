if( isServer ) then
   {
[""] call BIS_fnc_logFormat;
#define S3_VehSpawn 30
#define S3_TankSpawn 15
#define S3_HeliSpawn 60
#define S3_PlaneSpawn 60
#define S3_BastardSpawn 60
#define MAX_DAMAGE 0.8
//#define ARRAY_damage=[/* 'rhsusf_m1a1tank_base','rhsusf_m1a2tank_base' */ ]; //for adjusting rhs damage not complete.

  
	
	
	_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: {tools= "LIB_ToolKit";};	
    case 1: {tools= "ToolKit";};	
	case 2: { tools= "ToolKit";};
	case 3: { tools= "ToolKit";};
    case 4: {tools= "vn_b_item_toolkit";}; 	
    };
	
scriptName ('OLD RESPAWN ('+ gettext(configFile >> 'CfgVehicles' >> typeof (_this select 0)  >> 'displayName')+')');
[""] call BIS_fnc_logFormat;
private [ "_respawnDelay", "_theVehicle", "_startDirection", "_startPos", "_typ", "_lastUsedTime", "_abandoned", "_threadUID",
	"_Vdata", "_uhealth","_upylons","_uWeapons",'_uTextures',"_pylonPaths",'_saveName','_mobile','_oldRP','_velocity','_vehvarname','_animations'];

	_theVehicle   = _this select 0;
	params['',["_mobile", civilian, [civilian]]];
	diag_log str _theVehicle;
	clearWeaponCargoGlobal _theVehicle;
	clearMagazineCargoGlobal _theVehicle;
	clearBackpackCargoGlobal _theVehicle;
	clearItemCargoGlobal _theVehicle;
	_theVehicle disableTIEquipment true;
	_theVehicle addItemCargoGlobal ["FirstAidKit", 4];
	_theVehicle addItemCargoGlobal [tools, 1];
	_theVehicle setVehicleReportRemoteTargets true;
	_theVehicle  setVehicleReportOwnPosition true;
	_typ           = typeOf _theVehicle;
	_velocity = velocity _thevehicle;
	[_theVehicle] call MAD_fnc_ADDTextures_Actions;
	_saveName=  'Veh_'+ (_theVehicle call BIS_fnc_netId);
	[_theVehicle, [missionNamespace, _saveName] ] call BIS_fnc_saveVehicle;
	_uTextures= [];
	_uTextures= getObjectTextures _theVehicle;
    _upylons= getPylonMagazines _theVehicle;
	_uWeapons= _theVehicle call MAD_fnc_saveVehicleWeapons; 
	_startDirection = getDir _theVehicle;
	_startPos= getPos _theVehicle;
	_saveName=  'Veh_'+ (_theVehicle call BIS_fnc_netId);
	[_theVehicle, [missionNamespace, _saveName] ] call BIS_fnc_saveVehicle;	
	//[_thevehicle] remoteExec ['MAD_fnc_addHoldAction', 0, true];
	
	if (_mobile isEqualTo WEST) then
	{     	
	_oldRP=[west, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;
    	
    if(typeOf _theVehicle in ["LIB_C47_Skytrain"]) then { _thevehicle setvariable ["LIB_disableCargoActions",true,true]; w_air setCaptive true;};
	
	if !(typeOf _thevehicle isKindOf 'AIR') then {_theVehicle setVariable ['_armor', true, true];};	
	[ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
	_thevehicle addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];			
	if (side(group _unit)!= WEST) then {	
    [_vehicle,_unit] spawn MAD_fnc_veheh;	
	};
	}];			
	};
	if (_mobile isEqualTo EAST) then
	{     
	_oldRP=[east, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;    	
	if !(typeOf _thevehicle isKindOf 'AIR') then{ _theVehicle setVariable ['_armor', true, true];};
	[ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
	_thevehicle addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];				
	if (side(group _unit) != EAST) then {		
    [_vehicle,_unit] spawn MAD_fnc_veheh;		
	};
	}];		
	};
	if (_mobile isEqualTo RESISTANCE) then	
	{      
	_oldRP=[resistance, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;	
    if(typeOf _theVehicle in ["LIB_C47_Skytrain"]) then { _thevehicle setvariable ["LIB_disableCargoActions",true,true]; r_air setCaptive true;};	
	if !(typeOf _thevehicle isKindOf 'AIR') then	{_theVehicle setVariable ['_armor', true, true];};		
	[ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
	_thevehicle addEventHandler ["GetIn", {
	params ["_vehicle", "_role", "_unit", "_turret"];    	
	if (side(group _unit) != RESISTANCE) then { 	
    [_vehicle,_unit] spawn MAD_fnc_veheh;		
	};
	}];	
	};	
   
	
	if(typeOf _theVehicle in ["B_Heli_Light_01_dynamicLoadout_F"/* ,"vn_o_air_mi2_03_05 ","vn_b_air_oh6a_04" */ ]) then
	{
		{_theVehicle addweapon _x} forEach ["CMFlareLauncher"];
		{_theVehicle addmagazine _x} forEACH ["60Rnd_CMFlare_Chaff_Magazine","60Rnd_CMFlare_Chaff_Magazine"];
	};
	
	_abandoned = false;
	_lastUsedTime = time;
	_threadUID = round (random 10000);

	
	_respawnDelay = ["S3_VehSpawnTime",15] call BIS_fnc_getParamValue;
	if( _theVehicle isKindOf "Tank") then { _respawnDelay = ["S3_TankSpawnTime",15] call BIS_fnc_getParamValue; };
	if( _theVehicle isKindOf "Helicopter") then { _respawnDelay = ["S3_HeliSpawnTime",15] call BIS_fnc_getParamValue; };
	if( _theVehicle isKindOf "Plane") then { _respawnDelay = ["S3_PlaneSpawnTime",15] call BIS_fnc_getParamValue; };	
	if(typeOf _theVehicle in ["LIB_C47_Skytrain","LIB_PzKpfwIV_H_tarn51c","LIB_M4A3_76_HVSS","B_APC_Tracked_01_rcws_F","O_APC_Wheeled_02_rcws_v2_F","B_APC_Wheeled_01_cannon_F","B_Heli_Light_01_dynamicLoadout_F","RHS_MELB_AH6M","RHS_M2A3","rhs_brm1k_vv","O_Heli_Light_02_dynamicLoadout_F","CUP_B_LAV25_HQ_USMC","CUP_O_BTR90_HQ_RU","CUP_O_UH1H_gunship_SLA",	"CUP_B_UH1Y_Gunship_Dynamic_USMC","CUP_B_MCV80_GB_W","CUP_B_Boxer_HMG_GER_WDL","CUP_B_AW159_RN_Blackcat","CUP_B_M2Bradley_NATO_T","CUP_B_BMP2_CZ","CUP_B_FV510_GB_W","CUP_B_AH6M_USA","vn_o_air_mi2_03_05 ","vn_b_air_oh6a_04","vn_b_armor_m41_01_02","vn_o_armor_type63_01" ]) then 	 
	{
	_respawnDelay = ["S3_BasSpawnTime",15] call BIS_fnc_getParamValue;
	_theVehicle setVariable ['_mobile', true, true];	
	};

	while { true } do
	{
	sleep 5 + (random 10);

	if( (_theVehicle distance _startPos) < 20 ) then { _lastUsedTime = time; };
	if ( ({alive _x} count (crew _theVehicle)) > 0) then { _lastUsedTime = time };
	if( (_theVehicle distance _startPos) < 10 and !(canMove _theVehicle) ) then
	{
	_abandoned = true;
	};		
	if( (time-_lastUsedTime) >(["S3_AbandonTime",15] call BIS_fnc_getParamValue)) then	
	{
	_abandoned = true;
	};
	if( ((damage _theVehicle) > MAX_DAMAGE) or _abandoned ) then
	{	
	
	if ({alive _x} count (crew _theVehicle) > 0) exitWith {};
	
	sleep (_respawnDelay / 5);
	if ({alive _x} count (crew _theVehicle) > 0) exitWith {};
	//if !({alive _x} count (crew _theVehicle) > 0) then {{moveOut _x} forEach crew _theVehicle;};
	if (_mobile in [WEST,EAST,RESISTANCE]) then
	{	
	_oldRP call BIS_fnc_removeRespawnPosition;
	};
	deleteVehicle _theVehicle;
	_theVehicle = objNull;			
	
	sleep (_respawnDelay );
	
			
		if(getNumber(configFile >> "CfgVehicles" >> _typ >> "isUav")==1) then
		{
		_theVehicle = createVehicle [_typ, _startPos, [], 0, "FLY"];
		createVehicleCrew _thevehicle;				
		}			
		else
		{
		_theVehicle = _typ createVehicle _startPos;
		};		
	
		if (_mobile isEqualTo WEST) then			
		{
		 if (typeOf _theVehicle in ["CUP_B_AW159_RN_Blackcat","CUP_B_UH1Y_Gunship_Dynamic_USMC","CUP_B_AH6M_USA","vn_o_air_mi2_03_05 ","vn_b_air_oh6a_04"]) then {_thevehicle setVehicleVarName "w_air";};
		
		if (typeOf _theVehicle in ["LIB_C47_Skytrain"])  then {						 
		_theVehicle = createVehicle [_typ, _startPos, [], 0, "FLY"];
		_thevehicle setVehicleVarName "w_air";	
		_thevehicle setvariable ["LIB_disableCargoActions",true,true];
		_theVehicle flyInHeight 350;	 
		_thevehicle setVelocity _velocity;//fine		
		_grp = createVehicleCrew _theVehicle;		
		_tempGroup = createGroup civilian;
        { [_x] joinSilent _tempGroup; } foreach (crew _thevehicle);
		_pilot = currentPilot _thevehicle;
		_grp2= group _pilot;                	              
		_wType1= 'LOITER';				
		_target= getMarkerPos "ai_w";
		_wp= _grp2 addWaypoint[_target, 0,1]; 	
		_wp setWaypointType _wType1;			   
		[_grp2, 1] setWaypointLoiterRadius 150;
		[_grp2, 1] setWaypointLoiterType "CIRCLE_L";
		[_grp2, 1] setWaypointSpeed "LIMITED";		
		[_grp2, 1] setWaypointTimeout [2700, 2700,2700];
		[_grp2, 1] setWaypointBehaviour "CARELESS";      		
		};		
		_oldRP=[west, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;      		
		if !(typeOf _thevehicle isKindOf 'AIR') then{_theVehicle setVariable ['_armor', true, true];};
        [ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
		_thevehicle addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];				
		if (side(group _unit) != WEST) then {		
        [_vehicle,_unit] spawn MAD_fnc_veheh;			
		};
		}];			
		};
		if (_mobile isEqualTo EAST) then
		{ 
		 if (typeOf _theVehicle in ["CUP_B_AW159_RN_Blackcat","CUP_B_UH1Y_Gunship_Dynamic_USMC","CUP_B_AH6M_USA","vn_o_air_mi2_03_05 ","vn_b_air_oh6a_04"])then {_thevehicle setVehicleVarName "e_air";};          	
		_oldRP=[east, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;      		
		if !(typeOf _thevehicle isKindOf 'AIR') then { _theVehicle setVariable ['_armor', true, true];};
        [ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
		_thevehicle addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];				
		if (side(group _unit) != EAST) then {		
        [_vehicle,_unit] spawn MAD_fnc_veheh;			
		};
		}];				
		};		
		
		if (_mobile isEqualTo RESISTANCE) then
		{ 	 
   	     if (typeOf _theVehicle in ["LIB_C47_Skytrain"])  then {					
		_thevehicle setVehicleVarName "r_air";
		_thevehicle setvariable ["LIB_disableCargoActions",true,true];
		_theVehicle = createVehicle [_typ, _startPos, [], 0, "FLY"];
		_theVehicle flyInHeight 375;
		_thevehicle setVelocity _velocity;		
		_grp = createVehicleCrew _theVehicle;       
        _tempGroup = createGroup civilian;
        { [_x] joinSilent _tempGroup; } foreach (crew _thevehicle);	   
		_pilot = currentPilot _thevehicle;
		_grp2= group _pilot;                	              
		_wType1= 'LOITER';				
		_target= getMarkerPos "ai_e";
		_wp= _grp2 addWaypoint[_target, 0,1]; 	
		_wp setWaypointType _wType1;			   
		[_grp2, 1] setWaypointLoiterRadius 150;
		[_grp2, 1] setWaypointLoiterType "CIRCLE_L";
		[_grp2, 1] setWaypointSpeed "LIMITED";		
		[_grp2, 1] setWaypointTimeout [2700, 2700,2700];
		[_grp2, 1] setWaypointBehaviour "CARELESS";       		
		};		
		_oldRP=[resistance, _theVehicle,"Mobile Respawn "+ gettext(configFile >> 'CfgVehicles' >> _typ >> 'displayName')] call BIS_fnc_addRespawnPosition;		
		if !(typeOf _thevehicle isKindOf 'AIR') then {_theVehicle setVariable ['_armor', true, true];};
		[ _theVehicle, ['ARSENAL',{['BASTARD'] call MAD_fnc_arsenalPrepare; }, 0, 10, true, true, "", "speed _target == 0",10, false]] remoteExec ["addAction", 0, true];
		_thevehicle addEventHandler ["GetIn", {
		params ["_vehicle", "_role", "_unit", "_turret"];
        private ["_vehicle", "_unit"];		
		if (side(group _unit) != RESISTANCE) then {			
		[_vehicle,_unit] spawn MAD_fnc_veheh;
		};
		}];			
		};          
		
		_theVehicle disableTIEquipment true;
		[_theVehicle, [missionnamespace, _saveName]] call MAD_fnc_loadVehicle;			
					
	   
		if !(_theVehicle isKindOf "Air") then
		{
		[_theVehicle, _theVehicle call MAD_fnc_saveVehicleWeapons] call MAD_fnc_ClearVehicleWeapons;
		[_theVehicle, _uWeapons] call MAD_fnc_ADDVehicleWeapons;
		} else
		{
		_veh = _thevehicle;
		private _allPylons = "true" configClasses ( configFile>>"CfgVehicles" >> (typeOf _veh) >> "Components">>"TransportPylonsComponent">>"pylons"
		) apply {configName _x};
		_pylonsToRemove = getPylonMagazines _veh;
		_vehTurrets = [[-1]] + allTurrets _veh;
		{
		_weaponToRemove = getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
		{
		_veh removeWeaponTurret [_weaponToRemove, _x];
		} forEach _vehTurrets;
		} forEach _pylonsToRemove;
		//hint str _pylonsToRemove;
		{
		_veh setPylonLoadOut [_x, ""];
		} forEach _allPylons;	
		_pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _theVehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
		{ _theVehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]; } forEach _upylons;
		};
		
		
		if(typeOf _theVehicle in ["B_Heli_Light_01_dynamicLoadout_F"/* ,"vn_o_air_mi2_03_05 ","vn_b_air_oh6a_04" */ ]) then
		{
		{_theVehicle addweapon _x} forEach ["CMFlareLauncher"];
		{_theVehicle addmagazine _x} forEACH ["60Rnd_CMFlare_Chaff_Magazine","60Rnd_CMFlare_Chaff_Magazine"];
		};
        
		[_theVehicle] call MAD_fnc_ADDTextures_Actions;
		clearWeaponCargoGlobal _theVehicle;
		clearMagazineCargoGlobal _theVehicle;
		clearBackpackCargoGlobal _theVehicle;
		clearItemCargoGlobal _theVehicle;
		_theVehicle addItemCargoGlobal ["FirstAidKit",4];
		_theVehicle addItemCargoGlobal [tools, 1];			
		_theVehicle setPos _startPos;
		_theVehicle setDir _startDirection;
		{ _theVehicle setObjectTextureGlobal [_forEachIndex, _x];  } forEach _uTextures;
		
		
		_theVehicle setVehicleReportRemoteTargets true;
		_theVehicle  setVehicleReportOwnPosition true;
		
		AAS_PublicAddActionsAndEH = _theVehicle;
		publicVariable "AAS_PublicAddActionsAndEH";
		//if (['MAD_ZEUS', 1] call BIS_fnc_getParamValue isEqualTo 0) then{zeus addCuratorEditableObjects [[_thevehicle],true ];};	
		{
		 _x addCuratorEditableObjects [[_thevehicle],true ];
		} foreach allcurators;
		_abandoned = false;
		_lastUsedTime = time;
		};

	};
};

//not currently used
//if(getNumber(configFile >> "CfgVehicles" >> typeof _thevehicle >> "isUav")==1) then{createVehicleCrew _thevehicle;};		
