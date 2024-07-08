// ################# INIT FOR REQUESTING SUPPORT DRONES
// ### Function
cvo_support_fnc_spawnDrone = 		compileScript ["cvo\support\cvo_support_fnc_spawnDrone.sqf", 	false, ""];
// ### Create Interaction
// Create Node for Class based interaction

// DEFINE
#define VIC_CLASS "PLP_UNA_MRAP_03_F"
#define UAV_CLASS "PLP_UNA_UAV_03_F"
#define START_POS [10200,10200,0]
#define REMOVE_NVG true
#define REMOVE_TI true


// Creates Ace Interaction Node
_action = ["cvo_support_node","Request Support","\A3\ui_f\data\igui\cfg\simpleTasks\types\plane_ca.paa",{""},{true}] call ace_interact_menu_fnc_createAction;
["UK3CB_KDF_O_Gaz66_Radio", 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;

// Create Cooldown Node
if (isNil "cvo_support_drones") then {cvo_support_drones = [0]};

_action = ["cvo_support_drone_cooldown","Fixed Wing UAV already active","\A3\ui_f\data\igui\cfg\simpleTasks\types\wait_ca.paa",{""},{!((count cvo_support_drones) < 2)}] call ace_interact_menu_fnc_createAction;
["UK3CB_KDF_O_Gaz66_Radio", 0, ["ACE_MainActions","cvo_support_node"], _action] call ace_interact_menu_fnc_addActionToClass;

// Create Executive Action for Class Based interaction
_action = ["cvo_support_drone","Fixed Wing UAV","\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa",	{
	[UAV_CLASS, START_POS, _target, btc_player_side, independent, btc_gear_object, REMOVE_NVG, REMOVE_TI] remoteExec ["cvo_support_fnc_spawnDrone",2];
},{(count cvo_support_drones) < 2}] call ace_interact_menu_fnc_createAction;

["UK3CB_KDF_O_Gaz66_Radio", 0, ["ACE_MainActions","cvo_support_node"], _action] call ace_interact_menu_fnc_addActionToClass;