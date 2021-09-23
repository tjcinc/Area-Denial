//#include "S3_HUD.h"
class S3_ADMINMENU2
{
	idd = 404;
	movingEnable = 1;
	class ControlsBackground
	{
		class S3_CBG
		{
			type = 0;
			idc = -1;
			x = 0.00000002;
			//y = 0.10708863;
			y = 0.10908863;
			w = 0.44834126+0.1;			
			//h = 1.02341773;
			h = 1.09341773;
			style = 0;
			text = "";
			onLoad= "params['_c'];";
			colorBackground[] = {0.5,0.6,0.4,1 };    //0.5,0.6,0.4,1   old 0,0,0,0.8
			colorText[] = {0.6157,0.0118,0.3765,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);			
		};		
	};
	
	class Controls
	{
		class ControlTXT:RscText
		{
			idc = -1;
			x = 0.00000002;
			y = 0.00000002;
			w = 0.4501896+0.1;
			h = 0.10392406;
			text = "MAD ADMIN TOOL";
			moving = 1;
		};
		
		class ControlLB:RscListBox
		{
			type = 5;
			idc = -1;
			x = 0.01369669;
			y = 0.12291142;
			w = 0.33279623;
			h = 0.0379747*8;
			onLoad = "missionNamespace setVariable['MAD_ADMIN', player, true]; params['_lb']; uiNamespace setvariable['_AM2Lb',_lb]; S3_suspect=ObjNull; [] call MAD_ADMIN_UPDATELB"; // allUnits 
			onLBSelChanged="playsound 'assemble_target';  params['_lb','_idx'];  _data= _lb lbData _idx;   S3_suspect= call compile format['%1', _data]; hint format['Suspect: %1 Name: %2', S3_suspect, name S3_suspect]";
		};
		
		class S3_0:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.11556966;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Refresh";
			tooltip = "REFRESH players list";
			onButtonClick= " [] call MAD_ADMIN_UPDATELB"; //playableUnits
			
		};
		class S3_1:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.163038;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "KICK";
			tooltip = "Kick bastard";
			onMouseButtonClick = "serverCommand format ['#kick ""%1""', name S3_suspect];";
		};
		class S3_2:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.21050637;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "STFU";
			tooltip = "SHUT UP player";
			onButtonClick= " ['VTBAN'] remoteExec ['MAD_fnc_banApply', S3_suspect, false] ";
		};
		class S3_3:RscButton
		{
			idc = -1;
			x = 0.35914695;
			y = 0.25797474;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Kill";
			tooltip = "Kill marauder bastard";
			onButtonClick= "['KILL'] remoteExec ['MAD_fnc_banApply', S3_suspect, false]; ['>>> Killed by admin: ' +  name S3_suspect] remoteExec ['systemchat', 0, false];";
			
		};
		class S3_4:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.30544307;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "PARAMS TEST";	
			tooltip = "CHECK RECOIL/IMMORTAL/SPEED/ETC";
			onButtonClick= "['PARAMSTEST', player] remoteExec ['MAD_fnc_banApply', S3_suspect, false] ";
		};
		class S3_5:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.35291142;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Unban ALL";	
			tooltip = "";
			onButtonClick= "BAN_E setVariable['BAN_LIST', [], true];";
		};
		class S3_6:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.40037979;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "BAN";
			tooltip = "Temporary ban. Next mission unban";
			//onButtonClick= "_list= BAN_E getVariable['BAN_LIST',[]]; _list pushBackUnique (getPlayerUID S3_suspect); BAN_E setVariable['BAN_LIST', _list, true]; S3_suspect setPos (getPos BAN_E); ";
			onButtonClick= "['BAN'] remoteExec ['MAD_fnc_banApply', S3_suspect, false]; ";
		};
		
		
		class S3_7S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.44784813;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Time";
			onLoad= "params['_c']; _c sliderSetRange [0, 1439]; _c sliderSetPosition ((date select 3)*60+ (date select 4)); _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_h = floor (_pos / 60); _m = floor(_pos mod 60); uiNamespace setVariable ['S3_WTime', [_h, _m]]; if (_m < 10) then { _m = '0' + str _m }; _c ctrlSetTooltip format['Time %1:%2', _h, _m]; _c ctrlCommit 0;";
		};
		
		class S3_7:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.44784813;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "TIME";
			onButtonClick= "['TIME',uiNamespace getVariable ['S3_WTime', [10, 00]]] remoteExec ['MAD_fnc_settings', 2, false];";
			
		};
		class S3_8:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.49531646;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "RAIN";		
			
			onButtonClick= "['RAIN',uiNamespace getVariable ['S3_WRain', [0]]] remoteExec ['MAD_fnc_settings', 2, false];";
		};
		
		class S3_8S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.49531646;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Rain";
			onLoad= "params['_c']; _rainlevel=rain; _c sliderSetRange [0, 100]; _c sliderSetPosition (_rainlevel*100); _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_rain= _pos / 100; uiNamespace setVariable ['S3_WRain', [_rain]];  _c ctrlSetTooltip format['Rain %1', _rain]; _c ctrlCommit 0;";	
		};
		
		class S3_9:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.54797478;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "FOG";
			onButtonClick= "['FOG',uiNamespace getVariable ['S3_WFog', [0]]] remoteExec ['MAD_fnc_Settings', 2, false];";
			
		};
		
		class S3_9S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.54797478;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Fog";
			onLoad= "params['_c'];_foglevel = fog; _c sliderSetRange [0, 100]; _c sliderSetPosition (_foglevel*100); _c ctrlCommit 0;";			
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_fog= _pos / 100; uiNamespace setVariable ['S3_WFog', [_fog]];  _c ctrlSetTooltip format['Fog %1', _fog]; _c ctrlCommit 0;";
		};
		
		class S3_10:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.59797478;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "AI SKILL";				
			onButtonClick= "['AISKILL',uiNamespace getVariable ['MAD_AISKILL', [0.1]]] remoteExec ['MAD_fnc_settings', 2, false];";			
		};
		
		class S3_10S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.59797478;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "AI skill";
			//onLoad= "params['_c'];_skill=MAD_AI_SKILL; _c sliderSetRange [0, 10]; _c sliderSetPosition (_skill*1); _c ctrlCommit 0;";			
			//onSliderPosChanged = "params['_c']; _pos= _this select 1;	_skill= _pos; uiNamespace setVariable ['MAD_AISKILL', [_skill]];  _c ctrlSetTooltip format['AI Skill: %1', _skill]; _c ctrlCommit 0;";	
            onLoad= "params['_c']; _c sliderSetRange [0, 10];  _c sliderSetPosition MAD_AI_SKILL; _c ctrlCommit 0;";			
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_skill= _pos; uiNamespace setVariable ['MAD_AISKILL', [_skill]]; MAD_AI_SKILL=_skill;  _c ctrlSetTooltip format['AI Skill: %1', _skill]; _c ctrlCommit 0;";				
		};
		
		class S3_11:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.64797479;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "AREA";			
			onButtonClick= "_size= uiNamespace getVariable ['MAD_AreaSize', 666];  [_size] remoteExec ['MAD_fnc_resizeArea', 0, true];";
		};
		
		class S3_11S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.64797479;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Area size";
			onLoad= "params['_c']; _c sliderSetRange [1, 400]; _c sliderSetPosition MAD_SIZE; _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1; _size= round(_pos); uiNamespace setVariable ['MAD_AreaSize', _size]; _c ctrlSetTooltip format['Area size: %1', _size]; _c ctrlCommit 0;";
			
		};
		
		class S3_12:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.6979748;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Tickets";
			onButtonClick= " _tck=uiNamespace getVariable ['MAD_Tickets', 39]; [west, _tck-([west,0] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets; [east, _tck-([east,0] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets;";
		};
		class S3_12S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.6979748;
			w = 0.33279623;
			h = 0.0379747;
			tooltip = "MAD Tickets";
			onLoad= "params['_c'];_tck=uiNamespace getVariable ['MAD_Tickets', 39]; _c sliderSetRange [1, 100];_c sliderSetPosition _tck; _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1; _tickets= round(_pos); uiNamespace setVariable ['MAD_Tickets', _tickets]; _c ctrlSetTooltip format['Tickets: %1', _tickets]; _c ctrlCommit 0;";
		};
		
		class S3_13:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.74797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Zeus";
            onMouseButtonClick = "[] remoteExec ['MAD_fnc_zeus', 2, false]";
		};
		class S3_13t:RscText
		{
			idc = -1;
			x = 0.01369669;
			y = 0.73797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Current West groups/units";
			onLoad = "params['_c'];	 _c ctrlSetText format['WEST AI G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	uiNamespace setVariable ['MAD_AISCtrlW', _c]";
		};
		class S3_14:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.79797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "SEND LOBBY";
            onMouseButtonClick =  "[compile '''End5'' call BIS_fnc_endMission'] remoteExec ['call', S3_suspect, false];";

		};
		
		class S3_14t:RscText
		{
			idc = -1;
			x = 0.01369669;
			y = 0.79397481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Current IND. groups/units";
            onLoad = "params['_c'];	_c ctrlSetText format['IND. AI G:%1/U%2', MAD_NumberOfAIgroupsR, MAD_NumberOfAIunitsPerGroupR]; _c ctrlCommit 0;	uiNamespace setVariable ['MAD_AISCtrlR', _c]";

		};
		
		
		class S3_15:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.84797482;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "West AI Off";
			onMouseButtonClick = "[] remoteExec ['MAD_S_DAIW', 2, false]";				
		};
		        		
		class S3_15S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.84797482;
			w = 0.33279623;
			h = 0.0379747;
			
			tooltip = "West Groups";
			onLoad = "params['_c']; 	_c sliderSetRange [1, 10]; _c sliderSetPosition MAD_NumberOfAIgroupsW; _c ctrlCommit 0;";			
			onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlW'; _XX=round (_this select 1); MAD_NumberOfAIgroupsW= _XX;	_c ctrlSetText format[' WEST AI  G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISGW', 2, false]";
			
			
			
		};
		class S3_16:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.89797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "turn off then adjust slider ";	
			text = "West AI On";			
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_CreateAIW', 2, false]";            		
		};
		
		
		class S3_16S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.89797483;
			w = 0.33279623;
			h = 0.0379747;
			
			tooltip = "West units per group";
			onLoad = "params['_c'];	_c sliderSetRange [0, 10]; _c sliderSetPosition MAD_NumberOfAIunitsPerGroupW; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlW'; _XX=round (_this select 1); MAD_NumberOfAIunitsPerGroupW= _XX;	_c ctrlSetText format[' WEST AI G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISUW', 2, false]";
		
			
		};
		
		class S3_17:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.94797484;
			w = 0.07582939+0.1;
			h = 0.0379747;
		    text = "IND. AI Off";
			onMouseButtonClick = "[] remoteExec ['MAD_S_DAIR', 2, false];";
		};			
		
		class S3_17S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.94797484;
			w = 0.33279623;
			h = 0.0379747;			
			tooltip = "Resistance Groups";			
            onLoad = "params['_c'];	_c sliderSetRange [0, 10]; _c sliderSetPosition MAD_NumberOfAIgroupsR; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlR'; _XX=round (_this select 1); MAD_NumberOfAIgroupsR= _XX;	_c ctrlSetText format[' IND. AI G:%1/U:%2', MAD_NumberOfAIgroupsR, MAD_NumberOfAIunitsPerGroupR]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISGR', 2, false]";		   
		};		
		
		class S3_18:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.99797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "turn off then adjust slider ";	
			text = "IND. AI ON";
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_CreateAIR', 2, false]";
		};		
		
		class S3_18S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.99797483;
			w = 0.33279623;
			h = 0.0379747;			
		    tooltip = "Resistance units per group";			
		    onLoad = "params['_c'];	_c sliderSetRange [0,10]; _c sliderSetPosition MAD_NumberOfAIunitsPerGroupR; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlR'; _XX=round (_this select 1); MAD_NumberOfAIunitsPerGroupR= _XX;	_c ctrlSetText format[' IND. AI G:%1/U%2', MAD_NumberOfAIgroupsR, MAD_NumberOfAIunitsPerGroupR]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISUR', 2, false]";
			
		};
		//class S3_19S:Rsctext
		//{
		//	idc = -1;
		//	x = 0.01369669;
		//	y = 1.04797483;
		//	w = 0.33279623;
		//	h = 0.0379747;
		//	text = "IF AI WERE OFF AT START";			
		//};		
		
		class S3_19:RscButton
		{
			idc = -1;
			x = 0.35914698;
			//y = 0.99797483;
			y = 1.04797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "If there are no AI at mission start press this to start the ai script";
			text = "AI ON";
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_AiInit', 2, false]";
		};	
        
       		class S3_20:RscButton
		{
			idc = -1;
			x = 0.35914698;			
			y = 1.09797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "PUSHUPS";
			onMouseButtonClick = "[S3_suspect, 'AmovPercMstpSnonWnonDnon_exercisePushup'] remoteExec ['playmove', 0];";
		};		
		
	
	};
	
};


class S3_ADMINMENU
{
	idd = 404;
	movingEnable = 1;
	class ControlsBackground
	{
		class S3_CBG
		{
			type = 0;
			idc = -1;
			x = 0.00000002;
			//y = 0.10708863;
			y = 0.10908863;
			w = 0.44834126+0.1;
			//h = 1.02341773;
			h = 1.09341773;
			style = 0;
			text = "";
			onLoad= "params['_c'];";
			colorBackground[] = {0.5,0.6,0.4,1 };    //0.5,0.6,0.4,1   old 0,0,0,0.8
			colorText[] = {0.6157,0.0118,0.3765,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);			
		};		
	};
	
	class Controls
	{
		class ControlTXT:RscText
		{
			idc = -1;
			x = 0.00000002;
			y = 0.00000002;
			w = 0.4501896+0.1;
			h = 0.10392406;
			text = "MAD ADMIN TOOL";
			moving = 1;
		};
		
		class ControlLB:RscListBox
		{
			type = 5;
			idc = -1;
			x = 0.01369669;
			y = 0.12291142;
			w = 0.33279623;
			h = 0.0379747*8;
			onLoad = "missionNamespace setVariable['MAD_ADMIN', player, true]; params['_lb']; uiNamespace setvariable['_AM2Lb',_lb]; S3_suspect=ObjNull; [] call MAD_ADMIN_UPDATELB"; // allUnits 
			onLBSelChanged="playsound 'assemble_target';  params['_lb','_idx'];  _data= _lb lbData _idx;   S3_suspect= call compile format['%1', _data]; hint format['Suspect: %1 Name: %2', S3_suspect, name S3_suspect]";
		};
		
		class S3_0:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.11556966;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Refresh";
			tooltip = "REFRESH players list";
			onButtonClick= " [] call MAD_ADMIN_UPDATELB"; //playableUnits
			
		};
		class S3_1:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.163038;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "KICK";
			tooltip = "Kick bastard";
			onMouseButtonClick = "serverCommand format ['#kick ""%1""', name S3_suspect];";
		};
		class S3_2:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.21050637;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "STFU";
			tooltip = "SHUT UP player";
			onButtonClick= " ['VTBAN'] remoteExec 			['MAD_fnc_banApply', S3_suspect, false] ";
		};
		class S3_3:RscButton
		{
			idc = -1;
			x = 0.35914695;
			y = 0.25797474;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Kill";
			tooltip = "Kill marauder bastard";			
			onButtonClick= "['KILL'] remoteExec ['MAD_fnc_banApply', S3_suspect, false]; ['>>> Killed by admin: ' +  name S3_suspect] remoteExec ['systemchat', 0, false];";
		};
		class S3_4:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.30544307;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "PARAMS TEST";	
			tooltip = "CHECK RECOIL/IMMORTAL/SPEED/ETC";
			onButtonClick= "['PARAMSTEST', player] remoteExec ['MAD_fnc_banApply', S3_suspect, false] ";
		};
		class S3_5:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.35291142;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Unban ALL";	
			tooltip = "";
			onButtonClick= "BAN_E setVariable['BAN_LIST', [], true];";
		};
		
		class S3_6:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.40037979;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "BAN";
			tooltip = "Temporary ban. Next mission unban";
			//onButtonClick= "_list= BAN_E getVariable['BAN_LIST',[]]; _list pushBackUnique (getPlayerUID S3_suspect); BAN_E setVariable['BAN_LIST', _list, true]; S3_suspect setPos (getPos BAN_E); ";
			onButtonClick= "['BAN'] remoteExec ['MAD_fnc_banApply', S3_suspect, false];";
		};
		
		
		class S3_7S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.44784813;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Time";
			onLoad= "params['_c']; _c sliderSetRange [0, 1439]; _c sliderSetPosition ((date select 3)*60+ (date select 4)); _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_h = floor (_pos / 60); _m = floor(_pos mod 60); uiNamespace setVariable ['S3_WTime', [_h, _m]]; if (_m < 10) then { _m = '0' + str _m }; _c ctrlSetTooltip format['Time %1:%2', _h, _m]; _c ctrlCommit 0;";
		};
		
		class S3_7:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.44784813;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "TIME";
			onButtonClick= "['TIME',uiNamespace getVariable ['S3_WTime', [10, 00]]] remoteExec ['MAD_fnc_settings', 2, false];";
			
		};
		class S3_8:RscButton
		{
			idc = -1;
			x = 0.35914694;
			y = 0.49531646;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "RAIN";		
			
			onButtonClick= "['RAIN',uiNamespace getVariable ['S3_WRain', [0]]] remoteExec ['MAD_fnc_settings', 2, false];";
		};
		
		class S3_8S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.49531646;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Rain";
			onLoad= "params['_c']; _c sliderSetRange [0, 100]; _c sliderSetPosition (rain*100); _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_rain= _pos / 100; uiNamespace setVariable ['S3_WRain', [_rain]];  _c ctrlSetTooltip format['Rain %1', _rain]; _c ctrlCommit 0;";	
		};
		
		class S3_9:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.54797478;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "FOG";
			onButtonClick= "['FOG',uiNamespace getVariable ['S3_WFog', [0]]] remoteExec ['MAD_fnc_Settings', 2, false];";
			
		};
		
		class S3_9S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.54797478;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Fog";
			onLoad= "params['_c']; _c sliderSetRange [0, 100]; _c sliderSetPosition (fog*100); _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_fog= _pos / 100; uiNamespace setVariable ['S3_WFog', [_fog]];  _c ctrlSetTooltip format['Fog %1', _fog]; _c ctrlCommit 0;";
		};
		
		class S3_10:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.59797478;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "AI SKILL";
			onButtonClick= "['AISKILL',uiNamespace getVariable ['MAD_AISKILL', [0.1]]] remoteExec ['MAD_fnc_settings', 2, false];";			
		};
		
		class S3_10S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.59797478;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "AI skill";
			onLoad= "params['_c']; _c sliderSetRange [0, 10];  _c sliderSetPosition MAD_AI_SKILL; _c ctrlCommit 0;";			
			onSliderPosChanged = "params['_c']; _pos= _this select 1;	_skill= _pos; uiNamespace setVariable ['MAD_AISKILL', [_skill]]; MAD_AI_SKILL=_skill;  _c ctrlSetTooltip format['AI Skill: %1', _skill]; _c ctrlCommit 0;";			
		};
		
		class S3_11:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.64797479;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "AREA";
			onButtonClick= "_size= uiNamespace getVariable ['MAD_AreaSize', 666];  [_size] remoteExec ['MAD_fnc_resizeArea', 0, true];";
		};
		
		class S3_11S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.64797479;
			w = 0.33279623;
			h = 0.0379747;
			text = "";
			tooltip = "Area size";
			onLoad= "params['_c'];  _c sliderSetRange [1, 400];_c sliderSetPosition MAD_Size; _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1; _size= round(_pos); uiNamespace setVariable ['MAD_AreaSize', _size];MAD_Size= _size; _c ctrlSetTooltip format['Area size: %1', _size]; _c ctrlCommit 0;";
			
		};
		
		class S3_12:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.6979748;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Tickets";
			onButtonClick= " _tck=uiNamespace getVariable ['MAD_Tickets', 39]; [west, _tck-([west,0] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets; [east, _tck-([east,0] call BIS_fnc_respawnTickets)] call BIS_fnc_respawnTickets;";
		};
		class S3_12S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.6979748;
			w = 0.33279623;
			h = 0.0379747;
			tooltip = "Adjust Tickets (same for both sides)";
			onLoad= "params['_c']; _c sliderSetRange [1, 100];_c sliderSetPosition 50; _c ctrlCommit 0;";
			onSliderPosChanged = "params['_c']; _pos= _this select 1; _tickets= round(_pos); uiNamespace setVariable ['MAD_Tickets', _tickets]; _c ctrlSetTooltip format['Tickets: %1', _tickets]; _c ctrlCommit 0;";
		};
		
		class S3_13:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.74797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Zeus";
            onMouseButtonClick = "[] remoteExec ['MAD_fnc_zeus', 2, false]";
		};
		class S3_13t:RscText
		{
			idc = -1;
			x = 0.01369669;
			y = 0.73797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			//text = "Current West groups/units";
			onLoad = "params['_c'];	 _c ctrlSetText format['WEST AI G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	uiNamespace setVariable ['MAD_AISCtrlW', _c]";
		};
		class S3_14:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.79797481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "SEND LOBBY";
            onMouseButtonClick =  "[compile '''End5'' call BIS_fnc_endMission'] remoteExec ['call', S3_suspect, false];";

		};
		
		class S3_14t:RscText
		{
			idc = -1;
			x = 0.01369669;
			y = 0.79397481;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "Current East groups/units";
            onLoad = "params['_c']; _c ctrlSetText format['EAST AI G:%1/U%2', MAD_NumberOfAIgroupsE, MAD_NumberOfAIunitsPerGroupE]; _c ctrlCommit 0;	uiNamespace setVariable ['MAD_AISCtrlE', _c]";

		};
		
		
		class S3_15:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.84797482;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "West AI Off";
			onMouseButtonClick = "[] remoteExec ['MAD_S_DAIW', 2, false]";				
		};
		        		
		class S3_15S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.84797482;
			w = 0.33279623;
			h = 0.0379747;
			
			tooltip = "WestGroups";
			onLoad = "params['_c']; _c sliderSetRange [0, 10]; _c sliderSetPosition MAD_NumberOfAIgroupsW; _c ctrlCommit 0;";
			onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlW'; _XX=round (_this select 1); MAD_NumberOfAIgroupsW= _XX;	_c ctrlSetText format[' WEST AI  G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISGW', 2, false]";
			
		};
		class S3_16:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.89797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "turn off then adjust slider ";	
			text = "West AI On";			
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_CreateAIW', 2, false]";			
		};
		
		
		class S3_16S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.89797483;
			w = 0.33279623;
			h = 0.0379747;			
			tooltip = "West units per group";
			onLoad = "params['_c'];	_c sliderSetRange [0, 10]; _c sliderSetPosition MAD_NumberOfAIunitsPerGroupW; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlW'; _XX=round (_this select 1); MAD_NumberOfAIunitsPerGroupW= _XX;	_c ctrlSetText format[' WEST AI G:%1/U%2', MAD_NumberOfAIgroupsW, MAD_NumberOfAIunitsPerGroupW]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISUW', 2, false]";
		
			
		};
		
		class S3_17:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.94797484;
			w = 0.07582939+0.1;
			h = 0.0379747;
		    text = "East AI Off";
			onMouseButtonClick = "[] remoteExec ['MAD_S_DAIE', 2, false];";
		};			
		
		class S3_17S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.94797484;
			w = 0.33279623;
			h = 0.0379747;			
			tooltip = "East Groups";
			//onLoad = "params['_c'];_c ctrlSetTooltip 'East groups';	_c sliderSetRange [1, 10]; _c sliderSetPosition 2; _c ctrlCommit 0;";
			onLoad = "params['_c'];	_c sliderSetRange [0, 10]; _c sliderSetPosition MAD_NumberOfAIgroupsE; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlE'; _XX=round (_this select 1); MAD_NumberOfAIgroupsE= _XX;	_c ctrlSetText format[' East AI G:%1/U:%2', MAD_NumberOfAIgroupsE, MAD_NumberOfAIunitsPerGroupE]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISGE', 2, false]";			
		};		
		
		class S3_18:RscButton
		{
			idc = -1;
			x = 0.35914698;
			y = 0.99797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "turn off then adjust slider";	
			text = "East AI ON";
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_CreateAIE', 2, false]";
		};		
		
		class S3_18S:RscXSliderH
		{
			idc = -1;
			x = 0.01369669;
			y = 0.99797483;
			w = 0.33279623;
			h = 0.0379747;			
			
			tooltip = "East units per group";			
			onLoad = "params['_c'];	_c sliderSetRange [0,10]; _c sliderSetPosition MAD_NumberOfAIunitsPerGroupE; _c ctrlCommit 0;";
	        onSliderPosChanged = "_c= uiNamespace getVariable 'MAD_AISCtrlE'; _XX=round (_this select 1); MAD_NumberOfAIunitsPerGroupE= _XX;	_c ctrlSetText format[' EAST AI G:%1/U%2', MAD_NumberOfAIgroupsE, MAD_NumberOfAIunitsPerGroupE]; _c ctrlCommit 0;	 [_XX] remoteExec ['MAD_S_AISUE', 2, false]";
			
		};
		
		//class S3_19S:Rsctext
		//{
		//	idc = -1;
		//	x = 0.01369669;
		//	y = 1.04797483;
		//	w = 0.33279623;
		//	h = 0.0379747;
		//	text = "IF AI WERE OFF AT START";			
		//};
		
		
		class S3_19:RscButton
		{
			idc = -1;
			x = 0.35914698;
			//y = 0.99797483;
			y = 1.04797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			tooltip = "If there are no AI at mission start press this to start the ai script";
			text = "AI ON";
			onMouseButtonClick = "[] remoteExec ['MAD_fnc_AiInit', 2, false]";
		};	
			
		
			
			class S3_20:RscButton
		{
			idc = -1;
			x = 0.35914698;			
			y = 1.09797483;
			w = 0.07582939+0.1;
			h = 0.0379747;
			text = "PUSHUPS";
			onMouseButtonClick = "[S3_suspect, 'AmovPercMstpSnonWnonDnon_exercisePushup'] remoteExec ['playmove', 0];";
		};		
				
	};
	
};