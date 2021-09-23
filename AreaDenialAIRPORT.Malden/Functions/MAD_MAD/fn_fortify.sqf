 /*   _madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: { kit= "LIB_ToolKit";};	
    case 1: { kit= "ToolKit";};	
	case 2: { kit= "ToolKit";};
 	case 3: { kit= "ToolKit";};
	case 4: { kit= "vn_b_item_toolkit";};
    }; */
wAction = true; 
sAction = true; 
pAction = true;  
  

  
_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: {
	 ["MAd_fnc_fortify 0"] call BIS_fnc_logFormat;
	        kit= "LIB_ToolKit";
				removeFAction=["Remove Fortification",{ 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon"; 
			_unit playMoveNow _anim; 
			waitUntil {animationState _unit == _anim || !alive _unit}; 
			if (!alive _unit) exitWith {}; 
			deleteVehicle (_this select 0); 
			}, [], 10, false, true, "", "kit in items _this && {vehicle player isEqualTo player}", 1.5]; 
			 
			putSAction=["Sandbag", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [0,1.4,0.18], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 



			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_s = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [-0.05,1.39,0.18], [], 0, "CAN_COLLIDE"]; 
			_s setDir (getDir _unit); 
			_s setVehiclePosition [getPosATL _s, [], 0, "CAN_COLLIDE"]; 
			[_s, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true;
			}, [], 9, false, true, "", "kit in items _this && sAction && {vehicle player isEqualTo player}"]; 
			 
			putWAction=["Window Cover", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [0,1.42,-0.45], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit };
			deleteVehicle _ghost; 
			_w = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [-0.05,1.41,-0.45], [], 0, "CAN_COLLIDE"];
			_w setDir (getDir _unit);  
			[_w, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 8, false, true, "", "kit in items _this &&  wAction && {vehicle player isEqualTo player}"]; 
			 
			putPAction=["Plank", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.6,-0.05], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_p = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.5,-0.05], [], 0, "CAN_COLLIDE"]; 
			_p setDir (getDir _unit); 
			[_p, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 7, false, true, "", "kit in items _this  && pAction && {vehicle player isEqualTo player}"]; 
		};	
    case 1:  {
	 ["MAd_fnc_fortify 1"] call BIS_fnc_logFormat;
	            kit= "ToolKit";
				removeFAction=["Remove Fortification",{ 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon"; 
			_unit playMoveNow _anim; 
			waitUntil {animationState _unit == _anim || !alive _unit}; 
			if (!alive _unit) exitWith {}; 
			deleteVehicle (_this select 0); 
			}, [], 10, false, true, "", "kit in items _this && {vehicle player isEqualTo player}", 1.5]; 
			 
			putSAction=["Sandbag", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [0,1.4,0.18], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 



			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_s = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [-0.05,1.39,0.18], [], 0, "CAN_COLLIDE"]; 
			_s setDir (getDir _unit); 
			_s setVehiclePosition [getPosATL _s, [], 0, "CAN_COLLIDE"]; 
			[_s, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true;
			}, [], 9, false, true, "", "kit in items _this && sAction && {vehicle player isEqualTo player}"]; 
			 
			putWAction=["Window Cover", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [0,1.42,-0.45], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit };
			deleteVehicle _ghost; 
			_w = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [-0.05,1.41,-0.45], [], 0, "CAN_COLLIDE"];
			_w setDir (getDir _unit);  
			[_w, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 8, false, true, "", "kit in items _this &&  wAction && {vehicle player isEqualTo player}"]; 
			 
			putPAction=["Plank", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.6,-0.05], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_p = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.5,-0.05], [], 0, "CAN_COLLIDE"]; 
			_p setDir (getDir _unit); 
			[_p, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 7, false, true, "", "kit in items _this  && pAction && {vehicle player isEqualTo player}"]; 
		};	
	case 2:  {
	 ["MAd_fnc_fortify 2"] call BIS_fnc_logFormat;
	            kit= "ToolKit";
				removeFAction=["Remove Fortification",{ 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon"; 
			_unit playMoveNow _anim; 
			waitUntil {animationState _unit == _anim || !alive _unit}; 
			if (!alive _unit) exitWith {}; 
			deleteVehicle (_this select 0); 
			}, [], 10, false, true, "", "kit in items _this && {vehicle player isEqualTo player}", 1.5]; 
			 
			putSAction=["Sandbag", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [0,1.4,0.18], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 



			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_s = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [-0.05,1.39,0.18], [], 0, "CAN_COLLIDE"]; 
			_s setDir (getDir _unit); 
			_s setVehiclePosition [getPosATL _s, [], 0, "CAN_COLLIDE"]; 
			[_s, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true;
			}, [], 9, false, true, "", "kit in items _this && sAction && {vehicle player isEqualTo player}"]; 
			 
			putWAction=["Window Cover", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [0,1.42,-0.45], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit };
			deleteVehicle _ghost; 
			_w = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [-0.05,1.41,-0.45], [], 0, "CAN_COLLIDE"];
			_w setDir (getDir _unit);  
			[_w, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 8, false, true, "", "kit in items _this &&  wAction && {vehicle player isEqualTo player}"]; 
			 
			putPAction=["Plank", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.6,-0.05], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_p = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.5,-0.05], [], 0, "CAN_COLLIDE"]; 
			_p setDir (getDir _unit); 
			[_p, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 7, false, true, "", "kit in items _this  && pAction && {vehicle player isEqualTo player}"]; 
		};	
 	case 3:  {
	 ["MAd_fnc_fortify 3"] call BIS_fnc_logFormat;
	            kit= "ToolKit";
				removeFAction=["Remove Fortification",{ 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon"; 
			_unit playMoveNow _anim; 
			waitUntil {animationState _unit == _anim || !alive _unit}; 
			if (!alive _unit) exitWith {}; 
			deleteVehicle (_this select 0); 
			}, [], 10, false, true, "", "kit in items _this && {vehicle player isEqualTo player}", 1.5]; 
			 
			putSAction=["Sandbag", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [0,1.4,0.18], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 



			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_s = createVehicle ["Land_BagFence_Short_F", _unit modelToWorld [-0.05,1.39,0.18], [], 0, "CAN_COLLIDE"]; 
			_s setDir (getDir _unit); 
			_s setVehiclePosition [getPosATL _s, [], 0, "CAN_COLLIDE"]; 
			[_s, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true;
			}, [], 9, false, true, "", "kit in items _this && sAction && {vehicle player isEqualTo player}"]; 
			 
			putWAction=["Window Cover", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [0,1.42,-0.45], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit };
			deleteVehicle _ghost; 
			_w = createVehicle ["Land_Shoot_House_Panels_Crouch_F", _unit modelToWorld [-0.05,1.41,-0.45], [], 0, "CAN_COLLIDE"];
			_w setDir (getDir _unit);  
			[_w, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 8, false, true, "", "kit in items _this &&  wAction && {vehicle player isEqualTo player}"]; 
			 
			putPAction=["Plank", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.6,-0.05], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_p = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.5,-0.05], [], 0, "CAN_COLLIDE"]; 
			_p setDir (getDir _unit); 
			[_p, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 7, false, true, "", "kit in items _this  && pAction && {vehicle player isEqualTo player}"]; 
		};	
	case 4: {
	 ["MAd_fnc_fortify 4"] call BIS_fnc_logFormat;
                kit= "vn_b_item_toolkit";
				removeFAction=["Remove Fortification",{ 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon"; 
			_unit playMoveNow _anim; 
			waitUntil {animationState _unit == _anim || !alive _unit}; 
			if (!alive _unit) exitWith {}; 
			deleteVehicle (_this select 0); 
			}, [], 10, false, true, "", "kit in items _this && {vehicle player isEqualTo player}", 1.5]; 
			 
			putSAction=["Sandbag", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_vn_bagfence_01_short_green_f", _unit modelToWorld [0,1.4,0.18], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_s = createVehicle ["Land_vn_bagfence_01_short_green_f", _unit modelToWorld [-0.05,1.39,0.18], [], 0, "CAN_COLLIDE"]; 
			_s setDir (getDir _unit); 
			_s setVehiclePosition [getPosATL _s, [], 0, "CAN_COLLIDE"]; 
			[_s, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true;
			}, [], 9, false, true, "", "kit in items _this && sAction && {vehicle player isEqualTo player}"]; 
			 
			/* putWAction=["Window Cover", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["vn_shootingpos_f", _unit modelToWorld [0,1.42,-0.45], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit };
			deleteVehicle _ghost; 
			_w = createVehicle ["vn_shootingpos_f", _unit modelToWorld [-0.05,1.41,-0.45], [], 0, "CAN_COLLIDE"];
			_w setDir (getDir _unit);  
			[_w, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 8, false, true, "", "kit in items _this &&  wAction && {vehicle player isEqualTo player}"];  */
			 
			putPAction=["Plank", { 
			_unit = _this select 1; 
			_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
			_ghost = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.6,-0.05], [], 0, "CAN_COLLIDE"]; 
			_ghost attachTo [_unit]; 
			wAction = false; 
			sAction = false; 
			pAction = false;
			[_unit, dropFAction] remoteExec ["addAction", 0, true];
			waitUntil {animationState _unit == _anim || !alive _unit }; 
			deleteVehicle _ghost; 
			_p = createVehicle ["Land_Plank_01_4m_F", _unit modelToWorld [0,2.5,-0.05], [], 0, "CAN_COLLIDE"]; 
			_p setDir (getDir _unit); 
			[_p, removeFAction] remoteExec ["addAction", 0, true];
			wAction = true; 
			sAction = true; 
			pAction = true; 
			}, [], 7, false, true, "", "kit in items _this  && pAction && {vehicle player isEqualTo player}"]; 
		};	



	};
    


waituntil {!(IsNull (findDisplay 46))}; 
 


dropFAction=["Drop Item",{ 
_actionid =10;
_unit = _this select 1; 
_anim = "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"; 
_unit playMoveNow _anim; 
daction = false;
waitUntil {animationState _unit == _anim || !alive _unit}; 
if (!alive _unit) exitWith {}; 
deleteVehicle (_this select 0); 
}, [], 6, true, true, "", "kit in items _this && !waction && !saction && !paction &&  {vehicle player isEqualTo player}"];
