[""] call BIS_fnc_logFormat;
params['_fnc'];


		
switch (_fnc) do
{
	case 'DEAD':
	{
	   ["DEAD-tlspawn "] call BIS_fnc_logFormat; 
	    [] spawn {
		
		1 cutText ["<t size='1.5'><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>Click anywhere in your base area to create a spawn point<br/>ctrl + right click if you wish to halo </t>", "PLAIN", -1, true, true];
		sleep 2;
        		
		disableSerialization;	
	    mapAnimClear;
	    mapAnimAdd [1, 0.1, markerPos "m1"]; 	   
	    mapAnimCommit;
		};
   
	
	
	sleep .25;	
	_groupLeader = leader (group (vehicle player));		
		if (!(vehicle _groupleader isKindOf "AIR") and !(_groupLeader == vehicle player) and(isPlayer _groupleader ) and (isTouchingGround _groupleader)) then
		{
         UID = [player,_groupleader,"Team"] call BIS_fnc_addRespawnPosition;		
		 player setvariable['_groupspawn', true, false];
		 
		//_groupLeader = leader (group (vehicle player)); 
		_gs=  player getvariable'_groupspawn';
		while { _gs == true } do
		{
		  if ((vehicle _groupleader isKindOf "AIR")or !(alive _groupleader)) then
		  {		
		   UID call BIS_fnc_removeRespawnPosition; player setvariable['_groupspawn', false, false];hint "Team leader not available"; 
		  };
          _gs = player getvariable '_groupspawn';	  
		};
		};	
		
	};
	
	case 'RESPAWN':
	{	
	["RESPAWN-tlspawn"] call BIS_fnc_logFormat;
	
	_spawn = player getvariable '_groupspawn'; 
	_groupLeader = leader (group (vehicle player));	   
	_playerpos = getpos player;
	_leaderpos = getpos _groupleader;		
	if ( _spawn isEqualTo true )then 
	{
	UID call BIS_fnc_removeRespawnPosition; player setvariable['_groupspawn', false, false];
	 };
	if  (((player distance _leaderpos) < 30 ) and !(_groupleader == vehicle player)and!(vehicle _groupleader isKindOf "AIR")) then
	{
	[["groupspawn", "leader"], 5,"", 5, "", true, false, false, true] remoteExec ["BIS_fnc_advHint" ,_groupleader]; 
	[["groupspawn", "player"], 5,"", 5, "", true, false, false, false] call BIS_fnc_advHint;
	
	};	
	
	};	
};