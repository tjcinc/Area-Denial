[""] call BIS_fnc_logFormat;
#include "..\..\Mission\params.hpp" 
[parseText MAD_Title, true, nil, 7, 2, 0] spawn BIS_fnc_textTiles;

["<t size = '.8'>"+localize 'STR_MISSIONTYPE'+"<br/>"+
localize 'STR_MISSIONINFO'+ "<br/>"+
localize 'STR_MISSIONINFO1'+ "<br/>"+
localize 'STR_HINT1'+"<br/>"+
"</t>",-1,-1,15,0.3,0,789] spawn BIS_fnc_dynamicText;
