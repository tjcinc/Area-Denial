
if (!isServer)  exitwith {}; 
[""] call BIS_fnc_logFormat;
_madclass =["MAD_CLASS", 1] call BIS_fnc_getParamValue;
switch (_madclass) do {
    case 0: {
     	[west, ["ger_wwassault"]] call BIS_fnc_addRespawnInventory;
		[west, ["ger_wwassault2"]] call BIS_fnc_addRespawnInventory;		

		[west, ["ger_wwgunner5"]] call BIS_fnc_addRespawnInventory; 
		[west, ["ger_wwgunner6"]] call BIS_fnc_addRespawnInventory;		

		[west, ["ger_wwheavyat5"]] call BIS_fnc_addRespawnInventory; 
		[west, ["ger_wwheavyat6"]] call BIS_fnc_addRespawnInventory;		

		[west, ["ger_wwrecon5"]] call BIS_fnc_addRespawnInventory; 
		[west, ["ger_wwrecon6"]] call BIS_fnc_addRespawnInventory;				

		[resistance, ["usuk_wwassault"]] call BIS_fnc_addRespawnInventory;
		[resistance, ["usuk_wwassault2"]] call BIS_fnc_addRespawnInventory;		

		[resistance, ["usuk_wwgunner"]] call BIS_fnc_addRespawnInventory; 
		[resistance, ["usuk_wwgunner2"]] call BIS_fnc_addRespawnInventory;		

		[resistance, ["usuk_wwheavyat"]] call BIS_fnc_addRespawnInventory; 
		[resistance, ["usuk_wwheavyat2"]] call BIS_fnc_addRespawnInventory;		

		[resistance, ["usuk_wwrecon"]] call BIS_fnc_addRespawnInventory; 
		[resistance, ["usuk_wwrecon2"]] call BIS_fnc_addRespawnInventory;
		};	
    case 1: {
     	[west, ["west_sleader"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_sleader2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_sleader3"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_sleader4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_gunner"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_gunner2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_gunner3"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_gunner4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_heavyat"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_heavyat2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_heavyat3"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_heavyat4"]] call BIS_fnc_addRespawnInventory;	
		
		
		[west, ["west_recon"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_recon2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_recon3"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_recon4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_grenadier"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_grenadier2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_grenadier3"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_grenadier4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_sleader"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_sleader2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_sleader3"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_sleader4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_gunner"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_gunner2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_gunner3"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_gunner4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_heavyat"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_heavyat2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_heavyat3"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_heavyat4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_recon"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_recon2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_recon3"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_recon4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_grenadier"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_grenadier2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_grenadier3"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_grenadier4"]] call BIS_fnc_addRespawnInventory; 
		};
	
	case 2: {
     	[west, ["west_rhssleader"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhssleader2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhssleader3"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_sleader4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_rhsgunner"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_rhsgunner2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhsgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_rhsgunner4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_rhsheavyat"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_rhsheavyat2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhsheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_rhsheavyat4"]] call BIS_fnc_addRespawnInventory;	
		
		
		[west, ["west_rhsrecon"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_rhsrecon2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhsrecon3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_rhsrecon4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_rhsgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_rhsgrenadier2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_rhsgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_rhsgrenadier4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_rhssleader"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhssleader2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhssleader3"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_rhssleader4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_rhsgunner"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_rhsgunner2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhsgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_rhsgunner4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_rhsheavyat"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_rhsheavyat2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhsheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_rhsheavyat4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_rhsrecon"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_rhsrecon2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhsrecon3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_rhsrecon4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_rhsgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_rhsgrenadier2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_rhsgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_rhsgrenadier4"]] call BIS_fnc_addRespawnInventory; 
		};
		
    case 3: {
     	[west, ["west_cupsleader"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cupsleader2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cupsleader3"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_cupsleader4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_cupgunner"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_cupgunner2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cupgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupgunner4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_cupheavyat"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_cupheavyat2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cupheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupheavyat4"]] call BIS_fnc_addRespawnInventory;	
		
		
		[west, ["west_cuprecon"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_cuprecon2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cuprecon3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cuprecon4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_cupgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_cupgrenadier2"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_cupgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupgrenadier4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_cupsleader"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cupsleader2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cupsleader3"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_cupsleader4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_cupgunner"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_cupgunner2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cupgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupgunner4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_cupheavyat"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_cupheavyat2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cupheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupheavyat4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_cuprecon"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_cuprecon2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cuprecon3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cuprecon4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_cupgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_cupgrenadier2"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_cupgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupgrenadier4"]] call BIS_fnc_addRespawnInventory; 
		}; 
		
        case 4: {
     	[west, ["west_VNsleader"]] call BIS_fnc_addRespawnInventory;
		[west, ["west_VNsleader2"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_VNsleader3"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_cupsleader4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_VNgunner"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_VNgunner2"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_VNgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupgunner4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_VNheavyat"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_VNheavyat2"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_VNheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupheavyat4"]] call BIS_fnc_addRespawnInventory;	
		
		
		[west, ["west_VNrecon"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_VNrecon2"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_VNrecon3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cuprecon4"]] call BIS_fnc_addRespawnInventory;

		[west, ["west_VNgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[west, ["west_VNgrenadier2"]] call BIS_fnc_addRespawnInventory;
		//[west, ["west_VNgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[west, ["west_cupgrenadier4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_VNsleader"]] call BIS_fnc_addRespawnInventory;
		[east, ["east_VNsleader2"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_VNsleader3"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_cupsleader4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_VNgunner"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_VNgunner2"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_VNgunner3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupgunner4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_VNheavyat"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_VNheavyat2"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_VNheavyat3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupheavyat4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_VNrecon"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_VNrecon2"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_cuprecon3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cuprecon4"]] call BIS_fnc_addRespawnInventory;

		[east, ["east_VNgrenadier"]] call BIS_fnc_addRespawnInventory; 
		[east, ["east_VNgrenadier2"]] call BIS_fnc_addRespawnInventory;
		//[east, ["east_VNgrenadier3"]] call BIS_fnc_addRespawnInventory; 
		//[east, ["east_cupgrenadier4"]] call BIS_fnc_addRespawnInventory; 
		};
   		
};

shit=1;
publicVariable "shit";
diag_log "//////////////////////////////////////shit";