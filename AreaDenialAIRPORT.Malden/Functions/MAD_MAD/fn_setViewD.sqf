[""] call BIS_fnc_logFormat;
params['_dist'];
setViewDistance _dist; 
setObjectViewDistance (_dist-50);
//systemchat  format['View distance: %1 %2', ViewDistance, time]; 