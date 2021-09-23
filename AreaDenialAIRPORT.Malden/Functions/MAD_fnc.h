class MAD
{
	class ADB
	{
		preInit = 1;
		file = "Functions\MAD_MAD";	
		class getRole {};
		class arsenal {};
		class arsenalPrepare {};
		class arsenalOpened {};
		class arsenalFnc {};
		class saveInventory {};
		class loadInventory {};	
        class respawnMapClick   {};
        class respawnButtonClick  {};
		class mapDraw     {};		
		class dragEntityEnable {};	
		class drawnametag {};	
		class melee {};
		class meleeSP {}; 
        class SoundPatch {};		
        class keypress  {};
        class playeractions {};
		class earplugs {};        
		class banApply {};
		class banAllChat{};
        class halo {};		
        class settings  {};
        class minesMod_ON  {};	  
        class addHoldAction {}; 
		class arsenalAddRI{};
		class showRespawnMenuInventoryDetails{};
		class WML {};
		class MAD_tears {};
		class MAD_Click {};
		class SectorSetup	{};
		class resizeArea {};
		class miniMap {};
        class altminimap {};		
		class ehplayer{};		
		class lightning{};
		class antiCampProtection {};		
		class Zeus {}; 
		class noThermal {}; 
		class welcome {};
		class titan_VD {};
		class setViewD {};
		class trees {};
		class ClassesServer{};
		class End  {};
		class extraInit {};		
		class FULLAUTO {};
		class diary {};
		class fortify {};
		class aigroup {};
        class fly {};
        class armor {};
        class reload {};
		class tlspawn{};
		class buildingchanged {};
		class respawnMapClick2   {};       
		class printclasses   {};
       	class lowgear  {};
		};
	
	class VEHRESPAWN
	{
		postInit = 1;
		file = "Functions\MAD_VEHICLES";
		class jrRespawnInit	{};
		class ADDVehicleWeapons  {};
		class ClearVehicleWeapons {};		
		class saveVehicleWeapons {};
        class loadvehicle {}; 
        class veheh {};		
		class ADDTextures_Actions {};
	};	
	class AI
	{
		preInit = 1;
		file = "Functions\MAD_AI";
		class AiInit {};
		class AiParam   {};
		class spawnunit	{};		
		class CreateAIE {};		
		class CreateAIW {}; 
		class CreateAIR {}; 
		class AutoAI {};
		class vehicle {};		
		class waypoint {};
		class vehwaypoint {};		
	};

};

