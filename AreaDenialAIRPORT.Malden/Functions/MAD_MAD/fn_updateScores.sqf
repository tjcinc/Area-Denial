[""] call BIS_fnc_logFormat;
params[["_side", civilian, [civilian]]];

switch (_side) do
{
	case WEST:{east addScoreSide 1};
	case EAST:{west addScoreSide 1};	
	case RESISTANCE:{resistance addScoreSide 1};
};