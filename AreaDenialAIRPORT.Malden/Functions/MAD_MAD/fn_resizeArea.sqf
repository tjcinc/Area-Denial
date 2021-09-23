[""] call BIS_fnc_logFormat;
params['_size'];
if (isServer) then
{
	_logic= missionNamespace getVariable['MAD_logic', objNull];
	if (isNull _logic) ExitWith {diag_log 'MAD LOGIC'; systemChat 'MAD LOGIC'};
	waitUntil {!isNil "t1"};
	_area= [_size, _size, 100, false,100];
	_logic setvariable['objectArea', _area];
    
	//systemChat format['_area: %1', _area];

	_trg = ( _logic getVariable 'areas' ) select 0;
	_mrk = ( _trg getVariable 'markers' ) select 0;

	_mrk setMarkerSize [_area select 0, _area select 1];
    
	_trg setTriggerArea (_logic getvariable ['objectArea',[1050,1050,0,false,100]]);
	[t1, _area] remoteExec ["setTriggerArea", 0, true];

};