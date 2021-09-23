
if (!isServer)  exitwith {}; 

	for "_i" from 0 to ((count paramsArray) - 1) do
	{
		missionNamespace setVariable [configName ((missionConfigFile >> "Params") select _i), paramsArray select _i];
	};	
	[] spawn MAD_fnc_trees; 
	[] spawn Mad_fnc_End;
	[] spawn MAD_fnc_AiParam;
	[] spawn MAD_fnc_buildingchanged;
	if (['MAD_ZEUS', 1] call BIS_fnc_getParamValue isEqualTo 1) then{[] spawn Mad_fnc_Zeus;};    
	addMissionEventHandler ['HandleDisconnect',{deleteVehicle (_this select 0);}];

	["Initialize"] call BIS_fnc_dynamicGroups;
	_time = ["MAD_Time",750] call BIS_fnc_getParamValue;
	[_time] call BIS_fnc_estimatedTimeLeft;

	_tickets = ["MAD_Tickets",75] call BIS_fnc_getParamValue;
	
   _madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: { "re_1" setMarkerColor "ColorGreen";
		"respawn_east" setMarkerAlpha 0;
		["m1", [west,resistance]] spawn MAD_fnc_SectorSetup;
		[west, _tickets] call BIS_fnc_respawnTickets;   
		[resistance, _tickets] call BIS_fnc_respawnTickets;
        w_air setCaptive true;
        r_air setCaptive true;
	};	
   case 1: {"respawn_guerilla" setMarkerAlpha 0;
		["m1", [west,east]] spawn MAD_fnc_SectorSetup; 
		[west, _tickets] call BIS_fnc_respawnTickets;   
		[east, _tickets] call BIS_fnc_respawnTickets;
		["forgetTarget","onEachFrame", { 
		{
		_x forgetTarget w_air;             
		_x forgetTarget e_air;		
		} foreach allunits- allPlayers;
		}] call bis_fnc_addStackedEventHandler;
	    };
	case 2: {"respawn_guerilla" setMarkerAlpha 0;
		["m1", [west,east]] spawn MAD_fnc_SectorSetup; 
		[west, _tickets] call BIS_fnc_respawnTickets;   
		[east, _tickets] call BIS_fnc_respawnTickets;
		["forgetTarget","onEachFrame", { 
		{
		_x forgetTarget w_air;             
		_x forgetTarget e_air;	
		} foreach allunits- allPlayers;
		}] call bis_fnc_addStackedEventHandler;
		RHS_ENGINE_STARTUP_OFF = true;
		};
		
	case 3: {"respawn_guerilla" setMarkerAlpha 0;
		["m1", [west,east]] spawn MAD_fnc_SectorSetup; 
		[west, _tickets] call BIS_fnc_respawnTickets;   
		[east, _tickets] call BIS_fnc_respawnTickets;
		["forgetTarget","onEachFrame", { 
		{
		_x forgetTarget w_air;             
		_x forgetTarget e_air;		
		} foreach allunits- allPlayers;
		}] call bis_fnc_addStackedEventHandler;
	    };
    case 4: {"respawn_guerilla" setMarkerAlpha 0;
		["m1", [west,east]] spawn MAD_fnc_SectorSetup; 
		[west, _tickets] call BIS_fnc_respawnTickets;   
		[east, _tickets] call BIS_fnc_respawnTickets;
		["forgetTarget","onEachFrame", { 
		{
		_x forgetTarget w_air;             
		_x forgetTarget e_air;		
		} foreach allunits- allPlayers;
		}] call bis_fnc_addStackedEventHandler;			
	}; 	
    }; 
  
  
 ["itemAdd", ["MAD01", { _allShit= (nearestTerrainObjects [getpos player, [""], 20000]) + allMissionObjects "All" + allplayers+playableUnits; 
 [zeus , [_allShit, false]] remoteExec ['addCuratorEditableObjects', 2, false]; }, 10]] call BIS_fnc_loop;