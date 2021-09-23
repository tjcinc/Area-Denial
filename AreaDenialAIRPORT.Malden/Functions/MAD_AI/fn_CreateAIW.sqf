if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat;  
for "_i" from 0 to (MAD_NumberOfAIgroupsW-1) do
{
		_group= createGroup [west, false];
	//sleep 1;
	//systemchat format ['CreateGroup: %1 N: %2 _i: %3', _group, PjrAAS_NumberOfAIgroupsW, _i];
	All_Blues_grp pushBack _group;
	
	_ct=0;
	while {_ct<MAD_NumberOfAIunitsPerGroupW} do 
	{
		['W', _group] call MAD_fnc_SpawnUnit;
		_ct=_ct+1;
		sleep 1;
	};
};
