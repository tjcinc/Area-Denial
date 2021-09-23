[""] call BIS_fnc_logFormat;
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

params ['_mode','_display'];

switch (_mode) do 
{
	case ("DELETE"): 
	{
	["MAd_fnc_arsenalFnc-delete"] call BIS_fnc_logFormat;
		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_cursel = lnbcurselrow _ctrlTemplateValue;
		_name = _ctrlTemplateValue lnbtext [_cursel,0];
		
		[_center,[profileNamespace,_name],nil,true] call MAD_fnc_saveInventory;
		['SHOWTEMPLATES',_display] call MAD_fnc_arsenalFnc;
		_ctrlTemplateValue lnbsetcurselrow (_cursel max (lbsize _ctrlTemplateValue - 1));
		["templateSelChanged",[_display]] call BIS_fnc_arsenal;
	};
	
	case ("LOADSAVE")://button LOAD SAVE WINDOW
	{
	["MAd_fnc_arsenalFnc-loadsave"] call BIS_fnc_logFormat;
	_center = (missionNamespace getvariable ["BIS_fnc_arsenal_center",player]);
	_hideTemplate = true;
		_ctrlTemplateName = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME;
		
		['showMessage',[_display,format ['AAS loadout: %1', ctrltext _ctrlTemplateName]]] call BIS_fnc_arsenal;
		
		if (ctrlenabled _ctrlTemplateName) then {
			//--- Save
			_nameLoadout= format ['%1',ctrltext _ctrlTemplateName];
			[
				_center,
				[profileNamespace, _nameLoadout],
				[
					_center getvariable ["BIS_fnc_arsenal_face",face _center],
					speaker _center,
					_center call bis_fnc_getUnitInsignia
				]
			] call MAD_fnc_saveInventory;
		} else {
			//--- Load
			_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
			if ((_ctrlTemplateValue lbvalue lnbcurselrow _ctrlTemplateValue) >= 0) then {
				_inventory = _ctrlTemplateValue lnbtext [lnbcurselrow _ctrlTemplateValue,0];
				[_center,[profileNamespace,_inventory]] call MAD_fnc_loadInventory;
				_center switchmove "";
				//--- Load custom data
				_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
				_data = profileNamespace getvariable [missionNamespace getVariable['AAS_profile','ERROR'],[]];
				_name = _ctrlTemplateValue lnbtext [lnbcurselrow _ctrlTemplateValue,0];
				_nameID = _data find _name;
				if (_nameID >= 0) then {
					_inventory = _data select (_nameID + 1);
					_inventoryCustom = _inventory select 10;
					_center setface (_inventoryCustom select 0);
					_center setvariable ["BIS_fnc_arsenal_face",(_inventoryCustom select 0)];
					_center setspeaker (_inventoryCustom select 1);
					[_center,_inventoryCustom select 2] call bis_fnc_setUnitInsignia;
				};
				["ListSelectCurrent",[_display]] call BIS_fnc_arsenal;
			} else {
				_hideTemplate = false;
			};
		};
		if (_hideTemplate) then {
			_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
			_ctrlTemplate ctrlsetfade 1;
			_ctrlTemplate ctrlcommit 0;
			_ctrlTemplate ctrlenable false;

			_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
			_ctrlMouseBlock ctrlenable false;
		};
	};
	case ("LOAD"): //button MAIN
	{
	["MAd_fnc_arsenalFnc-LOAD"] call BIS_fnc_logFormat;
		//systemchat format['LOAD: %1', missionNamespace getVariable['AAS_profile','ERROR'] ];
		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_ctrlTemplate ctrlsetfade 0;
		_ctrlTemplate ctrlcommit 0;
		_ctrlTemplate ctrlenable true;
		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable true;
		ctrlsetfocus _ctrlMouseBlock;
		{
			(_display displayctrl _x) ctrlsettext localize "str_disp_int_load";
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TITLE,IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK];
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlshow false;
			_ctrl ctrlenable false;
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TEXTNAME,IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME];
		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		if (lnbcurselrow _ctrlTemplateValue < 0) then {_ctrlTemplateValue lnbsetcurselrow 0;};
		ctrlsetfocus _ctrlTemplateValue;
	};
	
	case ("SAVE"): //button MAIN
	{
	["MAd_fnc_arsenalFnc-SAVE"] call BIS_fnc_logFormat;
	//systemchat format['SAVE: %1', missionNamespace getVariable['AAS_profile','ERROR'] ];
	
			#define GETVIRTUALCARGO\
		_virtualItemCargo =\
			(missionNamespace call BIS_fnc_getVirtualItemCargo) +\
			(_cargo call BIS_fnc_getVirtualItemCargo) +\
			items _center +\
			assigneditems _center +\
			primaryweaponitems _center +\
			secondaryweaponitems _center +\
			handgunitems _center +\
			[uniform _center,vest _center,headgear _center,goggles _center];\
		_virtualWeaponCargo = [];\
		{\
			_weapon = _x call bis_fnc_baseWeapon;\
			_virtualWeaponCargo set [count _virtualWeaponCargo,_weapon];\
			{\
				private ["_item"];\
				_item = gettext (_x >> "item");\
				if !(_item in _virtualItemCargo) then {_virtualItemCargo set [count _virtualItemCargo,_item];};\
			} foreach ((configfile >> "cfgweapons" >> _x >> "linkeditems") call bis_fnc_returnchildren);\
		} foreach ((missionNamespace call BIS_fnc_getVirtualWeaponCargo) + (_cargo call BIS_fnc_getVirtualWeaponCargo) + weapons _center + [binocular _center]);\
		_virtualMagazineCargo = (missionNamespace call BIS_fnc_getVirtualMagazineCargo) + (_cargo call BIS_fnc_getVirtualMagazineCargo) + magazines _center;\
		_virtualBackpackCargo = (missionNamespace call BIS_fnc_getVirtualBackpackCargo) + (_cargo call BIS_fnc_getVirtualBackpackCargo) + [backpack _center];
		
	#define CONDITION(LIST)	(_fullVersion || {"%ALL" in LIST} || {{_item == _x} count LIST > 0})
	
		["SHOWTEMPLATES",_display] call MAD_fnc_arsenalFnc;
		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_ctrlTemplate ctrlsetfade 0;
		_ctrlTemplate ctrlcommit 0;
		_ctrlTemplate ctrlenable true;
		_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
		_ctrlMouseBlock ctrlenable true;

		{
			(_display displayctrl _x) ctrlsettext localize "str_disp_int_save";
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TITLE,IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK];
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlshow true;
			_ctrl ctrlenable true;
		} foreach [IDC_RSCDISPLAYARSENAL_TEMPLATE_TEXTNAME,IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME];

		_ctrlTemplateName = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_EDITNAME;
		ctrlsetfocus _ctrlTemplateName;

		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		_ctrlTemplateButtonOK = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
		_ctrlTemplateButtonOK ctrlenable true;
		_ctrlTemplateButtonDelete = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
		_ctrlTemplateButtonDelete ctrlenable ((lnbsize _ctrlTemplateValue select 0) > 0);

		['showMessage',[_display,localize "STR_A3_RscDisplayArsenal_message_save"]] call BIS_fnc_arsenal;
	};
	
	case ("SHOWTEMPLATES"): 
	{
		
		//systemchat "SHOWTEMPLATES";
		_ctrlTemplateValue = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
		lnbclear _ctrlTemplateValue;
		_data = profileNamespace getvariable [(missionNamespace getVariable['AAS_profile','ERROR']),[]];
		_center = (missionNamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_cargo = (missionNamespace getvariable ["BIS_fnc_arsenal_cargo",objnull]);
		
		GETVIRTUALCARGO
		
		for "_i" from 0 to (count _data - 1) step 2 do 
		{
			_name = _data select _i;
			_inventory = _data select (_i + 1);
			_inventoryWeapons = [
			(_inventory select 5), //--- Binocular
			(_inventory select 6 select 0), //--- Primary weapon
			(_inventory select 7 select 0), //--- Secondary weapon
			(_inventory select 8 select 0) //--- Handgun
			] - [""];
				_inventoryMagazines = (
					(_inventory select 0 select 1) + //--- Uniform
					(_inventory select 1 select 1) + //--- Vest
					(_inventory select 2 select 1) //--- Backpack items
				) - [""];
				_inventoryItems = (
					[_inventory select 0 select 0] + (_inventory select 0 select 1) + //--- Uniform
					[_inventory select 1 select 0] + (_inventory select 1 select 1) + //--- Vest
					(_inventory select 2 select 1) + //--- Backpack items
					[_inventory select 3] + //--- Headgear
					[_inventory select 4] + //--- Goggles
					(_inventory select 6 select 1) + //--- Primary weapon items
					(_inventory select 7 select 1) + //--- Secondary weapon items
					(_inventory select 8 select 1) + //--- Handgun items
					(_inventory select 9) //--- Assigned items
				) - [""];
				_inventoryBackpacks = [_inventory select 2 select 0] - [""];
				_lbAdd = _ctrlTemplateValue lnbaddrow [_name];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,1],gettext (configfile >> "cfgweapons" >> (_inventory select 6 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,2],gettext (configfile >> "cfgweapons" >> (_inventory select 7 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,3],gettext (configfile >> "cfgweapons" >> (_inventory select 8 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,4],gettext (configfile >> "cfgweapons" >> (_inventory select 0 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,5],gettext (configfile >> "cfgweapons" >> (_inventory select 1 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,6],gettext (configfile >> "cfgvehicles" >> (_inventory select 2 select 0) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,7],gettext (configfile >> "cfgweapons" >> (_inventory select 3) >> "picture")];
				_ctrlTemplateValue lnbsetpicture [[_lbAdd,8],gettext (configfile >> "cfgglasses" >> (_inventory select 4) >> "picture")];
				if (
					{_item = _x; !CONDITION(_virtualWeaponCargo) || !isclass(configfile >> "cfgweapons" >> _item)} count _inventoryWeapons > 0
					||
					{_item = _x; !CONDITION(_virtualItemCargo + _virtualMagazineCargo) || {isclass(configfile >> _x >> _item)} count ["cfgweapons","cfgglasses","cfgmagazines"] == 0} count _inventoryMagazines > 0
					||
					{_item = _x; !CONDITION(_virtualItemCargo + _virtualMagazineCargo) || {isclass(configfile >> _x >> _item)} count ["cfgweapons","cfgglasses","cfgmagazines"] == 0} count _inventoryItems > 0
					||
					{_item = _x; !CONDITION(_virtualBackpackCargo) || !isclass(configfile >> "cfgvehicles" >> _item)} count _inventoryBackpacks > 0
				) then {
					_ctrlTemplateValue lnbsetcolor [[_lbAdd,0],[1,1,1,0.25]];
					_ctrlTemplateValue lbsetvalue [_lbAdd,-1];
				};
		};
		_ctrlTemplateValue lnbsort [0,false];
		["templateSelChanged",[_display]] call BIS_fnc_arsenal;
	};
};