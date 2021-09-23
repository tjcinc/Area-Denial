  [""] call BIS_fnc_logFormat;              		
		private "_time"; 
		_time = 9; 
		while {_time > 0 } do { 
		_time = _time - 1;		
		[parseText format["<t color='#ffff00' size='.5' shadow='1' shadowColor='#000000' align='Center'> %1 %2</t>", localize 'STR_ARMOREND', _time],-1,1,1,1,0,""] spawn BIS_fnc_dynamicText; 
		if ((player getvariable['MFired', false]) or !(vehicle player isKindOf 'MAN')or (_time<1) )then {        		
		_time = 0;
		player allowDamage true; 		
        [parseText format[" <t color='#ff0000' size='.5' shadow='1' shadowColor='#000000' align='center'>"+ localize 'STR_ARMORDISABLED' +"</t>"],-1,1,2,1,0,""] spawn BIS_fnc_dynamicText;	
		};  
		sleep 1; 
		};    