


	class MAD_WELCOME
	{
	idd = 454;
	movingEnable = 1;
	class ControlsBackground
	{
			class MAD_CBG: RscText
	{
		type = 0;
		idc = -1;
		style = 0;
		font = "PuristaMedium";

		x = 0.175;
		y = 0;
		w = 0.675;
		h = 1.02;
		colorText[] = {0.6157,0.0118,0.3765,1};
		colorBackground[] = {0.13,0.54,0.21,0.8};
		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * GUI_GRID_H;
	};
	};
	
	class Controls
	{
		
	class MAD_FRAME: RscFrame
	{
		idc = 1800;

		text = "AREA DENIAL QUICK START"; 
		x = 0.2;
		y = 0.02;
		w = 0.6375;
		h = 0.98;
		sizeEx = 1 * GUI_GRID_H;
		moving = 1;
	};
	class MAD_text: RscStructuredText
	{
		idc = 1100;

		text = "<br/><t >DoubleClick anywhere in your base to create a spawn point</t><br/><t >Press </t><t color='#CC7F00'>CTRL-RIGHT CLICK </t>to spawn in AIR (HALO)<br/><t >Use </t><t color='#CC7F00'>MOBILE RESPAWN</t> click on vehicle if available<br/><t >Press</t><t color='#CC7F00'> 4</t> for Tripwire mine<br/><t >Press </t><t color='#CC7F00'>5</t> for IED<br/><t >Press</t><t color='#CC7F00'> 5</t> to detonoate IED<br/><t >Press </t><t color='#CC7F00'>6 </t>to melee<br/><t >Press eject </t><t color='#CC7F00'>vv</t> to exit mobile spawn aircraft<br/><t >Press eject </t><t color='#CC7F00'>vv</t> to open parachute<br/><t >Press </t><t color='#CC7F00'>-</t> to toggle earplugs off and on<br/><t ><br/><t >Press </t><t color='#CC7F00'>G </t>(swap gunner button)to toggle between gunner/driver seat<br/><t >Save arsenal loadout for use in respawn menu</t><br/><t >If time runs out, whoever holds the sector will win</t><br/><t >If tickets run out the team with tickets remaining wins</t><br/><t >To remove a ticket from the other team you must kill inside the zone</t>"; 
		x = 0.2125;
		y = 0.18;
		w = 0.625;
		h = 0.74;
		colorBackground[] = {-1,-1,-1,0};
	};
	class mad_picture: RscPicture
	{
		idc = 1200;

		text = "Images\area.paa";
		x = 0.45;
		y = 0.08;
		w = 0.12;
		h = 0.12;
		colorBackground[] = {-1,-1,-1,0};
	};
	class MAD_LINK: RscStructuredText
	{
		idc = 1101;
		text = "<t >Click the discord icon to join the Area denial discord !!!         </t><a  size='2' href='https://discord.gg/tA7S3DN'><img image='Images\discord.paa'/></a>"; 
		x = 0.2125;
		y = 0.9;
		w = 0.6;
		h = 0.08;
		colorBackground[] = {-1,-1,-1,0};
	};
		
		
		
	};
	
};   





