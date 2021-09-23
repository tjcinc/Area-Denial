 [""] call BIS_fnc_logFormat;
 Params ['_vehicle'];
		private ['_vehicle']; 
        1 cutText ["<t color='#ff0000' size='5'>STANDBY FOR TAKEOFF</t>", "PlAIN", 1, true, true]; 
        1 cutFadeOut 3; 
		sleep 3;
		
        hint parseText "EARPLUGS <t size='1.8' color='#ffff00'> ON</t>";
        _vehicle setVehiclePosition[player,[],0,"FLY"];  
        _vehicle setAirplaneThrottle 0.9;
       		
		_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: {  
	     _vehicle setVelocityModelSpace [0, 50, 0]; 
		 player addBackpack "B_LIB_GER_LW_Paradrop";
		 };	
    case 1: {  
		_vehicle setVelocityModelSpace [0, 100, 0]; 
		 player addBackpack "B_Parachute";
		 };	
	case 2:{
		_vehicle setVelocityModelSpace [0, 100, 0]; 
		 player addBackpack "B_Parachute";
		 };
    case 3:{
         _vehicle setVelocityModelSpace [0, 100, 0];		 
		 player addBackpack "B_Parachute";
		 };		 
 	case 4:{  
	     _vehicle setVelocityModelSpace [0, 100, 0]; 
		 player addBackpack "B_Parachute";
		 };
		};
	
	  sleep 2;	 
		
	player sideChat "work in progres :) :) :)"; 







