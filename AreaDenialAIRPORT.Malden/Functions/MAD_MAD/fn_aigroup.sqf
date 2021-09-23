  [""] call BIS_fnc_logFormat; 
   _cnt = count units group player;
	_grP= group player;
	[cursorObject] join grpNull;
	[cursorObject] join _grP;	
	cursorObject disableAI "AUTOTARGET";
	
	doStop (units player);
	_grP selectLeader player;
	(units player) doFollow leader _grP;
	



