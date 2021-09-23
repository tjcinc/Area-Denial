
 
//BAN FX TXT AND VOICE CHAT
_ret=false;

if (s3A_VTBAN) then
{
	/*
	if (inputAction 'pushToTalk'>0 and uiNamespace getvariable['s3A_VTBAN_FX',true] ) then 
	{
		uiNamespace setvariable['s3A_VTBAN_FX',false];
		0 spawn 
		{ 
			//playSound 'voice_ban'; //1st
			
			_snd = createSoundSource ["voiceBan", position player, [], 0];
			_snd attachTo [player,[0,0,0],'head'];
			
			sleep 1.8;
			
			deleteVehicle _snd;
			
			uiNamespace setvariable['s3A_VTBAN_FX',true];
		};
	};
	//*/
	
	if (inputAction 'pushToTalk'>0) then { _ret= true };
	if (inputAction 'chat'>0) then { _ret= true };
};

_ret