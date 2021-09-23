if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat; 
 params ['_unit'];
		private['_unit','_unit1','_unit2','_veh','_U','_stype','_grp','_grp2'];
        _unit1= _unit; 
		while {(count (waypoints (group _unit1))) > 0} do
		{
		deleteWaypoint ((waypoints (group _unit1)) select 0);
		};		
		{deleteWaypoint _x;} forEach (waypoints (group _unit1));      	
		_nO= (nearestObjects [_unit1, ['CAR'], 100]) select {alive _x};
		_stype =  _unit1 getVariable '_U';			
		if (_nO isEqualTo [])  exitwith {[_unit1]call MAD_fnc_waypoint; diag_log "no near vehicle"; };			
		if (count _nO>0)  then 			
		{							  
		_nO= _nO call bis_fnc_selectrandom;		
		if  (_nO getvariable "taken"== 1) exitwith { [_unit1]call MAD_fnc_waypoint; diag_log "vehicle taken"; }; 		
		_veh = _nO;
        _veh setvariable ["taken",1];
		
		_unit1 assignAsDriver _veh;			
		_unit1 moveindriver _veh;
       // _unit1 action ["GETINDRIVER",_veh]; 
		sleep .25;
		//_cnt = ({alive _x} count (units group _unit1)); 	
        	_cnt = count units group _unit;	
			diag_log str _cnt;
		if (_cnt<2) then
		{   			
		_closeEntities  = _unit1 nearEntities [_stype, 200];								
		_closeUnit = _closeEntities - allPlayers-[_unit1];		
		_infantryWithoutVehicle = [];
		{if (assignedVehicleRole _x isEqualTo []) then {_infantryWithoutVehicle pushBack _x;};} forEach _closeunit;							
		if ((_closeEntities isEqualTo [])or(_closeunit isEqualTo [])or(_infantryWithoutVehicle isEqualTo [])) exitwith 
		{ 
		diag_log format ["i cant get a gunner:%1,vehicle:%2",_unit1,_veh ];
		doGetOut _unit1;
		{ unassignVehicle _x } forEach crew _veh;
		crew _veh allowGetIn false;		       		
		 [_unit1]call MAD_fnc_waypoint;
		};		
		_unit2 = selectRandom _infantryWithoutVehicle;
		while {(count (waypoints (group _unit2))) > 0} do
		{
		deleteWaypoint ((waypoints (group _unit2)) select 0);
		};	
        {deleteWaypoint _x;} forEach (waypoints (group _unit2));
		
		
		
		if (_veh emptyPositions "gunner">0)   then
			{				
			_unit2 assignAsGunner _veh;
			_unit2 moveingunner _veh;		
			//_unit2 action ["GETINGUNNER",_veh];		
			}else
			{ if (_veh emptyPositions "cargo">0) then
			{
			
			_unit2 assignAsCargo _veh;				
			_unit2 moveincargo _veh;
			//_unit2 action ["GETINCARGO",_veh];
			};
			};
		 
        sleep 10;
		
		 if ((count (crew _veh)) == 1) exitwith  {diag_log "im alone"; {[_x]call MAD_fnc_waypoint; }forEach crew _veh; { doGetOut _x }forEach crew _veh;{unassignVehicle _x } forEach crew _veh; crew _veh allowGetIn false;};		
		    		
		[_unit1] call MAD_fnc_vehwaypoint;
 		
       
		
	   
        		 
		};//else  in case there are groups of more then one//		
		};  
 	