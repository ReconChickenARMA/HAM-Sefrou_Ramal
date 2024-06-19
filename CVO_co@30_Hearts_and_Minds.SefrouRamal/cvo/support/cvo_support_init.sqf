// ################# INIT FOR REQUESTING SUPPORT DRONES
// ### Function
cvo_support_fnc_spawnDrone = 		compileScript ["cvo\support\cvo_support_fnc_spawnDrone.sqf", 	false, ""];
// ### Create Interaction
// Create Node for Class based interaction

// Vehicle the action is attached to
_vehicle_class = "PLP_UNA_MRAP_03_F";
// uav class name
_uav_class = "PLP_UNA_UAV_03_F";
// Position where the drone is spawned - if Fixed Wing, ideally at the edge / off the map
_startPos = [10200,10200,0];



// Creates Ace Interaction Node
_action = ["cvo_support_node","Request Support","\A3\ui_f\data\igui\cfg\simpleTasks\types\plane_ca.paa",{""},{true}] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;


// Create Cooldown Node
if (isNil "cvo_support_drones") then {cvo_support_drones = [0]};

_action = ["cvo_support_drone_cooldown","Fixed Wing UAV already active","\A3\ui_f\data\igui\cfg\simpleTasks\types\wait_ca.paa",{""},{!((count cvo_support_drones) < 2)}] call ace_interact_menu_fnc_createAction;
[_vehicle, 0, ["ACE_MainActions","cvo_support_node"], _action] call ace_interact_menu_fnc_addActionToClass;

// Create Executive Action for Class Based interaction
_action = ["cvo_support_drone","Fixed Wing UAV","\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa",	{
	[_uav_class, _startPos, _target, btc_player_side, independent, btc_gear_object, true, true] remoteExec ["cvo_support_fnc_spawnDrone",2];
},{(count cvo_support_drones) < 2}] call ace_interact_menu_fnc_createAction;

[_vehicle, 0, ["ACE_MainActions","cvo_support_node"], _action] call ace_interact_menu_fnc_addActionToClass;