if (!isServer)  exitwith {};
 
	
	addMissionEventHandler ["BuildingChanged", { 
	[""] call BIS_fnc_logFormat;
	params ["_previousObject", "_newObject", "_isRuin"];
    _bbr = boundingBoxReal _previousObject; 
	_p1 = _bbr select 0; 
	_p2 = _bbr select 1; 	
	_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	_near  = _maxHeight +5;   	
	diag_log format ["map = %1,new = %2, ruin = %3, near %4 ",_previousObject,_newObject,_isRuin, _near];
	if !(isTouchingGround _newobject) then {deletevehicle _newObject;}; //for delete _newobject in air	
	private _buildingPos = getPos _newObject;
	diag_log str _buildingPos;	
	private _buildingEntities =  _buildingPos nearEntities [["Man","Thing"], _near];
	diag_log str _buildingEntities;	
    private _buildingObjects = nearestObjects [_buildingPos, ["LandVehicle","Strategic","Thing"], _near];	        
	diag_log str _buildingObjects;
    _buildingObjects deleteAt (_buildingObjects find _newObject);
        {deleteVehicle _x} forEach _buildingObjects;
        {
            if (!isPlayer _x) then {
                if (alive _x) then {
                    _x setDamage 1;
                } else {
                    deleteVehicle _x;
                };
            };
        } forEach _buildingEntities;
	}];