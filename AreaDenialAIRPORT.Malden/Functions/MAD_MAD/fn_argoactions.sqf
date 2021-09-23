[""] call BIS_fnc_logFormat;
params['_target','_caller','_idx','_actionName']; 
_res=false;  

if ('argo_ui_argo' in activatedAddons) then 
{
	hintC "this isnt argo silly!!!";
	
} 
else
{
	hint str _actionName;
	switch (_actionName) do
	{
		case 'switchWeapon': 
		{
			call MAD_fnc_titan_VD
		};
	};
};
_res