[""] call BIS_fnc_logFormat;
		MAD_WML=[['3Rnd_HE_Grenade_shell',4],['MiniGrenade',5],['HandGrenade',5],['RPG7_F',5]];//Magazines 

		_pmags= magazines player;
		{
		_x params['_mag','_maxCnt'];
		if (_mag in _pmags) then
		{
			_cnt= count (_pmags select {_x isEqualTo _mag});
			if (_cnt>_maxCnt) then
			{
				_delCnt= _cnt- _maxCnt;
				for "_i" from 1 to _delCnt do { player removeMagazine _mag };
				_info= getText (configFile >> 'cfgMagazines' >> _mag >> 'DisplayName');
				player sidechat format['%1  %2 REMOVED,THE LIMIT IS %3', _delCnt, _info, _maxCnt];
				player action ["rearm", player];
			};
		};
		} forEach MAD_WML;


		_role= call MAD_fnc_getRole;
		_w= getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _role >> "weapons");
		_item= getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _role >> "Items");
		_uniform = uniform player;
		_backpack =backpack player;
		_backpacks= getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> _role >> "backpacks");
		//copyToClipboard str _backpack;
		{
		if (_x !='') then
		{
			if !(_x in _w) then
			{
				player removeWeapon _x;	
				systemchat format['Weapon not allowed for this class: %1 [%2]', getText (configFile >> 'cfgWeapons' >> _x >> 'DisplayName'), _x];
				//copytoclipboard format[' %2', getText (configFile >> 'cfgWeapons' >> _x >> 'DisplayName'), _x];
			};
			
		};
		} forEach [primaryWeapon player, secondaryWeapon player, handgunWeapon player];

		{
		if (_x !='') then
		{
			if !(_x in _item) then
            			
			
			{
				player removePrimaryWeaponItem _x;  				
				//hintc str _x; 
				//systemchat format['Item not allowed for this class: %1 [%2]', getText (configFile >> 'cfgWeapons' >> _x >> 'DisplayName'), _x]; 
				systemchat format['Item not allowed for this class: %1[%2]', getText (configFile >> 'cfgWeapons' >> _x  >> 'DisplayName'), _x];
				//copyToClipboard format['%2', getText (configFile >> 'cfgWeapons' >> _x  >> 'DisplayName'), _x];
			};			
		};
		} forEach PrimaryWeaponitems player;

		if (_uniform!='') then
		{
		if !(_uniform in _item) then   			
		{
		removeUniform player ;				
		systemchat format['Uniform not allowed for this class']; 			 
		};
		};
		if (_backpack!='') then
		{
		if !(_backpack in _backpacks) then   			
		{
		removeBackpack player ;				
		systemchat format['Backpack not allowed for this class']; 			 
		};
		};
		
		