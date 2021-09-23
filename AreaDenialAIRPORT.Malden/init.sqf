{_x addEventHandler [ "CuratorObjectPlaced", {
		params[ "", "_entity" ];
    	
	  {	
    _side= side _x;
	_x setVariable ['_S', _side, true]; 
    _x setVariable ['_PC', _side, true];
   
	   _x addMPEventHandler ["MPKilled",{
	    params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isNull _instigator) then {_instigator = _killer};
		if (_killer inArea t1 and {_unit inArea t1}) then {
		if (_unit isEqualTo _killer) then 
		{
			_bastard= _unit getVariable['_BASTARD', objNull];
  
		if (_bastard inArea t1 and {_killer inArea t1}) then {
		[_unit,-1,true] call bis_fnc_respawnTickets} else {[_unit,-1,true] call bis_fnc_respawnTickets};
		}
		else
		{
			[_unit,-1,true] call bis_fnc_respawnTickets;
		};
	    };		
	    }];
		
	  _x addEventHandler["Killed",{
	   
       _killed = _this select 0; 
       _killer = _this select 1; 
       if (_killer == _killed) exitWith {}; 
       if (isNull _killer) exitWith {}; 
       if (isNull _killed) exitWith {}; 
       format["%1 was killed by %2",name _Killed, name _killer] remoteExec["systemChat",0];
	   
       }];

	
} forEach crew _entity; 	
	
	}];
}forEach allCurators;

RHS_ENGINE_STARTUP_OFF = true;