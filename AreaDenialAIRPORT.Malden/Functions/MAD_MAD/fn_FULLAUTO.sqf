 [""] call BIS_fnc_logFormat;
 _cw = primaryWeapon player;
        if (_cw != '') then
        {
            _Wmodes = getArray (configFile >> "CfgWeapons" >> _cw >> "modes");
            player selectWeapon _cw;

            {
                _m = toUpper (_x);
                if (_m find 'FULLAUTO' > -1) ExitWith { player action ["SWITCHMAGAZINE", player, player, _forEachIndex];};
            } forEach _Wmodes;
        };



