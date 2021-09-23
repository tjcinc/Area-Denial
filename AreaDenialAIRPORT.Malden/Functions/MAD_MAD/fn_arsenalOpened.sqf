[""] call BIS_fnc_logFormat;
#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
//systemchat 'Arsenal opened';

params ['_display'];

_display displayAddEventHandler ["keydown", "if !((_this select 1) in [1,200,208,14,211]) then {true};"];
[["arsenalhint", "arsenal"], 10,"", 10, "", true, true, false, true] call BIS_fnc_advHint;
['showMessage',[_display,format ['%1', call MAD_fnc_getRole]]] call BIS_fnc_arsenal;

_c= _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONSAVE;
_c ctrlRemoveAllEventHandlers "buttonclick";
//_c ctrlSetText ('AAS '+ctrlText _c); 
_c ctrlSetBackgroundColor [0.6, 1, 0, 0.5 ];
_c ctrlSetTextColor [0, 0, 0, 1];
_c ctrladdeventhandler ["buttonclick","['SHOWTEMPLATES',ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc;  ['SAVE',ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc;"];

_c ctrlCommit 0;

_c= _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONLOAD;
_c ctrlRemoveAllEventHandlers "buttonclick";	
//_c ctrlSetText ('AAS '+ctrlText _c); 
_c ctrlSetBackgroundColor [1, 0.6, 0, 0.5 ];
_c ctrlSetTextColor [0, 0, 0, 1];
_c ctrladdeventhandler ["buttonclick","['SHOWTEMPLATES',ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc; ['LOAD',ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc;"];

_c = _display displayCtrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONOK;
_c ctrlRemoveAllEventHandlers "buttonclick";	
//_c ctrlSetText ('AAS '+ctrlText _c); 
_c ctrlSetBackgroundColor [1, 1, 0, 0.5 ];
_c ctrlSetTextColor [0, 0, 0, 1];
_c ctrladdeventhandler ["buttonclick","['LOADSAVE', ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc; "];

_c = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_BUTTONDELETE;
_c ctrlRemoveAllEventHandlers "buttonclick";	
_c ctrladdeventhandler ["buttonclick","['DELETE',ctrlparent (_this select 0)] call MAD_fnc_arsenalFnc;"];

_c = _display displayCtrl IDC_RSCDISPLAYARSENAL_TEMPLATE_VALUENAME;
_c ctrlRemoveAllEventHandlers "LBDblClick";

_c= _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONIMPORT;
_c ctrlEnable  true;
_c ctrlRemoveAllEventHandlers "buttonclick";	
_c ctrlSetBackgroundColor [1, 0, 0, 0.5 ];
_c ctrlAddEventHandler ["buttonclick", 
{
	{player removeMagazine _x} forEach (magazines player);
	{
		_p= _x;
		{ _p removePrimaryWeaponItem _x} forEach (primaryWeaponMagazine _p);
		{ _p removeSecondaryWeaponItem _x} forEach (secondaryWeaponMagazine _p);
		{ _p removeHandgunItem _x } forEach (handgunMagazine _p);
		
	} forEach [player];
}];
_c ctrlSetText 'Clear (M)'; 

(_display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONRANDOM) ctrlEnable  false;