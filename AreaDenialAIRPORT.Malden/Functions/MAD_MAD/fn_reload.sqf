[""] call BIS_fnc_logFormat;
_weapon= currentWeapon player;
	if (_weapon isEqualto '' or !(primaryWeapon player isEqualTo _weapon)) Exitwith {};
	if ((player ammo _weapon) isEqualTo 0 and vehicle player isKindOf 'MAN'and missionNamespace getvariable['_ll',true]) then
	{
		
		
		_mags= getArray (configFile >> 'CfgWeapons' >>  _weapon >> 'Magazines');
		_magazinesAmmo = magazinesAmmo player;
		{
			_x params['_mag','_ammoCount'];
			if (_mag in _mags) ExitWith
			{
				missionNamespace setvariable['_ll',false, false];
				
				[_weapon, _mag, _ammoCount] spawn
				{
					params ['_weapon','_mag','_ammoCount'];
					player removeMagazine currentMagazine player;
					player removePrimaryWeaponItem  currentMagazine player;
					
					_snd= (getArray (configFile >> 'CfgWeapons' >>  _weapon >> 'reloadMagazineSound')select 0)+'.wss';
					
					_oldAnim= animationState player;
					//1
					//[player,"AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon_gear"] remoteExec ["switchMove",0,false];
					
					//2
					[player,"AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon"] remoteExec ["switchMove",0,false];
					playSound3D [_snd, player];	
					
					sleep 1;
					[player,_oldAnim] remoteExec ["switchMove",0,false];
					if (alive player) then {player addWeaponItem [_weapon,  [_mag, _ammoCount]] };
					missionNamespace setvariable['_ll',true, false];
				};
				_handled= true;
			};
		} forEach _magazinesAmmo;
	};