 [""] call BIS_fnc_logFormat;
params['_mode'];
disableSerialization;
switch (toUpper _mode) do
{
	case 'INIT':
	
	{
		//waituntil {!isnil "bis_fnc_preload_init"};
		private['_d'];
		//waituntil {_d= finddisplay 46; !isnull _d };
		
		_d= finddisplay 46;
		
		MAD_HUD_GPS_ZOOM=0.2;
		MAD_HUD_GPS_VISIBLE= true;
		MAD_HUD_HINT_TIME= 10;
		MAD_HUD_INFO_TIME= 1;//every x sec update info
		
		MAD_HUD_HINT='';
		MAD_HUD_hintMsgs=
		[
		localize "STR_HINT1",
		localize "STR_HINT2",
		localize "STR_HINT3",
		localize "STR_HINT4",
		localize "STR_HINT5",
		localize "STR_HINT6",
		localize "STR_HINT7"
		];
		MAD_HUD_hintBASTARD= toUpper (localize 'STR_MISSIONINFO1');
		
		//vehicle player addEventHandler ["FiredMan", {params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"]; player allowDamage true; player setvariable['MFired', true, false]; if !(vehicle _unit inArea t1) then { ['HINT', MAD_HUD_hintBASTARD,[1, 0.2, 0, 1]] spawn MAD_fnc_miniMap;}; }];
		
		MAD_HUD_HINT_TIMER= time+MAD_HUD_HINT_TIME;
		MAD_HUD_HINT_TIMER_INFO= time+MAD_HUD_INFO_TIME;
		
		
		
		{ctrlDelete _x} forEach (uiNamespace getVariable['MAD_HUD_GPS_CTRLS', [controlNull, controlNull, controlNull]]); 
		//Create
		_minimap = _d ctrlCreate ["MAD_RscMapControl", 10011];
		_pos = (ctrlPosition _minimap) select [0, 4];

		_pos set [1, safeZoneH+safeZoneY- (_pos select 3)-0.08];	//ARMA
		_pos set [0, (SafeZoneX+safeZoneWABS)- (_pos select 2)-0.015];	
		
		//_pos set [0, (SafeZoneX+safeZoneWABS)- (_pos select 2)-0.01];	
		_minimap ctrlSetPosition _pos;
		_minimap ctrlCommit 0;
		
		_minimap ctrlAddEventHandler ["Draw", {['DRAW', _this select 0] call MAD_fnc_miniMap}];
		
		_h = _d ctrlCreate ["RscStructuredText", 10012];
		_tp = ctrlposition _minimap;
		
		_h ctrlSetStructuredText parseText "<a size='0.7' color='#FFFFFF'><img  shadow= '0' color='#AAAAAAFF' image='A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\compass_ca.paa'/></a>";
		_h ctrlCommit 0;
		
		_tp set [1, (_tp select 1) -  (ctrlTextHeight _h)];
		_tp set [3,  ctrlTextHeight _h];
		
		_h ctrlSetPosition  _tp;
		_h ctrlSetBackgroundColor [0, 0, 0, 0.7];	
		_h ctrlSetStructuredText parseText '';
		_h ctrlSetFade 0;
		_h ctrlCommit 0;	
		
		_hb = _d ctrlCreate ["RscStructuredText", 10013];
		_tp = ctrlposition _minimap;
		
		_tp set [1, (_tp select 1)+(_tp select 3)];
		_tp set [3, 0.04];
		_hb ctrlSetPosition  _tp;
		_hb ctrlSetBackgroundColor [0, 0, 0, 0.7];	
		_hb ctrlSetStructuredText parseText '   LOADING GPS';
		_hb ctrlSetFade 0;
		_hb ctrlCommit 0;	
		
		uiNamespace setVariable['MAD_HUD_GPS_CTRLS', [_minimap, _h, _hb]];
		
		//INFO
		_aD= _d ctrlCreate ["RscStructuredText", 10001];
		_aD ctrlSetStructuredText parseText "<a shadow= '2' color= '#FFFFFF' align='Center'>Mercenaries run away with tears in their eyes</a>";
		_aD ctrlSetPosition [safeZoneXAbs, safeZoneH- (ctrlTextHeight _aD), SafeZoneWABS, ctrlTextHeight _aD];
		_aD ctrlSetBackgroundColor [0,0,0, 0.5];
		_aD ctrlSetFade 0;
		_aD ctrlCommit 0;
		uiNamespace setVariable ['HUD_INFO_PANEL', _aD];
		
        
       
		
		//FPS info
		_width= 0.5; 
		_fps = _d ctrlCreate ["RscStructuredText", 10013];
		_fps ctrlSetBackgroundColor [0, 0, 0, 0];	
		_fps ctrlSetStructuredText parseText 'FPS';
		_height= ctrlTextHeight _fps;
		//_fps ctrlSetPosition [SafeZoneXAbs, safeZoneH + safeZoneY -_height, _width, _height];
		_fps ctrlSetPosition [SafeZoneWAbs+SafeZoneX-_width, safeZoneH + safeZoneY -_height, _width, _height];
		
		_fps ctrlSetFade 0;
		_fps ctrlCommit 0;	
		uiNamespace setVariable['MAD_HUD_FPS', _fps];
		
		_d displayAddEventHandler ["KeyDOWN", "_res= false; if (_this select 3) then {switch (_this select 1) do {case 0x2C: { MAD_HUD_GPS_ZOOM= MAD_HUD_GPS_ZOOM-0.005; if (MAD_HUD_GPS_ZOOM< 0.005) then {MAD_HUD_GPS_ZOOM= 0.005; };_res= true;}; case 0x2D: { MAD_HUD_GPS_ZOOM= MAD_HUD_GPS_ZOOM+0.005; if (MAD_HUD_GPS_ZOOM> 1) then {MAD_HUD_GPS_ZOOM= 1; };_res= true;};}; }; if (inputAction 'minimapToggle'>0)then{ MAD_HUD_GPS_VISIBLE= !MAD_HUD_GPS_VISIBLE; {_x ctrlShow MAD_HUD_GPS_VISIBLE;  _x ctrlCommit 0;} forEach (uiNamespace getVariable['MAD_HUD_GPS_CTRLS', []]); _res= true}; _res"];
	// 
	};
	
	case 'HINT':
	{
		params['','_msg','_clr'];
		_h2= (uiNamespace getVariable 'MAD_HUD_GPS_CTRLS') select 2;
		_txt= format["<a size='0.8' color='#FFFFFF'><t align= 'center'>%1 </t></a>",_msg];
		if (count _this>=2) then 
		{
			//playSound3D ["a3\sounds_f\weapons\hits\metal_2.wss", vehicle player];
			_h2 ctrlSetBackgroundColor _clr;	
		};
		_pos= ctrlPosition _h2;
		_h2 ctrlSetStructuredText parseText _txt;
		_pos set[3, ctrlTextHeight _h2];
		_h2 ctrlSetPosition _pos; 
		
		_h2 ctrlCommit 0;
	};
	
	case 'DRAW':
	{
		params['','_map'];
		
		_h= (uiNamespace getVariable 'MAD_HUD_GPS_CTRLS') select 1;
		if (time> MAD_HUD_HINT_TIMER) then
		{
			MAD_HUD_HINT_TIMER= time+MAD_HUD_HINT_TIME;
			MAD_HUD_HINT= MAD_HUD_hintMsgs call bis_fnc_selectrandom;
			
			['HINT', MAD_HUD_HINT,[0, 0, 0, 0.7]] spawn MAD_fnc_miniMap;
		};
		
		_RCount=0; _WCount=0;
		_RCountT=0; _WCountT=0;		
		{		
             _side= _x getVariable ['_S',side _x];		
			
			if (_side isEqualTo RESISTANCE) then 
			{
				if (_x inArea t1 and alive _x) then { _RCount= _RCount +1};
				_RCountT= _RCountT+1;
			};
			if (_side isEqualTo WEST) then 
			{
				if (_x inArea t1 and alive _x) then { _WCount= _WCount +1};
				_WCountT= _WCountT+1;
			};			
		} forEach allplayers; 
	
				
		{
			_side= _x getVariable ['_S',side _x];
			//_side= _x getVariable '_S';
			
			if (_side isEqualTo RESISTANCE) then 
			{
				if (_x inArea t1 and alive _x) then { _RCount= _RCount +1};
				_RCountT= _RCountT+1;
			};
			if (_side isEqualTo WEST) then 
			{
				if (_x inArea t1 and alive _x) then { _WCount= _WCount +1};
				_WCountT= _WCountT+1;
			};			
		} forEach allunits - allPlayers - [r_aird,r_Airg,w_aird,w_airg];
		
		
		
		
       
		_txt = format["<a size='0.7' color='#FFFFFF'><img  shadow= '0' color='#AAAAAAFF' image='A3\ui_f\data\GUI\Rsc\RscDisplayArsenal\compass_ca.paa'/>%1 	[%2] <img  shadow= '0' color='#AAFF0000' size='0.5' image='A3\ui_f\data\igui\cfg\actions\heal_ca.paa'/> %3 %5 <t color='#EEFFFFFF' align= 'right'>%4 km/h</t></a>",
				round (direction vehicle player),  mapGridPosition getPos vehicle player, round ((1 - damage player) * 100), round (speed vehicle player), '%'];
		_h ctrlSetStructuredText parseText _txt;
		_h ctrlCommit 0;
		
		if (time> MAD_HUD_HINT_TIMER_INFO) then
		{
			MAD_HUD_HINT_TIMER_INFO= time+MAD_HUD_INFO_TIME;
			_infoCtrl= uinamespace getVariable ['HUD_INFO_PANEL', ctrlNull];
			_fps= str (round (diag_fps));
			while {count _fps<3}do {_fps='0'+_fps};

			_health = round ((1 - damage player) * 100);
			//_txt = format["<a align='center' size='1' color='#FFAA00'>%1 <img  shadow= '0' color='#AAAAAAFF' image='\A3\Data_F\Flags\Flag_red_CO.paa'/> %2 <a align='center' size='0.7' color='#FFFFFF'> %3 </a></a><a align='center' size='1' color='#00BBFF'> %4 <img  shadow= '0' color='#EEFFFFFF' image='\A3\Data_F\Flags\Flag_blue_CO.paa'/> %5 </a> ",
			/* _txt = format["<a align='center' size='1' color='#FFAA00'>%1 <img  shadow= '0' color='#AAAAAAFF' image='\WW2\Core_t\IF_Decals_t\US\flag_USA_co.paa'/> %2 <a align='center' size='0.7' color='#FFFFFF'> %3 </a></a><a align='center' size='1' color='#00BBFF'> %4 <img  shadow= '0' color='#EEFFFFFF' image='\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa'/> %5 </a> ",			
				_RCountT, _RCount, localize "STR_MADINAREA",  _WCount, _WCountT]; */  
               				
				 	
				_txt = format["<a align='center' size='1' color='#FFAA00'> <img  shadow= '0' color='#AAAAAAFF' image='\WW2\Core_t\IF_Decals_t\US\flag_USA_co.paa'/> %1 <a align='center' size='0.7' color='#FFFFFF'> %2 </a></a><a align='center' size='1' color='#00BBFF'> %3 <img  shadow= '0' color='#EEFFFFFF' image='\WW2\Core_t\IF_Decals_t\German\flag_GER_co.paa'/> </a> ",			
				//_RCountT, _RCount, localize "STR_MADINAREA",  _WCount, _WCountT];
               				
				 _RCount, localize "STR_MADINAREA",  _WCount];  // west vs resistance	
				
				
				
				
			_infoCtrl ctrlSetStructuredText parseText _txt;
			_infoCtrl ctrlSetPosition [safeZoneXAbs, safeZoneH + safeZoneY- (ctrlTextHeight _infoCtrl), SafeZoneWABS, ctrlTextHeight _infoCtrl];
			_infoCtrl ctrlCommit 0;
			
			_fpsCtrl= uiNamespace getVariable 'MAD_HUD_FPS';
			_fpsCtrl ctrlSetStructuredText parseText format
			["<a  align='center' size='0.8' color='#FFFFFF'><img  shadow= '0' color='#AAFF0000' size='0.5' image='A3\ui_f\data\igui\cfg\actions\heal_ca.paa'/>  HEALTH: %1 %2 <img  shadow= '0' color='#AAFFFF00' size='1' image='A3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_multiplayer_ca.paa'/> %3 %4 ONLY: %5 FPS </a>", 
			//_health, '%', localize "STR_MADPLAYERS", _WCountT+_ECountT, _fps];// west vs east
			_health, '%', localize "STR_MADPLAYERS", _WCountT+_RCountT, _fps];// west vs resistance
			_fpsCtrl ctrlCommit 0;
		};
		
		
		// ctrlSetPosition [SafeZoneWAbs+SafeZoneX-_width, safeZoneH + safeZoneY -_height, _width, _height];
		
		//*
		_p = getPos (vehicle player);
		_d = direction (vehicle player);
		
		
		if !(_p inArea t1) then
		{
			_l= _p distance2D markerPos "m1";
			_dir=[player, markerPos "m1"] call BIS_fnc_dirTo;
			_p1= (markerPos "m1") vectorAdd _p; 
			_p1= _p1 vectorMultiply 0.5;
			_clr= [0.3,1,0, abs(sin(time*100))];
			
			_asize= triggerArea t1; 
			//Array in format [a, b, angle, isRectangle, c], where: 
			if (_asize select 3) then 
			{
				_map drawRectangle [getPos t1, _asize select 0, _asize select 1, _asize select 2, _clr, "#(rgb,8,8,3)color(0.3,1,0,0.2)"];
			} else
			{
				_map drawEllipse [getPos t1, _asize select 0, _asize select 1, _asize select 2, _clr, "#(rgb,8,8,3)color(0.3,1,0,0.2)"];
			};
			
			_map drawRectangle 
			[
			_p1,
			3,
			_l/2,
			_dir,
			_clr,
			"#(rgb,8,8,3)color(0.3,1,0,0.5)"
			];
		};
		
		_map ctrlMapAnimAdd [0, MAD_HUD_GPS_ZOOM, _p];
		_map drawIcon [
		 'A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Threats\sector_ca.paa',
		// [1,1,1,0.85],
			[1,1,1,1],
		 _p,
		 128,
		 128,
		 _d,
		 '',//txt
		 0,
		 1,
		 'TahomaB',
		 'right'
		];

		_cAI = [1,1,1,1];
		_cAI set [3, 0.9];
		{
			_p = getPos (vehicle _x);
			_d = direction (vehicle _x);
			_map drawIcon [
			'A3\ui_f\data\IGUI\Cfg\simpleTasks\interaction_pointer6_ca.paa',
			_cAI,
			_p,
			48,
			48,
			_d,
			'',//txt
			0,
			1,
			'TahomaB',
			'right'
			];
		//} forEach ((Allunits- [player]) select {alive _x and side _x isEqualTo side player});	
		} forEach ((Allunits- [player,r_aird,r_Airg,w_aird,w_airg]) select {alive _x and (_x getVariable ['_S', side _x]) isEqualTo S3_Side});	
		ctrlMapAnimCommit _map;
		//*/
		
	};
};