//VAN
 #include "vanitems.hpp"

 #include "vanrifles.hpp"
 
 #include "vanglrifles.hpp"
  
 #include "vanmg.hpp"
  
 #include "vansrifles.hpp"

 #include "vanlaunchers.hpp" 
  
 #include "vanpistols.hpp"
   
 #include "vanmags.hpp"
   
 #include "vanpacks.hpp"
 
 #include "vanuniformswest.hpp"
 
 #include "vanuniformseast.hpp"
 
 #include "vanrockets.hpp"

 #include "vanmgmags.hpp" 
 
 #include "vanreconmags.hpp" 
 
 #include "vanglmags.hpp"
 
 #include "vansniperuniform.hpp"
  

 
 //RHS//
 
 /* #include "rhsitems.hpp"

 #include "rhsrifles.hpp"
 
 #include "rhsglrifles.hpp"
  
 #include "rhsmg.hpp"
  
 #include "rhssrifles.hpp"

 #include "rhslaunchers.hpp" 
  
 #include "rhspistols.hpp"
   
 #include "rhsmags.hpp"
   
 #include "rhspacks.hpp"
 
 #include "rhsuniformswest.hpp"
 
 #include "rhsuniformseast.hpp"
 
 #include "rhsrockets.hpp"

 #include "rhsmgmags.hpp" 
 
 #include "rhsreconmags.hpp" 
 
 #include "rhsglmags.hpp"
 
 #include "rhssniperuniform.hpp" */
 
/*  #include "ww2rifleswest.hpp"
  
 #include "ww2rifleseast.hpp"
  
 #include "ww2riflesusuk.hpp"

 #include "ww2glrifleswest.hpp"

 #include "ww2glrifleseast.hpp"
  
 #include "ww2glriflesusuk.hpp"
 
 #include "ww2smgwest.hpp"
 
 #include "ww2smgeast.hpp"
  
 #include "ww2smgusuk.hpp"
   
 #include "ww2mgwest.hpp"

 #include "ww2mgeast.hpp"
 
 #include "ww2mgusuk.hpp"
 
 #include "ww2srifleswest.hpp"

 #include "ww2srifleseast.hpp"
 
 #include "ww2sriflesusuk.hpp"
 
 #include "ww2pistolswest.hpp"

 #include "ww2pistolseast.hpp"

 #include "ww2pistolsusuk.hpp"

 #include "ww2launcherswest.hpp"

 #include "ww2launchersusuk.hpp"

 #include "ww2mags.hpp"
 
 #include "ww2glmags.hpp"

 #include "ww2uniformswest.hpp"

 #include "ww2uniformseast.hpp"

 #include "ww2uniformsusuk.hpp"

 #include "ww2uniformswest.hpp"

 #include "ww2uniformseast.hpp"

 #include "ww2uniformsusuk.hpp"
 
 #include "ww2headgearwest.hpp"
 
 #include "ww2headgearusuk.hpp"
 
 #include "ww2vestswest.hpp"
 
 #include "ww2vestsusuk.hpp"
 
 #include "ww2packswest.hpp"
 
 #include "ww2packsusuk.hpp"
 
 #include "ww2itemswest.hpp"
  
 #include "ww2itemseast.hpp"
 
 #include "ww2itemsusuk.hpp" */
 
 /* #include "cupitems.hpp"
 
 #include "cupmuzzle.hpp"

 #include "cuprifles.hpp"
 
 #include "cupglrifles.hpp"
  
 #include "cupmg.hpp"
  
 #include "cupsrifles.hpp"

 #include "cuplaunchers.hpp" 
  
 #include "cuppistols.hpp"
   
 #include "cupmags.hpp"
   
 #include "cuppacks.hpp"
 
 #include "cupuniformswest.hpp"
 
 #include "cupuniformseast.hpp"
 
 #include "cuprockets.hpp"

 #include "cupmgmags.hpp" 
 
// #include "cupreconmags.hpp" 
 
 #include "cupglmags.hpp"
 
 #include "cupsniperuniform.hpp"
 
 #include "cupssgun.hpp"
 
 #include "cuprocketrifles.hpp" */
 
/*  
 //VN
 
 #include "VNitems.hpp"
 
// #include "VNmuzzle.hpp"

 #include "VNrifles.hpp"
 
 #include "VNglrifles.hpp"
  
 #include "VNmg.hpp"
  
 #include "VNsrifles.hpp"

 #include "VNlaunchers.hpp" 
  
 #include "VNpistols.hpp"
   
 #include "VNmags.hpp"
   
 #include "VNpacksB.hpp"
 
 #include "VNpacksO.hpp"
 
 #include "VNuniformswest.hpp"
 
 #include "VNuniformseast.hpp"
 
 #include "VNrockets.hpp"

// #include "VNmgmags.hpp"  
 
 #include "VNglmags.hpp"
 
// #include "VNsniperuniform.hpp"
 
 #include "VNssgun.hpp" */
 

  
class CfgRoles
{
//WEST/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
    //VANwest///
	class west_plc
	{
	displayName = $STR_PISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_slc
	{
	displayName = $STR_SLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_atc
	{
	displayName = $STR_HEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	
	class west_gunnerc
	{
	displayName = $STR_GUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
    class west_grenadierc
	{
	displayName = $STR_GRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class west_reconc
	{
	displayName = $STR_RECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};

	
	////RHSwest///
/* 	class west_rhsplc
	{
	displayName = $STR_RHSPISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_rhsslc
	{
	displayName = $STR_RHSSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_rhsatc
	{
	displayName = $STR_RHSHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	
	class west_rhsgunnerc
	{
	displayName = $STR_RHSGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
    class west_rhsgrenadierc
	{
	displayName = $STR_RHSGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class west_rhsreconc
	{
	displayName = $STR_RHSRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	}; */
	
	
	////WW2west///////	
	/* class ger_asc
	{
	displayName = $STR_WWASSAULT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class ger_atc
	{
	displayName = $STR_WWHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};
	
	class ger_gunnerc
	{
	displayName = $STR_WWGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
   
	class ger_reconc
	{
	displayName = $STR_WWRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	}; */
	
	////CUPwest///
	/* class west_cupplc
	{
	displayName = $STR_CUPPISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_cupslc
	{
	displayName = $STR_CUPSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_cupatc
	{
	displayName = $STR_CUPHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	
	class west_cupgunnerc
	{
	displayName = $STR_CUPGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
    class west_cupgrenadierc
	{
	displayName = $STR_CUPGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class west_cupreconc
	{
	displayName = $STR_CUPRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	}; */
	
	////VNwest///
		
	/* class west_VNslc
	{
	displayName = $STR_VNSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	class west_VNatc
	{
	displayName = $STR_VNHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	
	class west_VNgunnerc
	{
	displayName = $STR_VNGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
    class west_VNgrenadierc
	{
	displayName = $STR_VNGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class west_VNreconc
	{
	displayName = $STR_VNRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	}; */
	
	
	
//EAST////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //VANeast///
    class east_plc
	{
	displayName = $STR_PISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	

	class east_slc
	{
	displayName = $STR_SLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class east_atc
	{
	displayName = $STR_HEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	

	class east_gunnerc
	{
	displayName = $STR_GUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
	
	class east_grenadierc
	{
	displayName = $STR_GRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class east_reconc
	{
	displayName = $STR_RECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};	


	//RHSeast//
    /* class east_rhsplc
	{
	displayName = $STR_RHSPISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	

	class east_rhsslc
	{
	displayName = $STR_RHSSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class east_rhsatc
	{
	displayName = $STR_RHSHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	

	class east_rhsgunnerc
	{
	displayName = $STR_RHSGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
	
	class east_rhsgrenadierc
	{
	displayName = $STR_RHSGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class east_rhsreconc
	{
	displayName = $STR_RHSRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};	 */
	
	//cupeast//
   /*  class east_cupplc
	{
	displayName = $STR_CUPPISTOL;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	

	class east_cupslc
	{
	displayName = $STR_CUPSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class east_cupatc
	{
	displayName = $STR_CUPHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	

	class east_cupgunnerc
	{
	displayName = $STR_CUPGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
	
	class east_cupgrenadierc
	{
	displayName = $STR_CUPGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class east_cupreconc
	{
	displayName = $STR_CUPRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};	 */
	
	//VNeast//
   	

	/* class east_vnslc
	{
	displayName = $STR_VNSLEADER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class east_vnatc
	{
	displayName = $STR_VNHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	

	class east_vngunnerc
	{
	displayName = $STR_VNGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};
	
	class east_vngrenadierc
	{
	displayName = $STR_VNGRENADIER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};
	class east_vnreconc
	{
	displayName = $STR_VNRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	};	 */
	
	////RESISTANCE///////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	////WW2resistance/////
	/* class usuk_asc
	{
	displayName = $STR_WWASSAULT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; 
	};	
	
	class usuk_atc
	{
	displayName = $STR_WWHEAVY_AT;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\sergeant_gs.paa";
	};	

	class usuk_gunnerc
	{
	displayName = $STR_WWGUNNER;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
	};	
	
	class usuk_reconc
	{
	displayName = $STR_WWRECON;
	icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
	}; */




	
};

class CfgRespawnInventory
{
//VAN//
#include "loadoutsvanwest.cpp"
#include "loadoutsvaneast.cpp"
//RHS//
//#include "loadoutsrhswest.cpp"
//#include "loadoutsrhseast.cpp"
//WW2//
//#include "loadoutsww2west.cpp"
//#include "loadoutsww2usuk.cpp"
//CUP//
//#include "loadoutscupwest.cpp"
//#include "loadoutscupeast.cpp"
//VN//
//#include "loadoutsVNwest.cpp"
//#include "loadoutsVNeast.cpp"

};

//arsenal contents everything from each loadout must fit into  ////
class ArsenalLoadoutConfig
{   
    //VANWEST//
    class west_pistol_1 
    {
		weapons[] = {_pistols};		
		items[] = {_vanuniformswest,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" };
		magazines[] = {"30Rnd_9x21_Mag"};
    };  
    class west_sleader_1
    { 
		weapons[] = {_pistols , _rifles};		
		items[] = { _items,_vanuniformswest};		
		magazines[] = {_mags};
    };
	class west_heavyat_1
    {
		weapons[] = {_rifles , _pistols , _launcher};		
		items[] = {_items,_vanuniformswest};		
		backpacks[]= {_vanpacks};
		magazines[] = {_mags , _vanrockets}; 
    };
	class west_gunner_1
    {
        weapons[] = {  _pistols , _machgun};		
		items[] = { _items,_vanuniformswest};		
		magazines[] = {_mags ,_vanmgmags};
    };
	class west_recon_1
    {       
		weapons[] = { _pistols , _srifle};		
		items[] = { _items,_vanuniformswest,_sniper};		
		magazines[] = {_mags ,_vanreconmags};		
    };
	class west_grenadier_1
    {       
		weapons[] = {  _riflegl , _pistols };		
		items[] = { _items,_vanuniformswest};		
		magazines[] = {_mags , _vanglmags};
    };
   //VANEAST//
    class east_pistol_1
    {
		weapons[] = {_pistols};		
		items[] = {_vanuniformseast,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" }; //later		
		magazines[] = {"30Rnd_9x21_Mag"};
    };
	class east_sleader_1
    { 
		weapons[] = {_rifles , _pistols};		
		items[] = {_items,_vanuniformseast};		
		magazines[] = {_mags};
    };
	class east_heavyat_1
    {
		weapons[] = {_rifles , _pistols , _launcher};		
		items[] = { _items,_vanuniformseast};		
		backpacks[]= {_vanpacks};		
		magazines[] = {_mags ,_vanrockets};
    };
	class east_gunner_1
    {       
		weapons[] = { _pistols , _machgun};		
		items[] = { _items,_vanuniformseast};		
		magazines[] = {_mags , _vanmgmags};
    };
	class east_recon_1
    {       
		weapons[] = { _pistols , _srifle};		
		items[] = { _items,_vanuniformseast,_sniper};		
		magazines[] = {_mags ,vanreconmags};		
    };
	class east_grenadier_1
    {       
		weapons[] = {_riflegl , _pistols };		
        items[] = { _items,_vanuniformseast};		
		magazines[] = {_mags ,_vanglmags};
    };		
	
	//RHSWEST//
   /*  class west_rhspistol_1 
    {
		weapons[] = {_rhspistols};		
		items[] = {_rhsuniformswest,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" };
		magazines[] = {"30Rnd_9x21_Mag"};
    };  
    class west_rhssleader_1
    {
		weapons[] = {_rhspistols , _rhsrifles};		
		items[] = {_rhsitems, _rhsuniformswest};
		magazines[] = {_rhsmags};
    };
	class west_rhsheavyat_1
    {
		weapons[] = {_rhsrifles , _rhspistols , _rhslauncher};		
		items[] = { _rhsitems, _rhsuniformswest};		
		backpacks[]= {_vanpacks,_rhspacks};
		magazines[] = {_rhsmags,   _rhsrockets}; 
    };
	class west_rhsgunner_1
    {
        weapons[] = {  _rhspistols , _rhsmachgun};		
		items[] = { _rhsitems,_rhsuniformswest};		
		magazines[] = {_rhsmags,_rhsmgmags};
    };
	class west_rhsrecon_1
    {       
		weapons[] = { _rhspistols ,  _rhssrifles };		
		items[] = { _rhsitems,_rhsuniformswest,_rhssniper};		
		magazines[] = {_rhsmags ,_rhsreconmags};		
    };
	class west_rhsgrenadier_1
    {       
		weapons[] = {   _rhsriflegl , _rhspistols};		
		items[] = { _rhsitems, _rhsuniformswest};		
		magazines[] = { _rhsmags , _rhsglmags};
    };
   //RHSEAST//
    class east_rhspistol_1
    {
		weapons[] = {_rhspistols};		
		items[] = {_rhsuniformseast,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" }; //later		
		magazines[] = {"30Rnd_9x21_Mag"};
    };
	class east_rhssleader_1
    { 
		weapons[] = {_rhsrifles , _rhspistols};		
		items[] = {_rhsitems,_rhsuniformseast};		
		magazines[] = {_rhsmags};
    };
	class east_rhsheavyat_1
    {
		weapons[] = {_rhsrifles , _rhspistols , _rhslauncher};		
		items[] = { _rhsitems,_rhsuniformseast};		
		backpacks[]= { _vanpacks, _rhspacks};		
		magazines[] = {_rhsmags , _rhsrockets};
    };
	class east_rhsgunner_1
    {       
		weapons[] = { _rhspistols, _rhsmachgun};		
		items[] = { _rhsitems,_rhsuniformseast};		
		magazines[] = {_rhsmags, _rhsmgmags};
    };
	class east_rhsrecon_1
    {       
		weapons[] = {_rhspistols, _rhssrifles};		
		items[] = { _rhsitems,_rhsuniformseast,_rhssniper};		
		magazines[] = {_rhsmags,_rhsreconmags};		
    };
	class east_rhsgrenadier_1
    {       
		weapons[] = {_rhsriflegl , _rhspistols };		
		items[] = { _rhsitems,_rhsuniformseast};		
		magazines[] = {_rhsmags,_rhsglmags};
    };
	
	//WW2WEST//
	class west_wwassault_1
    { 
		weapons[] = { _pistolwest,_riflewest,_smgwest,_rifleglwest};		
		items[] = { _itemswest,_wuniforms,_westheadgear,_westvests, "LIB_ACC_GW_SB_Empty","LIB_ACC_GL_DYAKONOV_Empty"};		
		magazines[] = {_magsww2,_magsgl};
    };
	class west_wwheavyat_1
    {
		weapons[] = { _pistolwest,_riflewest,  _launcherwest};		
		items[] = {_itemswest,_wuniforms,_westheadgear,_westvests};		
		backpacks[]= {_westpacks};
		magazines[] = {_magsww2};
    };
	class west_wwgunner_1
    {
        weapons[] = { _pistolwest , _hmgwest,_riflewest};		
		items[] = { _itemswest,_wuniforms,_westheadgear,_westvests};
        backpacks[]= {_westpacks};		
		magazines[] = {_magsww2 };
    };
	class west_wwrecon_1
    {       
		weapons[] = { _pistolwest , _sniperwest, _snipereast};		
		items[] = { _itemswest,_wuniforms,_westheadgear,_westvests};		
		magazines[] = {_magsww2 };		
    }; */

    //WW2USUK//
	/* class resistance_wwassault_1
    { 
		weapons[] = {_pistolusuk,_rifleusuk,_smgusuk,_rifleglusuk};		
		items[] = {_itemsusuk,_uuniforms,_usukheadgear,_usukvests,"LIB_ACC_GL_M7","LIB_ACC_GL_Enfield_CUP_Empty"};		
		magazines[] = {_magsww2,_magsgl};
    };
	class resistance_wwheavyat_1
    {
		weapons[] = { _pistolusuk,_rifleusuk,_launcherusuk};		
		items[] = { _itemsusuk, _uuniforms,_usukheadgear,_usukvests};		
		backpacks[]= {_usukpacks};		
		magazines[] = {_magsww2 };
    };
	class resistance_wwgunner_1
    {       
		weapons[] = { _pistolusuk , _hmgusuk};		
		items[] = { _itemsusuk, _uuniforms,_usukheadgear,_usukvests};
		backpacks[]= {_usukpacks};	
		magazines[] = {_magsww2 };
    };
	class resistance_wwrecon_1
    {       
		weapons[] = { _pistolusuk , _sniperusuk};		
		items[] = { _itemsusuk,_uuniforms,_usukheadgear,_usukvests};		
		magazines[] = {_magsww2};		
    };	 */
    
	//CUPWEST//
    /* class west_cuppistol_1 
    {
		weapons[] = {_cuppistols};		
		items[] = {_cupuniformswest,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" };
		magazines[] = {"30Rnd_9x21_Mag"};
    };  
    class west_cupsleader_1
    {
		weapons[] = {_cuppistols , _cuprifles , _cupssgun};		
		items[] = {_cupitems, _cupuniformswest, _cupmuzzle};
		magazines[] = {_cupmags};
    };
	class west_cupheavyat_1
    {
		weapons[] = {_cuprocketrifles , _cuppistols , _cuplauncher};		
		items[] = { _cupitems, _cupuniformswest};		
		backpacks[]= {_cuppacks};
		magazines[] = {_cupmags,   _cuprockets}; 
    };
	class west_cupgunner_1
    {
        weapons[] = {  _cuppistols , _cupmachgun };		
		items[] = { _cupitems, _cupuniformswest};		
		magazines[] = { _cupmags,_cupmgmags};
    };
	class west_cuprecon_1
    {       
		weapons[] = { _cuppistols ,  _cupsrifles ,_cupssgun };		
		items[] = {_cupmuzzle, _cupitems, _cupuniformswest, _cupsniper};		
		magazines[] = {_cupmags };		
    };
	class west_cupgrenadier_1
    {       
		weapons[] = {   _cupriflegl , _cuppistols};		
		items[] = { _cupitems, _cupuniformswest};		
		magazines[] = { _cupmags , _cupglmags};
    };
   //CUPEAST//
    class east_cuppistol_1
    {
		weapons[] = {_cuppistols};		
		items[] = {_cupuniformseast,"optic_MRD","muzzle_snds_acp","acc_flashlight_pistol","optic_Yorris","muzzle_snds_L" }; //later		
		magazines[] = {"30Rnd_9x21_Mag"};
    };
	class east_cupsleader_1
    { 
		weapons[] = {_cuprifles , _cuppistols, _cupssgun };		
		items[] = {_cupitems,_cupuniformseast,_cupmuzzle};		
		magazines[] = {_cupmags};
    };
	class east_cupheavyat_1
    {
		weapons[] = {_cuprocketrifles , _cuppistols , _cuplauncher};		
		items[] = { _cupitems,_cupuniformseast};		
		backpacks[]= { _cuppacks};		
		magazines[] = {_cupmags , _cuprockets};
    };
	class east_cupgunner_1
    {       
		weapons[] = { _cuppistols, _cupmachgun  };		
		items[] = { _cupitems,_cupuniformseast};		
		magazines[] = {_cupmags, _cupmgmags};
    };
	class east_cuprecon_1
    {       
		weapons[] = {_cuppistols, _cupsrifles, _cupssgun };		
		items[] = {_cupmuzzle, _cupitems,_cupuniformseast,_cupsniper};		
		magazines[] = {_cupmags };		
    };
	class east_cupgrenadier_1
    {       
		weapons[] = {_cupriflegl , _cuppistols };		
		items[] = { _cupitems,_cupuniformseast};		
		magazines[] = {_cupmags,_cupglmags};
    }; */
	
	
	
	
	
	
	
	
	
	
	
	
	
	//VNWEST//
   
  /*    class west_vnsleader_1
    {
		weapons[] = { _vnpistols , _vnrifles , _vnssgun };		
		items[] = { _vnitems , _vnuniformswest  };
		magazines[] = {_vnmags};
    };
	class west_vnheavyat_1
    {
		weapons[] = {_vnrifles , _vnpistols , _vnlauncher,_vnssgun};		
		items[] = { _vnitems, _vnuniformswest};		
		backpacks[]= {_vnpacksB};
		magazines[] = {_vnmags,   _vnrockets}; 
    };
	class west_vngunner_1
    {
        weapons[] = {  _vnpistols , _vnmachgun };		
		items[] = { _vnitems, _vnuniformswest};		
		magazines[] = { _vnmags};
    };
	class west_vnrecon_1
    {       
		weapons[] = { _vnpistols ,  _vnsrifles ,_vnssgun };		
		items[] = { _vnitems, _vnuniformswest, _vnsniper};		
		magazines[] = {_vnmags };		
    };
	class west_vngrenadier_1
    {       
		weapons[] = {   _vnriflegl , _vnpistols};		
		items[] = { _vnitems, _vnuniformswest};		
		magazines[] = { _vnmags , _vnglmags};
    };
   //VNEAST//
   
	class east_vnsleader_1
    { 
		weapons[] = {_vnrifles , _vnpistols, _vnssgun };		
		items[] = {_vnitems,_vnuniformseast};		
		magazines[] = {_vnmags};
    };
	class east_vnheavyat_1
    {
		weapons[] = {_vnrifles , _vnpistols , _vnlauncher,_vnssgun};		
		items[] = { _vnitems,_vnuniformseast};		
		backpacks[]= { _vnpacksO};		
		magazines[] = {_vnmags , _vnrockets};
    };
	class east_vngunner_1
    {       
		weapons[] = { _vnpistols, _vnmachgun  };		
		items[] = { _vnitems,_vnuniformseast};		
		magazines[] = {_vnmags};
    };
	class east_vnrecon_1
    {       
		weapons[] = {_vnpistols, _vnsrifles, _vnssgun };		
		items[] = { _vnitems,_vnuniformseast,_vnsniper};		
		magazines[] = {_vnmags };		
    };
	class east_vngrenadier_1
    {       
		weapons[] = {_vnriflegl , _vnpistols };		
		items[] = { _vnitems,_vnuniformseast};		
		magazines[] = {_vnmags,_vnglmags};
    };  */
	
		
};

