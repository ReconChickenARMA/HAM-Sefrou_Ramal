// Manages the CSC Source object
{
    // to be executed on server only
    [_x, -1] call ace_cargo_fnc_setSize;
    [_x, -1] call ace_cargo_fnc_setSpace;
    _x setVariable ["ace_cargo_noRename", true, true];
} forEach [cvo_csc_source];

// Add Custom Eventhandler
// Allows the CSC spawned boxes to be deleted by the black tarp
["cvo_csc_Event_crateSpawnedServer", {
    params ["_box", "_name"];
    btc_log_obj_created pushBackUnique _box;
}] call CBA_fnc_addEventHandler;


// Adds Items of the array to each vehicle in the layers of 2. array
private _items = ["ToolKit"];
private _layerNames = ["btc_vehicles", "Player Vehicles"];
{
    private _layerName = _x;
    private _vehicles = getMissionLayerEntities _layerName # 0;
    {
        private _vehicle = _x;
        private _vehicleInventory = itemCargo _vehicle;
        {
            private _desiredItem = _x;
            if !(_desiredItem in _vehicleInventory) then { _vehicle addItemCargoGlobal [_desiredItem, 1]; };
        } forEach _items;
    } forEach _vehicles;
} forEach _layerNames;



// TIMEFREEZE

[ { setTimeMultiplier 0.01; } , [], 30] call CBA_fnc_waitAndExecute;

private _condition = { 
    if (missionNamespace getVariable ["CVO_TIMEFREEZE_exit", false]) exitWith {};

    systemTime params ["", "", "_day", "_hour", "_minute", "", ""];
    20 >= _hour && { 50 >= _minute }
};

private _statement = {
    if (missionNamespace getVariable ["CVO_TIMEFREEZE_exit", false]) exitWith {};
    setTimeMultiplier 6;
};

private _parameter = [];
private _timeout = 3 * 60 * 60; // 3hours of timeout

[_condition, _statement, _parameter, _timeout,_statement] call CBA_fnc_waitUntilAndExecute;


// HEATWAVE - Serverside define of CVO_temperatureShift and Broadcast to playerclients and JIP Compatible

[ { 
    CVO_temperatureShift = 15 + round random 10;
    publicVariable "CVO_temperatureShift";
} , [], 7] call CBA_fnc_waitAndExecute;

[ { [compileScript ["cvo\misc\cvo_init_muezzin.sqf"]] call CBA_fnc_directCall; } , [], 60 * 30 ] call CBA_fnc_waitAndExecute;


// This script will apply the ZEN Intel Search Actions
[ { [compileScript ["intel\apply_intel.sqf"]] call CBA_fnc_directCall; } , [], /*60 * */ 5 ] call CBA_fnc_waitAndExecute;


{ [_x, 3, 300] call cvo_bigboom_fnc_prep } forEach [ fuel_1, fuel_2, fuel_3, fuel_4, fuel_5, fuel_6 ];

_condition = { missionNamespace getVariable ["trigger_player_inPosition", false] };
_statement = { [ "music_darkaction_full_RF" ] call cvo_music_fnc_play; };
[_condition, _statement] call CBA_fnc_waitUntilAndExecute;