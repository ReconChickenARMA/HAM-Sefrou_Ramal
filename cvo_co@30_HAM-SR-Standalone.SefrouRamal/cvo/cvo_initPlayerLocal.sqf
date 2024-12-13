diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - START");

[compileScript ["cvo\misc\cvo_acre_unconcious.sqf"]] call CBA_fnc_directCall;
diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - CVO acre_unconcious done...");

// Init Fast Travel for Vehicles





execVM "cvo\FTVic\cvo_FTVic_init.sqf";

execVM "cvo\cvo_zeus_debug.sqf";

diag_log ("[CVO] [INIT] (cvo_initPlayerLocal.sqf) - END");


