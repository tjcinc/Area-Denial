if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat;
#include "..\..\Mission\params.hpp"


	HP_dead=20;
_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
switch (_madclass) do {
    case 0: { 
	B_SPAWN=0;
	G_SPAWN=0;
	BLUE_Units= [];    
    GREEN_Units= [];
	
	BLUE_Units= MAD_WEST_WW2AI; //from config ?	
	GREEN_Units = MAD_RESISTANCE_WW2AI;
   
	All_Blues_grp= [];
	All_Greens_grp= []; 
    killedcntW=0;	
	killedcntR=0;
	};	
	
    case 1: { 
	R_SPAWN=0;
	B_SPAWN=0;

    BLUE_Units= [];
    RED_Units= [];
   
	
    BLUE_Units= MAD_WEST_VANAI; //from config ?
	RED_Units = MAD_EAST_VANAI;	
	
	All_Reds_grp= [];
	All_Blues_grp= [];
	killedcntW=0;
	killedcntE=0;
	};	
	
	case 2: {
	R_SPAWN=0;
	B_SPAWN=0;

    BLUE_Units= [];
    RED_Units= [];
   
	
    BLUE_Units= MAD_WEST_RHSAI; //from config ?
	RED_Units = MAD_EAST_RHSAI;	
	
	All_Reds_grp= [];
	All_Blues_grp= [];
	killedcntW=0;
	killedcntE=0;
	}; 
	
	
    case 3: {
	R_SPAWN=0;
	B_SPAWN=0;

    BLUE_Units= [];
    RED_Units= [];
   
	
    BLUE_Units= MAD_WEST_CUPAI; //from config ?
	RED_Units = MAD_EAST_CUPAI;	
	
	All_Reds_grp= [];
	All_Blues_grp= [];
	killedcntW=0;
	killedcntE=0;
	}; 
	
    case 4: {
	R_SPAWN=0;
	B_SPAWN=0;

    BLUE_Units= [];
    RED_Units= [];
   
	
    BLUE_Units= MAD_WEST_VNAI; //from config ?
	RED_Units = MAD_EAST_VNAI;	
	
	All_Reds_grp= [];
	All_Blues_grp= [];
	killedcntW=0;
	killedcntE=0;
	};    	  	
};
	


	_m2 = createMarker ["m2",getMarkerPos "m1"];
	"m2" setMarkerShape "RECTANGLE";
	"m2" setMarkerSize [75, 75];
	"m2" setMarkerAlpha 0;
	_guard=[["m2"],nil] call BIS_fnc_randomPos;
	createGuardedPoint [west,_guard, -1, objNull];
	createGuardedPoint [resistance,_guard, -1, objNull];
	createGuardedPoint [east,_guard, -1, objNull];

BehTypes=["AWARE", "COMBAT"];

MAD_S_Skill= 
{
	MAD_AI_Skill= _this select 0;
   
	
};
missionNamespace setVariable ['MAD_S_Skill', MAD_S_Skill,true];
missionNamespace setVariable ['MAD_AI_Skill', MAD_AI_Skill,true];
MAD_S_AISGW= 
{
	MAD_NumberOfAIgroupsW= _this select 0;
	
};
missionNamespace setVariable ['MAD_S_AISGW', MAD_S_AISGW,true];
missionNamespace setVariable ['MAD_NumberOfAIgroupsW', MAD_NumberOfAIgroupsW,true];
MAD_S_AISUW= 
{ 
	MAD_NumberOfAIunitsPerGroupW= _this select 0;
    
};
missionNamespace setVariable ['MAD_S_AISUW', MAD_S_AISUW,true]; 
missionNamespace setVariable ['MAD_NumberOfAIunitsPerGroupW', MAD_NumberOfAIunitsPerGroupW,true]; 
MAD_S_AISGR= 
{
	MAD_NumberOfAIgroupsR= _this select 0;
	 
};
missionNamespace setVariable ['MAD_S_AISGR', MAD_S_AISGR,true];
missionNamespace setVariable ['MAD_NumberOfAIgroupsR', MAD_NumberOfAIgroupsR,true];
MAD_S_AISUR= 
{ 
	MAD_NumberOfAIunitsPerGroupR= _this select 0;
     
};
missionNamespace setVariable ['MAD_S_AISUR', MAD_S_AISUR,true]; 
missionNamespace setVariable ['MAD_NumberOfAIunitsPerGroupR', MAD_NumberOfAIunitsPerGroupR,true]; 
MAD_S_AISGE= 
{	
	MAD_NumberOfAIgroupsE= _this select 0;
		
};
  missionNamespace setVariable ['MAD_S_AISGE', MAD_S_AISGE,true]; 
  missionNamespace setVariable ['MAD_NumberOfAIgroupsE', MAD_NumberOfAIgroupsE,true];  
MAD_S_AISUE= 
{ 	
	MAD_NumberOfAIunitsPerGroupE= _this select 0;
	
};
 missionNamespace setVariable ['MAD_S_AISUE', MAD_S_AISUE,true];  
 missionNamespace setVariable ['MAD_NumberOfAIunitsPerGroupE', MAD_NumberOfAIunitsPerGroupE,true]; 
MAD_S_DAI= { 
{
 if (!(_x isKindOf "air")) then
 {
if (['MAD_CLASS', 1] call BIS_fnc_getParamValue isEqualTo 0) then{

    {
	_units= units _x;
	{deleteVehicle _x} forEach _units;
	deleteGroup _x;
	} forEach (All_Blues_grp+All_Greens_grp);
	
	{
	deleteGroup (group _x);
	deleteVehicle _x;
	} forEach allUnits-[r_aird,r_Airg,w_aird,w_airg];
	//need solution for pilots
	
	
	All_Blues_grp=[];
	All_Greens_grp=[];

 
} else {
{
	_units= units _x;
	{deleteVehicle _x} forEach _units;
	deleteGroup _x;
	} forEach (All_Reds_grp+All_Blues_grp);
	
	{
	deleteGroup (group _x);
	deleteVehicle _x;
	} forEach allUnits;
	
	All_Reds_grp=[];
	All_Blues_grp=[];
	
};

};
} forEach allUnits;  



};


MAD_S_DAIE= { //Disable AI EAST
	{
	_units= units _x;
	{deleteVehicle _x} forEach _units;
	deleteGroup _x;
	} forEach All_Reds_grp;	
	All_Reds_grp=[];	
};

MAD_S_DAIW= { //Disable AI West
	{
	_units= units _x;
	{deleteVehicle _x} forEach _units;
	deleteGroup _x;
	} forEach All_Blues_grp;	
	All_Blues_grp=[];	
};

MAD_S_DAIR= { //Disable AI Resitance
	{
	_units= units _x;
	{deleteVehicle _x} forEach _units;
	deleteGroup _x;
	} forEach All_Greens_grp;	
	All_Greens_grp=[];	
};

 call MAD_fnc_AutoAI;       
	
_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
switch (_madclass) do {
    case 0: { 0 spawn { sleep 1; call MAD_fnc_CreateAIW;  };	
		      0 spawn { sleep 1; call MAD_fnc_CreateAIR;};};	
	
    case 1: {0 spawn { sleep 1; call MAD_fnc_CreateAIW;   };	
		     0 spawn { sleep 1; call MAD_fnc_CreateAIE;}; };	
	
	case 2: {0 spawn { sleep 1; call MAD_fnc_CreateAIW;   };	
		     0 spawn { sleep 1; call MAD_fnc_CreateAIE;}; }; 

	case 3: {0 spawn { sleep 1; call MAD_fnc_CreateAIW;   };	
		     0 spawn { sleep 1; call MAD_fnc_CreateAIE;}; };
			 
    case 4: {0 spawn { sleep 1; call MAD_fnc_CreateAIW;   };	
		     0 spawn { sleep 1; call MAD_fnc_CreateAIE;}; };    		 
};
	

	

	
	
	
	