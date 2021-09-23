 [""] call BIS_fnc_logFormat;
 if (!isServer)  exitwith {}; 
 
 #include "..\..\Mission\params.hpp"
  sleep 4;    	
params['_marker','_sides'];

_MAD_isRectangle= (markerShape _marker) == 'RECTANGLE';
//_MAD_SIZE= markerSize _marker;
_size= ["MAD_Size",75] call BIS_fnc_getParamValue;
//MAD_AREA= [_MAD_SIZE select 0, _MAD_SIZE select 1, markerDir _marker, _MAD_isRectangle,100];
MAD_AREA= [_size , _size , markerDir _marker, _MAD_isRectangle,100];
MAD_SIDES= _sides;
MAD_MARKER= _marker;
publicVariable "MAD_SIDES";
_type= ["MAD_AreaType",0] call BIS_fnc_getParamValue;
_size= ["MAD_Size",75] call BIS_fnc_getParamValue;
missionNamespace setVariable ['MAD_Size', _size,true];
 
switch (_type) do 
{
	case 1: {MAD_AREA= [_size, _size, markerDir MAD_MARKER, false] };
	case 2: {MAD_AREA= [_size, _size, markerDir MAD_MARKER, true] };
};


//Create trigger for scoring
t1 = createTrigger["EmptyDetector", getmarkerpos "m1"];
t1 setDir (MAD_AREA select 2);
[t1, MAD_AREA] remoteExec ['setTriggerArea', 0, true];
publicVariable "t1";

_pos = getmarkerpos _marker;  

/*
	_size = ["MAD_Size",75] call BIS_fnc_getParamValue;
    _pos = getmarkerpos "m1";
	//Create trigger for scoring
    t1 = createTrigger["EmptyDetector",getmarkerpos "m1"];
	[t1,[_size, _size, 100, false,100]] remoteExec ["setTriggerArea", 0, true];
    publicVariable "t1";	 
*/
	//Create the sector logic
	"ModuleSector_F" createUnit [ _pos, createGroup sideLogic, "		
		S1=this;
		this setVariable[ 'BIS_fnc_initModules_disableAutoActivation', false, true ];
		
		this setVariable[ 'Designation', 'A' ];		
		this setVariable[ 'CostInfantry', '1' ];
		this setVariable[ 'CostWheeled', '0' ];
		this setVariable[ 'CostTracked', '0' ];
		this setVariable[ 'CostWater', '0' ];
		this setVariable[ 'CostAir', '0' ];
		this setVariable[ 'CostPlayers', '2' ];	
		this setVariable[ 'TaskTitle', 'HOLD THE SECTOR' ];				
		this setVariable[ 'DefaultOwner', '-1' ];
		this setVariable[ 'OnOwnerChange', '' ];
		this setVariable[ 'OwnerLimit', '0' ];
		this setVariable[ 'ScoreReward', '0' ];
		this setVariable[ 'TaskOwner', '3' ];
		this setVariable[ 'sides', MAD_SIDES ];
		this setVariable[ 'markers', [MAD_MARKER]];
		this setVariable ['objectArea', MAD_AREA];
		
		_nul = [ this ] spawn {
			params[ '_logic' ];
			
			waitUntil {
				!isNil { _logic getVariable [ 'finalized', nil ] } &&
				{ !( _logic getVariable [ 'finalized', true ] ) }
			};
			
			missionNamespace setVariable['MAD_logic', _logic];
			
           
		};
	" ];
	
	//this setVariable[ 'TaskOwner', '3' ];
	
	