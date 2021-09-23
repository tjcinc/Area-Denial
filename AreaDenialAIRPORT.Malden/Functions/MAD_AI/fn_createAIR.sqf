if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat;  
for "_i" from 0 to (MAD_NumberOfAIgroupsR-1) do
{
	_group= createGroup [resistance, false];
	//sleep 1;
	//systemchat format ['CreateGroup: %1 N: %2 _i: %3', _group, PjrAAS_NumberOfAIgroupsE, _i];
	All_Greens_grp pushBack _group;
	
	_ct=0;
	
	while {_ct<MAD_NumberOfAIunitsPerGroupR} do 
	{
		['R', _group] call MAD_fnc_SpawnUnit;
		_ct=_ct+1;
		sleep 1;
	};
};