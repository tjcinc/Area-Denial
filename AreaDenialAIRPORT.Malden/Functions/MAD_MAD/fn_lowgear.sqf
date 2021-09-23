
 [""] call BIS_fnc_logFormat;

fnc_MAD_LOW_GEAR={
_pv= vehicle player;
_pv setVariable ["Low gear", !(_pv getVariable ["Low gear", false]),true];
_speed = 2.8; //turbo acc

if (_pv getVariable ["Low gear", false]) then 
{
hint "Low gear on";
waituntil
{
	_vel = velocity _pv;
	_dir = direction _pv;

	if ((Driver _pv ==player) and (inputAction "MoveForward" >0)) then 
	{
		if (speed _pv <20) then { _pv setVelocity [(_vel select 0) + (sin _dir *_speed), (_vel select 1) + (cos _dir*_speed), (_vel select 2)]; }; 
		if (speed _pv >30) then { _pv setVelocity [(_vel select 0) - (sin _dir* _speed/2), (_vel select 1) - (cos _dir*_speed/2), (_vel select 2)];};
	};
	sleep 0.2;
	(!(_pv getVariable ["Low gear",false]) or (isNull (Driver _pv)) or (isOnRoad _pv)or !(canMove _pv));
};
_pv setVariable ["Low gear", false,true];
hint "Low gear off";
};
};


fnc_MAD_ADD_V_ACTION={
params['_vehicle'];



if (_vehicle isKindof 'land') then
{
	_vehicle setVariable ["Low gear", false,true];
low_Gear_On= _vehicle addAction ["<t color='#00FF00'>Low Gear On 'Press R'</t>",{0 spawn fnc_MAD_LOW_GEAR}, -1, 6, false, true,"ReloadMagazine", "(Driver _target == player) and (!isOnRoad _target) and !(_target getvariable 'Low gear') and (speed _target <30)"];
low_Gear_Off = _vehicle addAction ["<t color='#FF0000'>Low Gear Off 'Press R'</t>",{0 spawn fnc_MAD_LOW_GEAR}, -1, 6, false, true,"ReloadMagazine", "(Driver _target == player) and (_target getvariable 'Low gear')"];
};

};

//SETUP
player addEventHandler ["GetInMan", " (_this select 2) spawn fnc_MAD_ADD_V_ACTION;"];
//player addEventHandler ["GetOutMan", "removeAllActions (_this select 2); 10 fadeSound 1;"];
player addEventHandler ["GetOutMan", "(_this select 2)removeAction low_Gear_On; (_this select 2)removeAction low_Gear_Off;"];