//player

[""] call BIS_fnc_logFormat;
private ['_trigger','_playerSide'];

waituntil {sleep 5; _playerSide= side player; _playerSide in [WEST, EAST,RESISTANCE]};

_init= true;


switch (_playerSide) do
{
	case EAST: { _trigger= t_w };
	case WEST: { _trigger= t_e };
	case RESISTANCE: { _trigger= t_w };
	default {endMission "END6"; _init=false};
};

if !(_init) ExitWith 
{
	[format['SPAWN CAMP PROTECTION FAILED: %1 %2', name player, side player]] remoteExec ['systemChat', 0, false];
};

//systemChat 'SPAWN CAMP PROTECTION ENABLED';
_trigger setTriggerActivation ['ANY', 'PRESENT', true]; 
_trigger setTriggerStatements
[
"vehicle player inArea thisTrigger and !(vehicle player isKindOf 'AIR') and (isTouchingGround (vehicle player)) and (alive (vehicle player))", 
"
	_arrow = 'Sign_arrow_direction_green_F' createVehicleLocal ( player modeltoworld [ 0, 3, 0.4 ] ); 
	_EH = addMissionEventHandler 
	['EachFrame', 
	{ 
		( player getVariable 'info' ) params[ '_arrow', '_EH', '_endTime' ]; 
		if !( isNil '_arrow' ) then 
		{ 
			if ( time > _endTime ) then 
			{	
				player spawn MAD_fnc_lightning; 
				hintSilent '';
				deleteVehicle _arrow; 
				removeMissionEventHandler[ 'EachFrame', _EH ]; 
				player setVariable [ 'info', nil ]; 
			} else
			{ 
				_colorA=[1,0,0,abs sin(time*400)] call BIS_fnc_colorRGBAtoHTML;
				_arrow setPosATL ( player modelToWorld [ 0, 3, 0.4 ] ); 
				_arrow setDir ( player getDir ( missionNamespace getVariable 't1')); 
				_txt= '<t align=''center'' size=''1.5'' color=''#ff0000''>'+localize'STR_NOSPAWNCAMPING'+'</t>';
				if (_endTime- time<2) then {_txt= '<t align=''center'' size=''2.5'' color=''#00ccff''>'+localize'STR_RAIDEN'+'</t>';};
				hintSilent composeText [parsetext format['<t size=''1.8'' align=''center'' color=''%2''>'+localize'STR_STOP'+'</t> <br/> <t align=''center'' size=''2.5'' color=''#ffff00''>%1</t> <br/> %3', round (_endTime- time), _colorA, _txt] ]; 
			}; 
		}; 
	}
	]; 
	player setVariable [ 'info', [ _arrow, _EH, time + 8 ] ]; 
", 

" 
	(player getVariable 'info' ) params[ '_arrow', '_EH' ]; 
	if !( isNil '_arrow' ) then 
	{ 
		hint ''; 
		deleteVehicle _arrow; 
		removeMissionEventHandler[ 'EachFrame', _EH ]; 
		player setVariable [ 'info', nil ]; 
	}; 
"
];

switch (_playerSide) do
{
	case EAST: { _trigger= t_ao };
	case WEST: { _trigger= t_ao };
	case RESISTANCE: { _trigger= t_ao };
	default {endMission "END6"; _init=false};
};

if !(_init) ExitWith 
{
	[format['SPAWN CAMP PROTECTION FAILED: %1 %2', name player, side player]] remoteExec ['systemChat', 0, false];
};

//systemChat 'SPAWN CAMP PROTECTION ENABLED';
_trigger setTriggerActivation ['ANY', 'NOT PRESENT', true]; 
_trigger setTriggerStatements
[
"!(vehicle player inArea thisTrigger) and !(vehicle player isKindOf 'AIR')and (isTouchingGround (vehicle player))and (alive (vehicle player))", 
"
	_arrow = 'Sign_arrow_direction_green_F' createVehicleLocal ( player modeltoworld [ 0, 3, 0.4 ] ); 
	_EH = addMissionEventHandler 
	['EachFrame', 
	{ 
		( player getVariable 'info' ) params[ '_arrow', '_EH', '_endTime' ]; 
		if !( isNil '_arrow' ) then 
		{ 
			if ( time > _endTime ) then 
			{	
				player spawn MAD_fnc_lightning; 
				hintSilent '';
				deleteVehicle _arrow; 
				removeMissionEventHandler[ 'EachFrame', _EH ]; 
				player setVariable [ 'info', nil ]; 
			} else
			{ 
				_colorA=[1,0,0,abs sin(time*400)] call BIS_fnc_colorRGBAtoHTML;
				_arrow setPosATL ( player modelToWorld [ 0, 3, 0.4 ] ); 
				_arrow setDir ( player getDir ( missionNamespace getVariable 't1')); 
				_txt= '<t align=''center'' size=''1.5'' color=''#ff0000''>'+localize'STR_RETURN'+'</t>';
				if (_endTime- time<2) then {_txt= '<t align=''center'' size=''2.5'' color=''#00ccff''>'+localize'STR_RAIDEN'+'</t>';};
				hintSilent composeText [parsetext format['<t size=''1.8'' align=''center'' color=''%2''>'+localize'STR_STOP'+'</t> <br/> <t align=''center'' size=''2.5'' color=''#ffff00''>%1</t> <br/> %3', round (_endTime- time), _colorA, _txt] ]; 
			}; 
		}; 
	}
	]; 
	player setVariable [ 'info', [ _arrow, _EH, time + 8 ] ]; 
", 

" 
	(player getVariable 'info' ) params[ '_arrow', '_EH' ]; 
	if !( isNil '_arrow' ) then 
	{ 
		hint ''; 
		deleteVehicle _arrow; 
		removeMissionEventHandler[ 'EachFrame', _EH ]; 
		player setVariable [ 'info', nil ]; 
	}; 
"
];