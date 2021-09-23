
if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat; 
[] spawn
{
sleep 10;

if  (count allPlayers > MAD_SUPPORT) then 
{ 	
    sleep 10;	
	[] spawn MAD_S_DAI; 
};
	
addMissionEventHandler
["PlayerConnected",
{
	_allP= (count allPlayers)+1;
	if  (_allP > MAD_SUPPORT) then 
	{   
	     sleep 10;	
		[] spawn MAD_S_DAI; 
	};
}];

addMissionEventHandler
["PlayerDisconnected", 
{
	_allP= (count allPlayers)-1;
	if  (_allP <= MAD_SUPPORT) then 
	{ 
		if (count All_Reds_grp == 0) then 
		{			
			[] spawn MAD_fnc_CreateAIE; 
		};
		if (count All_Blues_grp == 0) then 
		{			
			[] spawn MAD_fnc_CreateAIW ;
		};
		if (count All_Greens_grp == 0) then 
		{			
			[] spawn MAD_fnc_CreateAIR ;
		};
	};
}];
};