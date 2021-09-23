[""] call BIS_fnc_logFormat;
params['_c','_btn','_xP', '_yP','','_ctrl'];
	
	if (_btn!=0 and _ctrl ) ExitWith 
	{
		uiNamespace setVariable['MAD_IN_AIR', not (uiNamespace getVariable['MAD_IN_AIR',false])];		
		if (uiNamespace getVariable['MAD_IN_AIR',false]) then 
			{
			hint "HALO INSERTION SELECTED";
			}else
			{
			hint "GROUND INSERTION SELECTED";
			};			
	};
	if (_btn==1) exitWith{}; 

	_pos = _c ctrlMapScreenToWorld [_xP, _yP]; 
	private _m='';
	switch (playerside) do
	{
		case west: {_m='w'};
		case east: {_m='e'};
		case resistance: {_m='e'};
	};	
	_mS= format['r%1_1', _m];
	if (_pos inArea _mS) then
	{
		private['_mname'];
		_exit= false;
		{
			if (_pos distance2D _x <5) ExitWith 
			{
				//player sidechat str _x;
				_exit=true			
			};
		} forEach (playerSide call BIS_fnc_getRespawnPositions); 
		if (_exit) ExitWith 
		{   
			//player sidechat 'too close to existing spawnpoint';
			_mname= "respawn_"+ toLower (str playerside)+ '_CUSTOM';
		};	
		_mname= "respawn_"+ toLower (str playerside)+ '_CUSTOM';		
		if (_mname in AllMapMarkers) then {deleteMarkerLocal _mname};	
		_marker= createMarkerLocal [_mname, _pos];
		_marker setMarkerTextLocal "CUSTOM";
        
	player setVariable ['Mad_respawn_pos', _pos, false];	

     
	[] spawn MAD_fnc_respawnmapclick2;	
	
    };
	
	
    

    