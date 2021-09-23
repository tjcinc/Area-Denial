    [""] call BIS_fnc_logFormat;
	0 spawn	//NO SOUND PATCH
    {
        sleep 0.2;
        _wi = weaponsItems player;
        _1wm = primaryWeaponMagazine player;
        _2wm = secondaryWeaponMagazine player;
        _3wm = handgunMagazine player;
        {
            player removePrimaryWeaponItem _x;
        } forEach _1wm;
        {
            player removeSecondaryWeaponItem _x;
        } forEach _2wm;
        {
            player removeHandgunItem _x;
        } forEach _3wm;
        sleep 0.2;
        {
            _wpn  = _x select 0;
            _mags = _x select 1;
            {player addWeaponItem [_wpn, _x, true]} forEach _mags;
        } forEach [[primaryWeapon player, _1wm], [secondaryWeapon player, _2wm], [handgunWeapon player, _3wm]];
		
		//[] spawn MAD_fnc_FULLAUTO;

    };
