if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat;  
	params ['_unit'];
    //systemChat format [ "vehiclewaypoint:%1",_unit];
    private['_unit','_veh','_grp','_wType1','_target','_wp','_wType2','_target2','_wp2'];
	   
        {deleteWaypoint _x;} forEach (waypoints (group _unit));			
		
        _wType1= 'SENTRY';// 'SENTRY' 'MOVE'
		_target=[["m2"],nil] call BIS_fnc_randomPos;
		_grp= group _unit;
		_wp= _grp addWaypoint[_target, 0,1];
		_wp setWaypointType _wType1;
		[_grp, 1] setWaypointSpeed "SLOW";
		[_grp, 1] setWaypointCombatMode "RED";
		[_grp, 2] setWaypointBehaviour "COMBAT";
		_wp  setWaypointCompletionRadius 20; //waypoint may not be close to rd
		_wType2= 'guard';
		_target2=[["m2"],nil] call BIS_fnc_randomPos;
		_wp2= _grp addWaypoint [_target2, 0,2];
		_wp2 setWaypointType _wType2;
		[_grp, 2] setWaypointSpeed "SLOW";
		[_grp, 2] setWaypointCombatMode "RED";
		[_grp, 2] setWaypointBehaviour "COMBAT";
		_wp2  setWaypointCompletionRadius 50; //waypoint may not be close to rd
		//[_grp,2] setWaypointStatements ['true', "{[_x] orderGetIn false;}forEach group (crew _veh);"];
		//[_grp,2] setWaypointStatements ['true', "{[_x] orderGetIn false;}forEach thisList;"];
		
		
       