[""] call BIS_fnc_logFormat;
params['','_mBtn'];

switch (_mBtn) do
{
	case 0: //LEFT MOUSE BTN
	{
	["left-click"] call BIS_fnc_logFormat;
		[] spawn
		{
			waitUntil {(ctrlfade ((finddisplay  12) displayCtrl 88800))>0 };
			_mname= "respawn_"+ toLower (str playerside)+ '_CUSTOM';
			deleteMarkerLocal _mname;
			
			private ['_pos'];
			_pos= player getVariable ['Mad_respawn_pos', getpos player];
			_pos set [2,3];
			
			if (uiNamespace getVariable['MAD_IN_AIR',false]) then 
			{
				/* [player,1000] call BIS_fnc_halo;
				[player,"AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon"] remoteExec ["switchMove",0,false];	 */
				[player,500] call MAD_fnc_halo;
				player allowdamage false;
				player setDir ([player, getmarkerpos "m1"] call BIS_fnc_dirTo);
			//systemChat "air";
				
			} else
			{
				
				player setDir ([player,getmarkerpos "m1"] call BIS_fnc_dirTo);
			};
			
			uiNamespace setVariable['MAD_IN_AIR',false];
	
			
			[] spawn MAD_fnc_SoundPatch;			
			
		};
	};
};	

hintSilent ''; 


disableSerialization;
_combo = uiNamespace getVariable "BIS_RscRespawnControlsMap_ctrlComboLoadout";
if (isNil "BIS_respawnMenu_stored") then {BIS_respawnMenu_stored = [[],lbCurSel _combo]} else {BIS_respawnMenu_stored set [1,lbCurSel _combo]};
SAVE_007= lbCurSel _combo;
