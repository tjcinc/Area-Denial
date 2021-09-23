
[""] call BIS_fnc_logFormat;
private _logics = [];
private _logicIDs = [];
private _item1 = objNull;

	_item1 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleCurator_F",[694.258,12148,0],[],0,"CAN_COLLIDE"];
	_this = _item1;
	_logics pushback _this;
	_logicIDs pushback 1;
	_this setPosWorld [694.258,12148,28.92];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	zeus = _this;
	_this setVehicleVarName "zeus";
	_this setVariable ['Owner',"#adminlogged",true];;
	//_this setVariable ['Owner',"76561198049021315",true];;
	_this setVariable ['Name',"",true];;
	_this setVariable ['Addons',3,true];;
	_this setVariable ['Forced',0,true];;
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];

if !(isNull _item1) then {_item1 setvariable ["BIS_fnc_initModules_activate",true];};

private _item2 = objNull;

	_item2 = (group (missionNamespace getvariable ["BIS_functions_mainscope",objnull])) createUnit ["ModuleCuratorSetAttributesPlayer_F",[5313.87,1041.39,0],[],0,"CAN_COLLIDE"];
	_this = _item2;
	_logics pushback _this;
	_logicIDs pushback 2;
	_this setPosWorld [5313.87,1041.39,5];
	_this setVectorDirAndUp [[0,1,0],[0,0,1]];
	_this setVariable ['Curator',"zeus",true];;
	_this setVariable ['Skill',true,true];;
	_this setVariable ['UnitPos',true,true];;
	_this setVariable ['Rank',true,true];;
	_this setVariable ['Damage',true,true];;
	_this setVariable ['Fuel',true,true];;
	_this setVariable ['Lock',true,true];;
	_this setVariable ['RespawnVehicle',true,true];;
	_this setVariable ['RespawnPosition',true,true];;
	_this setVariable ['Exec',true,true];;
	_this setvariable ["BIS_fnc_initModules_disableAutoActivation",true];

if !(isNull _item2) then {_item2 setvariable ["BIS_fnc_initModules_activate",true];};

sleep 2;




 _allShit= (nearestTerrainObjects [getmarkerpos "m1", [""], 2000]) + allMissionObjects "All" + allplayers+playableUnits; 
[zeus , [_allShit, false]] remoteExec ['addCuratorEditableObjects', 2, false];
 
 
	
/* {_x addEventHandler [ "CuratorObjectPlaced", {
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
}forEach allCurators; */

/* {_x addEventHandler [ "CuratorGroupPlaced", {
		params[ "", "_group" ];
    	
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
	
} forEach units _group; 	
	
	}];
}forEach allCurators; */