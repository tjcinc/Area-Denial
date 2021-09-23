class CfgHints
{	
	class Welcomehint
	{
		displayName = "Spawn System";
		class intro
		{			
			displayName = "Spawn Select";			
			displayNameShort = "Spawn Select";			
			description = "You can spawn on the ground, in the air or use a Mobile respawn.click on your base area two times in the position you would like to spawn,ctrl-right click to turn the spawn into a halo. Your custom loadouts will show up in the respawn selection";			
			tip = "When making a Custom respawn point make sure the white rotating circle is highlighted on the position chosen";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			//image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";
            image = "Images\area.paa";		
			noImage = false;			
			dlc = 0;
			
		};
	};
	class Welcomehint2
	{
		displayName = "Instructions";
		class intro
		{			
			displayName = "How to play";			
			displayNameShort = "2 Ways to Win";			
			description = "Hold the sector for the duration of game or kill the enemy for tickets. the shooter and target need to be in the sector for ticket removal";			
			tip = "Press F1 for help. No spawncamping. Players are invincible in their spawn until they shoot,or they leave their base";
			//arguments[] = {
				//{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
				//{"name"}, // Nested array means element (specially formatted part of text)
				//"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";			
			noImage = false;			
			dlc = 0;
			
		};
	};
	class arsenalhint
	{		
		displayName = "Class Based arsenal";
		class arsenal
		{			
			displayName = "Arsenal";			
			displayNameShort = "Arsenal";			
			description = " Save loadouts by class, then use them on the respawn menu. if you enter the arsenal with something that doesnt belong to your class it will be removed";			
			tip = "Mobile Respawn has an arsenal, You can also find some in the Sector";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";			
			noImage = false;			
			dlc = 0;
			
		};
	};	
	class vehhint
	{		
		displayName = "Vehicles";
		class vehicle
		{			
			displayName = "Vehicles";			
			displayNameShort = "Vehicle info";		
			description = "Vehicles respawn on a timer. Mobile spawns and aircraft take longer to spawn. Each vehicle has a toolkit and first-aid. You cannot enter the enemy mobile respawn.  Careful exiting aircraft to parachute, the tail of the plane will kill you. Mobile Spawns give you a ten second invincible window when get out in case it is being camped, or until you fire your weapon. Earplugs are inserted automatically upon enter a vehicle";
			
			tip = "EARPLUGS <t size='1.8' color='#ffff00'> ON</t>";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";			
			noImage = false;			
			dlc = 0;			
		};
	};
	
	class itemhint
	{		
		displayName = "Equipment";
		class item
		{
			displayName = "Equipment";				
			displayNameShort = "Equipment info";				
			description = "You have 2 tripwire mines and 1 charge sufficient to disable a tank.press 4 to place a tripwire mine, press 5 to place a charge, press 5 to detonate the charge. You can disable a trip wire mine if you find it by holding space, it will get added to your current mines";				
			tip = "toolkits will add barricade options, the inventory on some ammocrates may hold special items";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};				
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";				
			noImage = false;				
			dlc = 0;

			
		};
	
	};
	
	class zeushint
	{
		displayName = "Zeus";
		class intro
		{			
			displayName = "Zeus";			
			displayNameShort = "Zeus";			
			description = "Zeus is available for logged or voted in admins";			
			tip = "If you are Zeus and you cannot enter Zeus try to rejoin and login again";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";			
			noImage = false;			
			dlc = 0;
			
		};
	};
	
	class earplugs
	{
		
		displayName = "Earplugs";
		class earplugson
		{
		displayName = "EARPLUGS <t size='1.8' color='#ffff00'> ON</t>";				
		displayNameShort = "EARPLUGS <t size='1.8' color='#ffff00'> ON</t>";				
		description = "EARPLUGS <t size='1.8' color='#ffff00'> ON</t>";				
		tip = "Auto Earplugs for vehicles";							
		image = "image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa'/>";				
		noImage = false;				
		dlc = -1;			
		};
		class earplugsoff
		{
		displayName = "EARPLUGS<t size='1.8' color='#ff0000'> OFF</t>";				
		displayNameShort = "EARPLUGS<t size='1.8' color='#ff0000'> OFF</t>";				
		description = "EARPLUGS<t size='1.8' color='#ff0000'> OFF</t>";				
		tip = "Auto Earplugs for vehicles";							
		image = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa";				
		noImage = false;				
		dlc = -1;	
		};
	};
	class help
	{
		displayName = "help";
		class intructions
		{			
			displayName = "Help";			
			displayNameShort = "Help";			
			description = "Inststructions/Help can be found in the field manual";			
			tip = "";
			//arguments[] = {
			//	{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
			//	{"name"}, // Nested array means element (specially formatted part of text)
			//	"name player" // Simple string will be simply compiled and called, String can also link to localization database in case it starts by str_
			//};			
			image = "\A3\Ui_f\data\IGUI\Cfg\simpleTasks\types\use_ca.paa";			
			noImage = false;			
			dlc = 0;
			
		};
	};
	
	class groupspawn
	{
		
		displayName = "Group Spawn";
		class leader
		{
		displayName = "a player has spawned on your position";				
		displayNameShort = "a player has spawned on your position";				
		description = "a player has spawned on your position";				
		tip = "";							
		image = "image='A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa'/>";				
		noImage = false;				
		dlc = -1;			
		};
		class player
		{
		displayName = "you have spawned on the group leader";				
		displayNameShort = "you have spawned on the group leader";				
		description = "you have spawned on the group leader";				
		tip = "";							
		image = "A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_sound_OFF_ca.paa";				
		noImage = false;				
		dlc = -1;	
		};
	};
};