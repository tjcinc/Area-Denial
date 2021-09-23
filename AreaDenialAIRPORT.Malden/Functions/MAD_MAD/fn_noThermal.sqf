[""] call BIS_fnc_logFormat;
scriptName "MAD_fncThermal.sqf";
/* _layer = 85125; 
while {true} do 
{ 
    if (currentVisionMode player == 2) then
	{ 
		  //hint "Thermals are active";
		_layer    cutText ["NO THERMALS PRESS N!!!.","BLACK",-1];
		playSound "FD_CP_Not_Clear_F";
		waituntil {currentVisionMode player != 2};
		_layer cutText ["", "PLAIN"];
	};
	sleep 5; 
	["thermal check"] call BIS_fnc_logFormat;
	
}  */
 ["itemAdd", ["MADThermal", {_layer = 85125;
 if (currentVisionMode player == 2) then{ 	  
_layer cutText ["NO THERMALS PRESS N!!!.","BLACK",-1];
playSound "FD_CP_Not_Clear_F";
waituntil {currentVisionMode player != 2};
_layer cutText ["", "PLAIN"];
};["thermal check"] call BIS_fnc_logFormat;}, 5]] call BIS_fnc_loop;