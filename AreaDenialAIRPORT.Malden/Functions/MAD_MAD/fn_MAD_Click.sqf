 [""] call BIS_fnc_logFormat;
private['_d','_d46'];
disableSerialization;
waituntil {_d= finddisplay 12; !isnull _d};
 

//_d= finddisplay 12;
_mapC= _d displayctrl 51;
_mapC ctrlAddEventHandler ["MouseButtondown", {_this call MAD_fnc_respawnMapClick;}];

_mapC ctrlAddEventHandler ["Draw", {_this call MAD_fnc_mapDraw}];

_respbC= _d displayctrl 88829;

_respbC ctrlADDEventHandler ["MouseButtondown", {_this call MAD_fnc_respawnButtonClick;}];

   
