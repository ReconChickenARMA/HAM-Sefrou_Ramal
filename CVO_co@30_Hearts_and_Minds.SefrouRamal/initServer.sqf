// Manages the CSC Source object
{
    [_x, -1] call ace_cargo_fnc_setSize;
    [_x, -1] call ace_cargo_fnc_setSpace;
    _x setVariable ["ace_cargo_noRename", true, true];
} forEach [cvo_csc_source];

// Add Custom Eventhandler Eventhandler

// private _id = ["tag_testEvent", {systemChat str _this}] call CBA_fnc_addEventHandler;

// Allows the CSC spawned boxes to be deleted by the black tarp
["cvo_csc_Event_crateSpawnedServer", {
    params ["_box", "_name"];
    btc_log_obj_created pushBackUnique _box;
}] call CBA_fnc_addEventHandler;
