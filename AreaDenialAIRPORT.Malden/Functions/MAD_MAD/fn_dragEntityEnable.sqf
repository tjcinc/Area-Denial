[""] call BIS_fnc_logFormat;
disableSerialization;
params['_d','_fnc'];

switch (_fnc) do
{
	case "INIT":
	{
	["MAd_fnc_dragEntityEnable INIT"] call BIS_fnc_logFormat;
		//_d displayAddEventHandler ["KeyDown", "params['','_btn']; if (_btn==7) then { ['','DRAG'] call MAD_fnc_dragEntityEnable };"];
		uiNamespace setVariable ['_DragObjects', ["Land_vn_sandbagbarricade_01_f","Land_vn_sandbagbarricade_01_half_f","Land_SandbagBarricade_01_half_F","Land_WoodenCrate_01_F","Land_WoodenCrate_01_stack_x3_F","Land_WoodenCrate_01_stack_x5_F","Land_SandbagBarricade_01_F","B_HMG_01_F","B_HMG_01_high_F","O_HMG_01_F","O_HMG_01_high_F","B_static_AT_F","O_static_AT_F","B_Mortar_01_F","O_Mortar_01_F","B_GMG_01_high_F","Land_Shoot_House_Panels_Crouch_F","Land_Plank_01_4m_F","Land_BagFence_Short_F","LIB_GrWr34_g","LIB_M2_60","LIB_MG42_Lafette_low_Deployed","LIB_MG42_Lafette_Deployed","LIB_MG34_Lafette_Deployed","LIB_MG34_Lafette_low_Deployed","LIB_M1919_M2","LIB_Maxim_M30_Trench","LIB_Maxim_M30_base","vn_b_army_static_mortar_m2","vn_b_army_static_m60_high","Land_vn_bagfence_01_short_green_f","vn_shootingpos_f","vn_b_army_static_m2_high","Land_vn_sandbagbarricade_01_hole_f","Land_SandbagBarricade_01_hole_F"]];
		_aD= _d ctrlCreate ["RscPicture", -2];
		_w= safeZoneH/4*(4/3);
		_aD ctrlSetPosition [SafeZoneXABS, SafeZoneY, _w,_w];
		_aD ctrlSetFade 1;
		_aD ctrlCommit 0;
		uinamespace setVariable ['UI_DRAG', _aD];
		
		
		DRAG_cam = "camera" camCreate (position player); 
		
		
	};
	case "DRAG":
	{
	    ["MAd_fnc_dragEntityEnable DRAG"] call BIS_fnc_logFormat;
		private _ct= cursorTarget;
		player forceWalk (!isForcedWalk player);
		
		_attached= uiNamespace getVariable ['_DragObject', objNull];
					
		if (isNull _attached) then
		{
			if (vehicle player isKindOf 'MAN' and {typeof _ct in (uiNamespace getVariable ['_DragObjects', []])} and {player distance2D _ct <3}) then
			{
				uiNamespace setVariable ['_DragObject', _ct];
				
				_bb= boundingBox _ct;
				_z= _bb select 1 select 2;
				_ct attachTo[player,[0,2,_z]];//_ct attachTo[player,[0,1,0],'LEFTHAND'];
				[] spawn
				{
					disableSerialization;
					_c= uiNamespace getvariable 'UI_DRAG';
					_c ctrlSetText "#(argb,256,256,1)r2t(rttSc2,1.333)";
					_c ctrlSetFade 0;
					_c ctrlCommit 0;
					
					showCinemaBorder false;
					
					DRAG_cam camSetTarget (uiNamespace getVariable ['_DragObject', objNull]);
					waitUntil
					{
						DRAG_cam cameraEffect ["internal","back","rttSc2"];
						DRAG_cam camSetRelPos [0,-0.5,7];
						DRAG_cam camCommit 0;
						((uiNamespace getVariable ['_DragObject', objNull] isEqualTo ObjNull) or {!alive player} or {!(vehicle player isKindOf 'MAN')}) 
					};
					_obj= uiNamespace getVariable ['_DragObject', objNull];
					sleep .02;
					player forceWalk false;
					detach _obj;
					deleteVehicle _obj;
					uiNamespace setVariable ['_DragObject', objNull];					
					_c ctrlSetFade 1;
					_c ctrlCommit 0; 					
				};
			};
		} else 
		{
			detach _attached;
			_pos = getpos _attached;
			_thing = typeof _attached;
			//systemchat str _thing;
			uiNamespace setVariable ['_DragObject', objNull];
			_attached setDir getDir player;						
			_bb= boundingBox _attached;
			_z= (_bb select 0 select 2);// - (_bb select 0 select 2); //bleh!!!			
			_attached setVehiclePosition [player modelToWorld [0,2,_z], [], 0, 'CAN_COLLIDE'];			
			deleteVehicle _attached;
			_new= createVehicle [_thing, player modelToWorld [0,2,0], [], 0, "CAN_COLLIDE"];
			_new setDir (getDir player);
			
			
			_c= uiNamespace getvariable 'UI_DRAG';
			_c ctrlSetFade 1;
			_c ctrlCommit 0;
		};
	};
};	


