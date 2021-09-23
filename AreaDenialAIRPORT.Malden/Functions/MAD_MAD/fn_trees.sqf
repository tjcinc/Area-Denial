 //create trees from p3d    place a Sign_Sphere100cm_F and in its init put the line below (without the comment//)
 //this setVariable['_class',""PinusP3s"", false];
 //sub class for different type of tree/bush


if (isServer) then
{
[""] call BIS_fnc_logFormat;
	{
		_pos= getPos _x;
		_class= _x getVariable['_class',''];
		_z=0;
		_dir= getDir _x;
		switch (_class) do {
			case 'QuercusIR2s': { _class= 'a3\plants_f\Tree\t_QuercusIR2s_F.p3d'; _z= 9.3; };
			case 'BroussonetiaP1s': { _class= 'a3\plants_f\Tree\t_BroussonetiaP1s_F.p3d'; _z= 3.4; };
			case 'FicusB1s': { _class= 'a3\plants_f\Tree\t_FicusB1s_F.p3d'; _z= 3; };
			case 'FicusB2s': { _class= 'a3\plants_f\Tree\t_FicusB2s_F.p3d'; _z= 4.5; };
			case 'FraxinusAV2s': { _class= 'a3\plants_f\Tree\t_FraxinusAV2s_F.p3d'; _z= 9; };
			case 'OleaE1s_F': { _class= 'a3\plants_f\Tree\t_OleaE1s_F.p3d'; _z= 4; };
			case 'OleaE2s': { _class= 'a3\plants_f\Tree\t_OleaE2s_F.p3d'; _z= 5; };
			case 'PinusP3s': { _class= 'a3\plants_f\Tree\t_PinusP3s_F.p3d'; _z= 5; };
			
			case 'FicusC1s': { _class= 'a3\plants_f\Bush\b_FicusC1s_F.p3d'; _z= 1.8; };
			case 'ficusC2d': { _class= 'a3\plants_f\Bush\b_ficusC2d_F.p3d'; _z= 1.8; };
			case 'FicusC2s': { _class= 'a3\plants_f\Bush\b_FicusC2s_F.p3d'; _z= 1.7; };
			
			case 'NeriumO2d': { _class= 'a3\plants_f\Bush\b_NeriumO2d_F.p3d'; _z= 1.1; };
			case 'NeriumO2s': { _class= 'a3\plants_f\Bush\b_NeriumO2s_F.p3d'; _z= 1.1; };
			case 'NeriumO2sW': { _class= 'a3\plants_f\Bush\b_NeriumO2s_white_F.p3d'; _z= 1.1; };
		};
		
		_o = createSimpleObject [_class, [0,0,0]];
		_o attachTo [_x,[0,0,_z]];
		_o setDir _dir;
		deleteVehicle _x;
		//systemchat str _o;
		//sleep 0.5;
	} forEach (allMissionObjects  "Sign_Sphere100cm_F");

};