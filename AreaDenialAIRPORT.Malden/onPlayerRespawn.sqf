    

player setVariable ['_N', S3_NAME, true];
player setVariable ['_S', S3_Side, true];
player setVariable ['MFired', false, false];
player enableStamina false;
player enableFatigue false;
player disableTIEquipment true;
player switchCamera 'INTERNAL';
//[player, "NoVoice"] remoteExec ["setSpeaker", 0, true];
player setSpeaker "NoVoice";
showGPS false;
[] spawn MAD_fnc_playeractions;
[]spawn Mad_fnc_WML;	
 
 if (getPlayerUID player in (BAN_E getVariable['BAN_LIST',[]])) exitWith 
	{ []spawn
	    {
		removeAllWeapons player;
		player setUnitLoadout [getunitLoadout 'C_scientist_F', true];
		_spawn = player getvariable '_groupspawn'; 
		if ( _spawn isEqualTo true )then 
		{
		UID call BIS_fnc_removeRespawnPosition; player setvariable['_groupspawn', false, false];
		 };
		 disableSerialization; _hud= uinamespace getVariable 'HUD_MINES'; _hud ctrlSetFade 1; _hud ctrlCommit 0;
		S3_MINESMOD_CNT=S3_MINESMOD_CNT-2;
		S3_MY_IED_CNT= S3_MY_IED_CNT-1;			
		 
		sleep 1;		
		Hint 'TEMPORARY BAN'; 
		if !(vehicle player isKindOf 'MAN') then {moveOut  player;};
		
		player setPos (getPos BAN_E);
        };	
	};   
	[["Welcomehint2","intro"], 10,"", 20, "", true, true, true, true] call BIS_fnc_advHint;
   
    player setVariable ["c_inventory", getUnitLoadout player, false];
	
	[] spawn{
	if ((daytime < 4) || (daytime >18)) then
	{
		_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
		switch (_madclass) do {
		case 0: { };	    	
		case 1: { player additem "NVGoggles";
				  player additem "optic_NVS";
			      player assignitem "NVGoggles";
				  sleep 2;
				  HintSilent 'Night Vision Items added to Kit';	
			};	
		case 2: { player additem "NVGoggles";
			      player additem "optic_NVS";
			      player assignitem "NVGoggles";
				  sleep 2;
				  HintSilent 'Night Vision Items added to Kit';	
			};   
		case 3: { player additem "CUP_NVG_PVS15_black";
			      player additem "CUP_optic_AN_PVS_10_black";
			      player assignitem "CUP_NVG_PVS15_black";
				  sleep 2;
				  HintSilent 'Night Vision Items added to Kit';	
			};
        case 4: { }; 				
		};	
      		
	};
	};
	
	[] spawn
	{
	//sleep 1;
    _role = call MAD_fnc_getRole; 
	if !((_role == "west_CUPsleader_1") or(_role == "west_CUPrecon_1")or(_role == "east_CUPsleader_1") or(_role == "east_CUPrecon_1")or(_role == "west_vnsleader_1") or(_role == "west_vnrecon_1")or(_role == "east_vnsleader_1") or(_role == "east_vnrecon_1")or(_role == "west_wwassault_1") or(_role == "west_wwrecon_1")or(_role == "resistance_wwassault_1") or(_role == "resistance_wwrecon_1")  or(_role == "west_sleader_1") or(_role == "west_recon_1")or(_role == "east_sleader_1") or(_role == "east_recon_1")      )  then
	{
	[] spawn {disableSerialization; _hud= uinamespace getVariable 'HUD_MINES'; _hud ctrlSetFade 1; _hud ctrlCommit 0};
	S3_MINESMOD_CNT=S3_MINESMOD_CNT-2;
    S3_MY_IED_CNT= S3_MY_IED_CNT-1;
	hint "no mines for this class";
	}else 
	{
	hint "press 4 for tripwire, press 5 for ied"
	};
	};
	{ _x addCuratorEditableObjects [[player],true ];} foreach allcurators;	