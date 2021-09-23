[""] call BIS_fnc_logFormat;
params['_role'];

[VIRTUAL_BOX, VIRTUAL_BOX call BIS_fnc_getVirtualWeaponCargo] call BIS_fnc_removeVirtualWeaponCargo;
[VIRTUAL_BOX, VIRTUAL_BOX call BIS_fnc_getVirtualMagazineCargo] call BIS_fnc_removeVirtualMagazineCargo;
[VIRTUAL_BOX, VIRTUAL_BOX call BIS_fnc_getVirtualItemCargo] call BIS_fnc_removeVirtualItemCargo;
[VIRTUAL_BOX, VIRTUAL_BOX call BIS_fnc_getVirtualBackpackCargo] call BIS_fnc_removeVirtualBackpackCargo;

_weapons=[];
_magazines=[];
_items=[];
_backpacks=[];


_mask='';
_mask= _role;


/*
_playerSide= tolower (str (side player));
switch (_role) do 
{
	case (localize "STR_ASSAULT"): { _mask=  _playerSide+'_assault' };
	case (localize "STR_GUNNER"): {	_mask=  _playerSide+'_gunner' };
	case (localize "STR_GRENADIER"): {	_mask=  _playerSide+'_grenadier' };
	case (localize "STR_MEDIC"): {	_mask=  _playerSide+'_medic' };
	case (localize "STR_LIGHT_AT"): {	_mask=  _playerSide+'_lightat' };
	case (localize "STR_HEAVY_AT"): {	_mask=  _playerSide+'_heavyat' };
	case (localize "STR_SAPPER"): {	_mask=  _playerSide+'_sapper' };
	case (localize "STR_SNIPER"): {	_mask=  _playerSide+'_sniper' };
	case (localize "STR_RECON"): {	_mask=  _playerSide+'_recon' };
	case (localize "STR_ENGINEER"): {	_mask=  _playerSide+'_repair' };
	case (localize "STR_SLEADER"): {	_mask=  _playerSide+'_sleader' };
};
//*/



private _allClasses = "true" configClasses (missionconfigFile>>"CfgRespawnInventory") apply { configName _x }; 

missionNamespace setVariable['AAS_profile', _mask, false];

//*
//systemchat ('   _mask1:'+ str _mask);
_mask= _mask select [0, (count _mask)-2];  
//systemchat ('   _mask2:'+ str _mask);
//*/

{
	_CfgRI= _x;
	//systemchat (str _CfgRI + '   _mask:'+ str _mask);
	if (str _CfgRI find _mask> -1) then	
	// 											_mask==_sleader_1 	west_sleader2 find _sleader_1 false
	//_mask= _mask select [0, (count _mask)-2]; _mask==_sleader  	west_sleader2 find _sleader True
	{
		//systemchat (str _CfgRI + 'Found');
		//Add weapons
		{
			_weapons pushBackUnique _x;
		} forEach getArray (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "weapons");
		//Add uniform
		_items pushBackUnique getText (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "uniformClass");
		//Add magazines
		{
			_magazines pushBackUnique _x;
		} forEach getArray (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "magazines");
		//Add items
		{
			_items pushBackUnique _x;
		} forEach getArray (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "items");
		//Add linked items
		{
			_items pushBackUnique _x;
		} forEach getArray (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "linkedItems");
		//Add backpack
		_backpacks pushBackUnique getText (missionconfigFile >> "CfgRespawnInventory" >> _CfgRI >> "backpack");	
	};
} forEach _allClasses;


_mask= _role;
//ArsenalLoadoutConfig
//systemchat str (getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _mask >> "backpacks"));
{
	_weapons pushBackUnique _x;
} forEach getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _mask >> "weapons");
{
	_items pushBackUnique _x;
} forEach getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _mask >> "items");
{
	_backpacks pushBackUnique _x;
} forEach getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _mask >> "backpacks");
{
	_magazines pushBackUnique _x;
} forEach getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _mask >> "magazines");

//systemchat str (getArray (missionconfigFile >> "ArsenalLoadoutConfig" >> _mask >> "weapons")); 

[VIRTUAL_BOX, _weapons, false, false] call BIS_fnc_addVirtualWeaponCargo;
[VIRTUAL_BOX, _magazines, false, false ] call BIS_fnc_addVirtualMagazineCargo;
[VIRTUAL_BOX, _backpacks, false, false ] call BIS_fnc_addVirtualBackpackCargo;
[VIRTUAL_BOX, _items, false, false ] call BIS_fnc_addVirtualItemCargo;
