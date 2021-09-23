[""] call BIS_fnc_logFormat;

S3tagCOLORE= [1,0.521569,0.145098,0.36];
S3tagCOLORW= [0.243137,0.784314,0.870588,0.36];

S3tagROLES= ['\A3\ui_f\data\igui\RscIngameUI\RscUnitInfo\role_driver_ca.paa','\A3\ui_f\data\igui\RscIngameUI\RscUnitInfo\role_gunner_ca.paa','\A3\ui_f\data\igui\RscIngameUI\RscUnitInfo\role_cargo_ca.paa','\A3\ui_f\data\igui\RscIngameUI\RscUnitInfo\role_commander_ca.paa']; 	
S3tagCOLOR= [1,1,1,0.6];	



S3tagCOLOR= [1,0.521569,0.145098,0.85];
if (playerSide==west) then {S3tagCOLOR= [0,0.3,0.6,.6]};       //[0,0.3,0.6,1]  old [0.243137,0.784314,0.870588,0.85]
if (playerSide==east) then {S3tagCOLOR= [0.5,0,0,.6]};         //[0.5,0,0,1]  old  [1,0.521569,0.145098,0.85]
if (playerSide==resistance) then {S3tagCOLOR= [0,0.5,0,.6]};  //[0,0.5,0,1]   old [1,0.521569,0.145098,0.85]

private ['_display'];
disableSerialization;
_display= findDisplay 46;

{
	_x ctrlSetFade 1;
	_x ctrlSetPosition [-1000,-1000,0,0];
	_x ctrlCommit 0;
} forEach (allcontrols _display select {str (ctrlType _x) isEqualTo '15'});

{
	if (ctrlIDC _x==-1) then
	{
	//_x ctrlSetFade 1;
	_x ctrlSetFade 0;
	_x ctrlSetPosition [-1000,-1000,0,0];
	_x ctrlCommit 0;
	};
} forEach (allcontrols _display);


_aD= _display ctrlCreate ["RscListBox", -1000];
_width= 0.25;
_aD ctrlSetPosition [SafeZoneXABS, SafeZoneY, _width, 0.36];
_aD ctrlSetBackgroundColor [0.12,0.99,0, 0.6];
_aD ctrlSetStructuredText parseText "<a shadow= '2' size= '1.0' color= '#FFFFFF' align='Center'>Mercenaries run away with tears in their eyes</a>";
_aD ctrlSetTextColor [1, 1, 1, 0.85];
_aD ctrlSetFade 1;
_aD ctrlCommit 0;
uinamespace setVariable ['HUD_NAMETAGv3', _aD];

fncDrawnametag=
{
	//vehicle player switchCamera "External";
	//systemchat format['CanMove %1 Damage %2',canMove CursorObject, damage CursorObject];
	
	/* _rf= uinamespace getVariable 'HUD_RANGEFINDER';
	if (currentWeapon player isEqualTo binocular player and cameraView isEqualTo 'GUNNER') then
	{
		_ins = lineIntersectsSurfaces [AGLToASL positionCameraToWorld [0,0,0], AGLToASL positionCameraToWorld [0,0,1000], player];
		_dist=0;
		if (count _ins > 0) then
		{
			_dist= round ((_ins select 0 select 0) distance player); 
		} else {_dist='---'};
		_rf ctrlSetStructuredText parseText format["<a size= '1.4' color= '#AA3333' align='Right'>%1m</a>", _dist];
		_rf ctrlSetFade 0;
		_rf ctrlCommit 0;
	} else 
	{
		_rf ctrlSetFade 1;
		_rf ctrlCommit 0;
	}; */
	
	if !(missionNamespace getVariable ["S3_NAMETAG",true]) exitWith {};  

	//drawIcon3D ['', S3tagCOLORW, S3_BPW, 1, -10, 0, localize 'STR_WESTBASE', 2,0.04,'PuristaSemiBold','CENTER',true];
	//drawIcon3D ['', S3tagCOLORE, S3_BPE, 1, -10, 0, localize 'STR_EASTBASE', 2,0.04,'PuristaSemiBold','CENTER',true];

	//CURSOR INFO////////////////////////////////////////
	_c= uinamespace getVariable 'HUD_NAMETAGv3';
	//if (inputAction "lookAround" > 0) then
	if !(vehicle player isEqualTo player) then
	{
		_veh= vehicle player;
		
		lbClear _c;
		
		_c ctrlCommit 0;
		_t= typeOf _veh;
			
		_c lbAdd gettext(configFile >> 'CfgVehicles' >> _t >> 'displayName');
		_c lbSetColor [0, [1,1,0,0.85]];
		_c lbSetPicture [(lbSize _c)-1, getText (configFile >> 'CfgVehicles' >> _t >> 'Picture')];
		{
			if (alive _x) then 
			{
				_name= _x getVariable ['_N', name _x]; 
				_c lbAdd format ["%1", _name];
				_p= 2;
				if (driver _veh isEqualTo _x) then {_p=0}; 
				if (gunner _veh isEqualTo _x) then {_p=1}; 
				if (commander _veh isEqualTo _x) then {_p=3}; 
				_c lbSetPicture [(lbSize _c)-1, S3tagROLES select _p];
			};
		} forEach (crew _veh);

		_cData= ctrlPosition _c;
		_size= lbSize _c;
		
		if (_size isEqualTo 0) then  {_c ctrlSetFade 1 } else {_c ctrlSetFade 0};		
		_c ctrlSetPosition [0.5-1.22, safezoneY + safezoneH- (_size*.5), .3, _size*0.04];//halfway down left		
		_c ctrlCommit 0;
	}
	else 
	{
		_c ctrlSetFade 1;_c ctrlCommit 0;
	};
	////////////	
	{
		if (alive _x) then
		{
			_sp= _x modelToWorldVisual (_x selectionPosition 'spine3');
			
			if !(_x isKindOf 'MAN') then
			{
				_sp= _x modelToWorldVisual [0,0, boundingBox _x select 1 select 2];
			};
			/* if (group _x!= group player) then 
		    {
			drawIcon3D ['A3\ui_f\data\IGUI\Cfg\Cursors\select_ca.paa', S3tagCOLOR, _sp, 0.6, 0.6, 0, '', 2,0.09,'PuristaSemiBold','CENTER'];
			}; */
			
			_name= _x getVariable ['_N', name _x]; 
			_pos = (_x modelToWorldVisual (_x selectionPosition "head")) vectorAdd [0,0,0.35];
			if (lifestate _x=='INCAPACITATED') then
			{
				drawIcon3D ['A3\ui_f\data\igui\cfg\actions\heal_ca.paa', [0.95,0.2,0,0.7], _pos, 0.4, -1.5, 0, format['%1 (%2m)', _name, round (player distance _x)], 2, 0.04, 'RobotoCondensed', 'Right', true]; 
			} else
			{						
			drawIcon3D ['',S3tagCOLOR, _pos, 0, -1.5, 0, _name, 2, 0.0275, 'PuristaSemiBold', 'CENTER'];				
			};			
		};
	} foreach ((allUnits -[player,r_aird,r_Airg,w_aird,w_airg]) select { (_x getVariable ['_S',civilian]) isEqualTo S3_Side});// allUnits //allPlayers
};
["nameTag", "onEachFrame", { call fncDrawnametag }] call BIS_fnc_addStackedEventHandler;
