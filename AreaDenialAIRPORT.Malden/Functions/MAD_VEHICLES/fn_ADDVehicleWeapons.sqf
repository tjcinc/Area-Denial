if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat; 
//ADD
params['_vehicle','_uWeapons'];
{
//diag_log format ['AAS_fnc_ADDVehicleWeapons>>> V: %1', typeof _vehicle];
		_turret= _x select 1;
	_weapons= _x select 0;
	{
	//diag_log format ['AddWeaponTurret %1 %2 ', _x, _turret]; 
	_vehicle AddWeaponTurret [ _x, _turret];  _vehicle AddWeaponTurret [ _x, _turret];} forEach _weapons;
	
} forEach (_uWeapons select 0);
{
//diag_log format ['AddMagazineTurret %1 %2 %3 ', _x select 0, _x select 1, _x select 2];

 _cnt= _x select 2; if (_cnt==0) then { _cnt=100500; };  _vehicle AddMagazineTurret [_x select 0, _x select 1, _cnt] } forEach (_uWeapons select 1);
 
 /* if (_vehicle inArea 're_1') then {_vehicle setObjectTextureGlobal [0, "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa"]};

if (_vehicle inArea 'rw_1') then {_vehicle setObjectTextureGlobal [0, "\A3\Air_F_Beta\Heli_Transport_01\Data\Heli_Transport_01_ext01_CO.paa"]};

[_vehicle] remoteExec ['MAD_fnc_addHoldAction', 0, true];
 */
