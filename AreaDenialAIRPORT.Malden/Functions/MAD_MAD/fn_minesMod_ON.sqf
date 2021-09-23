 [""] call BIS_fnc_logFormat;
//#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
#define S3_MINESMOD_MAX 2
#define S3_IED_MAX 1
//#define S3_MINE_CLASS mine

_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: { mine = "APERSTripMine_Wire_Ammo"; bomb="IEDUrbanBig_Remote_Ammo";};	
    case 1: { mine = "APERSTripMine_Wire_Ammo"; bomb="IEDUrbanBig_Remote_Ammo";};	
	case 2: { mine = "APERSTripMine_Wire_Ammo"; bomb="IEDUrbanBig_Remote_Ammo";};
    case 3: { mine = "APERSTripMine_Wire_Ammo"; bomb="IEDUrbanBig_Remote_Ammo";};
 	//case 4: { mine = "APERSTripMine_Wire_Ammo"; bomb="IEDUrbanBig_Remote_Ammo";};
	case 4: { mine = "vn_mine_punji_01_ammo"; bomb="IEDUrbanBig_Remote_Ammo";};
    };




S3_MINESMOD_CNT= S3_MINESMOD_MAX;
S3_MY_MINES=[]; 
S3_ALLMYMINES=[];

S3_MY_IED_CNT= S3_IED_MAX;
S3_MY_IED_obj= objNull;
S3_MY_IED_A= true;//activate

S3_Ifnc_Mine=
{
	if (player inArea t_e or player inArea t_w or !(vehicle player isKindOf 'MAN') or !(isTouchingGround player)) ExitWith {};
	if (S3_MINESMOD_CNT>0) then 
	{
		S3_MINESMOD_CNT=S3_MINESMOD_CNT-1;
		call S3_ifnc_UPDATE_HUD;
		playsound 'assemble_target'; player action ["rearm", player];
		_pos= player modelToWorld [0,1,0];
		_objMine= mine createVehicle _pos;
		S3_MY_MINES pushBack _objMine;
		S3_ALLMYMINES pushBack _objMine;
		
		_objMine setdir (getDir Player);
		[_objMine, [player,player]] remoteExec ['setShotParents', 2, false];
		
		[_objMine]  spawn
		{
			params ['_objMine'];
			_normal = surfaceNormal (_objMine modelToWorld [0,0,0]);
			_objMine setVectorUp _normal;
			
			_posS= AGLToASL (_objMine ModelToWorldVisual [-1.4,0,0.1]);
			_posE= AGLToASL (_objMine ModelToWorldVisual [1.6,0,0.1]);
			
			sleep 5;
			
			private ['_obj'];
			while {!(_objMine isEqualTo objNull)} do 
			{
				//mine life cycle
				_ins = lineIntersectsSurfaces [_posS, _posE, _objMine];
				{
					_obj= _x select 2;
					if (_obj isKindOf 'MAN' and !((_obj getVariable ['_S', civilian]) isEqualTo S3_Side)) then {_objMine setDamage 1};
				}forEach _ins;
				if (damage _objMine>0.1) then {_objMine setDamage 1};
				sleep 0.01;
			};
		};
	};  
};

S3_Ifnc_IED=   
{
	if (player inArea t_e or player inArea t_w or !(vehicle player isKindOf 'MAN') or !(isTouchingGround player)) ExitWith {};
	S3_MY_IED_CNT= S3_MY_IED_CNT-1;
	call S3_ifnc_UPDATE_HUD;
	hint 'Press 5 to ACTIVATE';
	_pos= player modelToWorld [0,0.15,0];
	_objIED= bomb createVehicle _pos;
	//player addOwnedMine _objIED;
	[_objIED, [player,player]] remoteExec ['setShotParents', 2, false];
	S3_ALLMYMINES pushBack _objIED;
	playsound 'assemble_target'; player action ["rearm", player];
	
	[_objIED] spawn
	{
		params['_objIED'];
		while {!(_objIED isEqualTo objNull) and alive player} do 
		{
			if (damage _objIED>0.001) then {_objIED setDamage 1};
			_dist= player distance2D _objIED;
			if (S3_MY_IED_A) then 
			{
				if (_dist<100) then { hintsilent ''; _objIED setDamage 1} else {S3_MY_IED_A= false; Hint 'No Radio signal for IED.'};
			};
			sleep 0.5;
		};
		if !(isNull _objIED) then {deleteVehicle _objIED};
		//systemchat 'DEL';
	};
};

S3_ifnc_UPDATE_HUD=
{
	disableSerialization;
	_hud= uinamespace getVariable 'HUD_MINES';
	_tTXT='';
	if (S3_MINESMOD_CNT>0) then
	{
		_tTXT= format["<img image= '\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoThrow_ca.paa'/> TRIPWIRE MINE (%1)", S3_MINESMOD_CNT];
	};
	_IEDTXT='';
	if (S3_MY_IED_CNT>0) then
	{
		_IEDTXT= format["<img image= '\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa'/> TNT (%1)", S3_MY_IED_CNT];
	};
	
	_hud ctrlSetStructuredText parseText format["<a size= '1.0' color= '#FFFFFF' align='Right'>%1 %2</a>", _tTXT, _IEDTXT];
	_hud ctrlSetFade 0;
	_hud ctrlCommit 0;
};


S3_ifnc_ADD_ACTIONS=
{	
	call S3_ifnc_UPDATE_HUD;	
	[player, "<t color='#FF1020'> Defuse </t>", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa", "\A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa", "call compile '_mines= player nearObjects [mine, 1.95]; (count _mines>0)'", "true",
	{ 	
		_mines= player nearObjects [mine, 1.95];
		if (count _mines>0) then
		{
			_obj= selectRandom _mines;
			_dir= [player, _obj] call BIS_fnc_dirTo; 	
			player setDir _dir;
		};
	}, 
	{  
	}, 
	{
		_mines= player nearObjects [mine, 1.95];
		
		if (count _mines>0) then
		{
			_obj= selectRandom _mines;
			//if (random 1 <0.8) then
			//{
			deleteVehicle _obj; player action ["rearm", player];S3_MINESMOD_CNT=S3_MINESMOD_CNT+1;
			Hint format['%1: bomb has been defuse', name player];
			call S3_ifnc_UPDATE_HUD;
			//}
			//else {player sideChat format['%1: Oops... next time I''m more lucky ', name player]; _obj setDamage 1};
		};	
	}, 
	{ }, [], 1, nil, false, false] call BIS_fnc_holdActionAdd;		
};

/* FCombatKBUP={

	params['','_key','_ss','_cs']; 

	
	if ( _key isEqualTo DIK_4 and !(lifestate player in ['INCAPACITATED','DEAD-RESPAWN'])) then 
	{
		if !(vehicle player isKindOf 'MAN') ExitWith {}; 
		call S3_Ifnc_Mine;
	};
	
	if ( _key isEqualTo DIK_5 and !(lifestate player in ['INCAPACITATED','DEAD-RESPAWN'])) then 
	{
		if !(vehicle player isKindOf 'MAN') ExitWith {}; 
		S3_MY_IED_A= not S3_MY_IED_A;
		if (S3_MY_IED_CNT>0) then 
		{
			call S3_Ifnc_IED;
		};
	};
}; */

disableSerialization;
waitUntil {!(isNull (uiNamespace getVariable['MAD_HUD_FPS', controlNull]))};
_d= findDisplay 46;
//_d displayAddEventHandler ["Keydown","_this call FCombatKBUP"];
_hud= _d ctrlCreate ["RscStructuredText", -1000];
_hud ctrlSetStructuredText parseText "<a shadow= '2' size= '1.0'>WWW000</a>";
_hud ctrlCommit 0;
_width= 0.5; _height= .52;
_hud ctrlSetPosition [SafeZoneWAbs+SafeZoneX-_width, safeZoneH + safeZoneY -_height, _width, _height];
_hud ctrlSetBackgroundColor [0,0,0,0];
_hud ctrlSetFade 0;
_hud ctrlCommit 0;
uinamespace setVariable ['HUD_MINES', _hud];

player addEventHandler ["killed", {
_res= false;  MAD_HUD_GPS_VISIBLE= !MAD_HUD_GPS_VISIBLE; {_x ctrlShow MAD_HUD_GPS_VISIBLE;  _x ctrlCommit 0;} forEach (uiNamespace getVariable['MAD_HUD_GPS_CTRLS', []]); _res= true; _res;
[] spawn {disableSerialization; _hud= uinamespace getVariable 'HUD_MINES'; _hud ctrlSetFade 1; _hud ctrlCommit 0};
[] spawn {disableSerialization; _hud= uinamespace getVariable 'HUD_INFO_PANEL'; _hud ctrlSetFade 1; _hud ctrlCommit 0};
 [] spawn {disableSerialization; _hud= uinamespace getVariable 'MAD_HUD_FPS'; _hud ctrlSetFade 1; _hud ctrlCommit 0};

}];

player addEventHandler ["Respawn", 
{
_res= false;  MAD_HUD_GPS_VISIBLE= !MAD_HUD_GPS_VISIBLE; {_x ctrlShow MAD_HUD_GPS_VISIBLE;  _x ctrlCommit 0;} forEach (uiNamespace getVariable['MAD_HUD_GPS_CTRLS', []]); _res= true; _res;
[] spawn {disableSerialization; _hud= uinamespace getVariable 'HUD_INFO_PANEL'; _hud ctrlSetFade 0; _hud ctrlCommit 0};
[] spawn {disableSerialization; _hud= uinamespace getVariable 'MAD_HUD_FPS'; _hud ctrlSetFade 0; _hud ctrlCommit 0};

	while {objNull in S3_ALLMYMINES} do
	{
		S3_ALLMYMINES= S3_ALLMYMINES-[objNull];
	};
	{
		[_x, [player, player]] remoteExec ['setShotParents', 2, false];
	} forEach S3_ALLMYMINES;

	S3_MINESMOD_CNT= S3_MINESMOD_MAX; 
	S3_MY_MINES=[];
	[] spawn S3_ifnc_ADD_ACTIONS;	
	
	S3_MY_IED_A= true;
	S3_MY_IED_CNT= S3_IED_MAX;
}
];

[] spawn S3_ifnc_ADD_ACTIONS;
call S3_ifnc_UPDATE_HUD;


