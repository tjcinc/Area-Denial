 if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat;  
	 params ['_unit','_unit2'];   
	   
      {deleteWaypoint _x;} forEach (waypoints (group _unit));	
	  
	  
	   
	  
       private['_unit','_grp','_wType1','_target','_wp','_wType2','_target2','_wp2','_wType3','_target3','_wp3'];
	     
        _wType1= 'MOVE';// 'SENTRY' 'MOVE'
		_target=[["m1"],nil] call BIS_fnc_randomPos;
		_grp= group _unit;		
		_wp= _grp addWaypoint[_target, 0,1]; 	
		_wp setWaypointType _wType1; 		
		[_grp, 1] setWaypointSpeed "FULL";
		[_grp, 1] setWaypointCombatMode "YELLOW";
		[_grp, 1] setWaypointBehaviour "COMBAT";		
		_wp  setWaypointCompletionRadius 20;
		_wType2= 'SAD';
		_target2=[["m2"],nil] call BIS_fnc_randomPos;		
		_wp2= _grp addWaypoint [_target2, 0,2];		
		_wp2 setWaypointType _wType2;
		[_grp, 2] setWaypointSpeed "FULL";	
		[_grp, 2] setWaypointCombatMode "RED";
		[_grp, 2] setWaypointBehaviour "STEALTH";
       // _wp2  setWaypointCompletionRadius 10;
        _wType3= 'GUARD';
		_target3=[["m2"],nil] call BIS_fnc_randomPos;		
		_wp3= _grp addWaypoint [_target3, 0,3];		
		_wp3 setWaypointType _wType3;
		[_grp, 3] setWaypointSpeed "NORMAL";	
		[_grp, 3] setWaypointCombatMode "RED";
		[_grp, 3] setWaypointBehaviour "COMBAT";
		
      // systemChat "waypointdone";