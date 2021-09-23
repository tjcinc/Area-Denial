 [""] call BIS_fnc_logFormat;
disableSerialization;

    _madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
    switch (_madclass) do {
    case 0: {_lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull];
	_cs= lbCurSel _lb;
	_data= _lb lbText _cs;
	_role='ERROR';	
	_playerSide= if (vehicleVarName player find 'W'>=0) then {'west'} else {'resistance'}; 
	switch (_data) do 
	{

	case (localize "STR_WWASSAULT"): { _role=  _playerSide+'_wwassault_1' };
	case (localize "STR_WWGUNNER"): { _role=  _playerSide+'_wwgunner_1' };
	case (localize "STR_WWHEAVY_AT"): {	_role=  _playerSide+'_wwheavyat_1' };
	case (localize "STR_WWRECON"): {	_role=  _playerSide+'_wwrecon_1' };	
    };
	missionNamespace setVariable['AAS_profile', _role, false];
    _role
	};		 
		 
    case 1: { _lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull];
	_cs= lbCurSel _lb;
	_data= _lb lbText _cs;
	_role='ERROR';
	_playerSide= if (vehicleVarName player find 'W'>=0) then {'west'} else {'east'}; 

	switch (_data) do 
	{
	
	case (localize "STR_ASSAULT"): { _role=  _playerSide+'_assault_1' };
	case (localize "STR_GUNNER"): {	_role=  _playerSide+'_gunner_1' };
	case (localize "STR_GRENADIER"): {	_role=  _playerSide+'_grenadier_1' };
	case (localize "STR_MEDIC"): {	_role=  _playerSide+'_medic_1' };
	case (localize "STR_LIGHT_AT"): {	_role=  _playerSide+'_lightat_1' };
	case (localize "STR_HEAVY_AT"): {	_role=  _playerSide+'_heavyat_1' };
	case (localize "STR_SAPPER"): {	_role=  _playerSide+'_sapper_1' };
	case (localize "STR_SNIPER"): {	_role=  _playerSide+'_sniper_1' };	
	case (localize "STR_RECON"): {	_role=  _playerSide+'_recon_1' };
	case (localize "STR_ENGINEER"): { _role=  _playerSide+'_repair_1' };
	case (localize "STR_SLEADER"): { _role=  _playerSide+'_sleader_1' };
	case (localize "STR_PISTOL"): { _role=  _playerSide+'_pistol_1' };	
	};
	missionNamespace setVariable['AAS_profile', _role, false];
    _role	
    };
	
	case 2: { _lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull];
	_cs= lbCurSel _lb;
	_data= _lb lbText _cs;
	_role='ERROR';
	_playerSide= if (vehicleVarName player find 'W'>=0) then {'west'} else {'east'}; // 'east';// tolower (str (side player));

	switch (_data) do 
	{
	case (localize "STR_RHSASSAULT"): { _role=  _playerSide+'_rhsassault_1' };
	case (localize "STR_RHSGUNNER"): {	_role=  _playerSide+'_rhsgunner_1' };
	case (localize "STR_RHSGRENADIER"): {	_role=  _playerSide+'_rhsgrenadier_1' };	
	case (localize "STR_RHSHEAVY_AT"): {	_role=  _playerSide+'_rhsheavyat_1' };		
	case (localize "STR_RHSRECON"): {	_role=  _playerSide+'_rhsrecon_1' };
	//case (localize "STR_RHSENGINEER"): { _role=  _playerSide+'_rhsrepair_1' };
	case (localize "STR_RHSSLEADER"): { _role=  _playerSide+'_rhssleader_1' };
	case (localize "STR_RHSPISTOL"): { _role=  _playerSide+'_pistol_1' };
    //case (localize "STR_RHSMEDIC"): {	_role=  _playerSide+'_rhsmedic_1' };
	//case (localize "STR_RHSLIGHT_AT"): {	_role=  _playerSide+'_rhslightat_1' };
	//case (localize "STR_RHSSAPPER"): {	_role=  _playerSide+'_rhssapper_1' };
	//case (localize "STR_RHSSNIPER"): {	_role=  _playerSide+'_rhssniper_1' };
	//case (localize "STR_RHSENGINEER"): { _role=  _playerSide+'_rhsrepair_1' };
    };
	missionNamespace setVariable['AAS_profile', _role, false];
   _role
   };  

   	case 3: { _lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull];
	_cs= lbCurSel _lb;
	_data= _lb lbText _cs;
	_role='ERROR';
	_playerSide= if (vehicleVarName player find 'W'>=0) then {'west'} else {'east'}; // 'east';// tolower (str (side player));

	switch (_data) do 
	{
	case (localize "STR_CUPASSAULT"): { _role=  _playerSide+'_CUPassault_1' };
	case (localize "STR_CUPGUNNER"): {	_role=  _playerSide+'_CUPgunner_1' };
	case (localize "STR_CUPGRENADIER"): {	_role=  _playerSide+'_CUPgrenadier_1' };	
	case (localize "STR_CUPHEAVY_AT"): {	_role=  _playerSide+'_CUPheavyat_1' };	
	case (localize "STR_CUPRECON"): {	_role=  _playerSide+'_CUPrecon_1' };	
	case (localize "STR_CUPSLEADER"): { _role=  _playerSide+'_CUPsleader_1' };
	case (localize "STR_CUPPISTOL"): { _role=  _playerSide+'_CUPpistol_1' };	
	//case (localize "STR_CUPMEDIC"): {	_role=  _playerSide+'_CUPmedic_1' };
	//case (localize "STR_CUPLIGHT_AT"): {	_role=  _playerSide+'_CUPlightat_1' };
	//case (localize "STR_CUPSAPPER"): {	_role=  _playerSide+'_CUPsapper_1' };
	//case (localize "STR_CUPSNIPER"): {	_role=  _playerSide+'_CUPsniper_1' };
	//case (localize "STR_CUPENGINEER"): { _role=  _playerSide+'_CUPrepair_1' };
    };
	missionNamespace setVariable['AAS_profile', _role, false];
   _role  
    
   }; 
   
   case 4: { _lb= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlRoleList', controlNull];
	_cs= lbCurSel _lb;
	_data= _lb lbText _cs;
	_role='ERROR';
	_playerSide= if (vehicleVarName player find 'W'>=0) then {'west'} else {'east'}; // 'east';// tolower (str (side player));

	switch (_data) do 
	{
	//case (localize "STR_VNASSAULT"): { _role=  _playerSide+'_VNassault_1' };
	case (localize "STR_VNGUNNER"): {	_role=  _playerSide+'_vngunner_1' };
	case (localize "STR_VNGRENADIER"): {	_role=  _playerSide+'_vngrenadier_1' };	
	case (localize "STR_VNHEAVY_AT"): {	_role=  _playerSide+'_vnheavyat_1' };	
	case (localize "STR_VNRECON"): {	_role=  _playerSide+'_vnrecon_1' };	
	case (localize "STR_VNSLEADER"): { _role=  _playerSide+'_vnsleader_1' };
	//case (localize "STR_VNPISTOL"): { _role=  _playerSide+'_VNpistol_1' };	
	//case (localize "STR_CUPMEDIC"): {	_role=  _playerSide+'_CUPmedic_1' };
	//case (localize "STR_CUPLIGHT_AT"): {	_role=  _playerSide+'_CUPlightat_1' };
	//case (localize "STR_CUPSAPPER"): {	_role=  _playerSide+'_CUPsapper_1' };
	//case (localize "STR_CUPSNIPER"): {	_role=  _playerSide+'_CUPsniper_1' };
	//case (localize "STR_CUPENGINEER"): { _role=  _playerSide+'_CUPrepair_1' };
    };
	missionNamespace setVariable['AAS_profile', _role, false];
   _role  
    
   };
};//condense later??


