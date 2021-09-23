if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat; 
_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
switch (_madclass) do {
    case 0: {[] spawn
 {
	 if !(isnil "bis_fnc_moduleCountdown_end") then 
	 {
	  terminate bis_fnc_moduleCountdown_end;
	  bis_fnc_moduleCountdown_end = nil;
	 };
	 MAD_END=nil;
	 _cc=0;
	 NAME_LOADOUT_MAD='ff:dd';
	 BIS_respawnMenu_stored= [];
	 waitUntil
	 {
	  sleep 0.15; 
	 if ([] call bis_fnc_missionTimeLeft ==0) then
	  {
	   MAD_END=true;	   
	   if (S1 getvariable "owner" == west) then {systemchat 'WEST'; "end1" call BIS_fnc_endMissionServer};	   
	   if (S1 getvariable "owner" == resistance) then {systemchat 'RESISTANCE'; "end2" call BIS_fnc_endMissionServer};
	   if (S1 getvariable "owner" == sideUnknown) then 
	   {		
		_rt= [resistance,0] call BIS_fnc_respawnTickets;
		_wt= [west,0] call BIS_fnc_respawnTickets;
		if (_rt==_wt) then {"epicFail" call BIS_fnc_endMissionServer} else
		{
			if (_rt>_wt) then {"end2" call BIS_fnc_endMissionServer} else {"end1" call BIS_fnc_endMissionServer};
		};	
	   };
	  };	  
	  if ([west,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end3" call BIS_fnc_endMissionServer};	 
	  if ([resistance,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end4" call BIS_fnc_endMissionServer}; 
	  !(isNil "MAD_END")
	 };
	};
	};	
	
    case 1: { [] spawn
	 {
	 if !(isnil "bis_fnc_moduleCountdown_end") then 
	 {
	  terminate bis_fnc_moduleCountdown_end;
	  bis_fnc_moduleCountdown_end = nil;
	 };	 
	 MAD_END=nil;
	 _cc=0;
	 NAME_LOADOUT_MAD='ff:dd';
	 BIS_respawnMenu_stored= [];	 
	 waitUntil
	 {
	  sleep 0.15;
	 if ([] call bis_fnc_missionTimeLeft ==0) then
	  {
	   MAD_END=true;	   
	   if (S1 getvariable "owner" == west) then {systemchat 'WEST'; "end5" call BIS_fnc_endMissionServer};	   
	   if (S1 getvariable "owner" == east) then {systemchat 'EAST'; "end6" call BIS_fnc_endMissionServer};
	   if (S1 getvariable "owner" == sideUnknown) then 
	   {
		_et= [east,0] call BIS_fnc_respawnTickets;		
		_wt= [west,0] call BIS_fnc_respawnTickets;
		if (_et==_wt) then {"epicFail" call BIS_fnc_endMissionServer} else
		{
			if (_et>_wt) then {"end8" call BIS_fnc_endMissionServer} else {"end7" call BIS_fnc_endMissionServer};
		};	
	   };
	  };	  
	  if ([west,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end7" call BIS_fnc_endMissionServer};
	  if ([east,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end8" call BIS_fnc_endMissionServer};	  
	  !(isNil "MAD_END")
	 };
	}; 
	};    
	
	case 2: { [] spawn
	 {
	 if !(isnil "bis_fnc_moduleCountdown_end") then 
	 {
	  terminate bis_fnc_moduleCountdown_end;
	  bis_fnc_moduleCountdown_end = nil;
	 };	 
	 MAD_END=nil;
	 _cc=0;
	 NAME_LOADOUT_MAD='ff:dd';
	 BIS_respawnMenu_stored= [];	 
	 waitUntil
	 {
	  sleep 0.15;
	 if ([] call bis_fnc_missionTimeLeft ==0) then
	  {
	   MAD_END=true;	   
	   if (S1 getvariable "owner" == west) then {systemchat 'WEST'; "end5" call BIS_fnc_endMissionServer};	   
	   if (S1 getvariable "owner" == east) then {systemchat 'EAST'; "end6" call BIS_fnc_endMissionServer};
	   if (S1 getvariable "owner" == sideUnknown) then 
	   {
		_et= [east,0] call BIS_fnc_respawnTickets;		
		_wt= [west,0] call BIS_fnc_respawnTickets;
		if (_et==_wt) then {"epicFail" call BIS_fnc_endMissionServer} else
		{
			if (_et>_wt) then {"end8" call BIS_fnc_endMissionServer} else {"end7" call BIS_fnc_endMissionServer};
		};	
	   };
	  };	  
	  if ([west,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end7" call BIS_fnc_endMissionServer};
	  if ([east,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end8" call BIS_fnc_endMissionServer};	  
	  !(isNil "MAD_END")
	 };
	}; 
	};   
	case 3: { [] spawn
	{
	if !(isnil "bis_fnc_moduleCountdown_end") then 
	{
	terminate bis_fnc_moduleCountdown_end;
	bis_fnc_moduleCountdown_end = nil;
	};	 
	MAD_END=nil;
	_cc=0;
	NAME_LOADOUT_MAD='ff:dd';
	BIS_respawnMenu_stored= [];	 
	waitUntil
	{
	 sleep 0.15;
	if ([] call bis_fnc_missionTimeLeft ==0) then
	{
	MAD_END=true;	   
	if (S1 getvariable "owner" == west) then {systemchat 'WEST'; "end5" call BIS_fnc_endMissionServer};	   
	if (S1 getvariable "owner" == east) then {systemchat 'EAST'; "end6" call BIS_fnc_endMissionServer};
	if (S1 getvariable "owner" == sideUnknown) then 
	   {
		_et= [east,0] call BIS_fnc_respawnTickets;		
		_wt= [west,0] call BIS_fnc_respawnTickets;
		if (_et==_wt) then {"epicFail" call BIS_fnc_endMissionServer} else
		{
			if (_et>_wt) then {"end8" call BIS_fnc_endMissionServer} else {"end7" call BIS_fnc_endMissionServer};
		};	
	   };
	  };	  
	  if ([west,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end7" call BIS_fnc_endMissionServer};
	  if ([east,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end8" call BIS_fnc_endMissionServer};	  
	  !(isNil "MAD_END")
	 };
	}; 
	}; 	
	
	case 4: { [] spawn
	{
	if !(isnil "bis_fnc_moduleCountdown_end") then 
	{
	terminate bis_fnc_moduleCountdown_end;
	bis_fnc_moduleCountdown_end = nil;
	};	 
	MAD_END=nil;
	_cc=0;
	NAME_LOADOUT_MAD='ff:dd';
	BIS_respawnMenu_stored= [];	 
	waitUntil
	{
	 sleep 0.15;
	if ([] call bis_fnc_missionTimeLeft ==0) then
	{
	MAD_END=true;	   
	if (S1 getvariable "owner" == west) then {systemchat 'WEST'; "end5" call BIS_fnc_endMissionServer};	   
	if (S1 getvariable "owner" == east) then {systemchat 'EAST'; "end6" call BIS_fnc_endMissionServer};
	if (S1 getvariable "owner" == sideUnknown) then 
	   {
		_et= [east,0] call BIS_fnc_respawnTickets;		
		_wt= [west,0] call BIS_fnc_respawnTickets;
		if (_et==_wt) then {"epicFail" call BIS_fnc_endMissionServer} else
		{
			if (_et>_wt) then {"end8" call BIS_fnc_endMissionServer} else {"end7" call BIS_fnc_endMissionServer};
		};	
	   };
	  };	  
	  if ([west,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end7" call BIS_fnc_endMissionServer};
	  if ([east,0] call BIS_fnc_respawnTickets <1) then {MAD_END=true;  "end8" call BIS_fnc_endMissionServer};	  
	  !(isNil "MAD_END")
	 };
	}; 
	}; 
};