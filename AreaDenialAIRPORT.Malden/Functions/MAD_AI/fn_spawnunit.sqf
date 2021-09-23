if (!isServer)  exitwith {};
[""] call BIS_fnc_logFormat;  
params ['_side','_grp'];
	
	[_side, _grp] spawn 
	{
		params ['_side','_grp'];
		sleep 1;
		private['_unit','_side','_pos','_Sunit','_grp','_ii', '_ca','_uside','_stype']; 		
		_ii=-1;
		
			if (_side=='W') then 
			{	
			_Sunit= BLUE_Units call bis_fnc_selectrandom;
			_ii= [["ai_w"],nil] call BIS_fnc_randomPos;
			_ca=1;
			_uside= WEST;
			
			_stype="SoldierWB";
		
			};	
				
			if (_side isEqualTo 'E') then 
			{	
			_Sunit=  RED_Units call bis_fnc_selectrandom;
			_ii= [["ai_e"],nil] call BIS_fnc_randomPos;
			_ca=0;
			_uside= EAST;
			
			_stype="SoldierEB";
			};
				
			if (_side=='R') then 
			{	
			_Sunit= GREEN_Units call bis_fnc_selectrandom;
			_ii= [["ai_e"],nil] call BIS_fnc_randomPos;
			_ca=0;
			_uside= RESISTANCE;
			
			_stype="SoldierWB"; //change later!!!!
		

			};		
			 	
			_pos= _ii;
			_unit= _grp createUnit [_Sunit, _pos, [], 0, 'NONE'];
			_skill= missionnamespace getVariable "MAD_AI_Skill";
			_aiskill= _skill/10;			
			_cnt = count units group _unit;			
			_att= _unit setVariable ['_ss', _ca, false];		
			_unit setVariable ['S_', _side, true];
			_unit setVariable ['_S', _uside, true];	            		
			_unit setVariable ['_U', _stype, true];
			_unit setVariable ['_jrGroup', group _unit, false];
			_unit setVariable ['BIS_noCoreConversations', true];
			_unit setRank 'COLONEL';
			_unit allowFleeing 0;
			_unit additem "ItemRadio";
			_unit assignitem "ItemRadio";			
            _unit setSkill ['aimingAccuracy', _aiskill];
		    _unit setSkill ['aimingShake', _aiskill];
			_unit setSkill ['aimingSpeed', _aiskill];           
		    _unit setSkill ['spotDistance', _aiskill];
			_unit setSkill ['spotTime', _aiskill];
            _unit setSkill ['courage', 1];
		    _unit setSkill ['reloadSpeed', _aiskill];
			_unit setSkill ['commanding',1];
			_unit setSkill ['general', _aiskill];
			_unit setVehicleReportRemoteTargets true;
	        _unit setVehicleReceiveRemoteTargets true;
	        _unit setVehicleReportOwnPosition true;
			     _unit setSpeaker "NoVoice";
				 _unit disableAI "RADIOPROTOCOL";
			//systemchat str _uside;
			_unit reveal [_unit, 4]; 
			_grp= group _unit;
			/* {
				_unit disableAI _x;
			} forEach ['FSM', 'COVER', 'AUTOCOMBAT']; */	//trying for now	
						
			_unit addMPEventHandler ['MPKilled', 
			{ 		     
			if !(isServer) ExitWith { };
			_killed = _this select 0; 
			_killer = _this select 1; 
			if (_killer == _killed) exitWith {}; 
			if (isNull _killer) exitWith {}; 
			if (isNull _killed) exitWith {}; 
			format["%1 was killed by %2",name _Killed, name _killer] remoteExec["systemChat",0];
			//params ['_unit'];
            params ["_unit", "_killer", "_instigator", "_useEffects"];
           	if (isNull _instigator) then {_instigator = _killer};
			if (_killer inArea t1 and {_unit inArea t1}) then {
			if (_unit isEqualTo _killer) then 
			{
				_bastard= _unit getVariable['_BASTARD', objNull];
	  
			if (_bastard inArea t1 and {_killer inArea t1}) then {
			[_unit,-1,true] call bis_fnc_respawnTickets} else {[_unit,-1,true] call bis_fnc_respawnTickets};
			}
			else
			{
				[_unit,-1,true] call bis_fnc_respawnTickets;
			};
            };		  
			
			_ss= _unit getVariable ['S_', 'WTF'];
			_g= _unit getVariable '_jrGroup'; 
			
			while {(count (waypoints group _unit)) > 0} do
			{
				deleteWaypoint ((waypoints group _unit) select 0);
			};
			
			//{deleteWaypoint _x;} forEach (waypoints (group _unit));
			   
			
			
			[_ss, _g] call MAD_fnc_SpawnUnit;

			(_this select 0) spawn 
			{ 
			_this removeAllMPEventHandlers 'MPKilled';
			_this removeAllEventHandlers 'GetOutMan'; 
			_this removeAllEventHandlers 'GetInMan';
			//_this removeAllEventHandlers 'hit'; 
			sleep 20; 
			deleteVehicle _this;
			};
			}];	
	
	
			_unit addEventHandler ["GetInMan", {
			params ["_unit", "_role", "_vehicle", "_turret","_grp2"];
			//systemChat "getin"; //if alive
			while {(count (waypoints (group _unit))) > 0} do
			{
			deleteWaypoint ((waypoints (group _unit)) select 0);
			};
			[_unit] call MAD_fnc_vehwaypoint;					
			}];				
			
			_unit addEventHandler ["GetOutMan", {
			params ["_unit", "_role", "_vehicle", "_turret"];				
			//systemChat "getout"; 
			{ unassignVehicle _x; } forEach crew _vehicle;
			while {(count (waypoints (group _unit))) > 0} do
			{
			deleteWaypoint ((waypoints (group _unit)) select 0);
			};				
			
			[_unit] call MAD_fnc_waypoint;
			
			}];					
			
			/* _unit addEventHandler ["Hit", {	 
			_unit setVariable['_BASTARD', _source, false];
			}];	 */	 
			
			if (random 100<50) then {[_unit] call MAD_fnc_vehicle;}else {[_unit] call MAD_fnc_waypoint;};
			
			//[_unit] call MAD_fnc_waypoint;			
		    
			//zeus addCuratorEditableObjects [[_unit],true ];
			//if (['MAD_ZEUS', 1] call BIS_fnc_getParamValue isEqualTo 0) then{zeus addCuratorEditableObjects [[_unit],true ];};   
			{
             _x addCuratorEditableObjects [[_unit],true ];
            } foreach allcurators;
			//sleep 20;
						
			//if (count (waypoints (group _unit)) < 2)then {systemchat format["nowaypoint :%1",_unit];  [_unit] call MAD_fnc_waypoint;};
			    
			

	};