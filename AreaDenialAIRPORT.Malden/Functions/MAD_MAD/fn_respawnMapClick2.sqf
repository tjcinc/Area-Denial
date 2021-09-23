[""] call BIS_fnc_logFormat;

    
    private _posLB= uiNamespace getVariable ['BIS_RscRespawnControlsMap_ctrlLocList', controlNull];
	private _listsize = (lbSize _posLB);
	waituntil {sleep 0.1;  _lsize = (lbSize _posLB); !(_lsize isequalto _listsize);};  	
	private _size= (lbSize _posLB)-1;	
    for "_i" from 0 to _size do 
	{ 		
    if (_posLB lbText _i == "CUSTOM") exitWith {
      _posLB lbSetCurSel _i; _posLB ctrlCommit 0 ;	
      };
    };
	