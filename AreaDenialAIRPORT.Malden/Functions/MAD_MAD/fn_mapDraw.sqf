 
params ['_map'];
_vp= vehicle player;
_p= getPos _vp;
_d= direction _vp;
_clr= [1,1,0,1];

_map drawIcon ['A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Threats\sector_ca.paa', [1,1,1,0.75], _p, 256, 128, _d, name player, 0, 0.04, 'TahomaB', 'center'];

{
	_map drawIcon ['A3\ui_f\data\IGUI\RscCustomInfo\Sensors\Threats\sector_ca.paa', [1,1,1,0.75], getpos _x ,256, 128, getDir _x, name _x, 2, 0.04,'TahomaB','center'];    ///[1,1,1,1]  [1,1,0,0.85]
} foreach ((allplayers - [player,r_aird,r_Airg,w_aird,w_airg]) select {alive _x and (_x getVariable ['_S', side _x]) isEqualTo S3_Side});
{
	_map drawIcon ['A3\ui_f\data\IGUI\Cfg\simpleTasks\interaction_pointer6_ca.paa', [1,1,1,0.75], getpos _x ,40, 40, getDir _x, '', 2, 0.04,'TahomaB','right'];    ///[1,1,1,1]  [1,1,0,0.85]
} foreach ((allunits - [player,r_aird,r_Airg,w_aird,w_airg]) select {alive _x and (_x getVariable ['_S', side _x]) isEqualTo S3_Side});
 

 if (ctrlfade (finddisplay 12 displayCtrl 88800)==0) then
{ 
   
   /* _title  = "<t color='#AAFFAA' size='1.2' shadow='1' shadowColor='#000000' align='center'>"+localize 'STR_HINT1'+"</t><br/> <t color='#ffFF00' size='1.2' shadow='1' shadowColor='#000000' align='center'>"+localize 'STR_MISSIONHALO'+"</t><br/><t color='#ffFF00' size='1.0' shadow='1' shadowColor='#000000' align='center'>"+localize 'STR_MISSIONHALO1'+"</t>";  
   hintSilent parseText _title; */
  // hintSilent parseText (localize 'STR_HELP_F1');
   //[["Welcomehint", "intro"], 10,"", 5, "", true, true, false, true] call BIS_fnc_advHint;
	_ssc= 16;
	_m= 'A3\ui_f\data\Map\Diary\Icons\taskCustom_ca.paa';
	if (uiNamespace getVariable['MAD_IN_AIR',false]) then
	{
	      
		_m='A3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa';
	};

	_pos= player getVariable ['Mad_respawn_pos', getpos player];
	_map drawIcon [_m, [1,1,1,1], _pos, _ssc, _ssc, 0, '', 0, 0.04, 'TahomaB', 'right'];
	
	_map drawIcon ['A3\ui_f\data\Map\GroupIcons\selector_selectedMission_ca.paa', [1,1,0,1], player getVariable ['Mad_respawn_pos', getpos player], _ssc*1.5, _ssc*1.5, -100*time];	
	
	_map drawIcon ['A3\ui_f\data\Map\Diary\Icons\taskCustom_ca.paa', [1,1,1,1], getpos player, _ssc, _ssc, 0, '', 0, 0.04, 'TahomaB', 'right'];	
	
}; 

