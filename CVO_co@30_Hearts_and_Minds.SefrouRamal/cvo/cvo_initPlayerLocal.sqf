diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - START");


// Init CVO Arsenal
[compileScript ["cvo\arsenal\cvo_arsenal_init.sqf"]] call CBA_fnc_directCall;
diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - CVO Arsenal done...");


[compileScript ["cvo\misc\cvo_acre_unconcious.sqf"]] call CBA_fnc_directCall;
diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - CVO acre_unconcious done...");

player addEventHandler ["Respawn", {
	player setUnitLoadout (player getVariable ["CVO_Loadout", []]);
}];

// Init Fast Travel for Vehicles
execVM "cvo\FTVic\cvo_FTVic_init.sqf";

execVM "cvo\cvo_zeus_debug.sqf";

diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - END");


