waitUntil {!isNil 'MAD_VM_EA_ID'};
_ea= !(player getvariable['_EARPLUGS',false]);
[""] call BIS_fnc_logFormat; 
	if (_ea) then 
	{
		player setUserActionText [MAD_VM_EA_ID, "<t color='#FF5050'> EARPLUGS OFF</t><img size='1'align='Right' image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_ON_ca.paa'/>"]; 
		2 fadeSound 0.3; 
		{_x setSpeaker "NoVoice";} forEach allUnits;
        if (vehicle player == player) then {[["earplugs", "earplugson"], 5,"", 5, "", true, false, false, false] call BIS_fnc_advHint;};		
		//[["earplugs", "earplugson"], 5,"", 5, "", true, false, false, true] call BIS_fnc_advHint;
	} else 
	{ 
	
		player setUserActionText [MAD_VM_EA_ID, "<t color='#FFFF50'> EARPLUGS ON</t><img size='1' align='Right' image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa'/>"]; 
		1 fadeSound 1; 
		//[["earplugs", "earplugsoff"], 5,"", 5, "", true, false, false, true] call BIS_fnc_advHint;
		 [["earplugs", "earplugsoff"], 5,"", 5, "", true, false, false, false] call BIS_fnc_advHint;
	};
	player setvariable['_EARPLUGS', _ea, false];
  
   