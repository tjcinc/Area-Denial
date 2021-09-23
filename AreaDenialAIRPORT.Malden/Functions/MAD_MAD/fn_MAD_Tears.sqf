 [""] call BIS_fnc_logFormat;
disableSerialization;
//waituntil {!isnull (finddisplay 46)};
_display = findDisplay 46;

_display displayAddEventHandler ["KeyUp", "if (inputAction 'personView' > 0) ExitWith { true };"];
//_display displayAddEventHandler ["KeyDown", "_this call MAD_fnc_keypress"];
//////////////////////////////////////////////////// 
  
PP_var_IN_hndl = ppEffectCreate ["ColorCorrections", 1707];
PP_var_IN_hndl ppEffectAdjust [1,0,0,[0.6,0,0,0.3],[1,0,0,0.2],[0.013,0.83,0.83,0],[0.5,0.3,-0.2,0.02,0,0,0.5]];
PP_var_IN_hndl ppEffectEnable false;
PP_var_IN_hndl ppEffectCommit 1.5;

PP_var_Blood_hndl = ppEffectCreate ["WetDistortion", 140];//WetDistortionFilmGrain 104
PP_var_Blood_hndl ppEffectAdjust [1, 1, 1, 4.10, 3.70, 2.50, 1.85, 0.004, 0.004, 0.002, 0.002, 0.5, 0.3, 20.0, 16.0];
PP_var_Blood_hndl ppEffectEnable false;
PP_var_Blood_hndl ppEffectCommit 1.5;



fnc_PPEffect_INC= {
	params ['_enabled'];
	player action ["nvGogglesOff",player];
	{_x ppEffectEnable _enabled; _x ppEffectCommit 1 } forEach [PP_var_Blood_hndl, PP_var_IN_hndl]; 
	waituntil 
	{	
		PP_var_IN_hndl ppEffectAdjust [1,0,0,[0.4,0,0,1],[1,0,0,0.2],[0.013,0.83,0.83,0],[0.5,0.0,-0.2,0.02,0,0,0.5]];
		PP_var_IN_hndl ppEffectCommit 0.5;
		sleep 1;
		PP_var_IN_hndl ppEffectAdjust [1,0,0,[0.4,0,0,1],[1,0,0,0.2],[0.013,0.83,0.83,0],[0.5,0.3,-0.2,0.02,0,0,0.5]];
		PP_var_IN_hndl ppEffectCommit 0.5;
		
		////////////
		_txt='';
		{
			if (alive _x) then 
			{
				_dist= round (_x distance player);
				if (_dist <50) then
				{
					_name= _x getVariable ['_N', name _x]; 
					_txt= _txt+format["<img align='Left' image='A3\ui_f\data\igui\cfg\actions\heal_ca.paa' color='#FF0000'/> <t color='#FFFFFF' size='1.2'>%1 (%2M)</t><br/>", _name, _dist ];
				};
			};
		} forEach ((allPlayers-[player]) select {side _x isEqualTo S3_Side});
		hint parseText _txt;
		////////////
		
		sleep 1;
		!(lifestate player in ['INCAPACITATED']);
	};
	{_x ppEffectEnable false; _x ppEffectCommit 0 } forEach [PP_var_Blood_hndl, PP_var_IN_hndl]; 
	player switchCamera 'INTERNAL';
};

AAAobj=[];

_magic = createTrigger["EmptyDetector", [0,0,0],false];
_magic setTriggerArea[0, 0, 0, true];
_magic setTriggerTimeout [0.1, 0.1, 0.1, false];
_magic setTriggerActivation["ANY","PRESENT", true]; 
_magic setTriggerStatements
[
"lifestate player in ['INCAPACITATED','DEAD-RESPAWN']", 
"player switchCamera 'INTERNAL'; [true] spawn fnc_PPEffect_INC; ",
" "
];