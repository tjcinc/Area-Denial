[""] call BIS_fnc_logFormat;
params ['_type','_admin'];
switch (_type) do 
{
	case ('INIT'):
	{
		disableSerialization;
		private['_display'];
		_display = findDisplay 46;
		_display displayAddEventHandler ["KeyDown","call MAD_fnc_banAllChat"];
		MAD_ADMIN_UPDATELB=
		{
			_lb= uiNamespace getvariable '_AM2Lb'; 
			lbClear _lb; 
			S3_suspect=ObjNull; 
			{
				_lb lbAdd ( _x getVariable ['_N', name _x]); 
				//_lb lbAdd ([ _x ] call BIS_fnc_getName); 
				_col= [0,1,0,1];
				if (side _x isEqualTo east) then {_col=[1,0.6,0,1]};
				if (side _x isEqualTo west) then {_col=[0,0.7,1,1]};
				_lb lbSetColor [_forEachIndex, _col]; 
				_lb lbSetData [_forEachIndex, str _x] 
			} forEach allPlayers;
		};
		//variables
		s3A_VTBAN=false;
	};
	
	case ('AC'): //Anti hack
	{
		_loop= [] spawn
		{
			scriptName "MAD_AntiHackLOOP";
			//player sideChat 'Anti hack Enabled';
			/* [] spawn 
			{
				sleep 5;
				titleText [format["<t color='#ff0000' size='3'>%1</t>", 'Anti hack Enabled'], "BLACK FADED", -1, false, true];
				titleFadeOut 3;
			}; */
			_speedC=0;
			_recoilC=0;
			_randTime= time+ random (15);
			while {true} do
			{
			["antihackloop"] call BIS_fnc_logFormat;
			//systemChat Format['Admin: %1',  missionNamespace getVariable['MAD_ADMIN', objNull]];
				//anti cheat////////////////////////////////////////////////////////////
				_res= false;
				if (alive player) then
				{
					//test
					//player addWeaponItem [currentWeapon player,  [currentMagazine player, 1000]];
					//player setdamage 0;
					//player setunitRecoilCoefficient 0;
					//player setCustomAimCoef 0;
					//player setAnimSpeedCoef 1.3;
					//systemchat str time;
					
					//recoil
					_myRecoil = unitRecoilCoefficient player;
					_coef =  getCustomAimCoef player;
					if (_coef<0.5 or _myRecoil<1) then
					{
						if (alive player) then
						{
							_recoilC= _recoilC+1;
							if (_recoilC>15) then
							{
								_recoilC=0;
								[format['>>> %1: i''m recoil hacker A: %2 R: %3', name player, _coef, _myRecoil]]remoteExec ["systemchat", -2, false];
								_res= true;
							};
						};
					};
					///////////////
					
					//speed hack// man only
					/* _vp= vehicle player;
					_max= getNumber (configfile >> "CfgVehicles" >> typeOf _vp >> "maxSpeed")+1;
					if (speed _vp > _max and _vp isKindOf 'MAN' and isTouchingGround _vp) then //_max!=0 and isTouchingGround _vp
					{
						
						if (alive player) then
						{
							_speedC=_speedC+1;
							if (_speedC>10) then
							{
								_speedC=0;
								[format['>>> %1: i''m speed hacker speed: %2', name player, speed _vp]] remoteExec ["systemchat", -2, false];
								player setUnconscious true;
								[] spawn { sleep 3; player spawn MAD_fnc_lightning}; 
								_res= true;
							};
						};
					}; */
					///////////////
					
					if (_res) then //catched
					{
						//player setDamage 1;
					};
					
					//uniform
					if (time>_randTime) then 
					{
						if (uniform player == "U_O_T_Soldier_Hidden_F" or isObjectHidden player) then 
						{
							player spawn MAD_fnc_lightning; 
							[player, format['INVISIBLE HACKER (%1)', name player]] remoteExec ['sideChat', -2, false];
							[player, 'RAIDEN: I caught one little bastard. You cannot hide from retaliation.'] remoteExec ['systemChat', -2, false];
							_randTime= time+ 5 +random (15);
						};
					};
					 
					
				} else {_speedC=0; _recoilC=0;};
				sleep 5;
			};	
		};
	};
	
	case ('VTBAN'): //Voice and Txt ban
	{
		_status= !(s3A_VTBAN);
		s3A_VTBAN= _status;
		if (_status) then { HINT 'You voice chat blocked' } else  { HINT 'You voice chat unblocked' };
	};
	
	case ('KILL'): //Voice and Txt ban
	{
	_t= player;
    _group = createGroup independent;  
    _lightning = _group createUnit ["ModuleLightning_F", getPos _t, [], 0, "CAN_COLLIDE"];
    _t setdamage 1;	
	};
	
	case ('BAN'): //Voice and Txt ban
	{
	  _list= BAN_E getVariable['BAN_LIST',[]]; _list pushBackUnique (getPlayerUID player); BAN_E setVariable['BAN_LIST', _list, true]; player setPos (getPos BAN_E);
      removeAllWeapons player;
	  player setUnitLoadout [getunitLoadout 'C_scientist_F', true]; 
	  disableSerialization; _hud= uinamespace getVariable 'HUD_MINES'; _hud ctrlSetFade 1; _hud ctrlCommit 0;
	  S3_MINESMOD_CNT=S3_MINESMOD_CNT-2;
	  S3_MY_IED_CNT= S3_MY_IED_CNT-1;			
	
	};
	
		
	//onButtonClick= "['PARAMSTEST', player] remoteExec ['MAD_fnc_banApply', S3_suspect, false] ";
	case ('PARAMSTEST'):
	{
		if !(alive player) exitWith {'Info: ',[format['Not alive yet: %1', name player]] remoteExec ['HintC', _admin, false]};
		
		_myRecoil= unitRecoilCoefficient player;
		_coef=  getCustomAimCoef player;
		_spd= getAnimSpeedCoef player;
		_txt= [];
		
		//Experimental
		_od= damage player;
		_d= 0.01+ random 0.1;
		player setDamage (_d+_od);
		sleep 0.15;
		if !(damage player isEqualTo (_d+_od)) then
		{
			if (alive player) then
			{
				//[format['>>> %1: i''m heal hacker', name player]]remoteExec ["systemchat", BAN_E getVariable['_admin', objNull], false];	
				_txt pushBack format['>>> %1: i''m heal hacker', name player];
			};
		} else 
		{
			player setDamage (_od);
		};
		
		if (alive player and isObjectHidden player) then
		{
			_txt pushBack format['>>> %1: i''m invisible hacker', name player];	
		};
		
		//_txt pushBack format['UID: %1', getPlayerUID player];
		//_txt pushBack format['S3_side: %1 S3_name: %2', S3_side, S3_name];
		//_txt pushBack format['_S: %1 _N: %2', player getVariable ['_S', 'shitSide'], player getVariable ['_N', 'shitSide']];
		//_txt pushBack format['Recoil Coefficient [%1]', _myRecoil];
		//_txt pushBack format['Custom Aim Coefficient [%1]', _coef];
		//_txt pushBack format['Vehicle: %1 side: %2 Damage: %3 (%4) Type: %5 Uniform: %6', player, side player, isDamageAllowed player, damage player, typeOf vehicle player, uniform player]; 
		//_txt pushBack format['SpeedA: %1 Speed: %2', _spd, speed vehicle player]; 
		_txt pushBack str diag_activeSQFScripts;
			
		[format['Params test: %1', name player], _txt] remoteExec ['HintC', _admin, false];
	};	

};//SW