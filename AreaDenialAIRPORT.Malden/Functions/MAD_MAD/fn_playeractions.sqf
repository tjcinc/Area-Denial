[""] call BIS_fnc_logFormat;
if (vehicle player != player) then {  player setvariable['_EARPLUGS', false, false];
	MAD_VM_EA_ID= player addAction ["<t color='#FFFF50'> EARPLUGS OFF</t><img size='2' align='Right' image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_ON_ca.paa'/>",{ [] spawn MAD_fnc_EARPLUGS }, -1,0,false, true, "timeDec",""]; }else { player setvariable['_EARPLUGS', false, false];
	MAD_VM_EA_ID= player addAction ["<t color='#FFFF50'> EARPLUGS ON</t><img size='2' align='Right' image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa'/>",{ [] spawn MAD_fnc_EARPLUGS }, -1,0,false, true, "timeDec",""];};          


	player addAction ["<t size='1.2'color= '#ef2f2f'>Melee</t>","call MAD_fnc_Melee", nil, 76, true, true, "", "(Player != cursorTarget) and ! ((cursorTarget getVariable[ '_S',playerSide]) isEqualTo playerside) and(Player distance cursorTarget < 2) and (cursorTarget isKindOf 'Man')&& alive cursorTarget "];

	
    player addAction["<t >FLIP VEHICLE</t>", {cursorObject setpos [getpos cursorObject select 0, getpos cursorObject select 1, 0];}, 0,10, true, true, "", "_CO = cursorObject; (vectorUp _CO select 2 < 0.5 and _CO iskindOf 'LandVehicle' and player distance _CO < 5 )"];	

	if (["MAD_groupAI", 1] call BIS_fnc_getParamValue isEqualTo 0) then
	{		
	player addAction ["<t size='1.2' color='#22FF22'> Follow me</t>","call MAD_fnc_AIGroup", -1, 100,true, true, "", "cursorTarget isKindOf 'MAN' and (side cursorTarget) isEqualTo playerSide and (Player distance cursorTarget < 6)and (group cursorTarget)!= group player"];	
	};

	player addAction ["<t color='#AAEECC'>DRAG</t>",{['','DRAG'] call MAD_fnc_dragEntityEnable}, 0,0, true, true, "", "_ct= cursorObject; vehicle player isKindOf 'MAN' and typeof _ct in (uiNamespace getVariable ['_DragObjects', []]) and player distance2D _ct >0.5 and player distance2D _ct <3.5"];
	player addAction ["<t color='#AAEEAA'>DROP</t>",{['','DRAG'] call MAD_fnc_dragEntityEnable}, 0,0, true, true, "", "!(uiNamespace getVariable ['_DragObject', objNull] isEqualTo objNull)"];	

	player addAction [format["<t size='1.2' color='#EEEEFF'><img size='1.5' shadow= '0' image='A3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa'/> %1 </t>", localize "STR_PARACHUTE"],
	{ 
		_pos= getpos player;
		_pz= _pos select 2;
		_pos set [2, _pz-10]; 
		player setpos _pos;
		player allowDamage false;
		moveOut player;
		[ player,_pz] spawn MAD_fnc_halo;  
		//hint 'Use SPACEBAR';
	}, 0,-1, true, true, "Eject", "_veh= vehicle player;(_veh isKindOf 'AIR' and  (getPosATL _veh) select 2 >50) and {!(driver _veh isEqualTo player)}"];
	sleep 5;

	player addAction putSAction;

	player addAction putWAction;

	player addAction putPAction;
	
	
/* 	[player, "<t color='#FF1020'>Cut fence</t>", "images\PP.paa", "images\PP.paa", "(typeOf S3A_Hlp find 'wire'>-1) and player distance2D arrow <2.5 ", "true", {  }, {  }, 
	{
		if (typeOf S3A_Hlp find 'wire' isEqualTo -1) ExitWith {};
		S3A_Hlp setdamage 1;
	}, 
	{ }, [], 3, nil, false, false] call BIS_fnc_holdActionAdd;
	
	
	arrow = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
arrow setObjectTexture [0, "#(rgb,8,8,3)color(1,1,0,0.0)"];
arrow setObjectMaterial [0,"A3\Structures_F\Data\Windows\window_set.rvmat"];
//S3A_Hlp= objNull;
S3A_Hlp=  cursorObject; 
S3A_Hlp_time= time;
onEachFrame {
	if (time-S3A_Hlp_time> 5) then
	{
		S3A_Hlp_time= time;
		_ins = lineIntersectsSurfaces [
			AGLToASL positionCameraToWorld [0,0,0], 
			AGLToASL positionCameraToWorld [0,0,1000], 
			 player,
            //objNull,
			 cursorObject,
            true,
			1,
			"GEOM",
			"view"
		];
		if (count _ins == 0) exitWith {arrow setPosASL [0,0,0]};
		arrow setPosASL (_ins select 0 select 0); 
		arrow setVectorUp (_ins select 0 select 1);
		

		S3A_Hlp= _ins select 0 select 2;
	};

}; */