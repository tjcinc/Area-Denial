[""] call BIS_fnc_logFormat;
if (!isServer)  exitwith {};
 
params['_type', '_params'];
switch (_type) do
{
	case 'TIME':
	{
		_params params['_h','_m']; //_date = date; _date set [3, _h];_date set [4, _m];[_date] remoteExec ['setDate', 0, true]; hint str date;
		while {date select 3 !=_h} do { skipTime 1 };
		while {date select 4 !=_m} do { skipTime 0.0166666666666667 };
	};
	case 'RAIN':
	{
		_params params['_r'];
		0 setOvercast _r;
		0 setRain _r;
		//setWind [-10+random 20, -10+random 20, true];
		//60 setGusts (random 1);
		
		if (_r<0.3) then
		{
			0 setWaves 0;
		};
		
		if (_r>0.8) then
		{
			0 setWaves (0.8+ random 0.2);
		};
		forceWeatherChange; 
		
	};
	
	case 'FOG':
	{
		_params params['_f'];
		0 setFog _f;
		uiNamespace setVariable ['S3_WFog', [_f]]
	};
	case 'AISKILL':
	{
		_params params['_skill'];
		MAD_AI_SKILL= _skill;
		_aiskill = MAD_AI_SKILL/10;
		//systemchat str MAD_AI_SKILL;
		systemchat format ["mad : %1, final : %2",MAD_AI_SKILL,_aiskill];
		//[format ['>>> AI skills changed: %1 %2', Round(MAD_AI_SKILL*100),'%']] remoteExec ['systemchat', 0, false];
		 uiNamespace setVariable ['MAD_AISKILL', [_skill]];
        
		
		{
		_x setskill _aiskill;
		_x setSkill ['aimingAccuracy', _aiskill];
		_x setSkill ['aimingShake', _aiskill];
		_x setSkill ['aimingSpeed', _aiskill];		
		_x setSkill ['spotDistance', _aiskill];
		_x setSkill ['spotTime', _aiskill];		
		_x setSkill ['reloadSpeed', _aiskill];		
		_x setSkill ['general',_aiskill];
		 
		 
		} foreach allunits-allplayers;
	};
	
	
};