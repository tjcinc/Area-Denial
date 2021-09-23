[""] call BIS_fnc_logFormat;
disableSerialization;
params['_fnc'];
		 

        
//vars MY_LOADOUT	MAD_CUSTOM_INVS		NAME_LOADOUT_MAD
switch (_fnc) do
{
       
		
		
	case "INIT":
	{   //waituntil {!isnil "Respawnready"};
	   
		private ["_RoleLb", "_LoadoutLb","_buttonDetails"];
		MADcustomInventoryReady= nil;
		
		waitUntil {!isNil "shit"};
		
		waituntil { _LoadoutLb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlComboLoadout', controlNull]; !(isNull _LoadoutLb)};/////????????		
		_LoadoutLb ctrlRemoveAllEventHandlers "LBSelChanged";
		_LoadoutLb ctrlAddEventHandler ["LBSelChanged", " ['close'] spawn MAD_fnc_showRespawnMenuInventoryDetails; MY_LOADOUT=nil; params ['_control', '_selectedIndex']; _name=_control lbData _selectedIndex; if (_name find 'mission'>-1) then {['SHOWMRII'] spawn MAD_fnc_arsenalAddRI; } else {call BIS_fnc_showRespawnMenuInventoryItems }"];
		
		waituntil {_buttonDetails= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlButtonDetails', controlNull]; !(isNull _buttonDetails)};
		_buttonDetails ctrlRemoveAllEventHandlers "buttonDown";
		_buttonDetails ctrlAddEventHandler ["buttonDown", " ['auto'] spawn MAD_fnc_showRespawnMenuInventoryDetails"];
		_buttonDetails ctrlSetText 'Details';
		
		waituntil {_RoleLb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull]; !(isNull _RoleLb)};
		_RoleLb ctrlAddEventHandler ["LBSelChanged", "MADcustomInventoryReady= nil; ['close'] spawn MAD_fnc_showRespawnMenuInventoryDetails; params ['_control', '_selectedIndex']; ['ROLE_CHANGE'] spawn MAD_fnc_arsenalAddRI; "];
		
		
		
		
		/*//show menu position
		private ["_locl"];
		waituntil {_locl= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlLocList', controlNull]; !(isNull _locl)};
	
		_locl ctrlSetfade 0;
		_locl ctrlShow true;
		_locl ctrlCommit 0;
		*/
		
         ////test/////argoui        
		/* _lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList',controlNull];
		_lb ctrlShow true;
		_lb ctrlSetFade 0;

		_cLb= uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlComboLoadout";
		_posLb = ctrlPosition _cLb;

		_lb ctrlSetPosition [(_posLb select 0),_posLb select 1, 0.19, _posLb select 3];
		_cLb ctrlSetPosition [(_posLb select 0)+0.19,_posLb select 1, 0.19,_posLb select 3];
		_cLb ctrlCommit 0;
		_lb ctrlCommit 0;	 */	
		
		
		//sleep 1;
		//Respawnready= true;
		
	};

	case "ROLE_CHANGE":
	{
		MADcustomInventoryReady= nil;
		
			//add respawn loadout
			disableSerialization;

			_LoadoutLb= uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlComboLoadout";
			_RoleLb= uiNamespace getVariable 'BIS_RscRespawnControlsMap_ctrlRoleList';
			waituntil {sleep 0.1; ctrlCommitted _LoadoutLb and  (lbsize _LoadoutLb > 0)};

			_LoadoutLb lbSetCurSel 0;
			_LoadoutLb ctrlCommit 0;
			call MAD_fnc_getRole;

			_profile= missionNamespace getVariable['AAS_profile','ERROR'];
			_data = +(profilenamespace getvariable [_profile,[]]); //or copy: _data = +(profilenamespace getvariable [_profile,[]]);

			_curSelRole = lbCurSel _RoleLb;
			MAD_CUSTOM_INVS=[];

			//clear custom
			for "_i" from (lbSize _LoadoutLb)-1 to 0 step -1 do
			{
				_lbdata= _LoadoutLb lbData _i;
				if (_lbdata find 'mission'>=0) then {_LoadoutLb lbDelete _i};
			};
             ///WEAPONS check for illegal class loadouts from arsenal
			_weapons= getArray (missionconfigFile >> "ArsenalLoadoutConfig" >> missionNamespace getVariable['AAS_profile', []] >> "weapons");
			_item= getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> missionNamespace getVariable['AAS_profile', []] >> "items");
			_backpack= getArray (missionConfigFile >> "ArsenalLoadoutConfig" >> missionNamespace getVariable['AAS_profile', []] >> "backpacks");
			for "_i" from 0 to ((count _data)-1) step 2 do
			{
				
				_p= _data select (_i+1) select 6 select 0;
				_s= _data select (_i+1) select 7 select 0;
				_h= _data select (_i+1) select 8 select 0;				
			
				_po= _data select (_i+1) select 6 select 1 select 2;
				_ss= _data select (_i+1) select 6 select 1 select 0;
				_hb= _data select (_i+1) select 6 select 1 select 3;
				
				_bp= _data select (_i+1) select 2 select 0;				
				_un = _data select (_i+1) select 0 select 0;				
				
			
				
				
				_notbadp= _p in _weapons or _p=='';
				_notbads= _s in _weapons or _s=='';
				_notbadh= _h in _weapons or _h=='';				
				_notbadpo= _po in _item or _po=='';
				_notbadss= _ss in _item or _ss=='';
				_notbadhb= _hb in _item or _hb=='';				
				_notbadun= _un in _item or _un=='';
				_notbadbp= _bp in _backpack or _bp=='';
				
				if (_notbadp and _notbads and _notbadp and _notbadpo and _notbadss and _notbadhb and _notbadbp and _notbadun  ) then
				{		
				
				MAD_CUSTOM_INVS pushback format['missionnamespace:%1', (_data select _i)]; //use in addRespawnInventory
				MAD_CUSTOM_INVS pushback  (_data select (_i+1));
				_nameLoadout= _data select _i;

				_index = _LoadoutLb lbAdd format['%1', _nameLoadout];
				_LoadoutLb lbSetData [_index,  format['missionnamespace:%1', _nameLoadout]];
				_LoadoutLb lbSetColor [_index, [0.75,0.95,0.75,1]];
				} else 
				{
					//if bad
					if !(_notbadp) then {player sidechat format['Class: %1 Illegal primary weapon: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _p >> 'DisplayName')]};
					if !(_notbads) then {player sidechat format['Class: %1 Illegal secondary weapon: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _s >> 'DisplayName')]};
					if !(_notbadh) then {player sidechat format['Class: %1 Illegal handgun weapon: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _h >> 'DisplayName')]};	
					if !(_notbadpo) then {player sidechat format['Class: %1 Illegal scope: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _po >> 'DisplayName')]};
					if !(_notbadss) then {player sidechat format['Class: %1 Illegal silencer: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _ss >> 'DisplayName')]};
					if !(_notbadhb) then {player sidechat format['Class: %1 Illegal bipod: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _hb >> 'DisplayName')]};
					if !(_notbadbp) then {player sidechat format['Class: %1 Illegal backpack: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _bp >> 'DisplayName')]};
					if !(_notbadun) then {player sidechat format['Class: %1 Illegal uniform: %2', _data select _i, getText(configFile >> 'cfgWeapons' >> _un >> 'DisplayName')]};
					
				};
			};

			if (SAVE_007 <=(lbSize _LoadoutLb)-1) then
			{
				_LoadoutLb lbSetCurSel SAVE_007;				
			};		

			_RoleLb ctrlCommit 0;
			_LoadoutLb ctrlCommit 0;
			
		MADcustomInventoryReady= true;
	};

	case "SHOWMRII":
	{

		//hint 'crappy';
		disableSerialization;
		NAME_LOADOUT_MAD='DD:dd';
		with uiNamespace do {
		//NOTE: local variables use correct names for ARGO, but global variables are same as in A3 (therefore ARGO optics UI control is named SecondaryWeapon in global variable)
		_list = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlRoleList} else {BIS_RscRespawnControlsMap_ctrlRoleList};
		_combo = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlComboLoadout} else {BIS_RscRespawnControlsMap_ctrlComboLoadout};
		_ctrlPrimaryWeapon = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlPicturePrimaryWeapon} else {BIS_RscRespawnControlsMap_ctrlPicturePrimaryWeapon};
		_ctrlOptics = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlPictureSecondaryWeapon} else {BIS_RscRespawnControlsMap_ctrlPictureSecondaryWeapon};
		/* _ctrlSupressor = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlPictureSupressor} else {BIS_RscRespawnControlsMap_ctrlPictureSupressor}; */
		_ctrlBipod = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlPictureOptics} else {BIS_RscRespawnControlsMap_ctrlPictureOptics};
		_ctrlGrenade = if (uiNamespace getVariable ["BIS_RscRespawnControlsSpectate_shown", false]) then {BIS_RscRespawnControlsSpectate_ctrlPictureItem} else {BIS_RscRespawnControlsMap_ctrlPictureItem};

		_curSelList = lbCurSel _list;
		_curSelCombo = lbCurSel _combo;

		//--- Set all pictures and tooltips empty
		_ctrlPrimaryWeapon ctrlSetText "";
		_ctrlOptics ctrlSetText "";
		//_ctrlSupressor ctrlSetText "";
		_ctrlBipod ctrlSetText "";
		_ctrlGrenade ctrlSetText "";

		//--- Main processing
		if !(_curSelCombo < 0) then {	//there is something selected
			_metadata = ["get",_curSelList] call (missionNamespace getVariable "BIS_fnc_showRespawnMenuInventoryMetadata");
			if ((count _metadata) == 0) exitWith {debuglog "BIS_fnc_showRespawnMenuInventoryItems: Warning! Metadata function returned an empty array for currently selected loadout!"};
			_loadouts = _metadata select 1;
			_comboText = _combo lbText _curSelCombo;

			//--- Find correct item in metadata
			_loadoutArray = [];
			{
				if ((_x select 1) isEqualTo _comboText) exitWith {_loadoutArray = _x};
			} forEach _loadouts;
			_name=_combo lbData (lbCurSel _combo);


			if (_name find 'mission'>-1) then
			{
				waitUntil {!isNil 'MAD_CUSTOM_INVS'};
				NAME_LOADOUT_MAD= _combo lbText (lbCurSel _combo);
				_find= (MAD_CUSTOM_INVS find _name)+1;

				_loadoutArray= MAD_CUSTOM_INVS select _find;
				//systemchat format['CUSTOM LoadoutName:%1 ',NAME_LOADOUT_MAD];

				if ((count _loadoutArray) > 0) then {
				//Basic variables
				//*
				_loadoutCfg = _loadoutArray select 2;
				_weaponCfg = configFile >> "CfgWeapons";
				_primaryWeaponCfg = configFile >> "";		//empty config as placeholder
				_opticsCfg = configFile >> "";				//empty config as placeholder
				_supressorCfg = configFile >> "";				//empty config as placeholder
				_bipodCfg = configFile >> "";				//empty config as placeholder
				_itemCfg = configFile >> "";				//empty config as placeholder
				//*/
				//Backpack items function
				//*
				_fnc_backpackItems = {
					_backpackItems = [];
					_transportCfg = configFile >> "CfgVehicles" >> _this >> "TransportItems";
					for "_i" from 0 to ((count _transportCfg) - 1) do {
						_backpackItemName = getText ((_transportCfg select _i) >> "Name");
						if (_backpackItemName != "") then {_backpackItems = _backpackItems + [_backpackItemName]};
					};
					_backpackItems
				};
				//*/

				//Weapon/item processing
				_weaponArray = [];
				_itemArray = [];
				_inventory = [];

					//---arsenal loadout

					_inventory = _loadoutArray;
					MY_LOADOUT=  _inventory;
					//copytoclipboard str (MY_LOADOUT);
					if ((count _inventory) > 0) then {
						_weaponArray = [((_inventory select 6) select 0)] + [((_inventory select 7) select 0)] + [((_inventory select 8) select 0)];
						_itemArray = ((_inventory select 0) select 1) + ((_inventory select 1) select 1);
					};


				{	//--weapons
					switch (getNumber (_weaponCfg >> _x >> "Type")) do {
						case 1: {_primaryWeaponCfg = _weaponCfg >> _x};
					};
				} forEach _weaponArray;

					//-- grenades
				_grenadeIcon = 0;
				switch (true) do {
					case (("HandGrenade" in _itemArray) && !("SmokeShell" in _itemArray)): {_grenadeIcon = 1};	//only hand grenade
					case (("SmokeShell" in _itemArray) && !("HandGrenade" in _itemArray)): {_grenadeIcon = 2};	//only smoke shell
					case (("SmokeShell" in _itemArray) && ("HandGrenade" in _itemArray)): {_grenadeIcon = 3};	//both types together
				};


				//---arsenal loadout
					_opticsClass = (((_inventory select 6) select 1) select 2);
					_supressorClass = (((_inventory select 6) select 1) select 0);
					_bipodClass = (((_inventory select 6) select 1) select 3);

					_opticsCfg = _weaponCfg >> _opticsClass;
					_supressorCfg = _weaponCfg >> _supressorClass;
					_bipodCfg = _weaponCfg >> _bipodClass;


				//Pictures and tooltips set
				if (isClass _primaryWeaponCfg) then {
					_ctrlPrimaryWeapon ctrlSetText (getText (_primaryWeaponCfg >> "Picture"));

					//store selection info for server
					_weaponIcon = getText (_primaryWeaponCfg >> "IconLog");
					_varName = "BIS_showRespawnMenuServer_weapon_" + name player;
					if ((isNil _varName) || {_weaponIcon != (missionNamespace getVariable _varName)}) then {
						missionNamespace setVariable [_varName,_weaponIcon];
						publicVariable _varName;
					};
				};
				if (isClass _opticsCfg) then {
					_ctrlOptics ctrlSetText (getText (_opticsCfg >> "Picture"));
				};
				/* if (isClass _supressorCfg) then {
					_ctrlSupressor ctrlSetText (getText (_supressorCfg >> "Picture"));
				}; */
				if (isClass _bipodCfg) then {
					_ctrlBipod ctrlSetText (getText (_bipodCfg >> "Picture"));
				};
				/* if (_grenadeIcon > 0) then {
					switch (_grenadeIcon) do {
						case 1: {_ctrlGrenade ctrlSetText "\Argo\UI_ARGO\Data\Displays\RscDisplayMetagame\Grenade_rgorgo_ca.paa"};	//only hand grenade
						case 2: {_ctrlGrenade ctrlSetText "\Argo\UI_ARGO\Data\Displays\RscDisplayMetagame\Grenade_smokesmoke_ca.paa"};	//only smoke
						case 3: {_ctrlGrenade ctrlSetText "\Argo\UI_ARGO\Data\Displays\RscDisplayMetagame\Grenade_smokergo_ca.paa"};	//both types
					};
				}; */

			} else {		//missing metadata for item!
				["No metadata found for loadout %1 when processing item images.",_comboText] call (missionNamespace getVariable "BIS_fnc_error");
			};



			};

		};
	};

	true;
	};
};
